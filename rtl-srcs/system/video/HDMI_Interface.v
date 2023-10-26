`timescale 1ns/1ps

////////////////////////////////////English///////////////////////////////////////
// Company:			Disp301 Experiment in SouthEast University
// Engineer:		Erie
// 
// Create Date: 	2020/07/14 14:07:12
// Design Name: 	HDMI Driver
// Module Name: 	HDMI_Interface
// Description: 	None
// 
// Dependencies: 	None
//
// Dependent modules:
// 	 Module Name				    Version
//      None				 		 None
//
// Version:			V1.3
// Revision Date:	2021/10/21 19:25:46
// History:			
// 2020/07/12		V1.0		Create File and Driver_HDMI module.
// 2021/05/10		V1.1		Renamed to HDMI_Interface.
// 2021/10/08		V1.2		Modify the name of the internal interface and optimize part of the timing.
// 2021/10/21		V1.3		Add IDE_MODE optional parameters, support VIVADO and PDS IDE; add the dependent encoder and Serdes parallel-to-serial conversion module to this file.
///////////////////////////////////Chinese////////////////////////////////////////
// 版权归属:		东南大学显示中心301实验室
// 开发人员:		Erie
// 
// 创建日期: 		2020年07月14日
// 设计名称: 		HDMI Driver
// 模块名称: 		HDMI_Interface
// 相关名称: 		None
// 
// 依赖资料: 		None
// 依赖模块:
// 	  模块名称						 版本
//      None				 		 None
// 
// 当前版本:		V1.3
// 修订日期:		2021年10月21日
// 修订历史:		
// 2020年07月14日	V1.0		创建文件,编写HDMI驱动模块(Driver_HDMI)
// 2021年05月10日	V1.1		更名为HDMI_Interface
// 2021年10月08日	V1.2		修改内部接口名称,优化部分时序
// 2021年10月21日	V1.3		增加IDE_MODE可选参数,支持VIVADO和PDS两个IDE;将依赖的编码器和Serdes并串转换模块加到本文件中;

//HDMI接口
module HDMI_Interface
#(
	parameter IDE_MODE = 2'd0	//IDE版本模式,2'd0代表VIVADO;2'd1代表PDS;其他
)
(
	input i_clk_pixel,
	input i_clk_pixel5x,
	input i_rstn,
	
	//------------------视频信号通道-------------------//
	input [23:0]i_rgb_data,
	input i_rgb_vde,
	input i_rgb_hsync,
	input i_rgb_vsync,
	
	//------------------TMDS编码通道-------------------//
	output o_tmds_clk_p,
	output o_tmds_clk_n,
	output [2:0]o_tmds_data_p,
	output [2:0]o_tmds_data_n
);
	
	//TMDS信号
	wire [9:0]TMDS_R_DATA;
	wire [9:0]TMDS_G_DATA;
	wire [9:0]TMDS_B_DATA;
	
	//TMDS信号奇数偶数分离
	wire [4:0]TMDS_R_ODD;
	wire [4:0]TMDS_R_EVEN;
	wire [4:0]TMDS_G_ODD;
	wire [4:0]TMDS_G_EVEN;
	wire [4:0]TMDS_B_ODD;
	wire [4:0]TMDS_B_EVEN;
	
	//R通道编码
	TMDS_Encoder_Interface TMDS_Encoder_Interface_Inst_R(
		.i_clk(i_clk_pixel),
		.i_rstn(i_rstn),
		.i_vde(i_rgb_vde),
		.i_data(i_rgb_data[23:16]),
		.i_c(2'd0),
		.o_data(TMDS_R_DATA),
		.o_data_odd(TMDS_R_ODD),
		.o_data_even(TMDS_R_EVEN)
	);
	
	//G通道编码
	TMDS_Encoder_Interface TMDS_Encoder_Interface_Inst_G(
		.i_clk(i_clk_pixel),
		.i_rstn(i_rstn),
		.i_vde(i_rgb_vde),
		.i_data(i_rgb_data[15:8]),
		.i_c(2'd0),
		.o_data(TMDS_G_DATA),
		.o_data_odd(TMDS_G_ODD),
		.o_data_even(TMDS_G_EVEN)
	);
	
	//B通道编码
	TMDS_Encoder_Interface TMDS_Encoder_Interface_Inst_B(
		.i_clk(i_clk_pixel),
		.i_rstn(i_rstn),
		.i_vde(i_rgb_vde),
		.i_data(i_rgb_data[7:0]),
		.i_c({i_rgb_vsync,i_rgb_hsync}),
		.o_data(TMDS_B_DATA),
		.o_data_odd(TMDS_B_ODD),
		.o_data_even(TMDS_B_EVEN)
	);
	
	//Serdes R通道
	Serializer_Interface #(.IDE_MODE(IDE_MODE))Serializer_Interface_Inst_R(
		.i_clk(i_clk_pixel),
		.i_clk_5x(i_clk_pixel5x),
		.i_rstn(i_rstn),

		//---------------输入并行数据---------------//
		.i_parallel_data(TMDS_R_DATA),
		.i_parallel_odd(TMDS_R_ODD),
		.i_parallel_even(TMDS_R_EVEN),
		
		//---------------TMDS管脚信号---------------//
		.o_tmds_data_p(o_tmds_data_p[2]),
		.o_tmds_data_n(o_tmds_data_n[2])
	);
	
	//Serdes G通道
	Serializer_Interface #(.IDE_MODE(IDE_MODE))Serializer_Interface_Inst_G(
		.i_clk(i_clk_pixel),
		.i_clk_5x(i_clk_pixel5x),
		.i_rstn(i_rstn),

		//---------------输入并行数据---------------//
		.i_parallel_data(TMDS_G_DATA),
		.i_parallel_odd(TMDS_G_ODD),
		.i_parallel_even(TMDS_G_EVEN),
		
		//---------------TMDS管脚信号---------------//
		.o_tmds_data_p(o_tmds_data_p[1]),
		.o_tmds_data_n(o_tmds_data_n[1])
	);
	
	//Serdes B通道
	Serializer_Interface #(.IDE_MODE(IDE_MODE))Serializer_Interface_Inst_B(
		.i_clk(i_clk_pixel),
		.i_clk_5x(i_clk_pixel5x),
		.i_rstn(i_rstn),
		
		//---------------输入并行数据---------------//
		.i_parallel_data(TMDS_B_DATA),
		.i_parallel_odd(TMDS_B_ODD),
		.i_parallel_even(TMDS_B_EVEN),
		
		//---------------TMDS管脚信号---------------//
		.o_tmds_data_p(o_tmds_data_p[0]),
		.o_tmds_data_n(o_tmds_data_n[0])
	);
	
	//Serdes 时钟通道
	Serializer_Interface #(.IDE_MODE(IDE_MODE))Serializer_Interface_Inst_CLK(
		.i_clk(i_clk_pixel),
		.i_clk_5x(i_clk_pixel5x),
		.i_rstn(i_rstn),

		//---------------输入并行数据---------------//
		.i_parallel_data(10'b11111_00000),
		.i_parallel_odd(5'b11100),
		.i_parallel_even(5'b11000),
		
		//---------------TMDS管脚信号---------------//
		.o_tmds_data_p(o_tmds_clk_p),
		.o_tmds_data_n(o_tmds_clk_n)
	);
endmodule


//高速收发器发送模块:10b-8b并串转换
module Serializer_Interface
#(
	parameter IDE_MODE = 2'd0	//IDE版本模式,2'd0代表VIVADO;2'd1代表PDS;其他
)
(
	input i_clk,
	input i_clk_5x,
	input i_rstn,
	
	//---------------输入并行数据---------------//
	input [9:0]i_parallel_data,
	input [4:0]i_parallel_odd,
	input [4:0]i_parallel_even,
	
	//---------------TMDS管脚信号---------------//
	output o_tmds_data_p,
	output o_tmds_data_n
);

	//生成TMDS输出
	generate if(IDE_MODE == 2'd0)begin:gen_VIVADO_SERDES
	
		//serdes输出信号
		wire TMDS_DATA;
		wire TMDS_SHIFT_1;
		wire TMDS_SHIFT_2;
		
		//输出BUFT
		OBUFDS #(.IOSTANDARD("DEFAULT"),.SLEW("FAST")) OBUFDS_Inst_P(.O(o_tmds_data_p),.OB(o_tmds_data_n),.I(TMDS_DATA));

		//高速收发器,低8位
		OSERDESE2 #(
						.DATA_RATE_OQ("DDR"),   	// DDR, SDR
						.DATA_RATE_TQ("DDR"),   	// DDR, BUF, SDR
						.DATA_WIDTH(10),         	// Parallel data width (2-8,10,14)
						.INIT_OQ(1'b0),         	// Initial value of OQ output (1'b0,1'b1)
						.INIT_TQ(1'b0),         	// Initial value of TQ output (1'b0,1'b1)
						.SERDES_MODE("MASTER"), 	// MASTER, SLAVE
						.SRVAL_OQ(1'b0),        	// OQ output value when SR is used (1'b0,1'b1)
						.SRVAL_TQ(1'b0),        	// TQ output value when SR is used (1'b0,1'b1)
						.TBYTE_CTL("FALSE"),    	// Enable tristate byte operation (FALSE, TRUE)
						.TBYTE_SRC("FALSE"),    	// Tristate byte source (FALSE, TRUE)
						.TRISTATE_WIDTH(1)      	// 3-state converter width (1,4)
		)OSERDESE2_Inst_Master(
			.OFB(),									// 1-bit output: Feedback path for data
			.OQ(TMDS_DATA),							// 1-bit output: Data path output
			
			.SHIFTOUT1(),							// SHIFTOUT1: 1-bit (each) output: Data output expansion (1-bit each)
			.SHIFTOUT2(),							// SHIFTOUT1: 1-bit (each) output: Data output expansion (1-bit each)
			.TBYTEOUT(),							// 1-bit output: Byte group tristate
			.TFB(),									// 1-bit output: 3-state control
			.TQ(),									// 1-bit output: 3-state control
			.CLK(i_clk_5x),							// 1-bit input: High speed clock
			.CLKDIV(i_clk),							// 1-bit input: Divided clock
			
			//并行数据
			.D1(i_parallel_data[0]),				// Parallel data inputs (1-bit each)
			.D2(i_parallel_data[1]),				// Parallel data inputs (1-bit each)
			.D3(i_parallel_data[2]),				// Parallel data inputs (1-bit each)
			.D4(i_parallel_data[3]),				// Parallel data inputs (1-bit each)
			.D5(i_parallel_data[4]),				// Parallel data inputs (1-bit each)
			.D6(i_parallel_data[5]),				// Parallel data inputs (1-bit each)
			.D7(i_parallel_data[6]),				// Parallel data inputs (1-bit each)
			.D8(i_parallel_data[7]),				// Parallel data inputs (1-bit each)
		
			//使能信号
			.OCE(1'b1),								// 1-bit input: Output data clock enable
			.RST(~i_rstn),							// 1-bit input: Reset
			
			//移位输入信号
			.SHIFTIN1(TMDS_SHIFT_1),				// SHIFTIN1: 1-bit (each) input: Data input expansion (1-bit each)
			.SHIFTIN2(TMDS_SHIFT_2),				// SHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
			
			//3态门控信号
			.T1(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.T2(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.T3(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.T4(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.TBYTEIN(1'b0),							// 1-bit input: Byte group tristate
			.TCE(1'b0)								// 1-bit input: 3-state clock enable
		);
		
		//高速收发器,高2位
		OSERDESE2 #(
						.DATA_RATE_OQ("DDR"),   	// DDR, SDR
						.DATA_RATE_TQ("DDR"),   	// DDR, BUF, SDR
						.DATA_WIDTH(10),         	// Parallel data width (2-8,10,14)
						.INIT_OQ(1'b0),         	// Initial value of OQ output (1'b0,1'b1)
						.INIT_TQ(1'b0),         	// Initial value of TQ output (1'b0,1'b1)
						.SERDES_MODE("SLAVE"), 		// MASTER, SLAVE
						.SRVAL_OQ(1'b0),        	// OQ output value when SR is used (1'b0,1'b1)
						.SRVAL_TQ(1'b0),        	// TQ output value when SR is used (1'b0,1'b1)
						.TBYTE_CTL("FALSE"),    	// Enable tristate byte operation (FALSE, TRUE)
						.TBYTE_SRC("FALSE"),    	// Tristate byte source (FALSE, TRUE)
						.TRISTATE_WIDTH(1)      	// 3-state converter width (1,4)
		)OSERDESE2_Inst_Slave(
			//时钟和使能信号
			.CLK(i_clk_5x),							// 1-bit input: High speed clock
			.CLKDIV(i_clk),							// 1-bit input: Divided clock
			.OCE(1'b1),								// 1-bit input: Output data clock enable
			.RST(~i_rstn),							// 1-bit input: Reset
			
			.OFB(),									// 1-bit output: Feedback path for data
			.OQ(),									// 1-bit output: Data path output
			
			.SHIFTOUT1(TMDS_SHIFT_1),				// SHIFTOUT1: 1-bit (each) output: Data output expansion (1-bit each)
			.SHIFTOUT2(TMDS_SHIFT_2),				// SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
			.TBYTEOUT(),							// 1-bit output: Byte group tristate
			.TFB(),									// 1-bit output: 3-state control
			.TQ(),									// 1-bit output: 3-state control
			
			
			//并行数据
			.D1(),									// Parallel data inputs (1-bit each)
			.D2(),									// Parallel data inputs (1-bit each)
			.D3(i_parallel_data[8]),				// Parallel data inputs (1-bit each)
			.D4(i_parallel_data[9]),				// Parallel data inputs (1-bit each)
			.D5(),									// Parallel data inputs (1-bit each)
			.D6(),									// Parallel data inputs (1-bit each)
			.D7(),									// Parallel data inputs (1-bit each)
			.D8(),									// Parallel data inputs (1-bit each)
			
			//移位输入信号
			.SHIFTIN1(),							// SHIFTIN1: 1-bit (each) input: Data input expansion (1-bit each)
			.SHIFTIN2(),							// SSHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
			
			//3态门控信号
			.T1(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.T2(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.T3(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.T4(1'b0),								// 1-bit (each) input: Parallel 3-state inputs
			.TBYTEIN(1'b0),							// 1-bit input: Byte group tristate
			.TCE(1'b0)								// 1-bit input: 3-state clock enable
		);
	end
	//PDS版本Serdes
	else if(IDE_MODE == 2'd1)begin:gen_PDS_Serdes
		//serdes输出信号
		wire TMDS_T_P;
		wire TMDS_O_P;
		wire TMDS_T_N;
		wire TMDS_O_N;
		
		//移位计数
		reg [2:0]shift_cnt = 0;
		
		//输入缓存信号
		reg [4:0]parallel_odd_i = 0;
		reg [4:0]parallel_even_i = 0;
		
		//输出BUFT
		GTP_OUTBUFT #(.SLEW_RATE("FAST"))GTP_OUTBUFT_Inst_P(.I(TMDS_O_P),.T(TMDS_T_P),.O(o_tmds_data_p));
		GTP_OUTBUFT #(.SLEW_RATE("FAST"))GTP_OUTBUFT_Inst_N(.I(TMDS_O_N),.T(TMDS_T_N),.O(o_tmds_data_n));
		
		//SERDES P
		GTP_OSERDES #(	.OSERDES_MODE("ODDR"),.WL_EXTEND("FALSE"),
						.GRS_EN("TRUE"),.LRS_EN("TRUE"),
						.TSDDR_INIT(1'b0))GTP_OSERDES_Inst_P(
			.DO(TMDS_O_P),.TQ(TMDS_T_P),
			.DI({6'd0,parallel_odd_i[0],parallel_even_i[0]}),.TI(4'd0),
			.RCLK(i_clk),.SERCLK(i_clk),
			.OCLK(1'b0),.RST(1'b0)
		);
		
		//SERDES N
		GTP_OSERDES #(	.OSERDES_MODE("ODDR"),.WL_EXTEND("FALSE"),
						.GRS_EN("TRUE"),.LRS_EN("TRUE"),
						.TSDDR_INIT(1'b0))GTP_OSERDES_Inst_N(
			.DO(TMDS_O_N),.TQ(TMDS_T_N),
			.DI({6'd0,~parallel_odd_i[0],~parallel_even_i[0]}),.TI(4'd0),
			.RCLK(i_clk),.SERCLK(i_clk),
			.OCLK(1'b0),.RST(1'b0)
		);
		
		//移位计数
		always@(posedge i_clk)begin
			if(shift_cnt[2] == 1'b1)shift_cnt <= 3'd0;
			else shift_cnt <= shift_cnt + 3'd1;
		end
		
		//输入信号缓存
		always@(posedge i_clk)begin
			if(shift_cnt[2] == 1'b1)begin
				parallel_odd_i <= i_parallel_odd;
				parallel_even_i <= i_parallel_even;
			end else begin
				parallel_odd_i <= {1'b0,parallel_odd_i[4:1]};
				parallel_even_i <= {1'b0,parallel_even_i[4:1]};
			end
		end
	end else begin:gen_None_Serdes
		assign o_tmds_data_p = 1'd0;
		assign o_tmds_data_n = 1'd0;
	end endgenerate

endmodule

//TMDS信号编码
module TMDS_Encoder_Interface
(
	input i_clk,
	input i_rstn,
	input i_vde,
	input [7:0]i_data,
	input [1:0]i_c,
	output [9:0]o_data,
	output [4:0]o_data_odd,
	output [4:0]o_data_even
);
	//延迟参数
	localparam Tp = 1;
	
	//控制令牌参数
	localparam PARAM_CTRL_TOKEN0 = 10'b1101010100;
	localparam PARAM_CTRL_TOKEN1 = 10'b0010101011;
	localparam PARAM_CTRL_TOKEN2 = 10'b0101010100;
	localparam PARAM_CTRL_TOKEN3 = 10'b1010101011;
	
	//选择信号
	wire sel_0;
	wire sel_1;
	wire sel_2;
	
	//QM
	wire [8:0]q_m;
	
	//disparity 计数
	reg [4:0]disp_cnt = 0;
	
	//求和
	reg [3:0]sum_data = 0;
	reg [3:0]sum_q_m = 0;
	reg [3:0]sum_q_m_n = 0;
	
	//其他缓存信号
	reg [8:0]q_m_buf = 0;
	
	//输入缓存信号
	reg [1:0]vde_i = 0;
	reg [7:0]data_i = 0;
	reg [3:0]c_i = 0;
	
	//输出信号
	reg [9:0]data_o = 0;
	
	//选择信号连线
	assign sel_0 = (sum_data > 4'd4) | ((sum_data == 4'd4) & (data_i[0] == 1'b0));
	assign sel_1 = (disp_cnt == 5'd0) | (sum_q_m == 4'd4);
	assign sel_2 = (~disp_cnt[4] & (sum_q_m < 4'd4)) | (disp_cnt[4] & (sum_q_m > 4'd4));
	
	//QM信号连线
	assign q_m[0] = data_i[0];
	assign q_m[1] = (sel_0 == 1'b1) ? (q_m[0] ^~ data_i[1]) : (q_m[0] ^ data_i[1]);
	assign q_m[2] = (sel_0 == 1'b1) ? (q_m[1] ^~ data_i[2]) : (q_m[1] ^ data_i[2]);
	assign q_m[3] = (sel_0 == 1'b1) ? (q_m[2] ^~ data_i[3]) : (q_m[2] ^ data_i[3]);
	assign q_m[4] = (sel_0 == 1'b1) ? (q_m[3] ^~ data_i[4]) : (q_m[3] ^ data_i[4]);
	assign q_m[5] = (sel_0 == 1'b1) ? (q_m[4] ^~ data_i[5]) : (q_m[4] ^ data_i[5]);
	assign q_m[6] = (sel_0 == 1'b1) ? (q_m[5] ^~ data_i[6]) : (q_m[5] ^ data_i[6]);
	assign q_m[7] = (sel_0 == 1'b1) ? (q_m[6] ^~ data_i[7]) : (q_m[6] ^ data_i[7]);
	assign q_m[8] = ~sel_0;
	
	//输出信号连线
	assign o_data = data_o;
	assign o_data_odd = {data_o[9],data_o[7],data_o[5],data_o[3],data_o[1]};
	assign o_data_even = {data_o[8],data_o[6],data_o[4],data_o[2],data_o[0]};
	
	//数据输出:第9位
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)data_o[9] <= #Tp 1'b0;
		else if(vde_i[1] == 1'b0)data_o[9] <= #Tp (c_i[3] ^~ c_i[2]);
		else if(sel_1 == 1'b1)data_o[9] <= #Tp (~q_m_buf[8]);
		else data_o[9] <= #Tp sel_2;
	end
	
	//数据输出:第8位
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)data_o[8] <= #Tp 1'b0;
		else if(vde_i[1] == 1'b0)data_o[8] <= #Tp (~c_i[2]);
		else data_o[8] <= #Tp q_m_buf[8];
	end
	
	//数据输出:第7-0位
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)data_o[7:0] <= #Tp 8'd0;
		else if(vde_i[1] == 1'b0)begin
			case(c_i[3:2])
				2'b00:data_o[7:0] <= #Tp PARAM_CTRL_TOKEN0[7:0];
				2'b01:data_o[7:0] <= #Tp PARAM_CTRL_TOKEN1[7:0];
				2'b10:data_o[7:0] <= #Tp PARAM_CTRL_TOKEN2[7:0];
				2'b11:data_o[7:0] <= #Tp PARAM_CTRL_TOKEN3[7:0];
			endcase
		end else if(sel_1 == 1'b1 && q_m_buf[8] == 1'b1)data_o[7:0] <= #Tp q_m_buf[7:0];
		else if(sel_1 == 1'b1)data_o[7:0] <= #Tp (~q_m_buf[7:0]);
		else if(sel_2 == 1'b1)data_o[7:0] <= #Tp (~q_m_buf[7:0]);
		else data_o[7:0] <= #Tp q_m_buf[7:0];
	end
	
	//计数
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)disp_cnt <= #Tp 5'd0;
		else if(vde_i[1] == 1'b0)disp_cnt <= #Tp 5'd0;
		else if(sel_1 == 1'b1 && q_m_buf[8] == 1'b1)disp_cnt <= #Tp (disp_cnt + sum_q_m_n - sum_q_m);
		else if(sel_1 == 1'b1)disp_cnt <= #Tp (disp_cnt + sum_q_m - sum_q_m_n);
		else if(sel_2 == 1'b1)disp_cnt <= #Tp (disp_cnt + {q_m_buf[8],1'b0} + sum_q_m - sum_q_m_n);
		else disp_cnt <= #Tp (disp_cnt  + sum_q_m_n - sum_q_m -  {~q_m_buf[8],1'b0});
	end
	
	//求和
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			sum_data <= #Tp 4'd0;
			sum_q_m <= #Tp 4'd0;
			sum_q_m_n <= #Tp 4'd0;
		end else begin
			sum_data <= #Tp (i_data[0] + i_data[1] + i_data[2] + i_data[3]) + (i_data[4] + i_data[5] + i_data[6] + i_data[7]);
			sum_q_m <= #Tp (q_m[0] + q_m[1] + q_m[2] + q_m[3]) + (q_m[4] + q_m[5] + q_m[6] + q_m[7]);
			sum_q_m_n <= #Tp 4'd8 - ((q_m[0] + q_m[1] + q_m[2] + q_m[3]) + (q_m[4] + q_m[5] + q_m[6] + q_m[7]));
		end
	end
	
	//其他信号缓存
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			q_m_buf <= #Tp 9'd0;
		end else begin
			q_m_buf <= #Tp q_m;
		end
	end
	
	//输入信号缓存
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			vde_i <= #Tp 2'd0;
			data_i <= #Tp 8'd0;
			c_i <= #Tp 4'd0;
		end else begin
			vde_i <= #Tp {vde_i[0],i_vde};
			data_i <= #Tp i_data;
			c_i <= #Tp {c_i[1:0],i_c};	
		end
	end
endmodule