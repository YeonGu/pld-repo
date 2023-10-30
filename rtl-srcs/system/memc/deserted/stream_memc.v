

module stream_memc #(
    parameter ADDR_WIDTH     = 15,
    parameter APP_DATA_WIDTH = 256,
    parameter APP_MASK_WIDTH = 32
) (
    input sys_rstn,

    /* Camera data */
    input        cam_pclk,
    input        cam_wren,
    input [15:0] cam_data,
    input        cam_frame_sync,

    /* Video Data read */
    input         video_pclk,
    input         video_fifo_rden,
    output [31:0] video_data,

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
    wire                      user_clk;
    wire                      user_rst;

    /**********************************************************************/
    // Wires Declaration
    /**********************************************************************/
    /** MIG **/
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

    wire                      app_wr_valid;
    assign app_wr_valid = app_rdy & app_wdf_rdy;

    /** Camera FIFO **/
    wire         cam_fifo_rden;
    wire [127:0] cam_fifo_rddata;
    wire [  6:0] cam_fifo_cnt;
    wire         cam_fifo_empty;
    wire         cam_fifo_rd_valid;
    assign cam_fifo_rd_valid = (cam_fifo_cnt[6:1] != 0);  // More than 2 data valid

    /** Video FIFO **/
    wire       video_fifo_empty;
    wire [7:0] video_fifo_cnt;

    wire       video_need_data;
    wire       video_dont_need_data;

    /**********************************************************************/
    // MEMC State Machine
    /**********************************************************************/
    localparam MEMC_IDLE = 4'd0;
    localparam MEMC_CAM_DATA_RDH = 4'd1;
    localparam MEMC_CAM_DATA_RDL = 4'd2;
    localparam MEMC_CAM_DATA_WAIT = 4'd3;
    localparam MEMC_CAM_DATA_WR = 4'd4;  // See memc-cam-write.json
    localparam MEMC_VIDEO_RD = 4'd5;

    reg [3:0] state_current;
    reg [3:0] state_next;
    always @(*) begin
        state_next = state_current;
        case (state_current)
            MEMC_IDLE: begin
                if (cam_fifo_rd_valid) state_next = MEMC_CAM_DATA_RDH;
                else if (video_need_data) state_next = MEMC_VIDEO_RD;  // TODO:
                else state_next = MEMC_IDLE;
            end
            /* MEMC Camera Write */
            /* RDH -> RDL -> WAIT -> WR */
            MEMC_CAM_DATA_RDH: state_next = MEMC_CAM_DATA_RDL;
            MEMC_CAM_DATA_RDL: state_next = MEMC_CAM_DATA_WAIT;
            MEMC_CAM_DATA_WAIT: state_next = MEMC_CAM_DATA_WR;
            MEMC_CAM_DATA_WR: begin
                if (app_wr_valid) begin
                    if (video_need_data) state_next = MEMC_VIDEO_RD;
                    else state_next = MEMC_IDLE;
                end else state_next = MEMC_CAM_DATA_WR;  // Not Write yet
            end
            MEMC_VIDEO_RD: begin
                state_next = (video_dont_need_data) ? MEMC_IDLE : MEMC_VIDEO_RD;  // TODO: Data Bypass
            end
            default: state_next = MEMC_IDLE;
        endcase
    end
    always @(posedge user_clk) begin
        state_current <= state_next;
    end

    /**********************************************************************/
    // MEMC Control / State Behavior, etc.
    /**********************************************************************/

    /** Write Address/Read Address Control; app_addr assign **/
    reg [ADDR_WIDTH-1:0] wr_addr;
    reg [ADDR_WIDTH-1:0] rd_addr;
    assign app_addr = (state_current == MEMC_CAM_DATA_WR) ? wr_addr : rd_addr;

    /* Write (Camera) address Control */
    always @(posedge user_clk or posedge cam_frame_sync) begin
        // VSYNC
        if (cam_frame_sync) wr_addr <= 0;
        // WRITE
        else if ((state_current == MEMC_CAM_DATA_WR) && app_wr_valid) wr_addr <= wr_addr + 1;
        // IDLE
        else
            wr_addr <= wr_addr;
    end
    // TODO: HDMI Video Read address Control

    /** Command, etc., app_cmd assign **/
    localparam APP_CMD_RD = 3'd1;
    localparam APP_CMD_WR = 3'd0;
    assign app_cmd = (state_current == MEMC_CAM_DATA_WR) ? APP_CMD_WR : APP_CMD_WR;

    /** Camera Data Write Control **/
    reg [255:0] cam_write_data;
    assign cam_fifo_rden = (state_current == MEMC_CAM_DATA_RDH) || (state_current == MEMC_CAM_DATA_RDL);
    assign app_en        = (state_current == MEMC_CAM_DATA_WR) && (app_wr_valid);
    // APP WDF INPUTS
    assign app_wdf_data  = cam_write_data;
    assign app_wdf_wren  = (state_current == MEMC_CAM_DATA_WR) && (app_wr_valid);
    assign app_wdf_end   = app_wdf_wren;
    assign app_wdf_mask  = 0;

    always @(posedge user_clk) begin
        if ((state_current == MEMC_CAM_DATA_RDL) || (state_current == MEMC_CAM_DATA_WAIT)) cam_write_data <= {cam_write_data[127:0], cam_fifo_rddata};
        else cam_write_data <= cam_write_data;
    end

    /** Video Data Write Control **/


    /**********************************************************************/
    // Camera data Write FIFO
    /**********************************************************************/
    camera_wr_fifo cam_wr_fifo_inst (
        .rst(~sys_rstn),  // input wire rst

        .wr_clk(cam_pclk),  // input wire wr_clk
        .din   (cam_data),  // input wire [15 : 0] din
        .wr_en (cam_wren),  // input wire wr_en

        .rd_clk       (user_clk),         // input wire rd_clk
        .rd_en        (cam_fifo_rden),    // input wire rd_en
        .dout         (cam_fifo_rddata),  // output wire [127 : 0] dout
        // .full         (full),             // output wire full
        .empty        (cam_fifo_empty),   // output wire empty
        .rd_data_count(rd_data_count),    // output wire [6 : 0] rd_data_count
        .wr_rst_busy  (wr_rst_busy),      // output wire wr_rst_busy
        .rd_rst_busy  (rd_rst_busy)       // output wire rd_rst_busy
    );

    video_rd_fifo video_rd_fifo_inst (
        .rst(~sys_rstn),  // input wire rst

        .wr_clk(user_clk),          // input wire wr_clk
        .din   (app_rd_data),       // input wire [255 : 0] din
        .wr_en (app_rd_data_valid), // input wire wr_en

        .rd_clk(video_pclk),       // input wire rd_clk
        .rd_en (video_fifo_rden),  // input wire rd_en
        .dout  (video_data),       // output wire [31 : 0] dout

        // .full         (full),          // output wire full
        .empty        (video_fifo_empty),  // output wire empty
        .wr_data_count(video_fifo_cnt),    // output wire [7 : 0] wr_data_count

        .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
        .rd_rst_busy(rd_rst_busy)   // output wire rd_rst_busy
    );

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
        .app_rdy (app_rdy),

        .app_wdf_data(app_wdf_data),
        .app_wdf_end (app_wdf_end),
        .app_wdf_wren(app_wdf_wren),

        .app_rd_data      (app_rd_data),
        .app_rd_data_end  (app_rd_data_end),
        .app_rd_data_valid(app_rd_data_valid),
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

endmodule
