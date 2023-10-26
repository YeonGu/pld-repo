

module sys_top (
    input         i_soc_clk,            // 50M Clock on board
    input         i_rstn,               // pll_locked
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
    wire clk_ddr_sys;  // 320M
    wire clk_ddr_ref;  // 200M
    wire soc_pll_locked;

    clk_wiz_0 soc_clk (
        // Clock out ports
        .clk_ddr_sys(clk_ddr_sys),     // output clk_ddr_sys
        .clk_ddr_ref(clk_ddr_ref),     // output clk_ddr_ref
        // Status and control signals
        .reset      (!i_rstn),         // input reset
        .locked     (soc_pll_locked),  // output locked
        // Clock in ports
        .clk_in1    (i_soc_clk)        // input clk_in1
    );

    video_sys video_system (
        .i_sys_clk          (clk_ddr_sys),              // input         i_sys_clk,            // MIG SYS CLK
        .i_clk_ref          (clk_ddr_ref),              // input         i_clk_ref,            // MIG REF CLK @ 200MHZ
        .i_sys_rstn         (i_rstn & soc_pll_locked),  // input         i_sys_rstn,           // pll_locked
        .i_key1             (i_key1),                   // input         i_key1,
        .i_camera_pclk      (i_camera_pclk),            // input         i_camera_pclk,
        .i_camera_data      (i_camera_data),            // input  [ 7:0] i_camera_data,
        .i_camera_hsync     (i_camera_hsync),           // input         i_camera_hsync,
        .i_camera_vsync     (i_camera_vsync),           // input         i_camera_vsync,
        .o_camera_xclk      (o_camera_xclk),            // output        o_camera_xclk,        // To Camera main clock
        .o_camera_resetn    (o_camera_resetn),          // output        o_camera_resetn,      // 1'b1
        .o_camera_power_down(o_camera_power_down),      // output        o_camera_power_down,  // 1'b0
        .io_camera_sda      (io_camera_sda),            // inout         io_camera_sda,
        .o_camera_scl       (o_camera_scl),             // output        o_camera_scl,
        .o_tmds_clk_p       (o_tmds_clk_p),             // output        o_tmds_clk_p,
        .o_tmds_clk_n       (o_tmds_clk_n),             // output        o_tmds_clk_n,
        .o_tmds_data_p      (o_tmds_data_p),            // output [ 2:0] o_tmds_data_p,
        .o_tmds_data_n      (o_tmds_data_n),            // output [ 2:0] o_tmds_data_n,
        .o_s_tmds_clk_p     (o_s_tmds_clk_p),           // output        o_tmds_clk_p,
        .o_s_tmds_clk_n     (o_s_tmds_clk_n),           // output        o_tmds_clk_n,
        .o_s_tmds_data_p    (o_s_tmds_data_p),          // output [ 2:0] o_tmds_data_p,
        .o_s_tmds_data_n    (o_s_tmds_data_n),          // output [ 2:0] o_tmds_data_n,
        .ddr3_dq            (ddr3_dq),                  // inout  [31:0] ddr3_dq,
        .ddr3_dqs_n         (ddr3_dqs_n),               // inout  [ 3:0] ddr3_dqs_n,
        .ddr3_dqs_p         (ddr3_dqs_p),               // inout  [ 3:0] ddr3_dqs_p,
        .ddr3_addr          (ddr3_addr),                // output [14:0] ddr3_addr,
        .ddr3_ba            (ddr3_ba),                  // output [ 2:0] ddr3_ba,
        .ddr3_ras_n         (ddr3_ras_n),               // output        ddr3_ras_n,
        .ddr3_cas_n         (ddr3_cas_n),               // output        ddr3_cas_n,
        .ddr3_we_n          (ddr3_we_n),                // output        ddr3_we_n,
        .ddr3_reset_n       (ddr3_reset_n),             // output        ddr3_reset_n,
        .ddr3_ck_p          (ddr3_ck_p),                // output [ 0:0] ddr3_ck_p,
        .ddr3_ck_n          (ddr3_ck_n),                // output [ 0:0] ddr3_ck_n,
        .ddr3_cke           (ddr3_cke),                 // output [ 0:0] ddr3_cke,
        .ddr3_cs_n          (ddr3_cs_n),                // output [ 0:0] ddr3_cs_n,
        .ddr3_dm            (ddr3_dm),                  // output [ 3:0] ddr3_dm,
        .ddr3_odt           (ddr3_odt),                 // output [ 0:0] ddr3_odt,
        .init_calib_complete(init_calib_complete)       // output        init_calib_complete
    );

endmodule
