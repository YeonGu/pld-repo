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
    reg [11:0] a_1, a_2, a_3, a_4;  //red temp
    reg [11:0] b_1, b_2, b_3, b_4;  //green temp
    reg [11:0] c_1, c_2, c_3, c_4;  //blue temp

    reg [7:0] aa_1, aa_2, aa_3, aa_4;
    reg [7:0] bb_1, bb_2, bb_3, bb_4;
    reg [7:0] cc_1, cc_2, cc_3, cc_4;

    reg [14:0] red11, red12, red21, red22;  //value before shift
    reg [14:0] gre11, gre12, gre21, gre22;
    reg [14:0] blu11, blu12, blu21, blu22;
    //step 1
    always @(posedge i_bicubic_clk or negedge rst_n) begin
        if (!rst_n) begin
            a_1  <= 0;
            a_2  <= 0;
            a_3  <= 0;
            a_4  <= 0;
            aa_1 <= 0;
            aa_2 <= 0;
            aa_3 <= 0;
            aa_4 <= 0;
            b_1  <= 0;
            b_2  <= 0;
            b_3  <= 0;
            b_4  <= 0;
            bb_1 <= 0;
            bb_2 <= 0;
            bb_3 <= 0;
            bb_4 <= 0;
            c_1  <= 0;
            c_2  <= 0;
            c_3  <= 0;
            c_4  <= 0;
            cc_1 <= 0;
            cc_2 <= 0;
            cc_3 <= 0;
            cc_4 <= 0;
        end else begin
            a_1  <= ((i_raw_pix21[23:16] * 5 + i_raw_pix31[23:16] * 5) > (i_raw_pix11[23:16] + i_raw_pix41[23:16])) ? (i_raw_pix21[23:16] * 5 + i_raw_pix31[23:16] * 5 - i_raw_pix11[23:16] - i_raw_pix41[23:16]) : 0;
            a_2  <= ((i_raw_pix22[23:16] * 5 + i_raw_pix32[23:16] * 5) > (i_raw_pix12[23:16] + i_raw_pix42[23:16])) ? (i_raw_pix22[23:16] * 5 + i_raw_pix32[23:16] * 5 - i_raw_pix12[23:16] - i_raw_pix42[23:16]) : 0;
            a_3  <= ((i_raw_pix23[23:16] * 5 + i_raw_pix33[23:16] * 5) > (i_raw_pix13[23:16] + i_raw_pix43[23:16])) ? (i_raw_pix23[23:16] * 5 + i_raw_pix33[23:16] * 5 - i_raw_pix13[23:16] - i_raw_pix43[23:16]) : 0;
            a_4  <= ((i_raw_pix24[23:16] * 5 + i_raw_pix34[23:16] * 5) > (i_raw_pix14[23:16] + i_raw_pix44[23:16])) ? (i_raw_pix24[23:16] * 5 + i_raw_pix34[23:16] * 5 - i_raw_pix14[23:16] - i_raw_pix44[23:16]) : 0;
            aa_1 <= i_raw_pix21[23:16];
            aa_2 <= i_raw_pix22[23:16];
            aa_3 <= i_raw_pix23[23:16];
            aa_4 <= i_raw_pix24[23:16];
            b_1  <= ((i_raw_pix21[15:8] * 5 + i_raw_pix31[15:8] * 5) > (i_raw_pix11[15:8] + i_raw_pix41[15:8])) ? (i_raw_pix21[15:8] * 5 + i_raw_pix31[15:8] * 5 - i_raw_pix11[15:8] - i_raw_pix41[15:8]) : 0;
            b_2  <= ((i_raw_pix22[15:8] * 5 + i_raw_pix32[15:8] * 5) > (i_raw_pix12[15:8] + i_raw_pix42[15:8])) ? (i_raw_pix22[15:8] * 5 + i_raw_pix32[15:8] * 5 - i_raw_pix12[15:8] - i_raw_pix42[15:8]) : 0;
            b_3  <= ((i_raw_pix23[15:8] * 5 + i_raw_pix33[15:8] * 5) > (i_raw_pix13[15:8] + i_raw_pix43[15:8])) ? (i_raw_pix23[15:8] * 5 + i_raw_pix33[15:8] * 5 - i_raw_pix13[15:8] - i_raw_pix43[15:8]) : 0;
            b_4  <= ((i_raw_pix24[15:8] * 5 + i_raw_pix34[15:8] * 5) > (i_raw_pix14[15:8] + i_raw_pix44[15:8])) ? (i_raw_pix24[15:8] * 5 + i_raw_pix34[15:8] * 5 - i_raw_pix14[15:8] - i_raw_pix44[15:8]) : 0;
            bb_1 <= i_raw_pix21[15:8];
            bb_2 <= i_raw_pix22[15:8];
            bb_3 <= i_raw_pix23[15:8];
            bb_4 <= i_raw_pix24[15:8];
            c_1  <= ((i_raw_pix21[7:0] * 5 + i_raw_pix31[7:0] * 5) > (i_raw_pix11[7:0] + i_raw_pix41[7:0])) ? (i_raw_pix21[7:0] * 5 + i_raw_pix31[7:0] * 5 - i_raw_pix11[7:0] - i_raw_pix41[7:0]) : 0;
            c_2  <= ((i_raw_pix22[7:0] * 5 + i_raw_pix32[7:0] * 5) > (i_raw_pix12[7:0] + i_raw_pix42[7:0])) ? (i_raw_pix22[7:0] * 5 + i_raw_pix32[7:0] * 5 - i_raw_pix12[7:0] - i_raw_pix42[7:0]) : 0;
            c_3  <= ((i_raw_pix23[7:0] * 5 + i_raw_pix33[7:0] * 5) > (i_raw_pix13[7:0] + i_raw_pix43[7:0])) ? (i_raw_pix23[7:0] * 5 + i_raw_pix33[7:0] * 5 - i_raw_pix13[7:0] - i_raw_pix43[7:0]) : 0;
            c_4  <= ((i_raw_pix24[7:0] * 5 + i_raw_pix34[7:0] * 5) > (i_raw_pix14[7:0] + i_raw_pix44[7:0])) ? (i_raw_pix24[7:0] * 5 + i_raw_pix34[7:0] * 5 - i_raw_pix14[7:0] - i_raw_pix44[7:0]) : 0;
            cc_1 <= i_raw_pix21[7:0];
            cc_2 <= i_raw_pix22[7:0];
            cc_3 <= i_raw_pix23[7:0];
            cc_4 <= i_raw_pix24[7:0];
        end
    end
    //step2   
    always @(posedge i_bicubic_clk or negedge rst_n) begin
        if (!rst_n) begin
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
            red11 <= ((a_2 * 5 + a_3 * 5) > (a_1 + a_4)) ? (a_2 * 5 + a_3 * 5 - a_1 - a_4) : 0;
            red12 <= a_2;
            red21 <= ((aa_2 * 5 + aa_3 * 5) > (aa_1 + aa_4)) ? (aa_2 * 5 + aa_3 * 5 - aa_1 - aa_4) : 0;
            red22 <= aa_2;
            gre11 <= ((b_2 * 5 + b_3 * 5) > (b_1 + b_4)) ? (b_2 * 5 + b_3 * 5 - b_1 - b_4) : 0;
            gre12 <= b_2;
            gre21 <= ((bb_2 * 5 + bb_3 * 5) > (bb_1 + bb_4)) ? (bb_2 * 5 + bb_3 * 5 - bb_1 - bb_4) : 0;
            gre22 <= bb_2;
            blu11 <= ((c_2 * 5 + c_3 * 5) > (c_1 + c_4)) ? (c_2 * 5 + c_3 * 5 - c_1 - c_4) : 0;
            blu12 <= c_2;
            blu21 <= ((cc_2 * 5 + cc_3 * 5) > (cc_1 + cc_4)) ? (cc_2 * 5 + cc_3 * 5 - cc_1 - cc_4) : 0;
            blu22 <= cc_2;
        end
    end



    assign o_res_pix11 = {red11[14] ? 255 : red11[13:6], gre11[14] ? 255 : gre11[13:6], blu11[14] ? 255 : blu11[13:6]};
    assign o_res_pix12 = {red12[14:11] ? 255 : red12[10:3], gre12[14:11] ? 255 : gre12[10:3], blu12[14:11] ? 255 : blu12[10:3]};
    assign o_res_pix21 = {red21[14:11] ? 255 : red21[10:3], gre21[14:11] ? 255 : gre21[10:3], blu21[14:11] ? 255 : blu21[10:3]};
    assign o_res_pix22 = {red22[14:8] ? 255 : red22[7:0], gre22[14:8] ? 255 : gre22[7:0], blu22[14:8] ? 255 : blu22[7:0]};

endmodule
