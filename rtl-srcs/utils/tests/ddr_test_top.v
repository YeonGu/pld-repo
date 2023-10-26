module ddr_test_top (
    input sys_clk,
    input sys_rstn,

    /** DDR phy pins **/
    /* Inouts */
    inout  [31:0] ddr3_dq,             // 数据
    inout  [ 3:0] ddr3_dqs_n,          // 数据
    inout  [ 3:0] ddr3_dqs_p,          // 数据
    /* Outputs */
    output [14:0] ddr3_addr,           // 地址线
    output [ 2:0] ddr3_ba,             // bank线
    output        ddr3_ras_n,          // 行使能信号，低电平有效
    output        ddr3_cas_n,          // 列使能信号，低电平有效
    output        ddr3_we_n,           // 写使能信号，低电平有效
    output        ddr3_reset_n,        // ddr3复位
    output [ 0:0] ddr3_ck_p,           // ddr3差分时钟
    output [ 0:0] ddr3_ck_n,           // ddr3差分时钟
    output [ 0:0] ddr3_cke,            // ddr3时钟使能信号
    output [ 0:0] ddr3_cs_n,           // ddr3片选信号
    output [ 3:0] ddr3_dm,             // ddr3掩码
    output [ 0:0] ddr3_odt,            // odt阻抗
    output        init_calib_complete  // 初始化标志
);

    /** Clock wires **/
    wire                               ddr_clk_320m;
    wire                               ddr_ref_200m;
    wire                               pll_locked;
    wire                               ref_locked;

    wire rstn = sys_rstn & pll_locked;
    clk_wiz_0 sys_pll (
        // Clock out ports
        .clk_out1(ddr_clk_320m),  // output clk_out1
        .clk_out2(ddr_ref_200m),
        // Status and control signals
        .reset   (~sys_rstn),     // input reset
        .locked  (pll_locked),    // output locked
        // Clock in ports
        .clk_in1 (sys_clk)        // input clk_in1
    );

    memc_test memc_inst (
        .ddr3_dq            (ddr3_dq),
        .ddr3_dqs_n         (ddr3_dqs_n),
        .ddr3_dqs_p         (ddr3_dqs_p),
        .ddr3_addr          (ddr3_addr),
        .ddr3_ba            (ddr3_ba),
        .ddr3_ras_n         (ddr3_ras_n),
        .ddr3_cas_n         (ddr3_cas_n),
        .ddr3_we_n          (ddr3_we_n),
        .ddr3_reset_n       (ddr3_reset_n),
        .ddr3_ck_p          (ddr3_ck_p),
        .ddr3_ck_n          (ddr3_ck_n),
        .ddr3_cke           (ddr3_cke),
        .ddr3_cs_n          (ddr3_cs_n),
        .ddr3_dm            (ddr3_dm),
        .ddr3_odt           (ddr3_odt),
        .init_calib_complete(init_calib_complete),
        .i_sys_clk          (ddr_clk_320m),
        .i_clk_ref          (ddr_ref_200m),
        .i_sys_rst          (~rstn)
    );
endmodule
