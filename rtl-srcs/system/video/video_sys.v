module video_sys (
    input         i_sys_clk,            // MIG SYS CLK
    input         i_clk_ref,            // MIG REF CLK @ 200MHZ
    input         i_sys_rstn,           // pll_locked
    input         i_key1,
    /** Camera **/
    /* Camera Data in*/
    input         i_camera_pclk,
    input  [ 7:0] i_camera_data,
    input         i_camera_hsync,
    input         i_camera_vsync,
    /* Camera Control out */
    output        o_camera_xclk,        // To Camera main clock
    output        o_camera_resetn,      // 1'b1
    output        o_camera_power_down,  // 1'b0
    /* Camera IIC Control */
    inout         io_camera_sda,
    output        o_camera_scl,
    /** HDMI **/
    output        o_tmds_clk_p,
    output        o_tmds_clk_n,
    output [ 2:0] o_tmds_data_p,
    output [ 2:0] o_tmds_data_n,
    /** HDMI **/
    output        o_s_tmds_clk_p,
    output        o_s_tmds_clk_n,
    output [ 2:0] o_s_tmds_data_p,
    output [ 2:0] o_s_tmds_data_n,
    /** DDR **/
    /* Inouts */
    inout  [31:0] ddr3_dq,
    inout  [ 3:0] ddr3_dqs_n,
    inout  [ 3:0] ddr3_dqs_p,
    /* Outputs */
    output [14:0] ddr3_addr,
    output [ 2:0] ddr3_ba,
    output        ddr3_ras_n,
    output        ddr3_cas_n,
    output        ddr3_we_n,
    output        ddr3_reset_n,
    output [ 0:0] ddr3_ck_p,
    output [ 0:0] ddr3_ck_n,
    output [ 0:0] ddr3_cke,
    output [ 0:0] ddr3_cs_n,
    output [ 3:0] ddr3_dm,
    output [ 0:0] ddr3_odt,
    output        init_calib_complete
);
    wire clk_hdmi_pixel, clk_hdmi_pixel_5x;
    wire video_pll_locked;
    clk_wiz_1 video_sys_clk (
        // Clock out ports
        .hdmi_pix_5x(clk_hdmi_pixel_5x),  // output hdmi_pix_5x
        .hdmi_pix   (clk_hdmi_pixel),     // output hdmi_pix @ 65MHZ
        .cam_xclk   (o_camera_xclk),      // output cam_xclk @ 24MHZ
        // Status and control signals
        .reset      (~i_sys_rstn),        // input reset
        .locked     (video_pll_locked),   // output locked
        // Clock in ports
        .clk_in1    (i_clk_ref)           // input clk_in1
    );

    /*******************************************************************/
    // OV5640 CAMERA
    /*******************************************************************/
    wire        camera_rgb565_vde;
    wire        camera_rgb565_vsync;  // Active low
    wire [15:0] camera_rgb565_data;
    Camera_Interface camera_data_interface (
        /** Camera Data in **/
        .i_clk_pixel   (i_camera_pclk),
        .i_rstn        (video_pll_locked),
        /* Camera input data */
        .i_camera_hsync(i_camera_hsync),
        .i_camera_vsync(i_camera_vsync),
        .i_camera_data (i_camera_data),
        /* Processed rgb565 data */
        .o_rgb565_vde  (camera_rgb565_vde),
        .o_rgb565_vsync(camera_rgb565_vsync),
        .o_rgb565_data (camera_rgb565_data)
    );

    wire OV5640_SDA_I;
    wire OV5640_SDA_O;
    wire OV5640_SDA_T;
    assign io_camera_sda       = OV5640_SDA_T == 1'b1 ? OV5640_SDA_O : 1'bz;  // SDA Transmit
    assign OV5640_SDA_I        = io_camera_sda;  // SDA Input
    assign o_camera_resetn     = 1'd1;
    assign o_camera_power_down = 1'd0;

    OV5640_Interface #(
        .CLOCK_FREQ_MHZ(13'd65),  // Use HDMI PCLK @ 65MHZ
        .IIC_Clock_KHz (13'd100)
    ) camera_controller (
        .i_clk        (clk_hdmi_pixel),
        .i_rstn       (video_pll_locked),
        /** Camera IIC Control **/
        .o_iic_scl    (o_camera_scl),
        .i_iic_sda    (OV5640_SDA_I),
        .o_iic_sda    (OV5640_SDA_O),
        .o_iic_sda_dir(OV5640_SDA_T)
    );


    /*******************************************************************/
    // HDMI
    /*******************************************************************/
    wire         video_fifo_rden;
    wire [ 15:0] video_fifo_data;

    wire [ 23:0] hdmi_rgb_data;
    wire         hdmi_rgb_vde;
    wire         hdmi_rgb_hsync;
    wire         hdmi_rgb_vsync;

    wire [ 23:0] s_hdmi_rgb_data;
    wire         s_hdmi_rgb_vde;
    wire         s_hdmi_rgb_hsync;
    wire         s_hdmi_rgb_vsync;

    wire         req_clk;
    wire [ 31:0] req_addr;
    wire         req_en;

    wire         bypass_data_clk;
    wire         bypass_data_en;
    wire [127:0] bypass_data;
    wire         bypass_last;

    video_generator video_generator_inst (
        .i_clk_hdmi_pixel    (clk_hdmi_pixel),
        .i_rstn              (video_pll_locked),
        // FETCH VIDEO DATA
        .o_video_fifo_rden   (video_fifo_rden),
        .i_video_fifo_data   (video_fifo_data),
        // HDMI RGB VIDEO DATA OUT
        .o_hdmi_video_data   (hdmi_rgb_data),
        .o_hdmi_video_vde    (hdmi_rgb_vde),
        .o_hdmi_video_hsync  (hdmi_rgb_hsync),
        .o_hdmi_video_vsync  (hdmi_rgb_vsync),
        // Output HDMI SLAVE SCREEN DATA
        .o_s_hdmi_video_data (s_hdmi_rgb_data),   // output [ 23:0] o_s_hdmi_video_data,
        .o_s_hdmi_video_vde  (s_hdmi_rgb_vde),    // output         o_s_hdmi_video_vde,
        .o_s_hdmi_video_hsync(s_hdmi_rgb_hsync),  // output         o_s_hdmi_video_hsync,
        .o_s_hdmi_video_vsync(s_hdmi_rgb_vsync),  // output         o_s_hdmi_video_vsync,
        // Video Processor Unit
        .o_proc_unit_clk     (req_clk),           // output         o_proc_unit_clk,
        .o_proc_unit_req_addr(req_addr),          // output [ 31:0] o_proc_unit_req_addr,
        .o_proc_unit_req_en  (req_en),            // output         o_proc_unit_req_en,
        // Video Processor Data in
        .i_bypass_data_clk   (bypass_data_clk),   // input          i_bypass_data_clk,
        .i_bypass_data_en    (bypass_data_en),    // input          i_bypass_data_en,
        .i_bypass_data       (bypass_data),       // input  [127:0] i_bypass_data,
        .i_bypass_rlast      (bypass_rlast)       // input          i_bypass_rlast
    );
    HDMI_Interface HDMI_TMDS_Interface (
        .i_clk_pixel  (clk_hdmi_pixel),
        .i_clk_pixel5x(clk_hdmi_pixel_5x),
        .i_rstn       (video_pll_locked),
        .i_rgb_data   (hdmi_rgb_data),
        .i_rgb_vde    (hdmi_rgb_vde),
        .i_rgb_hsync  (hdmi_rgb_hsync),
        .i_rgb_vsync  (hdmi_rgb_vsync),
        .o_tmds_clk_p (o_tmds_clk_p),
        .o_tmds_clk_n (o_tmds_clk_n),
        .o_tmds_data_p(o_tmds_data_p),
        .o_tmds_data_n(o_tmds_data_n)
    );
    HDMI_Interface S_HDMI_TMDS_Interface (
        .i_clk_pixel  (clk_hdmi_pixel),
        .i_clk_pixel5x(clk_hdmi_pixel_5x),
        .i_rstn       (video_pll_locked),
        .i_rgb_data   (s_hdmi_rgb_data),
        .i_rgb_vde    (s_hdmi_rgb_vde),
        .i_rgb_hsync  (s_hdmi_rgb_hsync),
        .i_rgb_vsync  (s_hdmi_rgb_vsync),
        .o_tmds_clk_p (o_s_tmds_clk_p),
        .o_tmds_clk_n (o_s_tmds_clk_n),
        .o_tmds_data_p(o_s_tmds_data_p),
        .o_tmds_data_n(o_s_tmds_data_n)
    );

    /*******************************************************************/
    // Memory
    /*******************************************************************/
    wire [15:0] sim_cam_data;
    wire        sim_cam_wren;
    wire        sim_cam_vsync;
    debug_sim_cam debug_cam (
        .i_clk_pix    (clk_hdmi_pixel),    // input         i_clk_pix,
        .i_rstn       (video_pll_locked),  // input         i_rstn,
        .i_use_color  (i_key1),            // input         i_use_color,
        .sim_data     (sim_cam_data),      // output [15:0] sim_data,
        .sim_data_wren(sim_cam_wren),      // output        sim_data_wren,
        .sim_vsync    (sim_cam_vsync)      // output        sim_vsync
    );
    ddr_streaming_top memory_top (
        /** Camera Data in **/
        // Debug only
        // .cam_pclk           (clk_hdmi_pixel),      // input          cam_pclk,
        // .cam_wren           (sim_cam_wren),        // input          cam_wren,
        // .cam_data           (sim_cam_data),        // input  [ 15:0] cam_data,
        // .cam_frame_sync     (sim_cam_vsync),       // input          cam_frame_sync,
        .cam_pclk           (i_camera_pclk),         // input          cam_pclk,
        .cam_wren           (camera_rgb565_vde),     // input          cam_wren,
        .cam_data           (camera_rgb565_data),    // input  [ 15:0] cam_data,
        .cam_frame_sync     (~camera_rgb565_vsync),  // input          cam_frame_sync,
        /** Bypass **/
        // Bypass Read Request in
        .i_bypass_clk       (req_clk),               // input          i_bypass_clk,
        .i_bypass_req_addr  (req_addr),              // input  [ 31:0] i_bypass_req_addr,
        .i_bypass_req_en    (req_en),                // input          i_bypass_req_en,
        // Bypass Read Data out
        .o_bypass_data_clk  (bypass_data_clk),       // output         o_bypass_data_clk,
        .o_bypass_data_en   (bypass_data_en),        // output         o_bypass_data_en,
        .o_bypass_data      (bypass_data),           // output [127:0] o_bypass_data,
        .o_bypass_last      (bypass_rlast),          // output         o_bypass_last,
        /** Video Read Data **/
        .i_video_pclk       (clk_hdmi_pixel),        // input          i_video_pclk,
        .i_video_sync_frame (~hdmi_rgb_vsync),       // input          i_video_sync_frame,
        .i_video_fifo_rden  (video_fifo_rden),       // input          i_video_fifo_rden,
        .o_video_rddata     (video_fifo_data),       // output [ 15:0] o_video_rddata,
        /** MIG SYS CLK **/
        .i_sys_clk          (i_sys_clk),             // input          i_sys_clk,           // MIG SYS CLK
        .i_clk_ref          (i_clk_ref),             // input          i_clk_ref,           // MIG REF CLK @ 200MHZ
        .i_sys_rstn         (i_sys_rstn),            // input          i_sys_rstn,          // pll_locked
        /** DDR phy pins **/
        /* Inouts */
        .ddr3_dq            (ddr3_dq),               // inout  [ 31:0] ddr3_dq,
        .ddr3_dqs_n         (ddr3_dqs_n),            // inout  [  3:0] ddr3_dqs_n,
        .ddr3_dqs_p         (ddr3_dqs_p),            // inout  [  3:0] ddr3_dqs_p,
        /* Outputs */
        .ddr3_addr          (ddr3_addr),             // output [ 14:0] ddr3_addr,
        .ddr3_ba            (ddr3_ba),               // output [  2:0] ddr3_ba,
        .ddr3_ras_n         (ddr3_ras_n),            // output         ddr3_ras_n,
        .ddr3_cas_n         (ddr3_cas_n),            // output         ddr3_cas_n,
        .ddr3_we_n          (ddr3_we_n),             // output         ddr3_we_n,
        .ddr3_reset_n       (ddr3_reset_n),          // output         ddr3_reset_n,
        .ddr3_ck_p          (ddr3_ck_p),             // output [  0:0] ddr3_ck_p,
        .ddr3_ck_n          (ddr3_ck_n),             // output [  0:0] ddr3_ck_n,
        .ddr3_cke           (ddr3_cke),              // output [  0:0] ddr3_cke,
        .ddr3_cs_n          (ddr3_cs_n),             // output [  0:0] ddr3_cs_n,
        .ddr3_dm            (ddr3_dm),               // output [  3:0] ddr3_dm,
        .ddr3_odt           (ddr3_odt),              // output [  0:0] ddr3_odt,
        .init_calib_complete(init_calib_complete)    // output         init_calib_complete
    );

endmodule
