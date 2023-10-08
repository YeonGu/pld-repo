`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/08 19:00:05
// Design Name: 
// Module Name: bicubic_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: ‰»Î100*100ÕºœÒ
// 
//////////////////////////////////////////////////////////////////////////////////
module bicubic_top(
//global clock
	input					clk,  				//cmos video pixel clock
	input					rst_n,				//global reset

	//Image data prepred to be processd
	input					per_frame_vsync,	//Prepared Image data vsync valid signal
	input					per_frame_href,		//Prepared Image data href vaild  signal
	input					per_frame_clken,	//Prepared Image data output/capture enable clock	
	input		[7:0]		per_img_red,		//Prepared Image red data to be processed
	input		[7:0]		per_img_green,		//Prepared Image green data to be processed
	input		[7:0]		per_img_blue,		//Prepared Image blue data to be processed
	
	//Image data has been processd
	output				post_frame_vsync,	//Processed Image data vsync valid signal
	output				post_frame_href,	//Processed Image data href vaild  signal
	output				post_frame_clken,	//Processed Image data output/capture enable clock	
	
	//output matrix 2*2
	output      [23:0]      o_res_pix11,
    output      [23:0]      o_res_pix12,
    output      [23:0]      o_res_pix21,
    output      [23:0]      o_res_pix22

);
//----------------------------------------------------
	//Generate 24Bit 4*4 Matrix for Video Image Processor.
	//Image data has been processd
	wire				matrix_frame_vsync;						//Prepared Image data vsync valid signal
	wire				matrix_frame_href;						//Prepared Image data href vaild  signal
	wire				matrix_frame_clken;						//Prepared Image data output/capture enable clock	
	wire		[23:0]	matrix_p11, matrix_p12, matrix_p13,matrix_p14;		//3X3 Matrix output
	wire		[23:0]	matrix_p21, matrix_p22, matrix_p23,matrix_p24;
	wire		[23:0]	matrix_p31, matrix_p32, matrix_p33,matrix_p34;
	wire		[23:0]	matrix_p41, matrix_p42, matrix_p43,matrix_p44;
/
	
	Shift_RAM_4X4 Shift_RAM_4X4_inst
	(
		//global clock
		.clk							(clk),  				//cmos video pixel clock
		.rst_n							(rst_n),				//global reset
		.per_frame_vsync				(per_frame_vsync),		//Prepared Image data vsync valid signal
		.per_frame_href					(per_frame_href),		//Prepared Image data href vaild  signal
		.per_frame_clken				(per_frame_clken),		//Prepared Image data output/capture enable clock
		.per_img_data				    ({per_img_red,per_img_green,per_img_blue}),			//Prepared Image brightness input
	
		//Image data has been processd
		.matrix_frame_vsync				(matrix_frame_vsync),	//Prepared Image data vsync valid signal
		.matrix_frame_href				(matrix_frame_href),	//Prepared Image data href vaild  signal
		.matrix_frame_clken				(matrix_frame_clken),	//Prepared Image data output/capture enable clock	
		
		.matrix_p11(matrix_p11),	.matrix_p12(matrix_p12), 	.matrix_p13(matrix_p13),   .matrix_p14(matrix_p14),	//3X3 Matrix output
		.matrix_p21(matrix_p21), 	.matrix_p22(matrix_p22), 	.matrix_p23(matrix_p23),  .matrix_p24(matrix_p24),
		.matrix_p31(matrix_p31), 	.matrix_p32(matrix_p32), 	.matrix_p33(matrix_p33),  .matrix_p34(matrix_p34),
		.matrix_p41(matrix_p41), 	.matrix_p42(matrix_p42), 	.matrix_p43(matrix_p43),  .matrix_p44(matrix_p44)
);
//calculate
    bicubic_core bicubic_core_inst
    (
        .i_bicubic_clk(clk),
        .rst_n(rst_n),

        .i_raw_pix11(matrix_p11),
        .i_raw_pix12(matrix_p12),
        .i_raw_pix13(matrix_p13),
        .i_raw_pix14(matrix_p14),
        .i_raw_pix21(matrix_p21),
        .i_raw_pix22(matrix_p22),
        .i_raw_pix23(matrix_p23),
        .i_raw_pix24(matrix_p24),
        .i_raw_pix31(matrix_p31),
        .i_raw_pix32(matrix_p32),
        .i_raw_pix33(matrix_p33),
        .i_raw_pix34(matrix_p34),
        .i_raw_pix41(matrix_p41),
        .i_raw_pix42(matrix_p42),
        .i_raw_pix43(matrix_p43),
        .i_raw_pix44(matrix_p44),

        .o_res_pix11(o_res_pix11),
        .o_res_pix12(o_res_pix12),
        .o_res_pix21(o_res_pix21),
        .o_res_pix22(o_res_pix22)
    );
    //------------------------------------------
	//lag 2 clocks signal sync  
	reg	[1:0]	per_frame_vsync_r;
	reg	[1:0]	per_frame_href_r;
	reg	[1:0]	per_frame_clken_r;
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			begin
				per_frame_vsync_r <= 0;
				per_frame_href_r  <= 0;
				per_frame_clken_r <= 0;
			end
		else
			begin
				per_frame_vsync_r 	<= 	{per_frame_vsync_r[0], matrix_frame_vsync};
				per_frame_href_r 	<= 	{per_frame_href_r [0], matrix_frame_href};
				per_frame_clken_r 	<= 	{per_frame_clken_r[0], matrix_frame_clken};
			end
	end
	
	assign	post_frame_vsync 	= 	per_frame_vsync_r[1];
	assign	post_frame_href 	= 	per_frame_href_r [1];
	assign	post_frame_clken 	= 	per_frame_clken_r[1];

endmodule