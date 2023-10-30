// verilator lint_off WIDTHCONCAT
// verilator lint_off WIDTHTRUNC
// verilator lint_off WIDTHEXPAND

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/08 19:00:05
// Design Name: 
// Module Name: bicubic_core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bicubic_core (
    input i_bicubic_clk,
    input rst_n,

    //input matrix 4*4
    input [23:0] i_raw_pix11,
    input [23:0] i_raw_pix12,
    input [23:0] i_raw_pix13,
    input [23:0] i_raw_pix14,
    input [23:0] i_raw_pix21,
    input [23:0] i_raw_pix22,
    input [23:0] i_raw_pix23,
    input [23:0] i_raw_pix24,
    input [23:0] i_raw_pix31,
    input [23:0] i_raw_pix32,
    input [23:0] i_raw_pix33,
    input [23:0] i_raw_pix34,
    input [23:0] i_raw_pix41,
    input [23:0] i_raw_pix42,
    input [23:0] i_raw_pix43,
    input [23:0] i_raw_pix44,

    //output matrix 2*2
    output [23:0] o_res_pix11,
    output [23:0] o_res_pix12,
    output [23:0] o_res_pix21,
    output [23:0] o_res_pix22

);
    // Parameter
    //        0.5                      0				   
    //[-0.125 0.625 0.625 -0.125]  [0 1 0 0]
    reg [11:0] red21, gre21, blu21;
    reg [14:0] red22, gre22, blu22;
    reg [7:0] red11, gre11, blu11;
    reg [11:0] red12, gre12, blu12;
    reg [11:0] red_21, gre_21, blu_21;
    reg [14:0] red_22, gre_22, blu_22;
    reg [7:0] red_11, gre_11, blu_11;
    reg [11:0] red_12, gre_12, blu_12;

    //step 1
    always @(posedge i_bicubic_clk or negedge rst_n) begin
        if (~rst_n) begin
            red11 <= 0;
            red12 <= 0;
            red21 <= 0;
            red22 <= 0;
            gre11 <= 0;
            gre12 <= 0;
            gre21 <= 0;
            gre22 <= 0;
            blu11 <= 0;
            blu12 <= 0;
            blu21 <= 0;
            blu22 <= 0;
        end else begin
            red21 <= ((i_raw_pix22[23:16] * 5 + i_raw_pix32[23:16] * 5) > (i_raw_pix12[23:16] + i_raw_pix42[23:16])) ? (i_raw_pix22[23:16] * 5 + i_raw_pix32[23:16] * 5 - i_raw_pix12[23:16] - i_raw_pix42[23:16]) : 0;
            gre21 <= ((i_raw_pix22[15:8] * 5 + i_raw_pix32[15:8] * 5) > (i_raw_pix12[15:8] + i_raw_pix42[15:8])) ? (i_raw_pix22[15:8] * 5 + i_raw_pix32[15:8] * 5 - i_raw_pix12[15:8] - i_raw_pix42[15:8]) : 0;
            blu21 <= ((i_raw_pix22[7:0] * 5 + i_raw_pix32[7:0] * 5) > (i_raw_pix12[7:0] + i_raw_pix42[7:0])) ? (i_raw_pix22[7:0] * 5 + i_raw_pix32[7:0] * 5 - i_raw_pix12[7:0] - i_raw_pix42[7:0]) : 0;
            red22<=((i_raw_pix22[23:16]*25+i_raw_pix32[23:16]*25+i_raw_pix23[23:16]*25+i_raw_pix33[23:16]*25+i_raw_pix11[23:16]+i_raw_pix41[23:16]+i_raw_pix14[23:16]+i_raw_pix44[23:16])>
				(i_raw_pix12[23:16]*5+i_raw_pix42[23:16]*5+i_raw_pix13[23:16]*5+i_raw_pix43[23:16]*5+i_raw_pix21[23:16]*5+i_raw_pix31[23:16]*5+i_raw_pix24[23:16]*5+i_raw_pix34[23:16]*5))?
				(i_raw_pix22[23:16]*25+i_raw_pix32[23:16]*25+i_raw_pix23[23:16]*25+i_raw_pix33[23:16]*25+i_raw_pix11[23:16]+i_raw_pix41[23:16]+i_raw_pix14[23:16]+i_raw_pix44[23:16]
				-i_raw_pix12[23:16]*5-i_raw_pix42[23:16]*5-i_raw_pix13[23:16]*5-i_raw_pix43[23:16]*5-i_raw_pix21[23:16]*5-i_raw_pix31[23:16]*5-i_raw_pix24[23:16]*5-i_raw_pix34[23:16]*5):0;
            gre22<=((i_raw_pix22[15:8]*25+i_raw_pix32[15:8]*25+i_raw_pix23[15:8]*25+i_raw_pix33[15:8]*25+i_raw_pix11[15:8]+i_raw_pix41[15:8]+i_raw_pix14[15:8]+i_raw_pix44[15:8])>
				(i_raw_pix12[15:8]*5+i_raw_pix42[15:8]*5+i_raw_pix13[15:8]*5+i_raw_pix43[15:8]*5+i_raw_pix21[15:8]*5+i_raw_pix31[15:8]*5+i_raw_pix24[15:8]*5+i_raw_pix34[15:8]*5))?
				(i_raw_pix22[15:8]*25+i_raw_pix32[15:8]*25+i_raw_pix23[15:8]*25+i_raw_pix33[15:8]*25+i_raw_pix11[15:8]+i_raw_pix41[15:8]+i_raw_pix14[15:8]+i_raw_pix44[15:8]
				-i_raw_pix12[15:8]*5-i_raw_pix42[15:8]*5-i_raw_pix13[15:8]*5-i_raw_pix43[15:8]*5-i_raw_pix21[15:8]*5-i_raw_pix31[15:8]*5-i_raw_pix24[15:8]*5-i_raw_pix34[15:8]*5):0;
            blu22<=((i_raw_pix22[7:0]*25+i_raw_pix32[7:0]*25+i_raw_pix23[7:0]*25+i_raw_pix33[7:0]*25+i_raw_pix11[7:0]+i_raw_pix41[7:0]+i_raw_pix14[7:0]+i_raw_pix44[7:0])>
				(i_raw_pix12[7:0]*5+i_raw_pix42[7:0]*5+i_raw_pix13[7:0]*5+i_raw_pix43[7:0]*5+i_raw_pix21[7:0]*5+i_raw_pix31[7:0]*5+i_raw_pix24[7:0]*5+i_raw_pix34[7:0]*5))?
				(i_raw_pix22[7:0]*25+i_raw_pix32[7:0]*25+i_raw_pix23[7:0]*25+i_raw_pix33[7:0]*25+i_raw_pix11[7:0]+i_raw_pix41[7:0]+i_raw_pix14[7:0]+i_raw_pix44[7:0]
				-i_raw_pix12[7:0]*5-i_raw_pix42[7:0]*5-i_raw_pix13[7:0]*5-i_raw_pix43[7:0]*5-i_raw_pix21[7:0]*5-i_raw_pix31[7:0]*5-i_raw_pix24[7:0]*5-i_raw_pix34[7:0]*5):0;
            red11 <= i_raw_pix22[23:16];
            gre11 <= i_raw_pix22[15:8];
            blu11 <= i_raw_pix22[7:0];
            red12 <= ((i_raw_pix22[23:16] * 5 + i_raw_pix23[23:16] * 5) > (i_raw_pix21[23:16] + i_raw_pix24[23:16])) ? (i_raw_pix22[23:16] * 5 + i_raw_pix23[23:16] * 5 - i_raw_pix21[23:16] - i_raw_pix24[23:16]) : 0;
            gre12 <= ((i_raw_pix22[15:8] * 5 + i_raw_pix23[15:8] * 5) > (i_raw_pix21[15:8] + i_raw_pix24[15:8])) ? (i_raw_pix22[15:8] * 5 + i_raw_pix23[15:8] * 5 - i_raw_pix21[15:8] - i_raw_pix24[15:8]) : 0;
            blu12 <= ((i_raw_pix22[7:0] * 5 + i_raw_pix23[7:0] * 5) > (i_raw_pix21[7:0] + i_raw_pix24[7:0])) ? (i_raw_pix22[7:0] * 5 + i_raw_pix23[7:0] * 5 - i_raw_pix21[7:0] - i_raw_pix24[7:0]) : 0;


        end
    end
    //step2   
    always @(posedge i_bicubic_clk or negedge rst_n) begin
        if (~rst_n) begin
            red_11 <= 0;
            red_12 <= 0;
            red_21 <= 0;
            red_22 <= 0;
            gre_11 <= 0;
            gre_12 <= 0;
            gre_21 <= 0;
            gre_22 <= 0;
            blu_11 <= 0;
            blu_12 <= 0;
            blu_21 <= 0;
            blu_22 <= 0;
        end else begin
            red_11 <= (red11 > 254) ? 255 : red11;
            red_12 <= (red12 > 2040) ? 2040 : red12;
            red_21 <= (red21 > 2040) ? 2040 : red21;
            red_22 <= (red22 > 16320) ? 16320 : red22;
            gre_11 <= (gre11 > 254) ? 255 : gre11;
            gre_12 <= (gre12 > 2040) ? 2040 : gre12;
            gre_21 <= (gre21 > 2040) ? 2040 : gre21;
            gre_22 <= (gre22 > 16320) ? 16320 : gre22;
            blu_11 <= (blu11 > 254) ? 255 : blu11;
            blu_12 <= (blu12 > 2040) ? 2040 : blu12;
            blu_21 <= (blu21 > 2040) ? 2040 : blu21;
            blu_22 <= (blu22 > 16320) ? 16320 : blu22;
        end
    end

    // assign o_res_pix11={red11[14]?255:red11[13:6],gre11[14]?255:gre11[13:6],blu11[14]?255:blu11[13:6]};
    // assign o_res_pix12={red12[14:11]?255:red12[10:3],gre12[14:11]?255:gre12[10:3],blu12[14:11]?255:blu12[10:3]};
    // assign o_res_pix21={red21[14:11]?255:red21[10:3],gre21[14:11]?255:gre21[10:3],blu21[14:11]?255:blu21[10:3]};
    // assign o_res_pix22={red22[14:8]?255:red22[7:0],gre22[14:8]?255:gre22[7:0],blu22[14:8]?255:blu22[7:0]};

    // assign o_res_pix11={red11,gre11,blu11};
    // assign o_res_pix12={(red12>2040)?255:red12[10:3],(gre12>2040)?255:gre12[10:3],(blu12>2040)?255:blu12[10:3]};
    // assign o_res_pix21={(red21>2040)?255:red21[10:3],(gre21>2040)?255:gre21[10:3],(blu21>2040)?255:blu21[10:3]};
    // assign o_res_pix22={(red22>16320)?255:red22[13:6],(gre22>16320)?255:gre22[13:6],(blu22>16320)?255:blu22[13:6]};

    assign o_res_pix11 = {red_11[7:0], gre_11[7:0], blu_11[7:0]};
    assign o_res_pix12 = {red_12[10:3], gre_12[10:3], blu_12[10:3]};
    assign o_res_pix21 = {red_21[10:3], gre_21[10:3], blu_21[10:3]};
    assign o_res_pix22 = {red_22[13:6], gre_22[13:6], blu_22[13:6]};

endmodule
