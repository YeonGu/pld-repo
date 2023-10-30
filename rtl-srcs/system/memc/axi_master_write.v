
module axi_master_write (
    /** Camera Data In **/
    input          cam_pclk,
    input          cam_wren,
    input  [ 15:0] cam_data,
    input          cam_frame_sync,
    /** AXI Master **/
    input          ARESETN,         //axi复位
    input          ACLK,            //axi总时钟
    //axi4写通道地址通道
    output [  3:0] M_AXI_AWID,      // [PARAM] 写地址ID，用来标志一组写信号。随意设置。
    output [ 31:0] M_AXI_AWADDR,    // 写地址，给出一次写突发传输的写地址
    output [  7:0] M_AXI_AWLEN,     // 突发长度，给出突发传输的次数  
    output [  2:0] M_AXI_AWSIZE,    // [CONFIG] 突发大小，给出每次突发传输的字节数  
    output [  1:0] M_AXI_AWBURST,   // [PARAM] 突发类型  
    output         M_AXI_AWLOCK,    // [PARAM] 总线锁信号，可提供操作的原子性  
    output [  3:0] M_AXI_AWCACHE,   // [PARAM] 内存类型，表明一次传输是怎样通过系统的  
    output [  2:0] M_AXI_AWPROT,    // [PARAM] 保护类型，表明一次传输的特权级及安全等级  
    output [  3:0] M_AXI_AWQOS,     // [PARAM] 质量服务QoS. 4'b0000
    output         M_AXI_AWVALID,   // 有效信号，表明此通道的地址控制信号有效
    input          M_AXI_AWREADY,   // 表明“从”可以接收地址和对应的控制信号
    //axi4写通道数据通道
    output [127:0] M_AXI_WDATA,     // 写数据
    output [ 15:0] M_AXI_WSTRB,     // [CONFIG] 写数据有效的字节线
    output         M_AXI_WLAST,     // 表明此次传输是最后一个突发传输
    output         M_AXI_WVALID,    // 写有效，表明此次写有效
    input          M_AXI_WREADY,    // 表明从机可以接收写数据
    //axi4写通道应答通道
    input  [  3:0] M_AXI_BID,       // [PARAM] 写响应ID TAG
    input  [  1:0] M_AXI_BRESP,     // 写响应，表明写传输的状态
    input          M_AXI_BVALID,    // 写响应有效
    output         M_AXI_BREADY     // 表明主机能够接收写响应
);

    /****************************************************************************/
    // Parameters & Signals & Declarations
    /****************************************************************************/
    localparam S_WR_IDLE = 3'd0;
    localparam S_WA = 3'd1;
    localparam S_WD = 3'd2;
    localparam S_WAIT_ANS = 3'd3;
    reg [2:0] state_current = 0, state_next = 0;

    /** Camera FIFO **/
    wire         cam_fifo_rden;
    wire [127:0] cam_fifo_rddata;

    wire         fifo_need_write;
    wire         cam_fifo_empty;
    wire         cam_fifo_full;
    wire [  7:0] rd_data_count;

    // wire         wr_busy;
    wire         wr_rst_busy;
    wire         rd_rst_busy;

    // assign wr_busy         = wr_rst_busy | video_sync_frame;

    assign fifo_need_write = (rd_data_count[7:6] != 2'b00);  // Over 64 Data

    /** AXI Signal **/
    wire axi_wd_handshake;
    assign axi_wd_handshake = M_AXI_WVALID & M_AXI_WREADY;

    /** Write Address & Control **/
    localparam WR_BURST_NUM = 7'd64;
    localparam WR_ADDR_INCR = 32'd16;  // 128bits
    reg [31:0] wr_addr = 0;
    reg [ 9:0] wr_cnt;

    /****************************************************************************/
    // AXI CONFIGS / PARAMS
    /****************************************************************************/
    /* AXI Master Write Control PARAMS */
    assign M_AXI_AWID         = 4'b0000;  // 单主机，随意设置
    assign M_AXI_AWBURST      = 2'b01;  // 01:Address INCR;  10:Address DECR.
    assign M_AXI_AWSIZE       = 3'b100;  // 16Byte = 128bits
    assign M_AXI_AWLOCK       = 1'b0;  // 总线锁
    assign M_AXI_AWCACHE[3:0] = 4'b0010;
    assign M_AXI_AWPROT[2:0]  = 3'b000;
    assign M_AXI_AWQOS[3:0]   = 4'b0000;  // 质量服务

    /****************************************************************************/
    // AXI WRITE STATE MACHINE
    /****************************************************************************/
    /** State Transfer **/
    always @(*) begin
        state_next = state_current;
        case (state_current)
            // 写FIFO数据超过128个，触发突发写
            S_WR_IDLE: state_next = (fifo_need_write) ? S_WA : S_WR_IDLE;
            // 写地址和控制信号握手
            S_WA: state_next = (M_AXI_AWREADY) ? S_WD : S_WA;
            // 写完成，等待应答
            S_WD: state_next = (wr_cnt == WR_BURST_NUM - 1) ? S_WAIT_ANS : S_WD;
            // 获得BVALID握手信号。数据传输完成。
            S_WAIT_ANS: state_next = M_AXI_BVALID ? S_WR_IDLE : S_WAIT_ANS;

            default: state_next = S_WR_IDLE;
        endcase
    end
    always @(posedge ACLK) begin
        if (!ARESETN) state_current <= S_WR_IDLE;
        else state_current <= state_next;
    end

    /****************************************************************************/
    // AXI WRITE CONTROL LOGIC
    /****************************************************************************/

    /* Write Address & Count */
    reg vsync;
    always @(posedge ACLK) begin
        vsync <= cam_frame_sync;
    end
    always @(posedge ACLK) begin
        if (vsync) wr_addr <= 0;
        else if ((state_current == S_WD) && axi_wd_handshake) wr_addr <= wr_addr + WR_ADDR_INCR;
        else wr_addr <= wr_addr;
    end
    always @(posedge ACLK) begin
        if (state_current != S_WD) begin
            wr_cnt <= 0;
        end else wr_cnt <= (axi_wd_handshake) ? wr_cnt + 1 : wr_cnt;
    end

    /* -1- Address & Control channel write */
    assign M_AXI_AWVALID = (state_current == S_WA) ? 1'b1 : 1'b0;
    assign M_AXI_AWADDR  = wr_addr;
    assign M_AXI_AWLEN   = WR_BURST_NUM - 1;

    /* -2- Data channel write */
    assign M_AXI_WVALID  = (state_current == S_WD) ? 1'b1 : 1'b0;
    assign M_AXI_WDATA   = cam_fifo_rddata;
    assign M_AXI_WSTRB   = 16'hFFFF;
    assign M_AXI_WLAST   = (state_current == S_WD) && (wr_cnt == WR_BURST_NUM - 1);

    /* -3- Write Response */
    // BREADY给高，可以接受写应答
    assign M_AXI_BREADY  = (state_current == S_WD) || (state_current == S_WAIT_ANS);

    /****************************************************************************/
    // FIFO DATA PREPARATIONS
    /****************************************************************************/
    assign cam_fifo_rden = (((state_current == S_WD) && axi_wd_handshake));

    /****************************************************************************/
    // FIFO INSTANCE
    /****************************************************************************/
    camera_wr_fifo cam_wr_fifo_inst (
        .rst          (~ARESETN || cam_frame_sync),  // input wire rst
        /* Data Write From Camera */
        .wr_clk       (cam_pclk),                    // input wire wr_clk
        .din          (cam_data),                    // input wire [15 : 0] din
        .wr_en        (cam_wren),                    // input wire wr_en
        /* Data Read from AXI */
        .rd_clk       (ACLK),                        // input wire rd_clk
        .rd_en        (cam_fifo_rden),               // input wire rd_en
        .dout         (cam_fifo_rddata),             // output wire [127 : 0] dout
        .full         (cam_fifo_full),               // output wire full
        .empty        (cam_fifo_empty),              // output wire empty
        .rd_data_count(rd_data_count),               // output wire [7 : 0] rd_data_count
        .wr_rst_busy  (wr_rst_busy),                 // output wire wr_rst_busy
        .rd_rst_busy  (rd_rst_busy)                  // output wire rd_rst_busy
    );


endmodule
