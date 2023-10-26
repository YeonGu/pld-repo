`timescale 1ns / 1ps

module Camera_Interface
(
	input i_clk_pixel,
	input i_rstn,
	
	//----------------摄像头视频数据通道----------------//
	//输入通道
	input i_camera_hsync,
	input i_camera_vsync,
	input [7:0]i_camera_data,
	
	//输出通道
	output o_rgb565_vde,
	output o_rgb565_vsync,
	output [15:0]o_rgb565_data
);

	reg [23:0] debug_vscnt = 0;
	always @(posedge i_clk_pixel) begin
		debug_vscnt <= (i_camera_vsync)? debug_vscnt + 1: 0;
	end

	//OV5640 IIC信号
	wire OV5640_SDA_O;
	wire OV5640_SDA_I;
	wire OV5640_SDA_T;
	wire OV5640_SCL;
	
	//标志
	reg receive_flag = 0;
	
	//输入缓存信号
	reg camera_hsync_i = 0;
	reg [1:0]camera_vsync_i = 0;
	reg [15:0]camera_data_i = 0;
	
	//输出信号
	reg rgb565_vde_o = 0;
	reg [15:0]rgb565_data_o = 0;
	
	//摄像头数据输出连线
	assign o_rgb565_vde = rgb565_vde_o;
	assign o_rgb565_vsync = camera_vsync_i[1];
	assign o_rgb565_data = rgb565_data_o;
	
	//摄像头数据输出
	always@(posedge i_clk_pixel or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			rgb565_vde_o <= 1'b0;
			rgb565_data_o <= 16'd0;
		end else if(camera_hsync_i == 1'b1 && receive_flag == 1'b1)begin
			rgb565_vde_o <= 1'b1;
			rgb565_data_o <= {camera_data_i[4:0],camera_data_i[10:5],camera_data_i[15:11]};
		end else begin
			rgb565_vde_o <= 1'b0;
			rgb565_data_o <= 16'd0;
		end
	end
	
	//接收标志
	always@(posedge i_clk_pixel or negedge i_rstn)begin
		if(i_rstn == 1'b0)receive_flag <= 1'b0;
		else if(camera_hsync_i == 1'b0)receive_flag <= 1'b0;
		else receive_flag <= ~receive_flag;
	end

	//输入信号缓存
	always@(posedge i_clk_pixel or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			camera_hsync_i <= 1'b0;
			camera_vsync_i <= 2'd0;
			camera_data_i <= 16'd0;
		end else begin
			camera_hsync_i <= i_camera_hsync;
			camera_vsync_i <= {camera_vsync_i[0],i_camera_vsync};
			camera_data_i <= {camera_data_i[7:0],i_camera_data};
		end
	end
	
endmodule