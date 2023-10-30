

module debug_sim_cam (
    input         i_clk_pix,
    input         i_rstn,
    input         i_use_color,
    output [15:0] sim_data,
    output        sim_data_wren,
    output        sim_vsync
);

    localparam all_pix = 1024 * 768;
    localparam wait_time = 2046;

    reg [15:0] pix_data;
    reg [31:0] pix_cnt;
    reg [31:0] wait_cnt;

    reg [2:0] state_current = 0, state_next;

    localparam S_IDLE = 0, S_WR = 1, S_WAIT = 2, S_SYNC = 3, S_WAIT2 = 4;
    always @(*) begin
        case (state_current)
            S_IDLE:  state_next = S_WR;
            S_WR: begin
                state_next = (pix_cnt == all_pix - 1) ? S_WAIT : S_WR;
            end
            S_WAIT: begin
                state_next = (wait_cnt == wait_time - 1) ? S_SYNC : S_WAIT;
            end
            S_SYNC:  state_next = S_WAIT2;
            S_WAIT2: state_next = (wait_cnt == wait_time - 1) ? S_IDLE : S_WAIT2;
            default: state_next = S_IDLE;
        endcase
    end

    always @(posedge i_clk_pix or negedge i_rstn) begin
        if (~i_rstn) begin
            state_current <= 0;
        end else state_current <= state_next;
    end
    always @(posedge i_clk_pix) begin
        pix_cnt  <= (state_current == S_WR) ? pix_cnt + 1 : 0;
        wait_cnt <= (state_current == S_WAIT) || (state_current == S_WAIT2) ? wait_cnt + 1 : 0;
        pix_data <= (state_current == S_WR) ? pix_data + 1 : 0;
    end
    assign sim_data      = i_use_color ? 16'b0 : pix_data;
    assign sim_data_wren = (state_current == S_WR);
    assign sim_vsync     = (state_current == S_SYNC);

endmodule
