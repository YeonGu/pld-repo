`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: <Company Name>
// Engineer: <Engineer Name>
//
// Create Date: <date>
// Design Name: <name_of_top-level_design>
// Module Name: <name_of_this_module>
// Target Device: <target device>
// Tool versions: <tool_versions>
// Description:
// <Description here>
// Dependencies:
// <Dependencies here>
// Revision:
// <Code_revision_information>
// Additional Comments:
// <Additional comments>
////////////////////////////////////////////////////////////////////////////////

module e203_system (
    input wire clk200m,  //GCLK-W19 		// This is loaded into MMCM to generate 16MHz Clock

    input wire fpga_rst,  //FPGA_RESET-T6
    // input wire mcu_rst,   //MCU_RESET-P20

    /** VSYS **/
    output        VSYS_APB_HCLK,
    output        VSYS_APB_HRESETn,
    output [31:0] VSYS_APB_PADDR,
    output [31:0] VSYS_APB_PWDATA,
    output        VSYS_APB_PWRITE,
    output        VSYS_APB_PSEL,
    output        VSYS_APB_PENABLE,
    input  [31:0] VSYS_APB_PRDATA,

    // Dedicated QSPI interface
    output wire       qspi0_cs,
    output wire       qspi0_sck,
    inout  wire [3:0] qspi0_dq,

    //gpioA
    inout wire [31:0] gpioA,  //GPIOA00~GPIOA31

    //gpioB
    // inout wire [31:0] gpioB,  //GPIOB00~GPIOB31

    // JD (used for JTAG connection)
    inout wire mcu_TDO,  //MCU_TDO-N17
    inout wire mcu_TCK,  //MCU_TCK-P15
    inout wire mcu_TDI,  //MCU_TDI-T18
    inout wire mcu_TMS,  //MCU_TMS-P17

    //pmu_wakeup

    inout wire pmu_paden,  //PMU_VDDPADEN-U15
    inout wire pmu_padrst  //PMU_VADDPARST_V15
    // inout wire mcu_wakeup   //MCU_WAKE-N15
);

    wire clk_out1;
    wire mmcm_locked;
    wire CLK32768KHZ;  //RTC_CLK-Y18	// Low Freq clock.

    wire reset_periph;

    wire ck_rst;
    wire mcu_rst;
    assign mcu_rst = fpga_rst;

    // All wires connected to the chip top
    wire          dut_clock;
    wire          dut_reset;

    wire          dut_io_pads_jtag_TCK_i_ival;
    wire          dut_io_pads_jtag_TMS_i_ival;
    wire          dut_io_pads_jtag_TMS_o_oval;
    wire          dut_io_pads_jtag_TMS_o_oe;
    wire          dut_io_pads_jtag_TMS_o_ie;
    wire          dut_io_pads_jtag_TMS_o_pue;
    wire          dut_io_pads_jtag_TMS_o_ds;
    wire          dut_io_pads_jtag_TDI_i_ival;
    wire          dut_io_pads_jtag_TDO_o_oval;
    wire          dut_io_pads_jtag_TDO_o_oe;

    wire [32-1:0] dut_io_pads_gpioA_i_ival;
    wire [32-1:0] dut_io_pads_gpioA_o_oval;
    wire [32-1:0] dut_io_pads_gpioA_o_oe;

    wire [32-1:0] dut_io_pads_gpioB_i_ival;
    wire [32-1:0] dut_io_pads_gpioB_o_oval;
    wire [32-1:0] dut_io_pads_gpioB_o_oe;

    wire          dut_io_pads_qspi0_sck_o_oval;
    wire          dut_io_pads_qspi0_cs_0_o_oval;
    wire          dut_io_pads_qspi0_dq_0_i_ival;
    wire          dut_io_pads_qspi0_dq_0_o_oval;
    wire          dut_io_pads_qspi0_dq_0_o_oe;
    wire          dut_io_pads_qspi0_dq_1_i_ival;
    wire          dut_io_pads_qspi0_dq_1_o_oval;
    wire          dut_io_pads_qspi0_dq_1_o_oe;
    wire          dut_io_pads_qspi0_dq_2_i_ival;
    wire          dut_io_pads_qspi0_dq_2_o_oval;
    wire          dut_io_pads_qspi0_dq_2_o_oe;
    wire          dut_io_pads_qspi0_dq_3_i_ival;
    wire          dut_io_pads_qspi0_dq_3_o_oval;
    wire          dut_io_pads_qspi0_dq_3_o_oe;


    wire          dut_io_pads_aon_erst_n_i_ival;
    wire          dut_io_pads_aon_pmu_dwakeup_n_i_ival;
    wire          dut_io_pads_aon_pmu_vddpaden_o_oval;
    wire          dut_io_pads_aon_pmu_padrst_o_oval;
    wire          dut_io_pads_bootrom_n_i_ival;
    wire          dut_io_pads_dbgmode0_n_i_ival;
    wire          dut_io_pads_dbgmode1_n_i_ival;
    wire          dut_io_pads_dbgmode2_n_i_ival;

    //=================================================
    // Clock & Reset
    wire          clk_8388;
    wire          clk_16M;



    mmcm ip_mmcm (
        .resetn  (ck_rst),
        .clk_in1 (clk200m),
        .clk_out1(clk_16M),     // 16 MHz, this clock we set to 16MHz
        .locked  (mmcm_locked)
    );

    assign ck_rst = fpga_rst & mcu_rst;

    clk_div_zynq clk_div (
        .clk           (clk_16M),
        .rstn          (ck_rst),
        .o_clk_32768khz(CLK32768KHZ)
    );

    reset_sys ip_reset_sys (
        .slowest_sync_clk    (clk_16M),
        .ext_reset_in        (ck_rst),        // Active-low
        .aux_reset_in        (1'b1),
        .mb_debug_sys_rst    (1'b0),
        .dcm_locked          (mmcm_locked),
        .mb_reset            (),
        .bus_struct_reset    (),
        .peripheral_reset    (reset_periph),
        .interconnect_aresetn(),
        .peripheral_aresetn  ()
    );

    //=================================================
    // SPI0 Interface

    wire [3:0] qspi0_ui_dq_o;
    wire [3:0] qspi0_ui_dq_oe;
    wire [3:0] qspi0_ui_dq_i;

    PULLUP qspi0_pullup[3:0] (.O(qspi0_dq));

    IOBUF qspi0_iobuf[3:0] (
        .IO(qspi0_dq),
        .O (qspi0_ui_dq_i),
        .I (qspi0_ui_dq_o),
        .T (~qspi0_ui_dq_oe)
    );


    //=================================================
    // IOBUF instantiation for GPIOs

    IOBUF #(
        .DRIVE       (12),
        .IBUF_LOW_PWR("TRUE"),
        .IOSTANDARD  ("DEFAULT"),
        .SLEW        ("SLOW")
    ) gpioA_iobuf[31:0] (
        .O (dut_io_pads_gpioA_i_ival),
        .IO(gpioA),
        .I (dut_io_pads_gpioA_o_oval),
        .T (~dut_io_pads_gpioA_o_oe)
    );

    // IOBUF #(
    //     .DRIVE       (12),
    //     .IBUF_LOW_PWR("TRUE"),
    //     .IOSTANDARD  ("DEFAULT"),
    //     .SLEW        ("SLOW")
    // ) gpioB_iobuf[31:0] (
    //     .O (dut_io_pads_gpioB_i_ival),
    //     .IO(gpioB),
    //     .I (dut_io_pads_gpioB_o_oval),
    //     .T (~dut_io_pads_gpioB_o_oe)
    // );
    //=================================================
    // JTAG IOBUFs

    wire iobuf_jtag_TCK_o;
    IOBUF #(
        .DRIVE       (12),
        .IBUF_LOW_PWR("TRUE"),
        .IOSTANDARD  ("DEFAULT"),
        .SLEW        ("SLOW")
    ) IOBUF_jtag_TCK (
        .O (iobuf_jtag_TCK_o),
        .IO(mcu_TCK),
        .I (1'b0),
        .T (1'b1)
    );
    assign dut_io_pads_jtag_TCK_i_ival = iobuf_jtag_TCK_o;
    PULLUP pullup_TCK (.O(mcu_TCK));

    wire iobuf_jtag_TMS_o;
    IOBUF #(
        .DRIVE       (12),
        .IBUF_LOW_PWR("TRUE"),
        .IOSTANDARD  ("DEFAULT"),
        .SLEW        ("SLOW")
    ) IOBUF_jtag_TMS (
        .O (iobuf_jtag_TMS_o),
        .IO(mcu_TMS),
        .I (1'b0),
        .T (1'b1)
    );
    assign dut_io_pads_jtag_TMS_i_ival = iobuf_jtag_TMS_o;
    PULLUP pullup_TMS (.O(mcu_TMS));

    wire iobuf_jtag_TDI_o;
    IOBUF #(
        .DRIVE       (12),
        .IBUF_LOW_PWR("TRUE"),
        .IOSTANDARD  ("DEFAULT"),
        .SLEW        ("SLOW")
    ) IOBUF_jtag_TDI (
        .O (iobuf_jtag_TDI_o),
        .IO(mcu_TDI),
        .I (1'b0),
        .T (1'b1)
    );
    assign dut_io_pads_jtag_TDI_i_ival = iobuf_jtag_TDI_o;
    PULLUP pullup_TDI (.O(mcu_TDI));

    wire iobuf_jtag_TDO_o;
    IOBUF #(
        .DRIVE       (12),
        .IBUF_LOW_PWR("TRUE"),
        .IOSTANDARD  ("DEFAULT"),
        .SLEW        ("SLOW")
    ) IOBUF_jtag_TDO (
        .O (iobuf_jtag_TDO_o),
        .IO(mcu_TDO),
        .I (dut_io_pads_jtag_TDO_o_oval),
        .T (~dut_io_pads_jtag_TDO_o_oe)
    );

    //wire iobuf_jtag_TRST_n_o;
    //IOBUF
    //#(
    //  .DRIVE(12),
    //  .IBUF_LOW_PWR("TRUE"),
    //  .IOSTANDARD("DEFAULT"),
    //  .SLEW("SLOW")
    //)

    //=================================================
    // Assignment of IOBUF "IO" pins to package pins

    // Pins IO0-IO13
    // Shield header row 0: PD0-PD7

    // Use the LEDs for some more useful debugging things.
    assign pmu_paden                     = dut_io_pads_aon_pmu_vddpaden_o_oval;
    assign pmu_padrst                    = dut_io_pads_aon_pmu_padrst_o_oval;

    // model select
    assign dut_io_pads_bootrom_n_i_ival  = 1'b0;  // 0: From internal ROM
    assign dut_io_pads_dbgmode0_n_i_ival = 1'b1;
    assign dut_io_pads_dbgmode1_n_i_ival = 1'b1;
    assign dut_io_pads_dbgmode2_n_i_ival = 1'b1;
    //

    e203_soc_top dut (
        .hfextclk(clk_16M),
        .hfxoscen(),

        .lfextclk(CLK32768KHZ),
        .lfxoscen(),

        .VSYS_APB_HCLK   (VSYS_APB_HCLK),
        .VSYS_APB_HRESETn(VSYS_APB_HRESETn),
        .VSYS_APB_PADDR  (VSYS_APB_PADDR),
        .VSYS_APB_PWDATA (VSYS_APB_PWDATA),
        .VSYS_APB_PWRITE (VSYS_APB_PWRITE),
        .VSYS_APB_PSEL   (VSYS_APB_PSEL),
        .VSYS_APB_PENABLE(VSYS_APB_PENABLE),
        .VSYS_APB_PRDATA (VSYS_APB_PRDATA),

        // Note: this is the real SoC top AON domain slow clock
        .io_pads_jtag_TCK_i_ival(dut_io_pads_jtag_TCK_i_ival),
        .io_pads_jtag_TMS_i_ival(dut_io_pads_jtag_TMS_i_ival),
        .io_pads_jtag_TDI_i_ival(dut_io_pads_jtag_TDI_i_ival),
        .io_pads_jtag_TDO_o_oval(dut_io_pads_jtag_TDO_o_oval),
        .io_pads_jtag_TDO_o_oe  (dut_io_pads_jtag_TDO_o_oe),

        .io_pads_gpioA_i_ival(dut_io_pads_gpioA_i_ival),
        .io_pads_gpioA_o_oval(dut_io_pads_gpioA_o_oval),
        .io_pads_gpioA_o_oe  (dut_io_pads_gpioA_o_oe),

        .io_pads_gpioB_i_ival(dut_io_pads_gpioB_i_ival),
        .io_pads_gpioB_o_oval(dut_io_pads_gpioB_o_oval),
        .io_pads_gpioB_o_oe  (dut_io_pads_gpioB_o_oe),

        .io_pads_qspi0_sck_o_oval (dut_io_pads_qspi0_sck_o_oval),
        .io_pads_qspi0_cs_0_o_oval(dut_io_pads_qspi0_cs_0_o_oval),

        .io_pads_qspi0_dq_0_i_ival(dut_io_pads_qspi0_dq_0_i_ival),
        .io_pads_qspi0_dq_0_o_oval(dut_io_pads_qspi0_dq_0_o_oval),
        .io_pads_qspi0_dq_0_o_oe  (dut_io_pads_qspi0_dq_0_o_oe),
        .io_pads_qspi0_dq_1_i_ival(dut_io_pads_qspi0_dq_1_i_ival),
        .io_pads_qspi0_dq_1_o_oval(dut_io_pads_qspi0_dq_1_o_oval),
        .io_pads_qspi0_dq_1_o_oe  (dut_io_pads_qspi0_dq_1_o_oe),
        .io_pads_qspi0_dq_2_i_ival(dut_io_pads_qspi0_dq_2_i_ival),
        .io_pads_qspi0_dq_2_o_oval(dut_io_pads_qspi0_dq_2_o_oval),
        .io_pads_qspi0_dq_2_o_oe  (dut_io_pads_qspi0_dq_2_o_oe),
        .io_pads_qspi0_dq_3_i_ival(dut_io_pads_qspi0_dq_3_i_ival),
        .io_pads_qspi0_dq_3_o_oval(dut_io_pads_qspi0_dq_3_o_oval),
        .io_pads_qspi0_dq_3_o_oe  (dut_io_pads_qspi0_dq_3_o_oe),


        // Note: this is the real SoC top level reset signal
        .io_pads_aon_erst_n_i_ival       (ck_rst),
        .io_pads_aon_pmu_dwakeup_n_i_ival(dut_io_pads_aon_pmu_dwakeup_n_i_ival),
        .io_pads_aon_pmu_vddpaden_o_oval (dut_io_pads_aon_pmu_vddpaden_o_oval),

        .io_pads_aon_pmu_padrst_o_oval(dut_io_pads_aon_pmu_padrst_o_oval),

        .io_pads_bootrom_n_i_ival(dut_io_pads_bootrom_n_i_ival),

        .io_pads_dbgmode0_n_i_ival(dut_io_pads_dbgmode0_n_i_ival),
        .io_pads_dbgmode1_n_i_ival(dut_io_pads_dbgmode1_n_i_ival),
        .io_pads_dbgmode2_n_i_ival(dut_io_pads_dbgmode2_n_i_ival)
    );

    // Assign reasonable values to otherwise unconnected inputs to chip top

    wire iobuf_dwakeup_o;
    // IOBUF #(
    //     .DRIVE       (12),
    //     .IBUF_LOW_PWR("TRUE"),
    //     .IOSTANDARD  ("DEFAULT"),
    //     .SLEW        ("SLOW")
    // ) IOBUF_dwakeup_n (
    //     .O (iobuf_dwakeup_o),
    //     .IO(mcu_wakeup),
    //     .I (1'b1),
    //     .T (1'b1)
    // );

    assign iobuf_dwakeup_o                      = 1'b1;
    assign dut_io_pads_aon_pmu_dwakeup_n_i_ival = (~iobuf_dwakeup_o);



    assign dut_io_pads_aon_pmu_vddpaden_i_ival  = 1'b1;

    assign qspi0_sck                            = dut_io_pads_qspi0_sck_o_oval;
    assign qspi0_cs                             = dut_io_pads_qspi0_cs_0_o_oval;
    assign qspi0_ui_dq_o                        = {dut_io_pads_qspi0_dq_3_o_oval, dut_io_pads_qspi0_dq_2_o_oval, dut_io_pads_qspi0_dq_1_o_oval, dut_io_pads_qspi0_dq_0_o_oval};
    assign qspi0_ui_dq_oe                       = {dut_io_pads_qspi0_dq_3_o_oe, dut_io_pads_qspi0_dq_2_o_oe, dut_io_pads_qspi0_dq_1_o_oe, dut_io_pads_qspi0_dq_0_o_oe};
    assign dut_io_pads_qspi0_dq_0_i_ival        = qspi0_ui_dq_i[0];
    assign dut_io_pads_qspi0_dq_1_i_ival        = qspi0_ui_dq_i[1];
    assign dut_io_pads_qspi0_dq_2_i_ival        = qspi0_ui_dq_i[2];
    assign dut_io_pads_qspi0_dq_3_i_ival        = qspi0_ui_dq_i[3];



endmodule

