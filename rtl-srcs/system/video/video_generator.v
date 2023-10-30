

module video_generator (
    input          i_clk_hdmi_pixel,
    input          i_rstn,
    // Raw Video
    output         o_video_fifo_rden,
    input  [ 15:0] i_video_fifo_data,
    /** HDMI OUTPUT **/
    // Output HDMI RGB DATA
    output [ 23:0] o_hdmi_video_data,
    output         o_hdmi_video_vde,
    output         o_hdmi_video_hsync,
    output         o_hdmi_video_vsync,
    // Output HDMI SLAVE SCREEN DATA
    output [ 23:0] o_s_hdmi_video_data,
    output         o_s_hdmi_video_vde,
    output         o_s_hdmi_video_hsync,
    output         o_s_hdmi_video_vsync,
    // Video Processor Unit
    output         o_proc_unit_clk,
    output [ 31:0] o_proc_unit_req_addr,
    output         o_proc_unit_req_en,
    // Video Processor Data in
    input          i_bypass_data_clk,
    input          i_bypass_data_en,
    input  [127:0] i_bypass_data,
    input          i_bypass_rlast
);

    /** Original Stage **/
    wire        vde;
    wire        hsync;
    wire        vsync;
    wire [11:0] set_x;
    wire [11:0] set_y;

    /************************************************************/
    // Internal Signal
    /************************************************************/
    (*mark_debug="true"*)wire        vpu_ram_rden;
    (*mark_debug="true"*)reg  [15:0] vpu_ram_rdaddr;
    (*mark_debug="true"*)wire [15:0] vpu_ram_rddata;


    /** Main Screen Output **/
    /************************************************************/
    // Main Screen
    /************************************************************/

    assign o_video_fifo_rden = vde;

    reg [ 1:0] r_vde;
    reg [ 1:0] r_hsync;
    reg [ 1:0] r_vsync;
    reg [23:0] r_video1;
    reg [23:0] r_video2;
    assign o_hdmi_video_data  = r_video2;
    assign o_hdmi_video_vde   = r_vde[1];
    assign o_hdmi_video_hsync = r_hsync[1];
    assign o_hdmi_video_vsync = r_vsync[1];
    always @(posedge i_clk_hdmi_pixel) begin
        r_vde    <= {r_vde[0], vde};
        r_hsync  <= {r_hsync[0], hsync};
        r_vsync  <= {r_vsync[0], vsync};
        r_video1 <= {i_video_fifo_data[15:11], 3'd0, i_video_fifo_data[10:5], 2'd0, i_video_fifo_data[4:0], 3'd0};
        r_video2 <= r_video1;
    end


    /************************************************************/
    // Second Screen
    /************************************************************/
    /** Second Screen Output **/
    localparam SIZE_H = 256;
    localparam SIZE_V = 256;
    assign vpu_ram_rden = vde && (!(set_x > SIZE_H)) && (!(set_y > SIZE_V));
    always @(posedge i_clk_hdmi_pixel or negedge i_rstn) begin
        if (~i_rstn) vpu_ram_rdaddr <= 0;
        else if (~vsync) vpu_ram_rdaddr <= 0;
        else if (vpu_ram_rden) vpu_ram_rdaddr <= vpu_ram_rdaddr + 1;
    end

    assign o_s_hdmi_video_vde   = o_hdmi_video_vde;
    assign o_s_hdmi_video_hsync = o_hdmi_video_hsync;
    assign o_s_hdmi_video_vsync = o_hdmi_video_vsync;
    assign o_s_hdmi_video_data  = {vpu_ram_rddata[15:11], 3'd0, vpu_ram_rddata[10:5], 2'd0, vpu_ram_rddata[4:0], 3'd0};


    video_proc_unit vpu (
        .i_proc_unit_clk     (i_clk_hdmi_pixel),      // input          i_proc_unit_clk,       // 视频处理模块总时钟
        .i_proc_unit_rstn    (i_rstn),                // input          i_proc_unit_rstn,
        .i_video_vsyncn      (vsync),                 // input          i_video_vsyncn,
        /** Bypass read **/
        .i_bypass_data_clk   (i_bypass_data_clk),     // input          i_bypass_data_clk,
        .i_bypass_data_en    (i_bypass_data_en),      // input          i_bypass_data_en,
        .i_bypass_data       (i_bypass_data),         // input  [127:0] i_bypass_data,
        .i_bypass_rlast      (i_bypass_rlast),        // input          i_bypass_rlast,
        // Video Processor RAM read (HDMI OUTPUT) 
        .vpu_ram_rden        (vpu_ram_rden),          // input          vpu_ram_rden,
        .vpu_ram_rdaddr      (vpu_ram_rdaddr),        // input  [ 17:0] vpu_ram_rdaddr,
        .vpu_ram_rddata      (vpu_ram_rddata),        // output [ 15:0] vpu_ram_rddata,
        // Video Processor Unit
        .o_proc_unit_clk     (o_proc_unit_clk),       // output         o_proc_unit_clk,       // 视频处理模块请求事件时钟
        .o_proc_unit_req_addr(o_proc_unit_req_addr),  // output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
        .o_proc_unit_req_en  (o_proc_unit_req_en)     // output         o_proc_unit_req_en     // 视频处理模块 数据请求使能
        // Video Processor Configs
    );


    hdmi_timing_gen hdmi_timing_generator_inst (
        .i_clk       (i_clk_hdmi_pixel),  // input       i_clk,         //Clock
        .i_rstn      (i_rstn),            // input       i_rstn,        //Reset signal, low reset
        .i_video_mode(3'b110),            // input [2:0] i_video_mode,  //Video format
        .i_freq_mode (1'd0),              // input       i_freq_mode,   //Frequency format
        .o_rgb_vde   (vde),               // output o_rgb_vde,    	//Data valid signal
        .o_rgb_hsync (hsync),             // output o_rgb_hsync,  	//Line signal
        .o_rgb_vsync (vsync),             // output o_rgb_vsync,  	//Field signal
        .o_set_x     (set_x),             // output [11:0] o_set_x,   //Image coordinate X
        .o_set_y     (set_y)              // output [11:0] o_set_y    //Image coordinate Y
    );

endmodule
