`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/11 14:26:33
// Design Name: 
// Module Name: sharpen_core
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


module sharpen_core(
input                  i_sharpen_clk,
input					rst_n,

//input matrix 3*3
input[23:0] i_raw_pix11,
input[23:0] i_raw_pix12,
input[23:0] i_raw_pix13,

input[23:0] i_raw_pix21,
input[23:0] i_raw_pix22,
input[23:0] i_raw_pix23,

input[23:0] i_raw_pix31,
input[23:0] i_raw_pix32,
input[23:0] i_raw_pix33,

//output pixel
output[23:0] o_res_pix
);
//Laplace Parameter
	//                         				        Pixel
	// [  +1  +1  +1  ]     [  P11  P12   P13 ]
	// [  1  -8  1  ]     [  P21  P22   P23 ]
	// [  1  1   1  ]       [  P31  P32   P33 ]
	
	reg [10:0]  red,green,blue;
    reg [7:0]   red1,green1,blue1;

	
	
	always@(posedge i_sharpen_clk or negedge rst_n)begin
		if(!rst_n)
			begin
				red<=0;
				green<=0;
				blue<=0;
			end
		else
			begin	
				red<= ((i_raw_pix13[23:16] + i_raw_pix23[23:16]  + i_raw_pix33[23:16]
				+i_raw_pix11[23:16] + i_raw_pix21[23:16] + i_raw_pix31[23:16]
				+i_raw_pix12[23:16]+i_raw_pix32[23:16])>(i_raw_pix22[23:16]<<3))?
                (i_raw_pix13[23:16] + i_raw_pix23[23:16]  + i_raw_pix33[23:16]
				+i_raw_pix11[23:16] + i_raw_pix21[23:16] + i_raw_pix31[23:16]
				+i_raw_pix12[23:16]+i_raw_pix32[23:16]-i_raw_pix22[23:16]<<3):0;
				green<= ((i_raw_pix13[15:8] + i_raw_pix23[15:8]  + i_raw_pix33[15:8]
				+i_raw_pix11[15:8] + i_raw_pix21[15:8] + i_raw_pix31[15:8]
				+i_raw_pix12[15:8]+i_raw_pix32[15:8])>(i_raw_pix22[15:8]<<3))?
                (i_raw_pix13[15:8] + i_raw_pix23[15:8]  + i_raw_pix33[15:8]
				+i_raw_pix11[15:8] + i_raw_pix21[15:8] + i_raw_pix31[15:8]
				+i_raw_pix12[15:8]+i_raw_pix32[15:8]-i_raw_pix22[15:8]<<3):0;
				blue<= ((i_raw_pix13[7:0] + i_raw_pix23[7:0]  + i_raw_pix33[7:0]
				+i_raw_pix11[7:0] + i_raw_pix21[7:0] + i_raw_pix31[7:0]
				+i_raw_pix12[7:0]+i_raw_pix32[7:0])>(i_raw_pix22[7:0]<<3))?
                (i_raw_pix13[7:0] + i_raw_pix23[7:0]  + i_raw_pix33[7:0]
				+i_raw_pix11[7:0] + i_raw_pix21[7:0] + i_raw_pix31[7:0]
				+i_raw_pix12[7:0]+i_raw_pix32[7:0]-i_raw_pix22[7:0]<<3):0;
			end
	end
	
	always@(posedge i_sharpen_clk or negedge rst_n)begin
		if(!rst_n)
			begin
				red1<=0;
				green1<=0;
				blue1<=0;
			end
		else
			begin	
				red1<=red[10:8]?0:(i_raw_pix32[23:16]>red[7:0]?(i_raw_pix32[23:16]-red[7:0]):0);
				green1<=green[10:8]?0:(i_raw_pix32[15:8]>green[7:0]?(i_raw_pix32[15:8]-green[7:0]):0);
				blue1<=blue[10:8]?0:(i_raw_pix32[7:0]>blue[7:0]?(i_raw_pix32[7:0]-blue[7:0]):0);
			end
	end
    assign o_res_pix       =   {red1,green1,blue1};
endmodule
