

module axi_master_read (

                          input          sys_rstn,          // PLL Locked
                          input          ARESETN,           //axi复位
                          input          ACLK,              //axi时钟
                          input          mig_init_finish,
    /** Video FIFO **/
                          input          video_pclk,
                          input          video_sync_frame,
                          input          video_fifo_rden,
                          output [ 15:0] video_rddata,
    /** Bypass Request **/
                          input          bypass_clk,
                          input  [ 31:0] bypass_req_addr,
                          input          bypass_req_en,
    /** Bypass Data **/
                          output         bypass_out_clk,
                          output         bypass_out_en,
                          output [127:0] bypass_out_data,
                          output         bypass_out_last,
    //axi读通道写地址
                          output [  3:0] M_AXI_ARID,        //读地址ID，用来标志一组写信号
    (*mark_debug="true"*) output [ 31:0] M_AXI_ARADDR,      //读地址，给出一次写突发传输的读地址
                          output [  7:0] M_AXI_ARLEN,       //突发长度，给出突发传输的次数
                          output [  2:0] M_AXI_ARSIZE,      //突发大小，给出每次突发传输的字节数
                          output [  1:0] M_AXI_ARBURST,     //突发类型
                          output [  1:0] M_AXI_ARLOCK,      //总线锁信号，可提供操作的原子性
                          output [  3:0] M_AXI_ARCACHE,     //内存类型，表明一次传输是怎样通过系统的
                          output [  2:0] M_AXI_ARPROT,      //保护类型，表明一次传输的特权级及安全等级
                          output [  3:0] M_AXI_ARQOS,       //质量服务QOS
                          output         M_AXI_ARVALID,     //有效信号，表明此通道的地址控制信号有效
                          input          M_AXI_ARREADY,     //表明“从”可以接收地址和对应的控制信号
    //axi读通道读数据
                          input  [  3:0] M_AXI_RID,         //读ID tag
                          input  [127:0] M_AXI_RDATA,       //读数据
                          input  [  1:0] M_AXI_RRESP,       //读响应，表明读传输的状态
                          input          M_AXI_RLAST,       //表明读突发的最后一次传输
    (*mark_debug="true"*) input          M_AXI_RVALID,      //表明此通道信号有效
                          output         M_AXI_RREADY       //表明主机能够接收读数据和响应信息
);

    /****************************************************************************/
    // Parameters & Signals & Declarations
    /****************************************************************************/
    (*mark_debug="true"*)reg [1:0] vsyncs;
    (*mark_debug="true"*)reg       vs_pulse;
    always @(posedge ACLK) begin
        vsyncs   <= {vsyncs[0], video_sync_frame};
        vs_pulse <= (vsyncs == 2'b01);
    end

    /** Video FIFO **/
    wire       video_fifo_empty;
    wire       video_fifo_full;
    (*mark_debug="true"*)wire [8:0] video_fifo_cnt;

    wire       wr_rst_busy;

    /** Bypass request event FIFO **/
    wire bypass_event_rden, bypass_req_empty;
    wire [32:0] bypass_rd_addr;

    wire        video_need_data;
    wire        bypass_need_data;

    // FIFO在少于161个数据的时候请求新数据。
    assign video_need_data  = video_fifo_cnt < 161;

    assign bypass_need_data = ~bypass_req_empty;

    /** AXI Read Address Control **/
    (*mark_debug="true"*)reg [31:0] video_rd_addr = 0;
    reg [31:0] rd_cnt;
    localparam RD_BURST_NUM = 7'd80;
    always @(posedge video_pclk) begin
        rd_cnt = video_fifo_rden ? rd_cnt + 1 : 0;
    end


    /****************************************************************************/
    // AXI CONFIGS / PARAMS
    /****************************************************************************/
    assign M_AXI_ARID    = 4'b0000;
    assign M_AXI_ARSIZE  = 3'b100;  // 128bits = 16Byte
    assign M_AXI_ARBURST = 2'b01;  // 01: Address INCR
    assign M_AXI_ARLOCK  = 1'b0;
    assign M_AXI_ARCACHE = 4'b0010;
    assign M_AXI_ARPROT  = 3'b000;
    assign M_AXI_ARQOS   = 4'b0000;


    /****************************************************************************/
    // State Machine
    /****************************************************************************/
    localparam S_RD_IDLE = 0;
    localparam S_RD_WA = 1;
    localparam S_RD_DATA = 2;

    localparam RD_TO_VIDEO = 0;
    localparam RD_TO_BYPASS = 1;
    reg read_to = 0;
    assign M_AXI_ARLEN = read_to == RD_TO_VIDEO ? RD_BURST_NUM - 1 : 7'd15;

    (*mark_debug="true"*) reg [1:0] state_current, state_next;
    always @(*) begin
        state_next = state_current;
        case (state_current)
            S_RD_IDLE: begin
                if (video_need_data || bypass_need_data) begin
                    state_next = S_RD_WA;
                end else state_next = S_RD_IDLE;
            end
            S_RD_WA: begin
                state_next = (M_AXI_ARREADY) ? S_RD_DATA : S_RD_WA;
            end
            S_RD_DATA: begin
                state_next = (M_AXI_RLAST & M_AXI_RVALID) ? S_RD_IDLE : S_RD_DATA;
            end
            default: state_next = S_RD_IDLE;
        endcase
    end
    always @(posedge ACLK) begin
        if ((~ARESETN) || (~mig_init_finish) || wr_rst_busy) state_current <= S_RD_IDLE;
        // else if( (~mig_init_finish) || wr_rst_busy)state_current <= S_RD_IDLE;
        else
            state_current <= state_next;
    end
    always @(posedge ACLK) begin
        if (~ARESETN) read_to <= 0;
        else if ((state_current == S_RD_IDLE) && (state_next == S_RD_WA)) begin
            read_to <= (video_need_data) ? RD_TO_VIDEO : RD_TO_BYPASS;
        end
    end


    /****************************************************************************/
    // AXI Control
    /****************************************************************************/

    /** Read Address **/
    assign M_AXI_ARADDR      = (read_to == RD_TO_VIDEO) ? video_rd_addr : bypass_rd_addr;
    // assign bypass_event_rden = (state_current == S_RD_IDLE) && (state_next == S_RD_WA);
    assign bypass_event_rden = (read_to == RD_TO_BYPASS) && M_AXI_RLAST;
    always @(posedge ACLK) begin
        if (~ARESETN) begin
            video_rd_addr <= 0;
        end
        if (video_sync_frame) begin
            video_rd_addr <= 0;
        end else begin
            if (state_current == S_RD_DATA && M_AXI_RVALID && (read_to == RD_TO_VIDEO)) begin
                video_rd_addr <= video_rd_addr + 16;
            end else video_rd_addr <= video_rd_addr;
        end
    end

    /** -1- Address Write channel **/
    assign M_AXI_ARVALID   = (state_current == S_RD_WA);

    /** -2- Data Read **/
    assign M_AXI_RREADY    = (state_current == S_RD_DATA);

    assign bypass_out_clk  = ACLK;
    assign bypass_out_en   = (state_current == S_RD_DATA) && (read_to == RD_TO_BYPASS) && (M_AXI_RVALID);
    assign bypass_out_data = M_AXI_RDATA;
    assign bypass_out_last = (read_to == RD_TO_BYPASS) && M_AXI_RLAST;


    video_rd_fifo video_fifo_inst (
        .rst(~sys_rstn || video_sync_frame),  // input wire rst

        .wr_clk(ACLK),                                    // input wire wr_clk
        .din   (M_AXI_RDATA),                             // input wire [127 : 0] din
        .wr_en (M_AXI_RVALID & (read_to == RD_TO_VIDEO)), // input wire wr_en

        .rd_clk(video_pclk),       // input wire rd_clk
        .rd_en (video_fifo_rden),  // input wire rd_en
        .dout  (video_rddata),     // output wire [15 : 0] dout

        .full         (video_fifo_full),   // output wire full
        .empty        (video_fifo_empty),  // output wire empty
        .wr_data_count(video_fifo_cnt),    // output wire [8 : 0] wr_data_count
        .wr_rst_busy  (wr_rst_busy)        // output wire wr_rst_busy
        // .rd_rst_busy  (rd_rst_busy)     // output wire rd_rst_busy
    );
    fifo_generator_0 bypass_rd_req_fifo (
        .rst   ((~sys_rstn)),        // input wire rst
        // Write request from bypass
        .wr_clk(bypass_clk),         // input wire wr_clk
        .din   (bypass_req_addr),    // input wire [31 : 0] din
        .wr_en (bypass_req_en),      // input wire wr_en
        // Read request from 
        .rd_clk(ACLK),               // input wire rd_clk
        .rd_en (bypass_event_rden),  // input wire rd_en
        .dout  (bypass_rd_addr),     // output wire [31 : 0] dout
        // .full (full),  // output wire full
        .empty (bypass_req_empty)    // output wire empty
        // .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
        // .rd_rst_busy(rd_rst_busy)   // output wire rd_rst_busy
    );

endmodule


