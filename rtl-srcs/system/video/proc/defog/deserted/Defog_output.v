`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/26 21:16:10
// Design Name: 
// Module Name: Shift_RAM3X3
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

`timescale 1ns / 1ps

module Defog_output (
    input         clk,
    input         rst_n,
    input         i_raw_pix11,
    input         i_raw_pix12,
    input         i_raw_pix13,
    input         i_raw_pix21,
    input         i_raw_pix22,
    input         i_raw_pix23,
    input         i_raw_pix31,
    input         i_raw_pix32,
    input         i_raw_pix33,
    input  [15:0] A,
    input  [ 7:0] per_img_red,
    input  [ 7:0] per_img_green,
    input  [ 7:0] per_img_blue,
    output [23:0] per_img_pixel
);

    wire [23:0] num[0:8];

    assign num[0] = i_raw_pix11;
    assign num[1] = i_raw_pix12;
    assign num[2] = i_raw_pix13;
    assign num[3] = i_raw_pix21;
    assign num[4] = i_raw_pix22;
    assign num[5] = i_raw_pix23;
    assign num[6] = i_raw_pix31;
    assign num[7] = i_raw_pix32;
    assign num[8] = i_raw_pix33;

    reg [23:0] sorted_nums[0:8];
    reg [23:0] temp;
    integer i, j;
    reg [28:0] per_img_fliter;

    // bubble sort
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 9; i = i + 1) begin
                sorted_nums[i] <= 24'd0;
            end
        end else begin
            for (i = 0; i < 9; i = i + 1) begin
                sorted_nums[i] <= num[i];
            end
            for (i = 0; i < 8; i = i + 1) begin
                for (j = 0; j < 8 - i; j = j + 1) begin
                    if (sorted_nums[j] > sorted_nums[j+1]) begin
                        temp             <= sorted_nums[j];
                        sorted_nums[j]   <= sorted_nums[j+1];
                        sorted_nums[j+1] <= temp;
                    end
                end
            end
        end
    end

    // Output the median value
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            per_img_fliter <= 29'b0;
        end else begin
            per_img_fliter <= ((29'b1000000 - sorted_nums[4]) > 29'b10) ? (29'b1000000 - sorted_nums[4]) : 29'b10;
        end
    end

    wire [15:0] per_img_red1;
    wire [15:0] per_img_green1;
    wire [15:0] per_img_blue1;

    assign per_img_red1   = {8'd0, per_img_red};
    assign per_img_green1 = {8'd0, per_img_green};
    assign per_img_blue1  = {8'd0, per_img_blue};

    reg [15:0] per_img_red_r;
    reg [15:0] per_img_blue_r;
    reg [15:0] per_img_green_r;

    always @(posedge clk) begin
        per_img_red_r   <= (per_img_red1 - A);
        per_img_green_r <= (per_img_green1 - A);
        per_img_blue_r  <= (per_img_blue1 - A);
    end

    reg [23:0] per_img_pixel_temp;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            per_img_pixel_temp <= 24'd0;
        end else begin
            if (A != 16'd0) begin
                per_img_pixel_temp <= {((per_img_red_r << 5) / per_img_fliter) >> 5 + A, ((per_img_green_r << 5) / per_img_fliter) >> 5 + A, ((per_img_blue_r << 5) / per_img_fliter) >> 5 + A};
            end else begin
                per_img_pixel_temp <= {per_img_red, per_img_green, per_img_blue};
            end
        end
    end

    assign per_img_pixel = per_img_pixel_temp;

endmodule


/*
module Defog_output(
	input						clk,
	input						rst_n,
	input			[23:0]		num[0:8],
	input			[15:0]		A,
	input			[7:0]		per_img_red,		
	input			[7:0]		per_img_green,		
	input			[7:0]		per_img_blue,	

	output			[23:0]		per_img_pixel
);
	
	reg 			[23:0] 		sorted_nums [0:8];
	reg 			[23:0] 		temp;
	integer 					i , j;
	reg			[28:0]		per_img_fliter;
	
	// bubble sort
	always @(posedge clk or posedge rst_n) begin
		if ( rst_n ) begin
			for (i = 0; i < 9; i = i + 1) begin
				sorted_nums[i] <= 0;
			end
		end else begin
			for (i = 0; i < 9; i = i + 1) begin
				sorted_nums[i] <= num[i];
			end
			for (i = 0; i < 8; i = i + 1) begin
				for (j = 0; j < 8 - i; j = j + 1) begin
					if (sorted_nums[j] > sorted_nums[j + 1]) begin
						temp <= sorted_nums[j];
						sorted_nums[j] <= sorted_nums[j + 1];
						sorted_nums[j + 1] <= temp;
					end
				end
			end
		end
	end
	
	// Output the median value
	always @(posedge clk or posedge rst_n) begin
		if ( rst_n ) begin
			per_img_fliter <= 8'b0;
		end else begin
			per_img_fliter <= ( ( 27'b100000 - sorted_nums[4] ) > 27'b10) ? ( ( 27'b100000 - sorted_nums[4] ) ) : 27'b10 ;
		end
	end
	
	reg	[15:0]	per_img_red1   ;	
	reg	[15:0]	per_img_green1 ;
	reg	[15:0]	per_img_blue1  ;	
	
	assign per_img_red1   = { 8'd0 , per_img_red   };
	assign per_img_green1 = { 8'd0 , per_img_green };
	assign per_img_blue1  = { 8'd0 , per_img_blue  };
	
	reg	[15:0]	per_img_red_r   ;
	reg	[15:0]	per_img_blue_r  ;
	reg	[15:0]	per_img_green_r ;

	always @(posedge clk or negedge rst_n) begin
		per_img_red_r 	<= ( ( per_img_red1   - A ) ;
		per_img_green_r <= ( ( per_img_green1 - A ) ;
		per_img_blue_r  <= ( ( per_img_blue1  - A ) ;
	end

	always @(posedge clk or negedge rst_n) begin
		if( pre_A != 16'b0 ) begin
			per_img_pixel <= { ( per_img_red_r   << 5 ) / per_img_fliter ) >> 5 + A , 
							   ( per_img_green_r << 5 ) / per_img_fliter ) >> 5 + A , 
							   ( per_img_blue_r  << 5 ) / per_img_fliter ) >> 5 + A };
		end else
			per_img_pixel <= { per_img_red , per_img_green , per_img_blue };
		end
	end

endmodule*/
