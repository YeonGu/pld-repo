module stream_memc_axi (


    input i_sys_clk,
    input i_clk_ref,
    input i_sys_rstn,

    output ui_clk,
    output ui_clk_sync_rst,
    output mmcm_locked,
    input  aresetn,
    input  app_sr_req,
    input  app_ref_req,
    input  app_zq_req,
    output app_sr_active,
    output app_ref_ack,
    output app_zq_ack,

    /** DDR phy pins **/
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


    /**********************************************************************/
    // MIG Inst
    /**********************************************************************/
    mig_7series_0 mig_inst (
        // Memory interface ports
        .ddr3_addr          (ddr3_addr),           // output [14:0]		ddr3_addr
        .ddr3_ba            (ddr3_ba),             // output [2:0]		ddr3_ba
        .ddr3_cas_n         (ddr3_cas_n),          // output			ddr3_cas_n
        .ddr3_ck_n          (ddr3_ck_n),           // output [0:0]		ddr3_ck_n
        .ddr3_ck_p          (ddr3_ck_p),           // output [0:0]		ddr3_ck_p
        .ddr3_cke           (ddr3_cke),            // output [0:0]		ddr3_cke
        .ddr3_ras_n         (ddr3_ras_n),          // output			ddr3_ras_n
        .ddr3_reset_n       (ddr3_reset_n),        // output			ddr3_reset_n
        .ddr3_we_n          (ddr3_we_n),           // output			ddr3_we_n
        .ddr3_dq            (ddr3_dq),             // inout [31:0]		ddr3_dq
        .ddr3_dqs_n         (ddr3_dqs_n),          // inout [3:0]		ddr3_dqs_n
        .ddr3_dqs_p         (ddr3_dqs_p),          // inout [3:0]		ddr3_dqs_p
        .init_calib_complete(init_calib_complete), // output			init_calib_complete

        .ddr3_cs_n(ddr3_cs_n),  // output [0:0]		ddr3_cs_n
        .ddr3_dm  (ddr3_dm),    // output [3:0]		ddr3_dm
        .ddr3_odt (ddr3_odt),   // output [0:0]		ddr3_odt

        // Application interface ports
        .ui_clk         (ui_clk),           // output			ui_clk
        .ui_clk_sync_rst(ui_clk_sync_rst),  // output			ui_clk_sync_rst
        .mmcm_locked    (mmcm_locked),      // output			mmcm_locked
        .aresetn        (aresetn),          // input			aresetn
        .app_sr_req     (app_sr_req),       // input			app_sr_req
        .app_ref_req    (app_ref_req),      // input			app_ref_req
        .app_zq_req     (app_zq_req),       // input			app_zq_req
        .app_sr_active  (app_sr_active),    // output			app_sr_active
        .app_ref_ack    (app_ref_ack),      // output			app_ref_ack
        .app_zq_ack     (app_zq_ack),       // output			app_zq_ack
        // -1- 写地址与控制 Slave Interface Write Address Ports 
        .s_axi_awid     (4'b0),             // input [3:0]	s_axi_awid
        .s_axi_awaddr   (s_axi_awaddr),     // input [29:0]	s_axi_awaddr
        .s_axi_awlen    (s_axi_awlen),      // input [7:0]	s_axi_awlen
        .s_axi_awsize   (3'b111),           // input [2:0]	s_axi_awsize
        .s_axi_awburst  (2'b01),            // input [1:0]	s_axi_awburst [INCR]
        .s_axi_awlock   (s_axi_awlock),     // input [0:0]	s_axi_awlock
        .s_axi_awcache  (s_axi_awcache),    // input [3:0]	s_axi_awcache
        .s_axi_awprot   (s_axi_awprot),     // input [2:0]	s_axi_awprot
        .s_axi_awqos    (s_axi_awqos),      // input [3:0]	s_axi_awqos
        .s_axi_awvalid  (s_axi_awvalid),    // input		s_axi_awvalid
        .s_axi_awready  (s_axi_awready),    // output		s_axi_awready
        // -2- 写数据 Slave Interface Write Data Ports 
        .s_axi_wdata    (s_axi_wdata),      // input [127:0]	s_axi_wdata
        .s_axi_wstrb    (16'hFFFF),         // input [15:0]		s_axi_wstrb
        .s_axi_wlast    (s_axi_wlast),      // input			s_axi_wlast
        .s_axi_wvalid   (s_axi_wvalid),     // input			s_axi_wvalid
        .s_axi_wready   (s_axi_wready),     // output			s_axi_wready
        // -3- 写响应 Slave Interface Write Response Ports 
        .s_axi_bid      (s_axi_bid),        // output [3:0]			s_axi_bid
        .s_axi_bresp    (s_axi_bresp),      // output [1:0]			s_axi_bresp
        .s_axi_bvalid   (s_axi_bvalid),     // output			s_axi_bvalid
        .s_axi_bready   (s_axi_bready),     // input			s_axi_bready
        // -4- 读地址和控制 Slave Interface Read Address Ports
        .s_axi_arid     (4'b0),             // input [3:0]			s_axi_arid
        .s_axi_araddr   (s_axi_araddr),     // input [29:0]			s_axi_araddr
        .s_axi_arlen    (s_axi_arlen),      // input [7:0]			s_axi_arlen
        .s_axi_arsize   (s_axi_arsize),     // input [2:0]			s_axi_arsize
        .s_axi_arburst  (s_axi_arburst),    // input [1:0]			s_axi_arburst
        .s_axi_arlock   (s_axi_arlock),     // input [0:0]			s_axi_arlock
        .s_axi_arcache  (s_axi_arcache),    // input [3:0]			s_axi_arcache
        .s_axi_arprot   (s_axi_arprot),     // input [2:0]			s_axi_arprot
        .s_axi_arqos    (s_axi_arqos),      // input [3:0]			s_axi_arqos
        .s_axi_arvalid  (s_axi_arvalid),    // input			s_axi_arvalid
        .s_axi_arready  (s_axi_arready),    // output			s_axi_arready
        // -5- 读数据 Slave Interface Read Data Ports
        .s_axi_rid      (s_axi_rid),        // output [3:0]			s_axi_rid
        .s_axi_rdata    (s_axi_rdata),      // output [127:0]			s_axi_rdata
        .s_axi_rresp    (s_axi_rresp),      // output [1:0]			s_axi_rresp
        .s_axi_rlast    (s_axi_rlast),      // output			s_axi_rlast
        .s_axi_rvalid   (s_axi_rvalid),     // output			s_axi_rvalid
        .s_axi_rready   (s_axi_rready),     // input			s_axi_rready

        // System Clock Ports
        .sys_clk_i(i_sys_clk),
        // Reference Clock Ports
        .clk_ref_i(i_clk_ref),
        .sys_rst  (i_sys_rstn)  // input sys_rst
    );
endmodule
