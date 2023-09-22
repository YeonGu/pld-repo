`timescale 1ns/1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 	Southeast University
// Engineer: 	Yuhang Gu
// 		Generate low freq clk for e203
//
// Create Date: 2023/9/22
// Design Name: CLK DIV ZYNQ
// Module Name: clk div zynq
// Target Device: ZYNQ
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

module clk_div_zynq #(
        parameter 	I_CLK_FREQ = 16_000_000	 // Default freq on Zynq
    ) (
        input      	clk,
        input      	rstn,

        output 		o_clk_32768khz
    );
    // localparam low_rtc_freq	=	32
    localparam clk_div_cnt = I_CLK_FREQ / 32768;
    localparam clk_div_cnt_half = I_CLK_FREQ / 32768 / 2;

    reg [14:0] clk_counter;

    always @(posedge clk) begin
        clk_counter <= (clk_counter==clk_div_cnt-1)? 0:clk_counter+1;
    end

    assign o_clk_32768khz = clk_counter >= clk_div_cnt_half? 1'b0: 1'b1;

endmodule //clk_div_zynq
