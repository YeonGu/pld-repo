`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/13 16:31:56
// Design Name: 
// Module Name: Defog_core
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


module Defog_core (
    input       clk,
    input       rst_n,
    input       per_frame_vsync,  //Prepared Image data vsync valid signal
    input       per_frame_href,   //Prepared Image data href valid
    input       per_frame_clken,  //Prepared Image data output/capture enable clock
    input [7:0] per_img_red,      //Prepared Image red data to be processed
    input [7:0] per_img_green,    //Prepared Image green data to be processed
    input [7:0] per_img_blue,     //Prepared Image blue data to be processed

    output [ 7:0] per_img_data,
    output [15:0] A
);

    reg     [ 7:0] per_img_min;
    reg     [ 7:0] per_img_max;
    reg     [ 7:0] per_img_sort   [149:0][1:0];
    integer        tot;
    reg     [15:0] pre_A;
    reg     [15:0] cur_A;
    reg     [ 7:0] per_img_data_r;

    assign per_img_data = per_img_data_r;
    assign A            = pre_A;

    /*always @(posedge clk or negedge rst_n) begin
		if ( ~ rst_n ) begin
			cur_A <= 16'b0;
			pre_A <= 16'b0;
		end else begin
			// 如果检测到垂直同步信号，则表示一个新场的开始
			if ( per_frame_vsync == 1'b1 ) begin
				pre_A <= cur_A / 150 ;
				cur_A <= 16'b0; 
			end else begin
				pre_A <= pre_A;
				cur_A <= cur_A; 
			end
		end
	end*/

    integer i, j;
    always @(posedge clk) begin
        per_img_max <= (((per_img_red < per_img_blue) ? per_img_blue : per_img_red) < per_img_green) ? per_img_green : ((per_img_red < per_img_blue) ? per_img_blue : per_img_red);
        per_img_min <= (((per_img_red > per_img_blue) ? per_img_blue : per_img_red) > per_img_green) ? per_img_green : ((per_img_red > per_img_blue) ? per_img_blue : per_img_red);
    end

    reg [7:0] current_max;  // 当前最大值

    //per_img_sort[i][1]:min ; per_img_sort[i][0]: max.
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            cur_A <= 16'b0;
            pre_A <= 16'b0;
            // 在复位时将所有像素值初始化为0
            for (i = 0; i < 150; i = i + 1) begin
                per_img_sort[i][0] <= 8'h00;
                per_img_sort[i][1] <= 8'h00;
            end
            current_max <= 8'h00;
        end else begin
            // 逐个比较输入像素数据与当前最大值以确定是否更新最大值
            if (per_frame_vsync == 1'b1) begin
                pre_A              <= cur_A / 150;
                cur_A              <= per_img_max;
                current_max        <= per_img_max;
                per_img_sort[0][1] <= per_img_max;
                per_img_sort[0][0] <= per_img_min;
                for (i = 1; i < 150; i = i + 1) begin
                    per_img_sort[i][1] <= 8'h00;
                    per_img_sort[i][0] <= 8'h00;
                end
            end else begin
                pre_A <= pre_A;
                if (per_img_max > current_max) begin
                    current_max <= per_img_max;
                    // 更新最大像素数组
                    for (i = 0; i < 150; i = i + 1) begin
                        if (current_max > per_img_sort[i][0]) begin
                            per_img_sort[i][0] <= per_img_max;
                            per_img_sort[i][1] <= per_img_min;
                            cur_A              <= cur_A + per_img_max - per_img_sort[i][0];
                            if (i < 149) begin
                                current_max <= per_img_sort[i+1][0];
                            end else begin
                                current_max <= per_img_sort[149][0];
                            end
                        end else begin
                            cur_A              <= cur_A;
                            per_img_sort[i][1] <= per_img_sort[i][1];
                            per_img_sort[i][0] <= per_img_sort[i][0];
                        end
                    end
                end else begin
                    current_max <= current_max;
                    // 更新最大像素数组
                    for (i = 0; i < 150; i = i + 1) begin
                        per_img_sort[i][0] <= per_img_max;
                        per_img_sort[i][1] <= per_img_min;
                        cur_A              <= cur_A;
                    end
                end
            end
        end
    end

    always @(posedge clk) begin
        if (pre_A != 16'b0) begin
            per_img_data_r <= per_img_min / pre_A;
        end else begin
            per_img_data_r <= per_img_min / cur_A;
        end
    end

endmodule
