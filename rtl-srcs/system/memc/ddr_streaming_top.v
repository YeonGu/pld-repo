
// DDR系统整合

module ddr_streaming_top (
    /** Camera Data in **/
    input          cam_pclk,
    input          cam_wren,
    input  [ 15:0] cam_data,
    input          cam_frame_sync,
    /** Bypass **/
    // Bypass Read Request in
    input          i_bypass_clk,
    input  [ 31:0] i_bypass_req_addr,
    input          i_bypass_req_en,
    // Bypass Read Data out
    output         o_bypass_data_clk,
    output         o_bypass_data_en,
    output [127:0] o_bypass_data,
    output         o_bypass_last,
    /** Video Read Data **/
    input          i_video_pclk,
    input          i_video_sync_frame,
    input          i_video_fifo_rden,
    output [ 15:0] o_video_rddata,
    /** MIG SYS CLK **/
    input          i_sys_clk,           // MIG SYS CLK
    input          i_clk_ref,           // MIG REF CLK @ 200MHZ
    input          i_sys_rstn,          // pll_locked
    /** DDR phy pins **/
    /* Inouts */
    inout  [ 31:0] ddr3_dq,
    inout  [  3:0] ddr3_dqs_n,
    inout  [  3:0] ddr3_dqs_p,
    /* Outputs */
    output [ 14:0] ddr3_addr,
    output [  2:0] ddr3_ba,
    output         ddr3_ras_n,
    output         ddr3_cas_n,
    output         ddr3_we_n,
    output         ddr3_reset_n,
    output [  0:0] ddr3_ck_p,
    output [  0:0] ddr3_ck_n,
    output [  0:0] ddr3_cke,
    output [  0:0] ddr3_cs_n,
    output [  3:0] ddr3_dm,
    output [  0:0] ddr3_odt,
    output         init_calib_complete
);

    wire ui_clk_sync_rst;
    wire mmcm_locked;
    wire ui_clk, ui_rst;

    /************************************************************/
    // AXI CHANNELS
    /************************************************************/
    /** AXI WRITE ADDRESS **/
    wire [  3:0] AXI_AWID;
    wire [ 31:0] AXI_AWADDR;
    wire [  7:0] AXI_AWLEN;
    wire [  2:0] AXI_AWSIZE;
    wire [  1:0] AXI_AWBURST;
    wire         AXI_AWLOCK;
    wire [  3:0] AXI_AWCACHE;
    wire [  2:0] AXI_AWPROT;
    wire [  3:0] AXI_AWQOS;
    wire         AXI_AWVALID;
    wire         AXI_AWREADY;
    /** AXI WRITE DATA **/
    wire [127:0] AXI_WDATA;
    wire [ 15:0] AXI_WSTRB;
    wire         AXI_WLAST;
    wire         AXI_WVALID;
    wire         AXI_WREADY;
    /** AXI WRITE RESPONSE **/
    wire [  3:0] AXI_BID;
    wire [  1:0] AXI_BRESP;
    wire         AXI_BVALID;
    wire         AXI_BREADY;

    /** AXI READ ADDRESS **/
    wire [  3:0] AXI_ARID;
    wire [ 31:0] AXI_ARADDR;
    wire [  7:0] AXI_ARLEN;
    wire [  2:0] AXI_ARSIZE;
    wire [  1:0] AXI_ARBURST;
    wire [  1:0] AXI_ARLOCK;
    wire [  3:0] AXI_ARCACHE;
    wire [  2:0] AXI_ARPROT;
    wire [  3:0] AXI_ARQOS;
    wire         AXI_ARVALID;
    wire         AXI_ARREADY;
    /** AXI READ DATA **/
    wire [  3:0] AXI_RID;
    wire [127:0] AXI_RDATA;
    wire [  1:0] AXI_RRESP;
    wire         AXI_RLAST;
    wire         AXI_RVALID;
    wire         AXI_RREADY;

    axi_master_write camera_axi_write (
        /******** Camera Data in *********/
        .cam_pclk      (cam_pclk),        // input          cam_pclk,
        .cam_wren      (cam_wren),        // input          cam_wren,
        .cam_data      (cam_data),        // input  [ 15:0] cam_data,
        .cam_frame_sync(cam_frame_sync),  // input          cam_frame_sync,
        /******** AXI Master *********/
        .ARESETN       (~ui_rst),         // input          ARESETN,         //axi复位
        .ACLK          (ui_clk),          // input          ACLK,            //axi总时钟
        // Address Write Channel
        .M_AXI_AWID    (AXI_AWID),        // output [  3:0] M_AXI_AWID,      // [PARAM] 写地址ID，用来标志一组写信号。随意设置。
        .M_AXI_AWADDR  (AXI_AWADDR),      // output [ 31:0] M_AXI_AWADDR,    // 写地址，给出一次写突发传输的写地址
        .M_AXI_AWLEN   (AXI_AWLEN),       // output [  7:0] M_AXI_AWLEN,     // 突发长度，给出突发传输的次数  
        .M_AXI_AWSIZE  (AXI_AWSIZE),      // output [  2:0] M_AXI_AWSIZE,    // [CONFIG] 突发大小，给出每次突发传输的字节数  
        .M_AXI_AWBURST (AXI_AWBURST),     // output [  1:0] M_AXI_AWBURST,   // [PARAM] 突发类型  
        .M_AXI_AWLOCK  (AXI_AWLOCK),      // output         M_AXI_AWLOCK,    // [PARAM] 总线锁信号，可提供操作的原子性  
        .M_AXI_AWCACHE (AXI_AWCACHE),     // output [  3:0] M_AXI_AWCACHE,   // [PARAM] 内存类型，表明一次传输是怎样通过系统的  
        .M_AXI_AWPROT  (AXI_AWPROT),      // output [  2:0] M_AXI_AWPROT,    // [PARAM] 保护类型，表明一次传输的特权级及安全等级  
        .M_AXI_AWQOS   (AXI_AWQOS),       // output [  3:0] M_AXI_AWQOS,     // [PARAM] 质量服务QoS. 4'b0000
        .M_AXI_AWVALID (AXI_AWVALID),     // output         M_AXI_AWVALID,   // 有效信号，表明此通道的地址控制信号有效
        .M_AXI_AWREADY (AXI_AWREADY),     // input          M_AXI_AWREADY,   // 表明“从”可以接收地址和对应的控制信号
        // Data Write Channel
        .M_AXI_WDATA   (AXI_WDATA),       // output [127:0] M_AXI_WDATA,     // 写数据
        .M_AXI_WSTRB   (AXI_WSTRB),       // output [ 15:0] M_AXI_WSTRB,     // [CONFIG] 写数据有效的字节线
        .M_AXI_WLAST   (AXI_WLAST),       // output         M_AXI_WLAST,     // 表明此次传输是最后一个突发传输
        .M_AXI_WVALID  (AXI_WVALID),      // output         M_AXI_WVALID,    // 写有效，表明此次写有效
        .M_AXI_WREADY  (AXI_WREADY),      // input          M_AXI_WREADY,    // 表明从机可以接收写数据
        // Write Response Channel
        .M_AXI_BID     (AXI_BID),         // input  [  3:0] M_AXI_BID,       // [PARAM] 写响应ID TAG
        .M_AXI_BRESP   (AXI_BRESP),       // input  [  1:0] M_AXI_BRESP,     // 写响应，表明写传输的状态
        .M_AXI_BVALID  (AXI_BVALID),      // input          M_AXI_BVALID,    // 写响应有效
        .M_AXI_BREADY  (AXI_BREADY)       // output         M_AXI_BREADY     // 表明主机能够接收写响应
    );

    /** AXI Master Read **/
    axi_master_read axi_read_m (
        .sys_rstn        (i_sys_rstn),           // input          sys_rstn,          // PLL Locked
        .ARESETN         (~ui_rst),              // input          ARESETN,           //axi复位
        .ACLK            (ui_clk),               // input          ACLK,              //axi时钟
        .mig_init_finish (init_calib_complete),
        /* Video Data Read */
        .video_pclk      (i_video_pclk),         // input          video_pclk,
        .video_sync_frame(i_video_sync_frame),   // input          video_sync_frame,
        .video_fifo_rden (i_video_fifo_rden),    // input          video_fifo_rden,
        .video_rddata    (o_video_rddata),       // output [ 15:0] video_rddata,
        /* Bypass req in */
        .bypass_clk      (i_bypass_clk),         // input          bypass_clk,
        .bypass_req_addr (i_bypass_req_addr),    // input  [ 31:0] bypass_req_addr,
        .bypass_req_en   (i_bypass_req_en),      // input          bypass_req_en,
        /** Bypass Data **/
        .bypass_out_clk  (o_bypass_data_clk),    // output         bypass_out_clk,
        .bypass_out_en   (o_bypass_data_en),     // output         bypass_out_en,
        .bypass_out_data (o_bypass_data),        // output [127:0] bypass_out_data,
        .bypass_out_last (o_bypass_last),        // output         bypass_out_last,
        .M_AXI_ARID      (AXI_ARID),             // output [  3:0] M_AXI_ARID,        //读地址ID，用来标志一组写信号
        .M_AXI_ARADDR    (AXI_ARADDR),           // output [ 31:0] M_AXI_ARADDR,      //读地址，给出一次写突发传输的读地址
        .M_AXI_ARLEN     (AXI_ARLEN),            // output [  7:0] M_AXI_ARLEN,       //突发长度，给出突发传输的次数
        .M_AXI_ARSIZE    (AXI_ARSIZE),           // output [  2:0] M_AXI_ARSIZE,      //突发大小，给出每次突发传输的字节数
        .M_AXI_ARBURST   (AXI_ARBURST),          // output [  1:0] M_AXI_ARBURST,     //突发类型
        .M_AXI_ARLOCK    (AXI_ARLOCK),           // output [  1:0] M_AXI_ARLOCK,      //总线锁信号，可提供操作的原子性
        .M_AXI_ARCACHE   (AXI_ARCACHE),          // output [  3:0] M_AXI_ARCACHE,     //内存类型，表明一次传输是怎样通过系统的
        .M_AXI_ARPROT    (AXI_ARPROT),           // output [  2:0] M_AXI_ARPROT,      //保护类型，表明一次传输的特权级及安全等级
        .M_AXI_ARQOS     (AXI_ARQOS),            // output [  3:0] M_AXI_ARQOS,       //质量服务QOS
        .M_AXI_ARVALID   (AXI_ARVALID),          // output         M_AXI_ARVALID,     //有效信号，表明此通道的地址控制信号有效
        .M_AXI_ARREADY   (AXI_ARREADY),          // input          M_AXI_ARREADY,     //表明“从”可以接收地址和对应的控制信号
        .M_AXI_RID       (AXI_RID),              // input  [  3:0] M_AXI_RID,         //读ID tag
        .M_AXI_RDATA     (AXI_RDATA),            // input  [127:0] M_AXI_RDATA,       //读数据
        .M_AXI_RRESP     (AXI_RRESP),            // input  [  1:0] M_AXI_RRESP,       //读响应，表明读传输的状态
        .M_AXI_RLAST     (AXI_RLAST),            // input          M_AXI_RLAST,       //表明读突发的最后一次传输
        .M_AXI_RVALID    (AXI_RVALID),           // input          M_AXI_RVALID,      //表明此通道信号有效
        .M_AXI_RREADY    (AXI_RREADY)            // output         M_AXI_RREADY       //表明主机能够接收读数据和响应信息
    );


    mig_7series_0 mig_inst (
        // System Clock Ports
        .sys_clk_i          (i_sys_clk),
        // Reference Clock Ports
        .clk_ref_i          (i_clk_ref),
        .sys_rst            (i_sys_rstn),           // input sys_rst
        // Memory interface ports
        .ddr3_addr          (ddr3_addr),            // output [14:0]		ddr3_addr
        .ddr3_ba            (ddr3_ba),              // output [2:0]		ddr3_ba
        .ddr3_cas_n         (ddr3_cas_n),           // output			ddr3_cas_n
        .ddr3_ck_n          (ddr3_ck_n),            // output [0:0]		ddr3_ck_n
        .ddr3_ck_p          (ddr3_ck_p),            // output [0:0]		ddr3_ck_p
        .ddr3_cke           (ddr3_cke),             // output [0:0]		ddr3_cke
        .ddr3_ras_n         (ddr3_ras_n),           // output			ddr3_ras_n
        .ddr3_reset_n       (ddr3_reset_n),         // output			ddr3_reset_n
        .ddr3_we_n          (ddr3_we_n),            // output			ddr3_we_n
        .ddr3_dq            (ddr3_dq),              // inout [31:0]		ddr3_dq
        .ddr3_dqs_n         (ddr3_dqs_n),           // inout [3:0]		ddr3_dqs_n
        .ddr3_dqs_p         (ddr3_dqs_p),           // inout [3:0]		ddr3_dqs_p
        .init_calib_complete(init_calib_complete),  // output			init_calib_complete
        .ddr3_cs_n          (ddr3_cs_n),            // output [0:0]		ddr3_cs_n
        .ddr3_dm            (ddr3_dm),              // output [3:0]		ddr3_dm
        .ddr3_odt           (ddr3_odt),             // output [0:0]		ddr3_odt

        // Application interface ports
        .ui_clk         (ui_clk),       // output			ui_clk
        .ui_clk_sync_rst(ui_rst),       // output			ui_clk_sync_rst
        .mmcm_locked    (mmcm_locked),  // output			mmcm_locked
        .aresetn        (i_sys_rstn),   // input			aresetn
        .app_sr_req     ('b0),          // input			app_sr_req
        .app_ref_req    ('b0),          // input			app_ref_req
        .app_zq_req     ('b0),          // input			app_zq_req
        .app_sr_active  (),             // output			app_sr_active
        .app_ref_ack    (),             // output			app_ref_ack
        .app_zq_ack     (),             // output			app_zq_ack
        // -1- 写地址与控制 Slave Interface Write Address Ports 
        .s_axi_awid     (AXI_AWID),     // input [3:0]	s_axi_awid
        .s_axi_awaddr   (AXI_AWADDR),   // input [29:0]	s_axi_awaddr
        .s_axi_awlen    (AXI_AWLEN),    // input [7:0]	s_axi_awlen
        .s_axi_awsize   (AXI_AWSIZE),   // input [2:0]	s_axi_awsize
        .s_axi_awburst  (AXI_AWBURST),  // input [1:0]	s_axi_awburst [INCR]
        .s_axi_awlock   (AXI_AWLOCK),   // input [0:0]	s_axi_awlock
        .s_axi_awcache  (AXI_AWCACHE),  // input [3:0]	s_axi_awcache
        .s_axi_awprot   (AXI_AWPROT),   // input [2:0]	s_axi_awprot
        .s_axi_awqos    (AXI_AWQOS),    // input [3:0]	s_axi_awqos
        .s_axi_awvalid  (AXI_AWVALID),  // input		s_axi_awvalid
        .s_axi_awready  (AXI_AWREADY),  // output		s_axi_awready
        // -2- 写数据 Slave Interface Write Data Ports 
        .s_axi_wdata    (AXI_WDATA),    // input [127:0]	s_axi_wdata
        .s_axi_wstrb    (AXI_WSTRB),    // input [15:0]		s_axi_wstrb
        .s_axi_wlast    (AXI_WLAST),    // input			s_axi_wlast
        .s_axi_wvalid   (AXI_WVALID),   // input			s_axi_wvalid
        .s_axi_wready   (AXI_WREADY),   // output			s_axi_wready
        // -3- 写响应 Slave Interface Write Response Ports 
        .s_axi_bid      (AXI_BID),      // output [3:0]			s_axi_bid
        .s_axi_bresp    (AXI_BRESP),    // output [1:0]			s_axi_bresp
        .s_axi_bvalid   (AXI_BVALID),   // output			s_axi_bvalid
        .s_axi_bready   (AXI_BREADY),   // input			s_axi_bready
        // -4- 读地址和控制 Slave Interface Read Address Ports
        .s_axi_arid     (AXI_ARID),     // input [3:0]			s_axi_arid
        .s_axi_araddr   (AXI_ARADDR),   // input [29:0]			s_axi_araddr
        .s_axi_arlen    (AXI_ARLEN),    // input [7:0]			s_axi_arlen
        .s_axi_arsize   (AXI_ARSIZE),   // input [2:0]			s_axi_arsize
        .s_axi_arburst  (AXI_ARBURST),  // input [1:0]			s_axi_arburst
        .s_axi_arlock   (AXI_ARLOCK),   // input [0:0]			s_axi_arlock
        .s_axi_arcache  (AXI_ARCACHE),  // input [3:0]			s_axi_arcache
        .s_axi_arprot   (AXI_ARPROT),   // input [2:0]			s_axi_arprot
        .s_axi_arqos    (AXI_ARQOS),    // input [3:0]			s_axi_arqos
        .s_axi_arvalid  (AXI_ARVALID),  // input			s_axi_arvalid
        .s_axi_arready  (AXI_ARREADY),  // output			s_axi_arready
        // -5- 读数据 Slave Interface Read Data Ports
        .s_axi_rid      (AXI_RID),      // output [3:0]			s_axi_rid
        .s_axi_rdata    (AXI_RDATA),    // output [127:0]			s_axi_rdata
        .s_axi_rresp    (AXI_RRESP),    // output [1:0]			s_axi_rresp
        .s_axi_rlast    (AXI_RLAST),    // output			s_axi_rlast
        .s_axi_rvalid   (AXI_RVALID),   // output			s_axi_rvalid
        .s_axi_rready   (AXI_RREADY)    // input			s_axi_rready
    );
endmodule
