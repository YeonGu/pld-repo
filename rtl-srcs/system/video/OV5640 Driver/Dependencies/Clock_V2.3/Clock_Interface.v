`timescale 1ns / 1ps

////////////////////////////////////English///////////////////////////////////////
// Company:			Disp301 Experiment in SouthEast University
// Engineer:		Erie
// 
// Create Date: 	2019/09/24 09:24:15
// Design Name: 	Clock Division
// Module Name: 	Clock_Interface
// Description: 	None
// 
// Dependencies: 	None
//
// Dependent modules:
// 	 Module Name				    Version
// 		None					 	 None
//
// Version:			V2.3
// Revision Date:	2021/10/15 21:06:24
// History:			
//    Time			   Version	   Revised by			Contents
// 2019/09/24			V1.0		 Erie		Create File and clk_division module.
// 2019/09/27			V1.1		 Erie		Add odd frequency division function.
// 2019/09/30			V1.2		 Erie		Add even frequency division function.
// 2019/10/02			V1.3		 Erie		Integrated into integer frequency division.
// 2020/07/21			V1.4		 Erie		Optimize timing.
// 2020/07/30			V1.5		 Erie		Increase frequency setting function.
// 2020/08/04			V1.6		 Erie		Fix the problem of the clock being pulled up for a long time caused by the shift of the frequency division coefficient.
// 2021/05/20			V1.7		 Erie		Increase the frequency division mode, pulse clock (a high level is given after the end of a set clock cycle); square wave clock, half-cycle duty cycle (rounded down).
// 2021/05/24			V1.8		 Erie		Add the clock falling edge detection option. The falling edge will cause timing problems. For situations where the timing requirements are not high, you can turn it on.
// 2021/08/24			V2.0		 Erie		Rename module to Clock_Interface.
// 2021/08/25			V2.1		 Erie		Increase the fractional frequency division function, and separate the odd/even/integer frequency divisions, and you can freely switch to select the 4-clock mode.
// 2021/10/11			V2.2		 Erie		Increase the key position mark output of the clock signal: low level start/low level center/high level start/high level center. Among them, fractional frequency does not support this function. 
// 2021/10/15			V2.3		 Erie		Fix the situation where the input frequency division parameter is always 1 during the merging process of odd and even frequency divisions.
///////////////////////////////////Chinese////////////////////////////////////////
// 版权归属:		东南大学显示中心301实验室
// 开发人员:		Erie
// 
// 创建日期: 		2019年09月24日
// 设计名称: 		Clock Division
// 模块名称: 		Clock_Interface
// 相关名称: 		None
// 
// 依赖资料: 		None
//
// 依赖模块:
// 	  模块名称						 版本
//      None					 	 None
//
// 当前版本:		V2.3
// 修订日期:		2021年10月15日
// 修订历史:		
//		时间			版本		修订人				修订内容		
// 2019年09月24日		V1.0		 Erie		创建文件,编写时钟分频模块(clk_division)
// 2019年09月27日		V1.1		 Erie		增加奇数分频功能
// 2019年09月30日		V1.2		 Erie		增加偶数分频功能
// 2019年10月02日		V1.3		 Erie		整合成整数分频
// 2020年07月21日		V1.4		 Erie		优化时序
// 2020年07月30日		V1.5		 Erie		增加频率设置功能
// 2020年08月04日		V1.6		 Erie		修复分频系数转变导致的时钟长时间拉高问题
// 2021年05月20日		V1.7		 Erie		增加分频模式选择,脉冲时钟(一个设置时钟周期结束后给一个高电平);方波时钟,半周期占空比(向下取整)
// 2021年05月24日		V1.8		 Erie		增加时钟下降沿检测选项,下降沿会导致时序问题,对于时序要求不高的情况,可以开启
// 2021年08月24日		V2.0		 Erie		更名为时钟分频接口(Clock_Interface)
// 2021年08月25日		V2.1		 Erie		增加小数分频功能,并将奇数/偶数/整数分频分开,可自由切换选择4种模式
// 2021年10月11日		V2.2		 Erie		增加时钟信号的关键位置标志输出:低电平起始/低电平中心/高电平起始/高电平中心;其中,小数分频不支持该功能
// 2021年10月15日		V2.3		 Erie		修复奇数偶数分频在合并过程中,输入分频参数始终为1的情况
/////////////////////////////////////////////////////////////////////////////////

//时钟分频接口
module Clock_Interface
#(
	parameter FACTOR_BIT = 5'd31,
	parameter CLOCK_MODE = 1'b0,		//时钟分频模式,0为脉冲时钟;1为方波时钟
	parameter NEGEDGE_ENABLE = 1'b0,	//主时钟下降沿反转检测使能,0为不开启检测(奇数分频方波时钟会存在一个主时钟偏差);1为开启检测(50%占空比方波时钟)
	parameter DIVIDER_MODE = 4'b0001	//分频模式,4'bxxx1代表整数分频;4'bxx10代表偶数分频;4'bx100代表奇数分频;4'b1000代表小数分频
)
(
	input i_clk,
	input i_rstn,
	
	//------------时钟输出通道----------//
	output o_clk_out,							//正常时钟输出
	output o_clk_ls,							//正常时钟的低电平起始位置,一个基准clock脉冲
	output o_clk_lc,							//正常时钟的低电平中心位置,一个基准clock脉冲
	output o_clk_hs,							//正常时钟的高电平起始位置,一个基准clock脉冲
	output o_clk_hc,							//正常时钟的高电平中心位置,一个基准clock脉冲
	
	//------------分频参数通道----------//
	input [FACTOR_BIT - 1:0]i_clk_dividend,		//整数/奇数/偶数分频模式下作为分频系数;小数分频模式下作为被除数
	input [FACTOR_BIT - 1:0]i_clk_divisor,		//整数/奇数/偶数分频模式下不使用;小数分频模式下作为除数
	input [FACTOR_BIT - 1:0]i_clk_quotient,		//整数/奇数/偶数分频模式下不使用;小数分频模式下作为商
	input [FACTOR_BIT - 1:0]i_clk_remainder		//整数/奇数/偶数分频模式下不使用;小数分频模式下作为余数
);
	
	//时钟信号
	wire clk_out_even;			//小数分频中,偶数分频时钟
	wire clk_out_odd;			//小数分频中,奇数分频时钟
	
	//计数
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//复位信号
	reg resetn_even = 0;		//小数分频中,偶数部分复位
	reg resetn_odd = 0;			//小数分频中,奇数部分复位
	
	//分频参数
	reg [FACTOR_BIT - 1:0]factor_odd = 0;
	reg [FACTOR_BIT - 1:0]factor_even = 0;
	reg [FACTOR_BIT - 1:0]factor_odd_num = 0;
	reg [FACTOR_BIT - 1:0]factor_even_num = 0;
	reg [FACTOR_BIT * 2 - 1:0]factor_cal_num = 0;
	
	//输入缓存信号
	reg [FACTOR_BIT - 1:0]clk_dividend_i = {FACTOR_BIT{1'b0}} + 1;
	
	//输出信号
	reg clk_out_o = 0;
	
	//时钟信号输出
	always@(*) begin
		if(clk_cnt <= factor_cal_num)clk_out_o <= clk_out_odd;
		else clk_out_o <= clk_out_even;
	end
	
	//偶数复位
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)resetn_even <= 1'b0;
		else if(clk_cnt == factor_cal_num - 1)resetn_even <= 1'b1;
		else if(clk_cnt == clk_dividend_i - 1)resetn_even <= 1'b0;
		else resetn_even <= resetn_even;
	end
	
	//奇数复位
	always@(negedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)resetn_odd <= 1'b0;
		else if(clk_cnt == factor_cal_num - 1)resetn_odd <= 1'b0;
		else if(clk_cnt == clk_dividend_i)resetn_odd <= 1'b1;
		else resetn_odd <= resetn_odd;
	end
	
	//分频计数
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_cnt <= {FACTOR_BIT{1'b0}};
		else if(clk_cnt == clk_dividend_i)clk_cnt <= {FACTOR_BIT{1'b0}} + 1;
		else clk_cnt <= clk_cnt + 1;
	end
	
	//如果是整数分频
	generate if(DIVIDER_MODE[0] == 1'b1)begin : gen_clock_divider_integer
		//整数分频模块实例化
		Clock_Divider_Integer #(.FACTOR_BIT(FACTOR_BIT),.CLOCK_MODE(CLOCK_MODE),
								.NEGEDGE_ENABLE(NEGEDGE_ENABLE))Clock_Divider_Integer_Inst(
			.i_clk(i_clk),
			.i_rstn(i_rstn),
			.i_clk_mode(i_clk_dividend),		//分频系数
			
			//------------时钟输出通道----------//
			.o_clk_out(o_clk_out),				//正常时钟输出
			.o_clk_ls(o_clk_ls),				//正常时钟的低电平起始位置,一个基准clock脉冲
			.o_clk_lc(o_clk_lc),				//正常时钟的低电平中心位置,一个基准clock脉冲
			.o_clk_hs(o_clk_hs),				//正常时钟的高电平起始位置,一个基准clock脉冲
			.o_clk_hc(o_clk_hc)					//正常时钟的高电平中心位置,一个基准clock脉冲
		);
		
		assign clk_out_odd = 1'b0;
		assign clk_out_even = 1'b0;
	end else if(DIVIDER_MODE[1] == 1'b1)begin : gen_clock_divider_even
		//偶数分频模块实例化
		Clock_Divider_Even #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Even_Inst(
			.i_clk(i_clk),
			.i_rstn(i_rstn),
			.i_clk_mode(clk_dividend_i),		//分频系数
			
			//------------时钟输出通道----------//
			.o_clk_out(o_clk_out),				//正常时钟输出
			.o_clk_ls(o_clk_ls),				//正常时钟的低电平起始位置,一个基准clock脉冲
			.o_clk_lc(o_clk_lc),				//正常时钟的低电平中心位置,一个基准clock脉冲
			.o_clk_hs(o_clk_hs),				//正常时钟的高电平起始位置,一个基准clock脉冲
			.o_clk_hc(o_clk_hc)					//正常时钟的高电平中心位置,一个基准clock脉冲
		);
		
		assign clk_out_odd = 1'b0;
		assign clk_out_even = 1'b0;
	end else if(DIVIDER_MODE[2] == 1'b1)begin : gen_clock_divider_odd
		//奇数分频模块实例化
		Clock_Divider_Odd #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Odd_Inst(
			.i_clk(i_clk),
			.i_rstn(i_rstn),
			.i_clk_mode(clk_dividend_i),		//分频系数
			
			//------------时钟输出通道----------//
			.o_clk_out(o_clk_out),				//正常时钟输出
			.o_clk_ls(o_clk_ls),				//正常时钟的低电平起始位置,一个基准clock脉冲
			.o_clk_lc(o_clk_lc),				//正常时钟的低电平中心位置,一个基准clock脉冲
			.o_clk_hs(o_clk_hs),				//正常时钟的高电平起始位置,一个基准clock脉冲
			.o_clk_hc(o_clk_hc)					//正常时钟的高电平中心位置,一个基准clock脉冲
		);
		
		assign clk_out_odd = 1'b0;
		assign clk_out_even = 1'b0;
	end else if(DIVIDER_MODE[3] == 1'b1)begin : gen_clock_divider_fractional
	
		//偶数分频模块实例化
		Clock_Divider_Even #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Even_Inst(
			.i_clk(i_clk),
			.i_rstn(resetn_even),
			.i_clk_mode(factor_even),			//分频系数
			
			//------------时钟输出通道----------//
			.o_clk_out(clk_out_even),			//正常时钟输出
			.o_clk_ls(),						//正常时钟的低电平起始位置,一个基准clock脉冲
			.o_clk_lc(),						//正常时钟的低电平中心位置,一个基准clock脉冲
			.o_clk_hs(),						//正常时钟的高电平起始位置,一个基准clock脉冲
			.o_clk_hc()							//正常时钟的高电平中心位置,一个基准clock脉冲
		);
		
		//奇数分频模块实例化
		Clock_Divider_Odd #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Odd_Inst(
			.i_clk(i_clk),
			.i_rstn(resetn_odd),
			.i_clk_mode(factor_odd),			//分频系数
			
			//------------时钟输出通道----------//
			.o_clk_out(clk_out_odd),			//正常时钟输出
			.o_clk_ls(),						//正常时钟的低电平起始位置,一个基准clock脉冲
			.o_clk_lc(),						//正常时钟的低电平中心位置,一个基准clock脉冲
			.o_clk_hs(),						//正常时钟的高电平起始位置,一个基准clock脉冲
			.o_clk_hc()							//正常时钟的高电平中心位置,一个基准clock脉冲
		);
		
		assign o_clk_out = clk_out_o;
		assign o_clk_ls = 1'b0;
		assign o_clk_lc = 1'b0;
		assign o_clk_hs = 1'b0;
		assign o_clk_hc = 1'b0;
		
	end else begin
		assign clk_out_odd = 1'b0;
		assign clk_out_even = 1'b0;
		
		assign o_clk_out = 1'b0;
		assign o_clk_ls = 1'b0;
		assign o_clk_lc = 1'b0;
		assign o_clk_hs = 1'b0;
		assign o_clk_hc = 1'b0;
	end endgenerate
	
	//奇偶数部分计算缓存
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			factor_odd <= {FACTOR_BIT{1'b0}};
			factor_even <= {FACTOR_BIT{1'b0}};
			factor_odd_num <= {FACTOR_BIT{1'b0}};
			factor_even_num <= {FACTOR_BIT{1'b0}};
			factor_cal_num <= {FACTOR_BIT{2'b00}} + 1;
		end else if(i_clk_quotient[0] == 1'b1)begin
			factor_odd <= i_clk_quotient;
			factor_odd_num <= i_clk_divisor - i_clk_remainder;
			factor_even <= i_clk_quotient + 1;
			factor_even_num <= i_clk_remainder;
			factor_cal_num <= i_clk_quotient * (i_clk_divisor - i_clk_remainder);
		end else begin
			factor_odd <= i_clk_quotient + 1;
			factor_odd_num <= i_clk_remainder;
			factor_even <= i_clk_quotient;
			factor_even_num <= i_clk_divisor - i_clk_remainder;
			factor_cal_num <= i_clk_remainder * (i_clk_quotient + 1);
		end
	end
	
    //输入信号缓存
    always@(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)begin
            clk_dividend_i <= {FACTOR_BIT{1'b0}} + 1;
        end else if(clk_cnt == 0 && i_clk_dividend != 0)begin
            clk_dividend_i <= i_clk_dividend;
        end else begin
            clk_dividend_i <= clk_dividend_i;
        end
    end
	
endmodule

//整数分频模块
module Clock_Divider_Integer
#(
	parameter FACTOR_BIT = 5'd31,
	parameter CLOCK_MODE = 1'b0,		//时钟分频模式,0为脉冲时钟;1为方波时钟
	parameter NEGEDGE_ENABLE = 1'b0		//主时钟下降沿反转检测使能,0为不开启检测(奇数分频方波时钟会存在一个主时钟偏差);1为开启检测(50%占空比方波时钟)
)
(
    input i_clk,
    input i_rstn,
    input [FACTOR_BIT - 1:0]i_clk_mode,			//分频系数
	
    //------------时钟输出通道----------//
	output o_clk_out,							//正常时钟输出
	output o_clk_ls,							//正常时钟的低电平起始位置,一个基准clock脉冲
	output o_clk_lc,							//正常时钟的低电平中心位置,一个基准clock脉冲
	output o_clk_hs,							//正常时钟的高电平起始位置,一个基准clock脉冲
	output o_clk_hc								//正常时钟的高电平中心位置,一个基准clock脉冲
);
    
	//时钟
	reg clk_square = 0;				//方波时钟
	reg clk_pulse = 0;				//脉冲时钟
	
	//计数
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//标志
	reg [1:0]flg_half_buff = 0;			//延迟缓存,方波半周期翻转标志
	reg flg_start = 0;					//第一次,防止复位重启问题
	
	//频率寄存器
	reg [FACTOR_BIT - 1:0]freq_register = 0;
	
	//输出信号
	reg clk_out_o = 0;
	reg clk_ls_o = 0;
	reg clk_lc_o = 0;
	reg clk_hs_o = 0;
	reg clk_hc_o = 0;
	
	//输出时钟连线
    assign o_clk_out = clk_out_o | flg_half_buff[1];
	assign o_clk_ls = clk_ls_o;
	assign o_clk_lc = clk_lc_o;
	assign o_clk_hs = clk_hs_o;
	assign o_clk_hc = clk_hc_o;
	
	//------------------------------时钟信号输出---------------------------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_out_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0)clk_out_o <= clk_pulse;
		else clk_out_o <= clk_square;
	end
	
	//----------------------------时钟标志位置输出-------------------------------//
	//低电平起始位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_ls_o <= 1'b0;
		else if(flg_start == 1'b0)clk_ls_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == 0)clk_ls_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == 0 && clk_square == 1'b0)clk_ls_o <= 1'b1;
		else clk_ls_o <= 1'b0;
	end
	
	//低电平中心位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_lc_o <= 1'b0;
		else if(flg_start == 1'b0)clk_lc_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:2])clk_lc_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == freq_register[FACTOR_BIT - 1:2] && clk_square == 1'b0)clk_lc_o <= 1'b1;
		else clk_lc_o <= 1'b0;
	end
	
	//高电平起始位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hs_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:1])clk_hs_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == 0 && clk_square == 1'b1)clk_hs_o <= 1'b1;
		else clk_hs_o <= 1'b0;
	end
	
	//高电平中心位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hc_o <= 1'b0;
		else if(flg_start == 1'b0)clk_hc_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:1] + freq_register[FACTOR_BIT - 1:2])clk_hc_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == freq_register[FACTOR_BIT - 1:2] && clk_square == 1'b1)clk_hc_o <= 1'b1;
		else clk_hc_o <= 1'b0;
	end
	
	//-----------------------------时钟计数等操作-------------------------------//
    //设置频率寄存器
    always@(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)begin
            freq_register <= {FACTOR_BIT{1'b0}} + 1;
        end else if(clk_cnt == 0)begin
            freq_register <= i_clk_mode;
        end else begin
            freq_register <= freq_register;
        end
    end
	
    //半周期反转标志
    always@(negedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)flg_half_buff <= 2'd0;
		else if(NEGEDGE_ENABLE == 1'b0)flg_half_buff <= 2'd0;
        else if(clk_cnt == freq_register[FACTOR_BIT - 1:1] && freq_register[0] == 1'b1)flg_half_buff <= {flg_half_buff[0],1'b1};
        else flg_half_buff <= {flg_half_buff[0],1'b0};
    end
	
	//复位标志
	always@(negedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)flg_start <= 1'b0;
		else if(flg_start == 1'b1)flg_start <= 1'b1;
		else if(clk_cnt == {FACTOR_BIT{1'b0}})flg_start <= 1'b0;
		else flg_start <= 1'b1;
    end
	
    //分频计数
    always @(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)clk_cnt <= {FACTOR_BIT{1'b0}};
		else if(CLOCK_MODE == 1'b0 && clk_cnt == freq_register - 1)clk_cnt <= {FACTOR_BIT{1'b0}};
		else if(CLOCK_MODE == 1'b0)clk_cnt <= clk_cnt + 1;
        else if(freq_register[0] == 1'b1 && clk_cnt == freq_register - 1)clk_cnt <= {FACTOR_BIT{1'b0}};
        else if(freq_register[0] == 1'b1 && clk_cnt == freq_register[FACTOR_BIT - 1:1])clk_cnt <= clk_cnt + 1;
        else if(freq_register[0] == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:1] - 1)clk_cnt <= {FACTOR_BIT{1'b0}};
		else if(clk_cnt >= freq_register)clk_cnt <= {FACTOR_BIT{1'b0}};
		else clk_cnt <= clk_cnt + 1;
    end
	
    //方波时钟
    always @(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)clk_square <= 1'b0;
        else if(freq_register[0] == 1'b1 && clk_cnt == freq_register - 1)clk_square <= ~clk_square;
        else if(freq_register[0] == 1'b1 && clk_cnt == freq_register[FACTOR_BIT - 1:1])clk_square <= ~clk_square;
        else if(freq_register[0] == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:1] - 1)clk_square <= ~clk_square;
        else clk_square <= clk_square;
    end
    
    //脉冲时钟
	always @(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_pulse <= 1'b0;
		else if(clk_cnt == 0)clk_pulse <= 1'b0;
		else if(clk_cnt == freq_register[FACTOR_BIT - 1:1])clk_pulse <= 1'b1;
		else clk_pulse <= 1'b0;
	end
	
endmodule

//偶数分频模块
module Clock_Divider_Even
#(
	parameter FACTOR_BIT = 5'd31
)
(					
	input i_clk,
	input i_rstn,
	input [FACTOR_BIT - 1:0]i_clk_mode,			//分频系数
	
	//------------时钟输出通道----------//
	output o_clk_out,							//正常时钟输出
	output o_clk_ls,							//正常时钟的低电平起始位置,一个基准clock脉冲
	output o_clk_lc,							//正常时钟的低电平中心位置,一个基准clock脉冲
	output o_clk_hs,							//正常时钟的高电平起始位置,一个基准clock脉冲
	output o_clk_hc								//正常时钟的高电平中心位置,一个基准clock脉冲
);
	//计数
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//输出信号
	reg clk_out_o = 0;
	reg clk_ls_o = 0;
	reg clk_lc_o = 0;
	reg clk_hs_o = 0;
	reg clk_hc_o = 0;
	
	//输出时钟连线
	assign o_clk_out = clk_out_o;
	assign o_clk_ls = clk_ls_o;
	assign o_clk_lc = clk_lc_o;
	assign o_clk_hs = clk_hs_o;
	assign o_clk_hc = clk_hc_o;
	
	//----------------------------时钟标志位置输出-------------------------------//
	//低电平起始位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_ls_o <= 1'b0;
		else if(clk_cnt == 1)clk_ls_o <= 1'b1;
		else clk_ls_o <= 1'b0;
	end
	
	//低电平中心位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_lc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_lc_o <= 1'b1;
		else clk_lc_o <= 1'b0;
	end
	
	//高电平起始位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hs_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + 1)clk_hs_o <= 1'b1;
		else clk_hs_o <= 1'b0;
	end
	
	//高电平中心位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_hc_o <= 1'b1;
		else clk_hc_o <= 1'b0;
	end
	
	//-----------------------------时钟计数等操作-------------------------------//
	//方波时钟
	always@(posedge i_clk or negedge i_rstn) begin
		if(i_rstn == 1'b0)clk_out_o <= 1'b0;
		else if(clk_cnt == 0)clk_out_o <= ~clk_out_o;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])clk_out_o <= ~clk_out_o;
		else clk_out_o <= clk_out_o;
	end
	
	//分频计数
	always@(posedge i_clk or negedge i_rstn) begin
		if(i_rstn == 1'b0)clk_cnt <= {FACTOR_BIT{1'b0}};
		else if(clk_cnt == i_clk_mode - 1)clk_cnt <= {FACTOR_BIT{1'b0}};
		else clk_cnt <= clk_cnt + 1;
	end
	
endmodule

//奇数分频模块
module Clock_Divider_Odd
#(
	parameter FACTOR_BIT = 5'd31
)
(					
	input i_clk,
	input i_rstn,
	input [FACTOR_BIT - 1:0]i_clk_mode,			//分频系数
	
	//------------时钟输出通道----------//
	output o_clk_out,							//正常时钟输出
	output o_clk_ls,							//正常时钟的低电平起始位置,一个基准clock脉冲
	output o_clk_lc,							//正常时钟的低电平中心位置,一个基准clock脉冲
	output o_clk_hs,							//正常时钟的高电平起始位置,一个基准clock脉冲
	output o_clk_hc								//正常时钟的高电平中心位置,一个基准clock脉冲
);
	
	//计数
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//标志
	reg flg_half = 0;				//方波半周期翻转标志
	
	//输出信号
	reg clk_out_o = 0;
	reg clk_ls_o = 0;
	reg clk_lc_o = 0;
	reg clk_hs_o = 0;
	reg clk_hc_o = 0;
	
	//输出时钟连线
	assign o_clk_out = clk_out_o | flg_half;
	assign o_clk_ls = clk_ls_o;
	assign o_clk_lc = clk_lc_o;
	assign o_clk_hs = clk_hs_o;
	assign o_clk_hc = clk_hc_o;
	
	//----------------------------时钟标志位置输出-------------------------------//
	//低电平起始位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_ls_o <= 1'b0;
		else if(clk_cnt == 1)clk_ls_o <= 1'b1;
		else clk_ls_o <= 1'b0;
	end
	
	//低电平中心位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_lc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_lc_o <= 1'b1;
		else clk_lc_o <= 1'b0;
	end
	
	//高电平起始位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hs_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + 1)clk_hs_o <= 1'b1;
		else clk_hs_o <= 1'b0;
	end
	
	//高电平中心位置
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_hc_o <= 1'b1;
		else clk_hc_o <= 1'b0;
	end
	
	//-----------------------------时钟计数等操作-------------------------------//
	//方波时钟
    always @(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)clk_out_o <= 1'b0;
        else if(clk_cnt == i_clk_mode - 1)clk_out_o <= ~clk_out_o;
        else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])clk_out_o <= ~clk_out_o;
        else clk_out_o <= clk_out_o;
    end
	
	//半周期反转标志
	always@(negedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)flg_half <= 1'b0;
        else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])flg_half <= 1'b1;
        else flg_half <= 1'b0;
    end
	
	//分频计数
	always @(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)clk_cnt <= {FACTOR_BIT{1'b0}};
        else if(clk_cnt == i_clk_mode - 1)clk_cnt <= {FACTOR_BIT{1'b0}};
        else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])clk_cnt <= clk_cnt + 1;
		else clk_cnt <= clk_cnt + 1;
    end
	
endmodule
