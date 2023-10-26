

module bicubic_top_tb ();

    reg clk = 0;
    reg rstn = 0;
    always #1 clk = ~clk;
    initial begin
        rstn = 0;
        #20;
        rstn = 1;
    end

    integer i, j;
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 128; j = j + 1) begin
                bicubic_top_2x.loaded_pixel[i][j] = 16'd0;
            end
        end
    end


    reg [7:0] config_x = 3, config_y = 2;

    wire [31:0] o_proc_unit_req_addr;
    wire        o_proc_unit_req_en;
    wire [17:0] o_res_wraddr;
    wire [15:0] o_res_wrdata;
    wire        o_res_wren;


    reg  [ 7:0] write_cnt;
    reg         wr = 0;
    always @(posedge clk) begin
        if (o_proc_unit_req_en) wr <= 1;
        else if (write_cnt == 15) wr <= 0;
        else wr <= wr;
    end
    always @(posedge clk) begin
        write_cnt <= (wr) ? write_cnt + 1 : 0;
    end

    wire         i_bypass_data_en;
    wire [127:0] i_bypass_data;
    wire         i_bypass_rlast;
    assign i_bypass_data    = {16{write_cnt}};
    assign i_bypass_data_en = wr;
    assign i_bypass_rlast   = write_cnt == 15;

    bicubic_top_2x bicubic_2x (
        .i_bicubic_clk       (clk),                   // input          i_bicubic_clk,
        .i_rstn              (rstn),                  // input          i_rstn,
        .i_vsync             (0),                     // input          i_vsync,
        .i_config_x          (config_x),              // input  [  7:0] i_config_x,
        .i_config_y          (config_y),              // input  [  7:0] i_config_y,
        .o_proc_unit_req_addr(o_proc_unit_req_addr),  // output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
        .o_proc_unit_req_en  (o_proc_unit_req_en),    // output         o_proc_unit_req_en,    // 视频处理模块 数据请求使能
        .i_bypass_data_clk   (clk),                   // input          i_bypass_data_clk,
        .i_bypass_data_en    (i_bypass_data_en),      // input          i_bypass_data_en,
        .i_bypass_data       (i_bypass_data),         // input  [127:0] i_bypass_data,
        .i_bypass_rlast      (i_bypass_rlast),        // input          i_bypass_rlast,
        .o_res_wraddr        (o_res_wraddr),          // output [ 17:0] o_res_wraddr,
        .o_res_wrdata        (o_res_wrdata),          // output [ 15:0] o_res_wrdata,
        .o_res_wren          (o_res_wren)             // output         o_res_wren
    );
endmodule
