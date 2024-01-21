

module video_generator (
    input          i_clk_hdmi_pixel,
    input          i_rstn,
    /** apb priphs socket **/
    input          APB_HCLK,
    input          APB_HRESETn,
    input  [ 11:0] APB_PADDR,
    input  [ 31:0] APB_PWDATA,
    input          APB_PWRITE,
    input          APB_PSEL,
    input          APB_PENABLE,
    output [ 31:0] APB_PRDATA,
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

    /** Original Stage (HDMI TIMING) **/
    wire           vde;
    wire           hsync;
    wire           vsync;
    wire    [11:0] set_x;
    wire    [11:0] set_y;

    /************************************************************/
    // Internal Signal
    /************************************************************/
    (*mark_debug="true"*)wire           vpu_ram_rden;
    (*mark_debug="true"*)reg     [15:0] vpu_ram_rdaddr;
    (*mark_debug="true"*)wire    [15:0] vpu_ram_rddata;

    wire    [ 8:0] config_setx;  // 0
    wire    [ 8:0] config_sety;  // 1
    wire    [ 7:0] config_settings;  // 2 OPT reg
    wire    [ 7:0] configs_1;  // 3 CONF reg; Advanced Proc. Select
    wire    [ 7:0] configs_2;  // 4
    wire           ui_ram_wren;
    wire    [11:0] ui_ram_wraddr;
    wire    [ 7:0] ui_ram_wrdata;

    integer        i;
    /************************************************************/
    // IO REGISTERS (APB)
    /************************************************************/
    vpu_ioregs vpu_conf_ioregs (
        .HCLK             (APB_HCLK),         // input                       HCLK,
        .HRESETn          (APB_HRESETn),      // input  	   HRESETn,
        .PADDR            (APB_PADDR),        // input  [11:0] PADDR,
        .PWDATA           (APB_PWDATA),       // input  [               7:0] PWDATA,
        .PWRITE           (APB_PWRITE),       // input                       PWRITE,
        .PSEL             (APB_PSEL),         // input                       PSEL,
        .PENABLE          (APB_PENABLE),      // input                       PENABLE,
        .PRDATA           (APB_PRDATA),       // output                      PRDATA,
        .o_config_setx    (config_setx),      // output [               7:0] o_config_setx,
        .o_config_sety    (config_sety),      // output [               7:0] o_config_sety,
        .o_config_settings(config_settings),  // output [               7:0] o_config_settings,
        .o_configs_1      (configs_1),        // output [               7:0] o_configs_1,
        .o_configs_2      (configs_2),        // output [               7:0] o_configs_2,    
        .o_ui_ram_wren    (ui_ram_wren),      // output                      o_ui_ram_wren,
        .o_ui_ram_wraddr  (ui_ram_wraddr),    // output [               11:0] o_ui_ram_wraddr,
        .o_ui_ram_wrdata  (ui_ram_wrdata)     // output [               7:0] o_ui_ram_wrdata
    );

    wire [11:0] size_h, size_v;
    assign size_h = (config_settings[1]) ? 128 : 256;
    assign size_v = (config_settings[1]) ? 128 : 256;
    /** Main Screen Output **/
    /************************************************************/
    // Main Screen
    //  Latency: 5 clocks
    //	VDE -> 
    /************************************************************/

    wire [23:0] ui_pixel;
    assign o_video_fifo_rden = vde;

    reg  [ 4:0] r_vde;
    reg  [ 4:0] r_hsync;
    reg  [ 4:0] r_vsync;

    wire [23:0] video_data_888;
    assign video_data_888 = {i_video_fifo_data[15:11], 3'd0, i_video_fifo_data[10:5], 2'd0, i_video_fifo_data[4:0], 3'd0};
    reg  [23:0] r_video     [4:0];


    /* Boarder hit
	 * config_setx, config_sety
	*/
    wire [ 9:0] x_r;
    wire [ 9:0] y_b;
    wire        l_board_hit;
    wire        r_board_hit;
    wire        t_board_hit;
    wire        b_board_hit;
    reg  [ 4:0] board_hit_r;

    reg  [ 7:0] win_size;
    assign x_r         = config_setx + win_size - 1;
    assign y_b         = config_sety + win_size - 1;
    assign l_board_hit = (set_x == config_setx) && (set_y >= config_sety) && (set_y <= y_b);
    assign r_board_hit = (set_x == x_r) && (set_y >= config_sety) && (set_y <= y_b);
    assign t_board_hit = (set_y == config_sety) && (set_x >= config_setx) && (set_x <= x_r);
    assign b_board_hit = (set_y == y_b) && (set_x >= config_setx) && (set_x <= x_r);
    always @(*) begin
        if ((config_settings[2])) begin  // 4x
            win_size = size_h / 4;
        end else begin  // 2x
            win_size = size_h / 2;
        end
    end
    always @(posedge i_clk_hdmi_pixel) begin
        board_hit_r[0]   <= l_board_hit || r_board_hit || t_board_hit || b_board_hit;
        board_hit_r[4:1] <= board_hit_r[3:0];
    end


    always @(posedge i_clk_hdmi_pixel) begin
        r_vde      <= {r_vde[3:0], vde};
        r_hsync    <= {r_hsync[3:0], hsync};
        r_vsync    <= {r_vsync[3:0], vsync};
        // r_video1   <= {i_video_fifo_data[15:11], 3'd0, i_video_fifo_data[10:5], 2'd0, i_video_fifo_data[4:0], 3'd0};
        // r_video2   <= r_video1;
        r_video[0] <= video_data_888;
        for (i = 1; i <= 4; i = i + 1) begin
            r_video[i] <= r_video[i-1];
        end
    end

    assign o_hdmi_video_data  = (ui_pixel != 0) && (config_settings[0]) ? ui_pixel : ((board_hit_r[4]) ? (24'h7E0) : r_video[4]);
    assign o_hdmi_video_vde   = r_vde[4];
    assign o_hdmi_video_hsync = r_hsync[4];
    assign o_hdmi_video_vsync = r_vsync[4];

    /** UI RENDERING **/
    ui_renderer u_ui_renderer (
        .i_hdmi_pclk    (i_clk_hdmi_pixel),  // input         i_hdmi_pclk,
        .i_rstn         (i_rstn),            // input         i_rstn,
        /* Message from HDMI TIMING */
        .i_vsync        (vsync),             // input         i_vsync,
        .i_vde          (vde),               // input         i_vde,
        .i_setx         (set_x),             // input  [11:0] i_setx,
        .i_sety         (set_y),             // input  [11:0] i_sety,
        /* Write to UI-RAM (FROM CONFIG IO REGISTERS) */
        .i_ui_ram_wrclk (APB_HCLK),          // input         i_ui_ram_wrclk,
        .i_ui_ram_wren  (ui_ram_wren),       // input         i_ui_ram_wren,
        .i_ui_ram_wraddr(ui_ram_wraddr),     // input  [ 11:0] i_ui_ram_wraddr,
        .i_ui_ram_wrdata(ui_ram_wrdata),     // input  [ 7:0] i_ui_ram_wrdata,
        /* Final result out */
        .o_ui_pixel     (ui_pixel)           // output [23:0] o_ui_pixel
    );


    /************************************************************/
    // Second Screen
    /************************************************************/
    /** Second Screen Output **/


    assign o_s_hdmi_video_vde   = r_vde[1];
    assign o_s_hdmi_video_hsync = r_hsync[1];
    assign o_s_hdmi_video_vsync = r_vsync[1];
    assign o_s_hdmi_video_data  = (set_x < size_h && set_y > 3 && set_y < size_v) ? {vpu_ram_rddata[15:11], 3'd0, vpu_ram_rddata[10:5], 2'd0, vpu_ram_rddata[4:0], 3'd0} : 0;


    localparam SIZE_H = 256;
    localparam SIZE_V = 256;
    assign vpu_ram_rden = vde && ((set_x < SIZE_H + 1)) && ((set_y < SIZE_V + 1));
    always @(posedge i_clk_hdmi_pixel or negedge i_rstn) begin
        if (~i_rstn) vpu_ram_rdaddr <= 0;
        else if (~vsync) vpu_ram_rdaddr <= 0;
        else if (vpu_ram_rden) vpu_ram_rdaddr <= vpu_ram_rdaddr + 1;
        else vpu_ram_rdaddr <= vpu_ram_rdaddr;
    end



    video_proc_unit vpu (
        .i_proc_unit_clk     (i_clk_hdmi_pixel),      // input          i_proc_unit_clk,       // 视频处理模块总时�?
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
        .o_proc_unit_req_en  (o_proc_unit_req_en),    // output         o_proc_unit_req_en     // 视频处理模块 数据请求使能
        // Video Processor Configs
        .i_config_setx       (config_setx),
        .i_config_sety       (config_sety),
        .i_config_settings   (config_settings),
        .i_configs_1         (configs_1),
        .i_configs_2         (configs_2)
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
