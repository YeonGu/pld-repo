module video_proc_unit (
    input          i_proc_unit_clk,       // 视频处理模块总时钟
    input          i_proc_unit_rstn,
    input          i_video_vsyncn,
    /** Bypass read **/
    input          i_bypass_data_clk,
    input          i_bypass_data_en,
    input  [127:0] i_bypass_data,
    input          i_bypass_rlast,
    // Video Processor RAM read (HDMI OUTPUT) 
    input          vpu_ram_rden,
    input  [ 15:0] vpu_ram_rdaddr,
    output [ 15:0] vpu_ram_rddata,
    // Video Processor Unit
    output         o_proc_unit_clk,       // 视频处理模块请求事件时钟
    output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
    output         o_proc_unit_req_en,    // 视频处理模块 数据请求使能
    // Video Processor Configs
    input  [  7:0] i_config_setx,
    input  [  7:0] i_config_sety,
    input  [  7:0] i_config_settings,
    input  [  7:0] i_configs_1,
    input  [  7:0] i_configs_2
);

    assign o_proc_unit_clk = i_proc_unit_clk;

    (*mark_debug="true"*)wire        vrr_wren;
    (*mark_debug="true"*)wire [15:0] vrr_wraddr;
    (*mark_debug="true"*)wire [15:0] vrr_wrdata;

    /** Configs **/
    // wire [ 7:0] config_x;
    // wire [ 7:0] config_y;

    // assign config_x = 0;
    // assign config_y = 0;


    wire        bicubic_2x_rstn;


    assign bicubic_2x_rstn = i_proc_unit_rstn;
    bicubic_top_2x bicubic_2x (
        .i_bicubic_clk       (i_proc_unit_clk),       // input          i_bicubic_clk,
        .i_rstn              (bicubic_2x_rstn),       // input          i_rstn,
        .i_vsync             (~i_video_vsyncn),       // input          i_vsync,
        .i_config_x          (i_config_setx),         // input  [  7:0] i_config_x,
        .i_config_y          (i_config_sety),         // input  [  7:0] i_config_y,
        .o_proc_unit_req_addr(o_proc_unit_req_addr),  // output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
        .o_proc_unit_req_en  (o_proc_unit_req_en),    // output         o_proc_unit_req_en,    // 视频处理模块 数据请求使能
        // 请求的数据输入 (AXI CLOCK)
        .i_bypass_data_clk   (i_bypass_data_clk),     // input          i_bypass_data_clk,
        .i_bypass_data_en    (i_bypass_data_en),      // input          i_bypass_data_en,
        .i_bypass_data       (i_bypass_data),         // input  [127:0] i_bypass_data,
        .i_bypass_rlast      (i_bypass_rlast),        // input          i_bypass_rlast,
        .o_res_wraddr        (vrr_wraddr),            // output [ 15:0] o_res_wraddr,
        .o_res_wrdata        (vrr_wrdata),            // output [ 15:0] o_res_wrdata,
        .o_res_wren          (vrr_wren)               // output         o_res_wren
    );

    vpu_result_ram vpu_ram (
        /** Port A write **/
        .clka (i_proc_unit_clk),  // input wire clka
        .ena  (1'b1),             // input wire ena
        .wea  (vrr_wren),         // input wire [0 : 0] wea
        .addra(vrr_wraddr),       // input wire [15 : 0] addra
        .dina (vrr_wrdata),       // input wire [15 : 0] dina
        /** Port B read **/
        .clkb (i_proc_unit_clk),  // input wire clkb
        .enb  (vpu_ram_rden),     // input wire enb
        .addrb(vpu_ram_rdaddr),   // input wire [15 : 0] addrb
        .doutb(vpu_ram_rddata)    // output wire [15 : 0] doutb
    );

endmodule
