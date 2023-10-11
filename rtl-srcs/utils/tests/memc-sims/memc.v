`timescale 1ns / 1ns

module memc #(
    parameter ADDR_WIDTH     = 32,
    parameter APP_DATA_WIDTH = 256,
    parameter APP_MASK_WIDTH = 32
) (
    /** DDR phy pins **/
    /* Inouts */
    inout  [31:0] ddr3_dq,
    inout  [ 3:0] ddr3_dqs_n,
    inout  [ 3:0] ddr3_dqs_p,
    /* Outputs */
    output [13:0] ddr3_addr,
    output [ 2:0] ddr3_ba,
    output        ddr3_ras_n,
    output        ddr3_cas_n,
    output        ddr3_we_n,
    output        ddr3_reset_n,
    output [ 0:0] ddr3_ck_p,
    output [ 0:0] ddr3_ck_n,
    output [ 0:0] ddr3_cke,

    output [0:0] ddr3_cs_n,

    output [3:0] ddr3_dm,

    output [0:0] ddr3_odt,
    // Input Clock
    // Differential system clocks
    input        sys_clk_p,
    input        sys_clk_n,
    // differential iodelayctrl clk (reference clock)
    input        clk_ref_p,
    input        clk_ref_n
);
    /**********************************************************************/
    // MEMC USER INTERFACE
    /**********************************************************************/
    reg user_clk=0;
    reg user_rst=0;
	initial begin
		forever #1 user_clk = ~user_clk;
	end
	initial begin
		user_rst = 1;
		#10 user_rst = 0;
	end
	initial begin
		#100 $finish(2);
	end


    /* APP Cmd */
    wire [               2:0] app_cmd;
    wire [    ADDR_WIDTH-1:0] app_addr;
    wire                      app_en;
    wire                      app_rdy;
    /* APP Write */
    wire [APP_DATA_WIDTH-1:0] app_wdf_data;
    wire                      app_wdf_end;
    wire                      app_wdf_wren;
    wire [APP_MASK_WIDTH-1:0] app_wdf_mask;
    wire                      app_wdf_rdy;
    /* APP Read */
    wire                      app_rd_data_valid;
    wire [APP_DATA_WIDTH-1:0] app_rd_data;
    wire                      app_rd_data_end;

    /**********************************************************************/
    // MEMC STATE MACHINE
    /**********************************************************************/
    /* -1- MEMC Status Declartion */
    localparam MEMC_IDLE = 0;
    localparam MEMC_TEST_WR = 1;
    localparam MEMC_TEST_RD = 2;
    // -1.1- MEMC Test Params
    localparam MEMC_TEST_SIZE = 1024;
    localparam MEMC_TEST_START_ADDR = 0;
    localparam MEMC_TEST_END_ADDR = MEMC_TEST_SIZE + MEMC_TEST_START_ADDR;

    // -1.2- MEMC Control
    reg  [ADDR_WIDTH - 1:0] memc_wr_addr = 0;
    reg  [ADDR_WIDTH - 1:0] memc_rd_addr = 0;
    reg  [ADDR_WIDTH - 1:0] app_rd_addr = 0;

    wire                    wdf_rdy;
    assign wdf_rdy = app_rdy & app_wdf_rdy;

    /** -2- MEMC Next status **/
    reg [2:0] state_current = 0;
    reg [2:0] state_next = 0;  // Combinational
    always @(*) begin
        state_next = state_current;
        case (state_current)
            MEMC_IDLE: begin
                state_next = MEMC_TEST_WR;
            end
            MEMC_TEST_WR: begin
                state_next = ((memc_wr_addr == MEMC_TEST_END_ADDR) && (wdf_rdy)) ? MEMC_TEST_RD : MEMC_TEST_WR;
            end
            MEMC_TEST_RD: begin
                state_next = ((app_rd_addr == MEMC_TEST_END_ADDR) && (app_rd_data_valid)) ? MEMC_TEST_WR : MEMC_TEST_RD;
            end
            default: state_next = MEMC_IDLE;
        endcase
    end
    always @(posedge user_clk) begin
        state_current <= state_next;
    end

    /** -3- MEMC Status Behavior **/
    localparam APP_RD = 0;
    localparam APP_WR = 1;

    /* -3.1- MEMC Wire Assignment  */
    assign app_cmd      = (state_current == MEMC_TEST_WR) ? APP_WR : APP_RD;
    assign app_addr     = (state_current == MEMC_TEST_WR) ? memc_wr_addr : memc_rd_addr;
    assign app_en       = (state_current == MEMC_TEST_WR) || (state_current == MEMC_TEST_RD);

    /* MEMC APP Write */
    assign app_wdf_wren = (state_current == MEMC_TEST_WR) ? 1 : 0;
    assign app_wdf_end  = (state_current == MEMC_TEST_WR) ? 1 : 0;
    assign app_wdf_mask = 0;
    assign app_wdf_data = {8{memc_wr_addr}};


    /*  -3.2- MEMC RD/WR ADDR Control */
    always @(posedge user_clk) begin
        if (state_current == MEMC_TEST_WR) begin
            memc_wr_addr <= (wdf_rdy) ? memc_wr_addr + 8 : memc_wr_addr;
        end else memc_wr_addr <= MEMC_TEST_START_ADDR;
    end
    always @(posedge user_clk) begin
        if (state_current == MEMC_TEST_RD) begin
            memc_rd_addr <= (app_rdy) ? memc_rd_addr + 8 : memc_rd_addr;
        end else memc_rd_addr <= MEMC_TEST_START_ADDR;
    end
    always @(posedge user_clk) begin
        if (app_rd_addr == MEMC_TEST_END_ADDR) begin
            app_rd_addr <= app_rd_data_valid ? 0 : app_rd_addr;
        end else begin
            app_rd_addr <= app_rd_data_valid ? app_rd_addr + 1 : app_rd_addr;
        end
    end

    // Debug Only
    // ila1 ila_inst (
    //     .clk    (user_clk),
    //     .probe1 (app_cmd),
    //     .probe2 (app_en),
    //     .probe3 (app_addr),
    //     .probe4 (app_rdy),
    //     .probe5 (app_rdy),
    //     .probe6 (app_wdf_data),
    //     .probe7 (app_wdf_end),
    //     .probe8 (app_wdf_wren),
    //     .probe9 (app_wdf_mask),
    //     .probe10(app_wdf_rdy),
    //     .probe11(app_rd_data_valid),
    //     .probe12(app_rd_data),
    //     .probe13(app_rd_data_end)
    // );


    /**********************************************************************/
    // MEMC DDR MIG INST
    /**********************************************************************/
    // mig_7series_1 u_mig (
    //     // Memory interface ports
    //     .ddr3_addr          (ddr3_addr),
    //     .ddr3_ba            (ddr3_ba),
    //     .ddr3_cas_n         (ddr3_cas_n),
    //     .ddr3_ck_n          (ddr3_ck_n),
    //     .ddr3_ck_p          (ddr3_ck_p),
    //     .ddr3_cke           (ddr3_cke),
    //     .ddr3_ras_n         (ddr3_ras_n),
    //     .ddr3_we_n          (ddr3_we_n),
    //     .ddr3_dq            (ddr3_dq),
    //     .ddr3_dqs_n         (ddr3_dqs_n),
    //     .ddr3_dqs_p         (ddr3_dqs_p),
    //     .ddr3_reset_n       (ddr3_reset_n),
    //     .init_calib_complete(init_calib_complete),
    //     .ddr3_cs_n          (ddr3_cs_n),
    //     .ddr3_dm            (ddr3_dm),
    //     .ddr3_odt           (ddr3_odt),

    //     // Application interface ports
    //     .app_cmd (app_cmd),
    //     .app_addr(app_addr),
    //     .app_en  (app_en),

    //     .app_wdf_data(app_wdf_data),
    //     .app_wdf_end (app_wdf_end),
    //     .app_wdf_wren(app_wdf_wren),

    //     .app_rd_data      (app_rd_data),
    //     .app_rd_data_end  (app_rd_data_end),
    //     .app_rd_data_valid(app_rd_data_valid),
    //     .app_rdy          (app_rdy),
    //     .app_wdf_rdy      (app_wdf_rdy),
    //     //   .app_sr_active                  (app_sr_active),
    //     //   .app_ref_ack                    (app_ref_ack),
    //     //   .app_zq_ack                     (app_zq_ack),
    //     .ui_clk           (user_clk),
    //     .ui_clk_sync_rst  (rst),

    //     .app_wdf_mask(app_wdf_mask),

    //     .app_sr_req (1'b0),
    //     .app_ref_req(1'b0),
    //     .app_zq_req (1'b0),

    //     // System Clock Ports
    //     .sys_clk_p(sys_clk_p),
    //     .sys_clk_n(sys_clk_n),
    //     // Reference Clock Ports
    //     .clk_ref_p(clk_ref_p),
    //     .clk_ref_n(clk_ref_n),

    //     .sys_rst(sys_rst)
    // );

endmodule  //memc
