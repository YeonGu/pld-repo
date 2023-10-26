module memc_test #(
    parameter ADDR_WIDTH     = 28,
    parameter APP_DATA_WIDTH = 256,
    parameter APP_MASK_WIDTH = 32
) (
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
    output        init_calib_complete,

    // Input Clock
    // Differential system clocks
    input i_sys_clk,
    // differential iodelayctrl clk (reference clock)
    input i_clk_ref,
    input i_sys_rst
);
    /**********************************************************************/
    // MEMC USER INTERFACE
    /**********************************************************************/
    wire                      user_clk;
    wire                      user_rst;
    /* APP Cmd */
    (* mark_debug = "true" *)wire [               2:0] app_cmd;
    (* mark_debug = "true" *)wire [    ADDR_WIDTH-1:0] app_addr;
    (* mark_debug = "true" *)wire                      app_en;
    (* mark_debug = "true" *)wire                      app_rdy;
    /* APP Write */
    (* mark_debug = "true" *)wire [APP_DATA_WIDTH-1:0] app_wdf_data;
    (* mark_debug = "true" *)wire                      app_wdf_end;
    (* mark_debug = "true" *)wire                      app_wdf_wren;
    wire [APP_MASK_WIDTH-1:0] app_wdf_mask;
    (* mark_debug = "true" *)wire                      app_wdf_rdy;
    /* APP Read */
    (* mark_debug = "true" *)wire                      app_rd_data_valid;
    (* mark_debug = "true" *)wire [APP_DATA_WIDTH-1:0] app_rd_data;
    wire                      app_rd_data_end;


    // (* mark_debug = "true" *) reg calib, userrst, sysrst;
    // always @(posedge i_sys_clk) begin
    //     calib   <= init_calib_complete;
    //     userrst <= user_rst;
    //     sysrst  <= i_sys_rst;
    // end

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
    (* mark_debug = "true" *)reg  [ADDR_WIDTH - 1:0] app_rd_addr = 0;
    reg  [            31:0] memc_wr_data = 0;

    wire                    wdf_rdy;
    assign wdf_rdy = app_rdy & app_wdf_rdy;

    /** -2- MEMC Next status **/
    (*mark_debug="true"*)reg [2:0] state_current = 0;
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
                state_next = ((app_rd_addr == MEMC_TEST_END_ADDR) && (app_rdy)) ? MEMC_TEST_WR : MEMC_TEST_RD;
            end
            default: state_next = MEMC_IDLE;
        endcase
    end
    always @(posedge user_clk) begin
        state_current <= (user_rst) ? 0 : state_next;
    end

    /** -3- MEMC Status Behavior **/
    localparam APP_RD = 1;
    localparam APP_WR = 0;

    /* -3.1- MEMC Wire Assignment  */
    reg app_rd_end;
    assign app_cmd      = (state_current == MEMC_TEST_WR) ? APP_WR : APP_RD;
    assign app_addr     = (state_current == MEMC_TEST_WR) ? memc_wr_addr : memc_rd_addr;
    assign app_en       = (state_current == MEMC_TEST_WR) || ((state_current == MEMC_TEST_RD) && (~app_rd_end));

    /* MEMC APP Write */
    assign app_wdf_wren = (state_current == MEMC_TEST_WR) ? 1 : 0;
    assign app_wdf_end  = (state_current == MEMC_TEST_WR) ? 1 : 0;
    assign app_wdf_mask = 0;
    assign app_wdf_data = memc_wr_addr;

    /*  -3.1- MEMC RDEN/WREN Control */
    always @(posedge user_clk) begin
        case (state_current)
            MEMC_TEST_RD: begin
                app_rd_end <= (app_rd_addr == MEMC_TEST_END_ADDR);
            end
            default: app_rd_end <= 0;
        endcase
    end

    /*  -3.2- MEMC RD/WR ADDR Control */
    always @(posedge user_clk) begin
        if (state_current == MEMC_TEST_WR) begin
            memc_wr_addr <= (wdf_rdy) ? memc_wr_addr + 8 : memc_wr_addr;
        end else memc_wr_addr <= MEMC_TEST_START_ADDR;
    end
    always @(posedge user_clk) begin
        if (state_current == MEMC_TEST_RD) begin
            if (memc_rd_addr == MEMC_TEST_END_ADDR)  // Reach the end.
                memc_rd_addr <= memc_rd_addr;
            else memc_rd_addr <= (app_rdy) ? memc_rd_addr + 8 : memc_rd_addr;
        end else memc_rd_addr <= MEMC_TEST_START_ADDR;
    end
    always @(posedge user_clk) begin
        if (state_current != MEMC_TEST_RD && state_next == MEMC_TEST_WR) begin
            app_rd_addr <= MEMC_TEST_START_ADDR;
        end else begin
            app_rd_addr <= app_rd_data_valid ? app_rd_addr + 8 : app_rd_addr;
        end
    end
    always @(posedge user_clk) begin
        if (state_current == MEMC_TEST_WR && app_wdf_rdy) begin
            memc_wr_data <= memc_wr_data + 1;
        end
    end

    // Debug Only
    // ila_0 ila_inst (
    //     .clk   (user_clk),
    //     .probe0(state_current),
    //     .probe1(app_cmd),
    //     .probe2(app_addr),
    //     .probe3(app_rdy),
    //     .probe4(app_wdf_data[31:0]),
    //     .probe5(app_rd_data_valid),
    //     .probe6(app_rd_data[31:0])
    // );


    /**********************************************************************/
    // MEMC DDR MIG INST
    /**********************************************************************/
    mig_7series_0 mig_inst (
        // Memory interface ports
        .ddr3_addr          (ddr3_addr),
        .ddr3_ba            (ddr3_ba),
        .ddr3_cas_n         (ddr3_cas_n),
        .ddr3_ck_n          (ddr3_ck_n),
        .ddr3_ck_p          (ddr3_ck_p),
        .ddr3_cke           (ddr3_cke),
        .ddr3_ras_n         (ddr3_ras_n),
        .ddr3_we_n          (ddr3_we_n),
        .ddr3_dq            (ddr3_dq),
        .ddr3_dqs_n         (ddr3_dqs_n),
        .ddr3_dqs_p         (ddr3_dqs_p),
        .ddr3_reset_n       (ddr3_reset_n),
        .init_calib_complete(init_calib_complete),

        .ddr3_cs_n(ddr3_cs_n),
        .ddr3_dm  (ddr3_dm),
        .ddr3_odt (ddr3_odt),

        // Application interface ports
        .app_cmd (app_cmd),
        .app_addr(app_addr),
        .app_en  (app_en),

        .app_wdf_data(app_wdf_data),
        .app_wdf_end (app_wdf_end),
        .app_wdf_wren(app_wdf_wren),

        .app_rd_data      (app_rd_data),
        .app_rd_data_end  (app_rd_data_end),
        .app_rd_data_valid(app_rd_data_valid),
        .app_rdy          (app_rdy),
        .app_wdf_rdy      (app_wdf_rdy),
        //   .app_sr_active                  (app_sr_active),
        //   .app_ref_ack                    (app_ref_ack),
        //   .app_zq_ack                     (app_zq_ack),
        .ui_clk           (user_clk),
        .ui_clk_sync_rst  (rst),

        .app_wdf_mask(app_wdf_mask),

        .app_sr_req (1'b0),
        .app_ref_req(1'b0),
        .app_zq_req (1'b0),

        // System Clock Ports
        .sys_clk_i(i_sys_clk),
        // Reference Clock Ports
        .clk_ref_i(i_clk_ref),

        .sys_rst(i_sys_rst)
    );

endmodule  //memc
