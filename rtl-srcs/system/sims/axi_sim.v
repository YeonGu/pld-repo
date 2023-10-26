`timescale 1ps / 1ps

module axi_sim_top ();
    /******************************************************************/
    // System Signals
    /******************************************************************/
    /** DDR **/
    wire [31:0] ddr3_dq;
    wire [ 3:0] ddr3_dqs_n;
    wire [ 3:0] ddr3_dqs_p;
    wire [14:0] ddr3_addr;
    wire [ 2:0] ddr3_ba;
    wire        ddr3_ras_n;
    wire        ddr3_cas_n;
    wire        ddr3_we_n;
    wire        ddr3_reset_n;
    wire [ 0:0] ddr3_ck_p;
    wire [ 0:0] ddr3_ck_n;
    wire [ 0:0] ddr3_cke;
    wire [ 0:0] ddr3_cs_n;
    wire [ 3:0] ddr3_dm;
    wire [ 0:0] ddr3_odt;
    wire        init_calib_complete;


    /******************************************************************/
    // Clocks
    /******************************************************************/

    /* SYSTEM CLOCKS
	* DDR MIG SYS 	@ 320MHZ = 3125ps
	* DDR REF		@ 200MHZ = 5000ps
	* CAM PCLK		@ 48MHZ  = 20833ps
	* HDMI PCLK		@ 65MHZ  = 15385ps
	*/
    reg         ddr_sys_clk = 0;
    reg         ddr_ref_clk = 0;
    reg         cam_pclk = 0;
    reg         hdmi_pclk = 0;
    always #1562.5 ddr_sys_clk = ~ddr_sys_clk;
    always #2500 ddr_ref_clk = ~ddr_ref_clk;
    always #10417 cam_pclk = ~cam_pclk;
    always #7692 hdmi_pclk = ~hdmi_pclk;

    reg  pll_locked;
    wire sys_rstn;
    initial begin
        pll_locked = 1'b0;
        #100000;
        pll_locked = 1'b1;
    end


    /******************************************************************/
    // Signals & Params
    /******************************************************************/
    // Camera
    reg  [16:0] cam_data = 0;
    wire        cam_wren;
    wire        cam_frame_sync;

    reg  [31:0] bypass_req_addr;
    wire        bypass_req_en;

    wire        video_sync_frame;
    wire        video_fifo_rden;

    // Sim: data in
    // reg [15:0] camera_data_in;
    // initial begin
    //     wait (init_calib_complete == 1'b1);
    //     #100000;
    // end
    reg  [31:0] j = 0;
    always @(posedge cam_pclk) begin
        if (init_calib_complete && (~u_app_top.ui_rst)) begin
            // cam_wren = ~cam_wren;
            // cam_data = cam_data + 1;
            j = (j == 4095) ? 0 : j + 1;
        end
        // if (u_app_top.camera_axi_write.wr_addr == 32'h1000) begin
        //     cam_frame_sync = 1;
        // end else cam_frame_sync = 0;
    end
    assign cam_wren       = ((j > 0) && (j <= 2048));
    assign cam_frame_sync = (j > 3000 && j < 3700);
    always @(posedge cam_pclk) begin
        if (~init_calib_complete) cam_data = 0;
        else cam_data = cam_wren ? cam_data + 1 : cam_data;
    end
    // integer                           j = 0;
    // always @(posedge hdmi_pclk) begin
    //     if (~init_calib_complete) begin
    //         j = 0;
    //     end else j = (j == 4095) ? 0 : j + 1;
    // end
    // assign video_sync_frame = (j >= 0) && (j < 2048);
    // assign video_fifo_rden  = (j >= 2600) && (j < 4090);

    // Sim: HDMI VIDEO DATA OUT
    // always @(posedge hdmi_pclk) begin
    // video_fifo_rden  = init_calib_complete;
    // video_sync_frame = (u_app_top.axi_read_m.video_rd_addr == 32'h1000);
    // end
    reg [31:0] i = 0;
    always @(posedge hdmi_pclk) begin
        if (~init_calib_complete) begin
            i = 0;
        end else i = (i == 4095) ? 0 : i + 1;
    end
    assign video_fifo_rden  = ((i > 0) && (i <= 2048));
    assign video_sync_frame = (i >= 2600) && (i < 3500);


    reg [31:0] k = 0;
    always @(posedge hdmi_pclk) begin
        if (~init_calib_complete) k = 0;
        else k = (k == 4300) ? 0 : k + 1;
    end

    // wire bypass_req_addr, bypass_req_en;
    always @(*) begin
        if (k == 4100) begin
            bypass_req_addr = 32'h0;
        end else if (k == 4101) bypass_req_addr = 32'h400;
        else if (k == 4102) bypass_req_addr = 32'h800;
        else bypass_req_addr = 0;
    end
    assign bypass_req_en = (k == 4100) || (k == 4101) || (k == 4102);

    /******************************************************************/
    // Modules
    /******************************************************************/

    /** Main **/
    ddr_streaming_top u_app_top (
        /* Camera */
        .cam_pclk           (cam_pclk),            // input          cam_pclk,
        .cam_wren           (cam_wren),            // input          cam_wren,
        .cam_data           (cam_data),            // input  [ 15:0] cam_data,
        .cam_frame_sync     (cam_frame_sync),      // input          cam_frame_sync,
        /* Bypass */
        .i_bypass_clk       (hdmi_pclk),           // input          i_bypass_clk,
        .i_bypass_req_addr  (bypass_req_addr),     // input  [ 31:0] i_bypass_req_addr,
        .i_bypass_req_en    (bypass_req_en),       // input          i_bypass_req_en,
        .o_bypass_data_clk  (o_bypass_data_clk),   // output         o_bypass_data_clk,
        .o_bypass_data_en   (o_bypass_data_en),    // output         o_bypass_data_en,
        .o_bypass_data      (o_bypass_data),       // output [127:0] o_bypass_data,
        .o_bypass_last      (o_bypass_last),       // output         o_bypass_last,
        /* HDMI */
        .i_video_pclk       (hdmi_pclk),           // input          i_video_pclk,
        .i_video_sync_frame (video_sync_frame),    // input          i_video_sync_frame,
        .i_video_fifo_rden  (video_fifo_rden),     // input          i_video_fifo_rden,
        .o_video_rddata     (),                    // output [ 15:0] o_video_rddata,
        /* DDR */
        .i_sys_clk          (ddr_sys_clk),         // input          i_sys_clk,           // MIG SYS CLK
        .i_clk_ref          (ddr_ref_clk),         // input          i_clk_ref,           // MIG REF CLK @ 200MHZ
        .i_sys_rstn         (pll_locked),          // input          i_sys_rstn,          // pll_locked
        .ddr3_dq            (ddr3_dq),             // inout  [ 31:0] ddr3_dq,
        .ddr3_dqs_n         (ddr3_dqs_n),          // inout  [  3:0] ddr3_dqs_n,
        .ddr3_dqs_p         (ddr3_dqs_p),          // inout  [  3:0] ddr3_dqs_p,
        .ddr3_addr          (ddr3_addr),           // output [ 14:0] ddr3_addr,
        .ddr3_ba            (ddr3_ba),             // output [  2:0] ddr3_ba,
        .ddr3_ras_n         (ddr3_ras_n),          // output         ddr3_ras_n,
        .ddr3_cas_n         (ddr3_cas_n),          // output         ddr3_cas_n,
        .ddr3_we_n          (ddr3_we_n),           // output         ddr3_we_n,
        .ddr3_reset_n       (ddr3_reset_n),        // output         ddr3_reset_n,
        .ddr3_ck_p          (ddr3_ck_p),           // output [  0:0] ddr3_ck_p,
        .ddr3_ck_n          (ddr3_ck_n),           // output [  0:0] ddr3_ck_n,
        .ddr3_cke           (ddr3_cke),            // output [  0:0] ddr3_cke,
        .ddr3_cs_n          (ddr3_cs_n),           // output [  0:0] ddr3_cs_n,
        .ddr3_dm            (ddr3_dm),             // output [  3:0] ddr3_dm,
        .ddr3_odt           (ddr3_odt),            // output [  0:0] ddr3_odt,
        .init_calib_complete(init_calib_complete)  // output         init_calib_complete
    );

    /** DDR MODEL **/
    ddr3_model ddr3_model_h (
        .rst_n  (ddr3_reset_n),
        .ck     (ddr3_ck_p),
        .ck_n   (ddr3_ck_n),
        .cke    (ddr3_cke),
        .cs_n   (ddr3_cs_n),
        .ras_n  (ddr3_ras_n),
        .cas_n  (ddr3_cas_n),
        .we_n   (ddr3_we_n),
        .dm_tdqs(ddr3_dm[3:2]),
        .ba     (ddr3_ba),
        .addr   (ddr3_addr),
        .dq     (ddr3_dq[31:16]),
        .dqs    (ddr3_dqs_p[3:2]),
        .dqs_n  (ddr3_dqs_n[3:2]),
        .tdqs_n (),
        .odt    (ddr3_odt)
    );
    ddr3_model ddr3_model_l (
        .rst_n  (ddr3_reset_n),
        .ck     (ddr3_ck_p),
        .ck_n   (ddr3_ck_n),
        .cke    (ddr3_cke),
        .cs_n   (ddr3_cs_n),
        .ras_n  (ddr3_ras_n),
        .cas_n  (ddr3_cas_n),
        .we_n   (ddr3_we_n),
        .dm_tdqs(ddr3_dm[1:0]),
        .ba     (ddr3_ba),
        .addr   (ddr3_addr),
        .dq     (ddr3_dq[15:0]),
        .dqs    (ddr3_dqs_p[1:0]),
        .dqs_n  (ddr3_dqs_n[1:0]),
        .tdqs_n (),
        .odt    (ddr3_odt)
    );


endmodule
