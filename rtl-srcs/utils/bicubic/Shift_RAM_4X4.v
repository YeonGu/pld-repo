`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/23 17:06:49
// Design Name: 
// Module Name: Shift_RAM_4X4
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


module Shift_RAM_4X4(
 //global signals
    input                   clk,
    input                   rst_n,
    //Image data prepared to be processed
    input                   per_frame_vsync,    //Prepared Image data vsync valid signal
    input                   per_frame_href,     //Prepared Image data href valid
    input                   per_frame_clken,    //Prepared Image data output/capture enable clock
    input        [23:0]      per_img_data,          //Prepared Image brightness input
    
    //Image data has been processed
    output                  matrix_frame_vsync,
    output                  matrix_frame_href,
    output                  matrix_frame_clken,
    
    output  reg     [23:0]   matrix_p11,
    output  reg     [23:0]   matrix_p12,
    output  reg     [23:0]   matrix_p13,
    output  reg     [23:0]   matrix_p14,
    output  reg     [23:0]   matrix_p21,         //3X3 Matrix output
    output  reg     [23:0]   matrix_p22,
    output  reg     [23:0]   matrix_p23,
    output  reg     [23:0]   matrix_p24,
    output  reg     [23:0]   matrix_p31,
    output  reg     [23:0]   matrix_p32,
    output  reg     [23:0]   matrix_p33,
    output  reg     [23:0]   matrix_p34,
    output  reg     [23:0]   matrix_p41,
    output  reg     [23:0]   matrix_p42,
    output  reg     [23:0]   matrix_p43,
    output  reg     [23:0]   matrix_p44
    );
    
    //------------------------------------------------
    //consume 1clk
    wire    [23:0]   row1_data;//frame data og the 1th row
    wire    [23:0]   row2_data;//frame data og the 2th row
     wire    [23:0]   row3_data;//frame data og the 2th row
    reg     [23:0]   row4_data;//frame data og the 3th row
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            row4_data <= 24'b0;
        else begin
            if(per_frame_clken)
                row4_data <= per_img_data;
            else
                row4_data <= row4_data; 
        end
    end
    
    //Shift_RAM_3X3_24bit1
    Shift_RAM_4X4_24bit u1_Shift_RAM_4X4_24bit (
        .D      (row4_data),
        .CLK    (per_frame_clken & clk),
        .Q      (row3_data)
    );
    
    //Shift_RAM_3X3_8bit1
    Shift_RAM_4X4_24bit u2_Shift_RAM_4X4_24bit (
        .D      (row3_data),
        .CLK    (per_frame_clken & clk),
        .Q      (row2_data)
    );
    
    //Shift_RAM_3X3_8bit1
    Shift_RAM_4X4_24bit u3_Shift_RAM_4X4_24bit (
        .D      (row2_data),
        .CLK    (per_frame_clken & clk),
        .Q      (row1_data)
    );
    
    //-----------------------------------------------------
    //per_clken delay 4clk
    reg [5:0]per_frame_clken_r;
    reg [5:0]per_frame_vsync_r;
    reg [5:0]per_frame_href_r;
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            per_frame_clken_r <= 6'b0;
            per_frame_vsync_r <= 6'b0;
            per_frame_href_r  <= 6'b0;
        end
        else begin
            per_frame_clken_r <= {per_frame_clken_r[4:0],per_frame_clken};
            per_frame_vsync_r <= {per_frame_vsync_r[4:0],per_frame_vsync};
            per_frame_href_r  <= {per_frame_href_r [4:0],per_frame_href};
        end
    end
    
    
    assign matrix_frame_vsync = per_frame_vsync_r[5];
    assign matrix_frame_href  = per_frame_href_r[5];
    assign matrix_frame_clken = per_frame_clken_r[5];
    
    /**********************************************
    (1)read data from shift_RAM
    (2)caulate the sobel
    (3)steady data after sobel generate
    ***********************************************/
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            {matrix_p11, matrix_p12, matrix_p13,matrix_p14} <= 96'h0;
            {matrix_p21, matrix_p22, matrix_p23,matrix_p24} <= 96'h0;
            {matrix_p31, matrix_p32, matrix_p33,matrix_p34} <= 96'h0;
            {matrix_p41, matrix_p42, matrix_p43,matrix_p44} <= 96'h0;
        end
        else if(per_frame_clken_r[4])begin                                              //shift RAM data read clock enable
            {matrix_p11, matrix_p12, matrix_p13,matrix_p14} <= {matrix_p12, matrix_p13, matrix_p14,row1_data};//1th shift input
            {matrix_p21, matrix_p22, matrix_p23,matrix_p24} <= {matrix_p22, matrix_p23, matrix_p24,row2_data};//2th shift input
            {matrix_p31, matrix_p32, matrix_p33,matrix_p34} <= {matrix_p32, matrix_p33,matrix_p34, row3_data};//3th shift input
            {matrix_p41, matrix_p42, matrix_p43,matrix_p44} <= {matrix_p42, matrix_p43,matrix_p44, row4_data};//4th shift input
        end
        else begin
            {matrix_p11, matrix_p12, matrix_p13,matrix_p14} <= {matrix_p11, matrix_p12, matrix_p13,matrix_p14};
            {matrix_p21, matrix_p22, matrix_p23,matrix_p24} <= {matrix_p21, matrix_p22, matrix_p23,matrix_p24};
            {matrix_p31, matrix_p32, matrix_p33,matrix_p34} <= {matrix_p31, matrix_p32, matrix_p33,matrix_p34};
            {matrix_p41, matrix_p42, matrix_p43,matrix_p44} <= {matrix_p41, matrix_p42, matrix_p43.matrix_p44};
        end
    end
       
endmodule