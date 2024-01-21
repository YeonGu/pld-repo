

module bicubic_top_2x (
                          input          i_bicubic_clk,
                          input          i_rstn,
                          input          i_vsync,
    // bicubic配置信息输入
                          input  [  8:0] i_config_x,
                          input  [  8:0] i_config_y,
    // 数据请求输出
    (*mark_debug="true"*) output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
    (*mark_debug="true"*) output         o_proc_unit_req_en,    // 视频处理模块 数据请求使能
    // 请求的数据输入 (AXI CLOCK)
                          input          i_bypass_data_clk,
    (*mark_debug="true"*) input          i_bypass_data_en,
    (*mark_debug="true"*) input  [127:0] i_bypass_data,
    (*mark_debug="true"*) input          i_bypass_rlast,
    // BRAM结果输出
    (*mark_debug="true"*) output [ 15:0] o_res_wraddr,
    (*mark_debug="true"*) output [ 15:0] o_res_wrdata,
    (*mark_debug="true"*) output         o_res_wren
);

    /******************************************************************/
    // INTERNAL SIGNALS
    /******************************************************************/
    (*mark_debug="true"*)reg       vsync_pulse;
    reg [1:0] vsync;
    always @(posedge i_bicubic_clk) begin
        vsync       <= {vsync[0], i_vsync};
        vsync_pulse <= i_vsync;
    end

    // wire [15:0] original_res_data;
    // wire [15:0] original_res_wraddr;
    // wire        original_res_wren;

    (*mark_debug="true"*)wire [ 8:0] raw_data_load_cnt;

    reg  [ 7:0] pixel_load_cnt;
    reg  [15:0] loaded_pixel          [3:0] [127:0];

    (*mark_debug="true"*)reg  [ 7:0] v_cnt = 0;
    (*mark_debug="true"*)reg  [ 7:0] calc_cnt;
    (*mark_debug="true"*)reg  [ 7:0] write_cnt;
    (*mark_debug="true"*)reg  [31:0] vram_rd_p;

    /** RAW DATA LOAD FIFO **/
    wire [15:0] raw_fifo_rddata;
    wire        raw_fifo_rden;
    (*mark_debug="true"*)wire        raw_fifo_full;
    (*mark_debug="true"*)wire        raw_fifo_empty;
    (*mark_debug="true"*)wire        raw_fifo_wr_rst_busy;

    /** Bicubic CALC CACHE FIFO **/
    wire [31:0] bicubic_res_buf_wrdata[1:0];
    wire        bicubic_res_buf_wren  [1:0];

    wire [15:0] bicubic_res_buf_rddata[1:0];
    wire        bicubic_res_buf_rden  [1:0];

    wire [15:0] bicubic_res_pix11;
    wire [15:0] bicubic_res_pix12;
    wire [15:0] bicubic_res_pix21;
    wire [15:0] bicubic_res_pix22;

    wire [23:0] o_bicubic_res_pix11;
    wire [23:0] o_bicubic_res_pix12;
    wire [23:0] o_bicubic_res_pix21;
    wire [23:0] o_bicubic_res_pix22;

    assign bicubic_res_pix11 = {o_bicubic_res_pix11[23:19], o_bicubic_res_pix11[15:10], o_bicubic_res_pix11[7:3]};
    assign bicubic_res_pix12 = {o_bicubic_res_pix12[23:19], o_bicubic_res_pix12[15:10], o_bicubic_res_pix12[7:3]};
    assign bicubic_res_pix21 = {o_bicubic_res_pix21[23:19], o_bicubic_res_pix21[15:10], o_bicubic_res_pix21[7:3]};
    assign bicubic_res_pix22 = {o_bicubic_res_pix22[23:19], o_bicubic_res_pix22[15:10], o_bicubic_res_pix22[7:3]};

    /******************************************************************/
    // CONFIGS
    /******************************************************************/
    localparam [7:0] RAW_PIXEL_COUNT = 128;  // 原始图像的大小（边长）
    reg [7:0] conf_x_start, conf_y_start;
    reg [32:0] vram_rd_start_addr;

    /******************************************************************/
    // STATUS MACHINE
    /******************************************************************/
    localparam S_IDLE = 0;
    localparam S_INIT = 1;  // 加载这一帧的配置数据
    localparam S_REQ = 2;  // 请求数据，同时数据上移一行
    localparam S_WAIT = 3;
    localparam S_LOAD = 4;  // 将输入的FIFO的数据读入reg
    localparam S_CALC = 5;  // 结果计算
    localparam S_WRITE_1 = 6;  // 结果写回第一行
    localparam S_WRITE_SWITCH = 7;
    localparam S_WRITE_2 = 8;
    localparam S_NEXT = 9;
    localparam S_FINAL = 10;

    (*mark_debug="true"*) reg [3:0] state_current, state_next;
    always @(*) begin
        // state_next = state_current;
        // if (vsync_pulse) state_next = S_IDLE;
        // else
        case (state_current)
            S_IDLE: state_next = (vsync_pulse) ? S_IDLE : S_INIT;
            S_INIT: state_next = (raw_fifo_wr_rst_busy) ? S_INIT : S_REQ;
            S_REQ: state_next = S_WAIT;
            S_WAIT: state_next = (raw_data_load_cnt >= 128) ? S_LOAD : S_WAIT;
            S_LOAD: state_next = (pixel_load_cnt == RAW_PIXEL_COUNT - 1) ? S_CALC : S_LOAD;
            S_CALC: state_next = (calc_cnt == RAW_PIXEL_COUNT - 1) ? S_WRITE_1 : S_CALC;
            S_WRITE_1: state_next = (write_cnt == 255) ? S_WRITE_SWITCH : S_WRITE_1;
            S_WRITE_SWITCH: state_next = S_WRITE_2;
            S_WRITE_2: begin
                if (write_cnt != 255) begin
                    state_next = S_WRITE_2;
                end else begin
                    state_next = (v_cnt == RAW_PIXEL_COUNT - 1) ? S_FINAL : S_NEXT;
                end
            end
            S_NEXT: state_next = S_REQ;
            S_FINAL: state_next = (vsync_pulse) ? S_IDLE : S_FINAL;
            default: state_next = S_IDLE;
        endcase
    end
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) state_current <= S_IDLE;
        // else if (vsync_pulse) state_current <= S_IDLE;
        else
            state_current <= state_next;
    end

    /******************************************************************/
    // STATE BEHAVIOR
    /******************************************************************/
    // VRAM READ POINTER
    wire [31:0] vram_rd_start;
    always @(posedge i_bicubic_clk) begin
        // if (~i_rstn) vram_rd_p <= vram_rd_start;
        if (state_current == S_INIT) vram_rd_p <= vram_rd_start;
        else if (state_current == S_NEXT) vram_rd_p <= vram_rd_p + 1280;
        // else if ((state_current == S_FINAL) || (state_current == S_IDLE)) vram_rd_p <= vram_rd_start;
        else
            vram_rd_p <= vram_rd_p;
    end

    /** INIT **/
    wire [9:0] x_start, y_start;
    // 起始坐标
    assign x_start              = i_config_x;
    assign y_start              = (i_config_y > 351) ? 351 : i_config_y;
    assign vram_rd_start        = (y_start * 1280) + (x_start << 1);

    // always @(posedge i_bicubic_clk or negedge i_rstn) begin
    //     if (~i_rstn) begin
    //         conf_x_start       <= 0;
    //         conf_y_start       <= 0;
    //         vram_rd_start_addr <= 0;
    //     end else begin
    //         conf_x_start       <= (state_current == S_INIT) ? i_config_x : conf_x_start;
    //         conf_y_start       <= (state_current == S_INIT) ? i_config_y : conf_y_start;
    //         vram_rd_start_addr <= 0;
    //     end
    // end

    /** REQ **/
    assign o_proc_unit_req_en   = (state_current == S_REQ);
    assign o_proc_unit_req_addr = vram_rd_p;

    /** WAIT UNTIL RLAST COMES **/

    /** LOAD 加载读取到的一行数据 **/
    assign raw_fifo_rden        = state_current == S_LOAD;

    always @(posedge i_bicubic_clk) begin
        if (state_current == S_LOAD) begin
            loaded_pixel[0][pixel_load_cnt] <= raw_fifo_rddata;
        end else loaded_pixel[0][pixel_load_cnt] <= loaded_pixel[0][pixel_load_cnt];
    end
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (!i_rstn) pixel_load_cnt <= 0;
        else pixel_load_cnt <= (state_current == S_LOAD) ? pixel_load_cnt + 1 : 0;
    end

    /** CALC **/
    always @(posedge i_bicubic_clk) begin
        calc_cnt <= (state_current == S_CALC) ? calc_cnt + 1 : 0;
    end

    reg [3:0] state_delayed[1:0];
    always @(posedge i_bicubic_clk) begin
        state_delayed[1] <= state_delayed[0];
        state_delayed[0] <= state_current;
    end
    assign bicubic_res_buf_wren[0]   = (state_delayed[1] == S_CALC);
    assign bicubic_res_buf_wren[1]   = (state_delayed[1] == S_CALC);
    assign bicubic_res_buf_wrdata[0] = {bicubic_res_pix11, bicubic_res_pix12};
    assign bicubic_res_buf_wrdata[1] = {bicubic_res_pix21, bicubic_res_pix22};


    wire [23:0] i_raw_pix11;
    wire [23:0] i_raw_pix12;
    wire [23:0] i_raw_pix13;
    wire [23:0] i_raw_pix14;
    wire [23:0] i_raw_pix21;
    wire [23:0] i_raw_pix22;
    wire [23:0] i_raw_pix23;
    wire [23:0] i_raw_pix24;
    wire [23:0] i_raw_pix31;
    wire [23:0] i_raw_pix32;
    wire [23:0] i_raw_pix33;
    wire [23:0] i_raw_pix34;
    wire [23:0] i_raw_pix41;
    wire [23:0] i_raw_pix42;
    wire [23:0] i_raw_pix43;
    wire [23:0] i_raw_pix44;

    // {i_video_fifo_data[15:11], 3'd0, i_video_fifo_data[10:5], 2'd0, i_video_fifo_data[4:0], 3'd0};

    assign i_raw_pix11 = {loaded_pixel[3][calc_cnt+0][15:11], 3'd0, loaded_pixel[3][calc_cnt+0][10:5], 2'd0, loaded_pixel[3][calc_cnt+0][4:0], 3'd0};
    assign i_raw_pix12 = {loaded_pixel[3][calc_cnt+1][15:11], 3'd0, loaded_pixel[3][calc_cnt+1][10:5], 2'd0, loaded_pixel[3][calc_cnt+1][4:0], 3'd0};
    assign i_raw_pix13 = {loaded_pixel[3][calc_cnt+2][15:11], 3'd0, loaded_pixel[3][calc_cnt+2][10:5], 2'd0, loaded_pixel[3][calc_cnt+2][4:0], 3'd0};
    assign i_raw_pix14 = {loaded_pixel[3][calc_cnt+3][15:11], 3'd0, loaded_pixel[3][calc_cnt+3][10:5], 2'd0, loaded_pixel[3][calc_cnt+3][4:0], 3'd0};
    assign i_raw_pix21 = {loaded_pixel[2][calc_cnt+0][15:11], 3'd0, loaded_pixel[2][calc_cnt+0][10:5], 2'd0, loaded_pixel[2][calc_cnt+0][4:0], 3'd0};
    assign i_raw_pix22 = {loaded_pixel[2][calc_cnt+1][15:11], 3'd0, loaded_pixel[2][calc_cnt+1][10:5], 2'd0, loaded_pixel[2][calc_cnt+1][4:0], 3'd0};
    assign i_raw_pix23 = {loaded_pixel[2][calc_cnt+2][15:11], 3'd0, loaded_pixel[2][calc_cnt+2][10:5], 2'd0, loaded_pixel[2][calc_cnt+2][4:0], 3'd0};
    assign i_raw_pix24 = {loaded_pixel[2][calc_cnt+3][15:11], 3'd0, loaded_pixel[2][calc_cnt+3][10:5], 2'd0, loaded_pixel[2][calc_cnt+3][4:0], 3'd0};
    assign i_raw_pix31 = {loaded_pixel[1][calc_cnt+0][15:11], 3'd0, loaded_pixel[1][calc_cnt+0][10:5], 2'd0, loaded_pixel[1][calc_cnt+0][4:0], 3'd0};
    assign i_raw_pix32 = {loaded_pixel[1][calc_cnt+1][15:11], 3'd0, loaded_pixel[1][calc_cnt+1][10:5], 2'd0, loaded_pixel[1][calc_cnt+1][4:0], 3'd0};
    assign i_raw_pix33 = {loaded_pixel[1][calc_cnt+2][15:11], 3'd0, loaded_pixel[1][calc_cnt+2][10:5], 2'd0, loaded_pixel[1][calc_cnt+2][4:0], 3'd0};
    assign i_raw_pix34 = {loaded_pixel[1][calc_cnt+3][15:11], 3'd0, loaded_pixel[1][calc_cnt+3][10:5], 2'd0, loaded_pixel[1][calc_cnt+3][4:0], 3'd0};
    assign i_raw_pix41 = {loaded_pixel[0][calc_cnt+0][15:11], 3'd0, loaded_pixel[0][calc_cnt+0][10:5], 2'd0, loaded_pixel[0][calc_cnt+0][4:0], 3'd0};
    assign i_raw_pix42 = {loaded_pixel[0][calc_cnt+1][15:11], 3'd0, loaded_pixel[0][calc_cnt+1][10:5], 2'd0, loaded_pixel[0][calc_cnt+1][4:0], 3'd0};
    assign i_raw_pix43 = {loaded_pixel[0][calc_cnt+2][15:11], 3'd0, loaded_pixel[0][calc_cnt+2][10:5], 2'd0, loaded_pixel[0][calc_cnt+2][4:0], 3'd0};
    assign i_raw_pix44 = {loaded_pixel[0][calc_cnt+3][15:11], 3'd0, loaded_pixel[0][calc_cnt+3][10:5], 2'd0, loaded_pixel[0][calc_cnt+3][4:0], 3'd0};

    /** WRITE **/
    reg [15:0] res_wraddr;
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) res_wraddr <= 0;
        else if (state_current == S_IDLE) res_wraddr <= 0;
        else res_wraddr <= (o_res_wren) ? res_wraddr + 1 : res_wraddr;
    end
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) write_cnt <= 0;
        else write_cnt <= (o_res_wren) ? write_cnt + 1 : 0;
    end

    assign o_res_wren              = (calc_cnt > 4) || (state_current == S_WRITE_1) || (state_current == S_WRITE_2);
    assign o_res_wraddr            = res_wraddr;
    assign bicubic_res_buf_rden[0] = o_res_wren && (state_current != S_WRITE_2);
    assign bicubic_res_buf_rden[1] = o_res_wren && (state_current == S_WRITE_2);

    assign o_res_wrdata            = (state_current == S_WRITE_2) ? bicubic_res_buf_rddata[1] : bicubic_res_buf_rddata[0];

    /** NEXT **/
    // 更新读指针、缓存上移
    integer i;
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) begin
            v_cnt <= 0;
            for (i = 0; i < 16; i = i + 1) begin
                loaded_pixel[3][i] <= 16'b0;
                loaded_pixel[2][i] <= 16'b0;
                loaded_pixel[1][i] <= 16'b0;
            end
        end else if (state_current == S_IDLE) begin
            v_cnt <= 0;
            for (i = 0; i < 16; i = i + 1) begin
                loaded_pixel[3][i] <= 16'b0;
                loaded_pixel[2][i] <= 16'b0;
                loaded_pixel[1][i] <= 16'b0;
            end
        end else if (state_current == S_NEXT) begin
            v_cnt <= v_cnt + 1;
            for (i = 0; i < 128; i = i + 1) begin
                loaded_pixel[3][i] <= loaded_pixel[2][i];
                loaded_pixel[2][i] <= loaded_pixel[1][i];
                loaded_pixel[1][i] <= loaded_pixel[0][i];
            end
        end else begin
            v_cnt <= v_cnt;
            for (i = 0; i < 128; i = i + 1) begin
                loaded_pixel[3][i] <= loaded_pixel[3][i];
                loaded_pixel[2][i] <= loaded_pixel[2][i];
                loaded_pixel[1][i] <= loaded_pixel[1][i];
            end
        end
    end


    // 原始数据加载FIFO
    (*mark_debug="true"*)wire         raw_fifo_rd_rst_busy;
    (*mark_debug="true"*)wire [5 : 0] wr_data_count;
    bicubic_raw_cache raw_data_fifo (
        .rst          (~i_rstn || vsync_pulse),  // input wire rst
        .wr_clk       (i_bypass_data_clk),       // input wire wr_clk
        .din          (i_bypass_data),           // input wire [127 : 0] din
        .wr_en        (i_bypass_data_en),        // input wire wr_en
        /** FIFO READ PORT **/
        .rd_clk       (i_bicubic_clk),           // input wire rd_clk
        .rd_en        (raw_fifo_rden),           // input wire rd_en
        .dout         (raw_fifo_rddata),         // output wire [15 : 0] dout
        .full         (raw_fifo_full),           // output wire full
        .empty        (raw_fifo_empty),          // output wire empty
        .wr_rst_busy  (raw_fifo_wr_rst_busy),    // output wire wr_rst_busy
        .rd_rst_busy  (raw_fifo_rd_rst_busy),    // output wire rd_rst_busy
        .rd_data_count(raw_data_load_cnt),       // output wire [8 : 0] rd_data_count
        .wr_data_count(wr_data_count)            // output wire [5 : 0] wr_data_count
    );

    // Bicubic计算缓存
    bicubic_2x_buffer bicubic_2x_buffer0 (
        .clk  (i_bicubic_clk),              // input wire clk
        .srst (~i_rstn),                    // input wire srst
        .wr_en(bicubic_res_buf_wren[0]),    // input wire wr_en
        .din  (bicubic_res_buf_wrdata[0]),  // input wire [31 : 0] din
        .rd_en(bicubic_res_buf_rden[0]),    // input wire rd_en
        .dout (bicubic_res_buf_rddata[0])   // output wire [15 : 0] dout
        // .full (full),           // output wire full
        // .empty(empty)           // output wire empty
    );
    bicubic_2x_buffer bicubic_2x_buffer1 (
        .clk  (i_bicubic_clk),              // input wire clk
        .srst (~i_rstn),                    // input wire srst
        .wr_en(bicubic_res_buf_wren[1]),    // input wire wr_en
        .din  (bicubic_res_buf_wrdata[1]),  // input wire [31 : 0] din
        .rd_en(bicubic_res_buf_rden[1]),    // input wire rd_en
        .dout (bicubic_res_buf_rddata[1])   // output wire [15 : 0] dout
        // .full (full),           // output wire full
        // .empty(empty)           // output wire empty
    );

    bicubic_core bicubic_core_2x (
        .i_bicubic_clk(i_bicubic_clk),        //input i_bicubic_clk,
        .rst_n        (i_rstn),               //input rst_n,
        // input matrix 4*4
        .i_raw_pix11  (i_raw_pix11),          //input [23:0] i_raw_pix11,
        .i_raw_pix12  (i_raw_pix12),          //input [23:0] i_raw_pix12,
        .i_raw_pix13  (i_raw_pix13),          //input [23:0] i_raw_pix13,
        .i_raw_pix14  (i_raw_pix14),          //input [23:0] i_raw_pix14,
        .i_raw_pix21  (i_raw_pix21),          //input [23:0] i_raw_pix21,
        .i_raw_pix22  (i_raw_pix22),          //input [23:0] i_raw_pix22,
        .i_raw_pix23  (i_raw_pix23),          //input [23:0] i_raw_pix23,
        .i_raw_pix24  (i_raw_pix24),          //input [23:0] i_raw_pix24,
        .i_raw_pix31  (i_raw_pix31),          //input [23:0] i_raw_pix31,
        .i_raw_pix32  (i_raw_pix32),          //input [23:0] i_raw_pix32,
        .i_raw_pix33  (i_raw_pix33),          //input [23:0] i_raw_pix33,
        .i_raw_pix34  (i_raw_pix34),          //input [23:0] i_raw_pix34,
        .i_raw_pix41  (i_raw_pix41),          //input [23:0] i_raw_pix41,
        .i_raw_pix42  (i_raw_pix42),          //input [23:0] i_raw_pix42,
        .i_raw_pix43  (i_raw_pix43),          //input [23:0] i_raw_pix43,
        .i_raw_pix44  (i_raw_pix44),          //input [23:0] i_raw_pix44,
        // output matrix 2*2
        .o_res_pix11  (o_bicubic_res_pix11),  //output [23:0] o_res_pix11,
        .o_res_pix12  (o_bicubic_res_pix12),  //output [23:0] o_res_pix12,
        .o_res_pix21  (o_bicubic_res_pix21),  //output [23:0] o_res_pix21,
        .o_res_pix22  (o_bicubic_res_pix22)   //output [23:0] o_res_pix22
    );

endmodule
