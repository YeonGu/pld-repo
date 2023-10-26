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
// ��Ȩ����:		���ϴ�ѧ��ʾ����301ʵ����
// ������Ա:		Erie
// 
// ��������: 		2019��09��24��
// �������: 		Clock Division
// ģ������: 		Clock_Interface
// �������: 		None
// 
// ��������: 		None
//
// ����ģ��:
// 	  ģ������						 �汾
//      None					 	 None
//
// ��ǰ�汾:		V2.3
// �޶�����:		2021��10��15��
// �޶���ʷ:		
//		ʱ��			�汾		�޶���				�޶�����		
// 2019��09��24��		V1.0		 Erie		�����ļ�,��дʱ�ӷ�Ƶģ��(clk_division)
// 2019��09��27��		V1.1		 Erie		����������Ƶ����
// 2019��09��30��		V1.2		 Erie		����ż����Ƶ����
// 2019��10��02��		V1.3		 Erie		���ϳ�������Ƶ
// 2020��07��21��		V1.4		 Erie		�Ż�ʱ��
// 2020��07��30��		V1.5		 Erie		����Ƶ�����ù���
// 2020��08��04��		V1.6		 Erie		�޸���Ƶϵ��ת�䵼�µ�ʱ�ӳ�ʱ����������
// 2021��05��20��		V1.7		 Erie		���ӷ�Ƶģʽѡ��,����ʱ��(һ������ʱ�����ڽ������һ���ߵ�ƽ);����ʱ��,������ռ�ձ�(����ȡ��)
// 2021��05��24��		V1.8		 Erie		����ʱ���½��ؼ��ѡ��,�½��ػᵼ��ʱ������,����ʱ��Ҫ�󲻸ߵ����,���Կ���
// 2021��08��24��		V2.0		 Erie		����Ϊʱ�ӷ�Ƶ�ӿ�(Clock_Interface)
// 2021��08��25��		V2.1		 Erie		����С����Ƶ����,��������/ż��/������Ƶ�ֿ�,�������л�ѡ��4��ģʽ
// 2021��10��11��		V2.2		 Erie		����ʱ���źŵĹؼ�λ�ñ�־���:�͵�ƽ��ʼ/�͵�ƽ����/�ߵ�ƽ��ʼ/�ߵ�ƽ����;����,С����Ƶ��֧�ָù���
// 2021��10��15��		V2.3		 Erie		�޸�����ż����Ƶ�ںϲ�������,�����Ƶ����ʼ��Ϊ1�����
/////////////////////////////////////////////////////////////////////////////////

//ʱ�ӷ�Ƶ�ӿ�
module Clock_Interface
#(
	parameter FACTOR_BIT = 5'd31,
	parameter CLOCK_MODE = 1'b0,		//ʱ�ӷ�Ƶģʽ,0Ϊ����ʱ��;1Ϊ����ʱ��
	parameter NEGEDGE_ENABLE = 1'b0,	//��ʱ���½��ط�ת���ʹ��,0Ϊ���������(������Ƶ����ʱ�ӻ����һ����ʱ��ƫ��);1Ϊ�������(50%ռ�ձȷ���ʱ��)
	parameter DIVIDER_MODE = 4'b0001	//��Ƶģʽ,4'bxxx1����������Ƶ;4'bxx10����ż����Ƶ;4'bx100����������Ƶ;4'b1000����С����Ƶ
)
(
	input i_clk,
	input i_rstn,
	
	//------------ʱ�����ͨ��----------//
	output o_clk_out,							//����ʱ�����
	output o_clk_ls,							//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
	output o_clk_lc,							//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
	output o_clk_hs,							//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
	output o_clk_hc,							//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
	
	//------------��Ƶ����ͨ��----------//
	input [FACTOR_BIT - 1:0]i_clk_dividend,		//����/����/ż����Ƶģʽ����Ϊ��Ƶϵ��;С����Ƶģʽ����Ϊ������
	input [FACTOR_BIT - 1:0]i_clk_divisor,		//����/����/ż����Ƶģʽ�²�ʹ��;С����Ƶģʽ����Ϊ����
	input [FACTOR_BIT - 1:0]i_clk_quotient,		//����/����/ż����Ƶģʽ�²�ʹ��;С����Ƶģʽ����Ϊ��
	input [FACTOR_BIT - 1:0]i_clk_remainder		//����/����/ż����Ƶģʽ�²�ʹ��;С����Ƶģʽ����Ϊ����
);
	
	//ʱ���ź�
	wire clk_out_even;			//С����Ƶ��,ż����Ƶʱ��
	wire clk_out_odd;			//С����Ƶ��,������Ƶʱ��
	
	//����
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//��λ�ź�
	reg resetn_even = 0;		//С����Ƶ��,ż�����ָ�λ
	reg resetn_odd = 0;			//С����Ƶ��,�������ָ�λ
	
	//��Ƶ����
	reg [FACTOR_BIT - 1:0]factor_odd = 0;
	reg [FACTOR_BIT - 1:0]factor_even = 0;
	reg [FACTOR_BIT - 1:0]factor_odd_num = 0;
	reg [FACTOR_BIT - 1:0]factor_even_num = 0;
	reg [FACTOR_BIT * 2 - 1:0]factor_cal_num = 0;
	
	//���뻺���ź�
	reg [FACTOR_BIT - 1:0]clk_dividend_i = {FACTOR_BIT{1'b0}} + 1;
	
	//����ź�
	reg clk_out_o = 0;
	
	//ʱ���ź����
	always@(*) begin
		if(clk_cnt <= factor_cal_num)clk_out_o <= clk_out_odd;
		else clk_out_o <= clk_out_even;
	end
	
	//ż����λ
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)resetn_even <= 1'b0;
		else if(clk_cnt == factor_cal_num - 1)resetn_even <= 1'b1;
		else if(clk_cnt == clk_dividend_i - 1)resetn_even <= 1'b0;
		else resetn_even <= resetn_even;
	end
	
	//������λ
	always@(negedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)resetn_odd <= 1'b0;
		else if(clk_cnt == factor_cal_num - 1)resetn_odd <= 1'b0;
		else if(clk_cnt == clk_dividend_i)resetn_odd <= 1'b1;
		else resetn_odd <= resetn_odd;
	end
	
	//��Ƶ����
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_cnt <= {FACTOR_BIT{1'b0}};
		else if(clk_cnt == clk_dividend_i)clk_cnt <= {FACTOR_BIT{1'b0}} + 1;
		else clk_cnt <= clk_cnt + 1;
	end
	
	//�����������Ƶ
	generate if(DIVIDER_MODE[0] == 1'b1)begin : gen_clock_divider_integer
		//������Ƶģ��ʵ����
		Clock_Divider_Integer #(.FACTOR_BIT(FACTOR_BIT),.CLOCK_MODE(CLOCK_MODE),
								.NEGEDGE_ENABLE(NEGEDGE_ENABLE))Clock_Divider_Integer_Inst(
			.i_clk(i_clk),
			.i_rstn(i_rstn),
			.i_clk_mode(i_clk_dividend),		//��Ƶϵ��
			
			//------------ʱ�����ͨ��----------//
			.o_clk_out(o_clk_out),				//����ʱ�����
			.o_clk_ls(o_clk_ls),				//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
			.o_clk_lc(o_clk_lc),				//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
			.o_clk_hs(o_clk_hs),				//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
			.o_clk_hc(o_clk_hc)					//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
		);
		
		assign clk_out_odd = 1'b0;
		assign clk_out_even = 1'b0;
	end else if(DIVIDER_MODE[1] == 1'b1)begin : gen_clock_divider_even
		//ż����Ƶģ��ʵ����
		Clock_Divider_Even #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Even_Inst(
			.i_clk(i_clk),
			.i_rstn(i_rstn),
			.i_clk_mode(clk_dividend_i),		//��Ƶϵ��
			
			//------------ʱ�����ͨ��----------//
			.o_clk_out(o_clk_out),				//����ʱ�����
			.o_clk_ls(o_clk_ls),				//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
			.o_clk_lc(o_clk_lc),				//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
			.o_clk_hs(o_clk_hs),				//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
			.o_clk_hc(o_clk_hc)					//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
		);
		
		assign clk_out_odd = 1'b0;
		assign clk_out_even = 1'b0;
	end else if(DIVIDER_MODE[2] == 1'b1)begin : gen_clock_divider_odd
		//������Ƶģ��ʵ����
		Clock_Divider_Odd #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Odd_Inst(
			.i_clk(i_clk),
			.i_rstn(i_rstn),
			.i_clk_mode(clk_dividend_i),		//��Ƶϵ��
			
			//------------ʱ�����ͨ��----------//
			.o_clk_out(o_clk_out),				//����ʱ�����
			.o_clk_ls(o_clk_ls),				//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
			.o_clk_lc(o_clk_lc),				//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
			.o_clk_hs(o_clk_hs),				//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
			.o_clk_hc(o_clk_hc)					//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
		);
		
		assign clk_out_odd = 1'b0;
		assign clk_out_even = 1'b0;
	end else if(DIVIDER_MODE[3] == 1'b1)begin : gen_clock_divider_fractional
	
		//ż����Ƶģ��ʵ����
		Clock_Divider_Even #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Even_Inst(
			.i_clk(i_clk),
			.i_rstn(resetn_even),
			.i_clk_mode(factor_even),			//��Ƶϵ��
			
			//------------ʱ�����ͨ��----------//
			.o_clk_out(clk_out_even),			//����ʱ�����
			.o_clk_ls(),						//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
			.o_clk_lc(),						//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
			.o_clk_hs(),						//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
			.o_clk_hc()							//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
		);
		
		//������Ƶģ��ʵ����
		Clock_Divider_Odd #(.FACTOR_BIT(FACTOR_BIT))Clock_Divider_Odd_Inst(
			.i_clk(i_clk),
			.i_rstn(resetn_odd),
			.i_clk_mode(factor_odd),			//��Ƶϵ��
			
			//------------ʱ�����ͨ��----------//
			.o_clk_out(clk_out_odd),			//����ʱ�����
			.o_clk_ls(),						//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
			.o_clk_lc(),						//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
			.o_clk_hs(),						//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
			.o_clk_hc()							//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
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
	
	//��ż�����ּ��㻺��
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
	
    //�����źŻ���
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

//������Ƶģ��
module Clock_Divider_Integer
#(
	parameter FACTOR_BIT = 5'd31,
	parameter CLOCK_MODE = 1'b0,		//ʱ�ӷ�Ƶģʽ,0Ϊ����ʱ��;1Ϊ����ʱ��
	parameter NEGEDGE_ENABLE = 1'b0		//��ʱ���½��ط�ת���ʹ��,0Ϊ���������(������Ƶ����ʱ�ӻ����һ����ʱ��ƫ��);1Ϊ�������(50%ռ�ձȷ���ʱ��)
)
(
    input i_clk,
    input i_rstn,
    input [FACTOR_BIT - 1:0]i_clk_mode,			//��Ƶϵ��
	
    //------------ʱ�����ͨ��----------//
	output o_clk_out,							//����ʱ�����
	output o_clk_ls,							//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
	output o_clk_lc,							//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
	output o_clk_hs,							//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
	output o_clk_hc								//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
);
    
	//ʱ��
	reg clk_square = 0;				//����ʱ��
	reg clk_pulse = 0;				//����ʱ��
	
	//����
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//��־
	reg [1:0]flg_half_buff = 0;			//�ӳٻ���,���������ڷ�ת��־
	reg flg_start = 0;					//��һ��,��ֹ��λ��������
	
	//Ƶ�ʼĴ���
	reg [FACTOR_BIT - 1:0]freq_register = 0;
	
	//����ź�
	reg clk_out_o = 0;
	reg clk_ls_o = 0;
	reg clk_lc_o = 0;
	reg clk_hs_o = 0;
	reg clk_hc_o = 0;
	
	//���ʱ������
    assign o_clk_out = clk_out_o | flg_half_buff[1];
	assign o_clk_ls = clk_ls_o;
	assign o_clk_lc = clk_lc_o;
	assign o_clk_hs = clk_hs_o;
	assign o_clk_hc = clk_hc_o;
	
	//------------------------------ʱ���ź����---------------------------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_out_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0)clk_out_o <= clk_pulse;
		else clk_out_o <= clk_square;
	end
	
	//----------------------------ʱ�ӱ�־λ�����-------------------------------//
	//�͵�ƽ��ʼλ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_ls_o <= 1'b0;
		else if(flg_start == 1'b0)clk_ls_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == 0)clk_ls_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == 0 && clk_square == 1'b0)clk_ls_o <= 1'b1;
		else clk_ls_o <= 1'b0;
	end
	
	//�͵�ƽ����λ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_lc_o <= 1'b0;
		else if(flg_start == 1'b0)clk_lc_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:2])clk_lc_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == freq_register[FACTOR_BIT - 1:2] && clk_square == 1'b0)clk_lc_o <= 1'b1;
		else clk_lc_o <= 1'b0;
	end
	
	//�ߵ�ƽ��ʼλ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hs_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:1])clk_hs_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == 0 && clk_square == 1'b1)clk_hs_o <= 1'b1;
		else clk_hs_o <= 1'b0;
	end
	
	//�ߵ�ƽ����λ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hc_o <= 1'b0;
		else if(flg_start == 1'b0)clk_hc_o <= 1'b0;
		else if(CLOCK_MODE == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:1] + freq_register[FACTOR_BIT - 1:2])clk_hc_o <= 1'b1;
		else if(CLOCK_MODE == 1'b1 && clk_cnt == freq_register[FACTOR_BIT - 1:2] && clk_square == 1'b1)clk_hc_o <= 1'b1;
		else clk_hc_o <= 1'b0;
	end
	
	//-----------------------------ʱ�Ӽ����Ȳ���-------------------------------//
    //����Ƶ�ʼĴ���
    always@(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)begin
            freq_register <= {FACTOR_BIT{1'b0}} + 1;
        end else if(clk_cnt == 0)begin
            freq_register <= i_clk_mode;
        end else begin
            freq_register <= freq_register;
        end
    end
	
    //�����ڷ�ת��־
    always@(negedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)flg_half_buff <= 2'd0;
		else if(NEGEDGE_ENABLE == 1'b0)flg_half_buff <= 2'd0;
        else if(clk_cnt == freq_register[FACTOR_BIT - 1:1] && freq_register[0] == 1'b1)flg_half_buff <= {flg_half_buff[0],1'b1};
        else flg_half_buff <= {flg_half_buff[0],1'b0};
    end
	
	//��λ��־
	always@(negedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)flg_start <= 1'b0;
		else if(flg_start == 1'b1)flg_start <= 1'b1;
		else if(clk_cnt == {FACTOR_BIT{1'b0}})flg_start <= 1'b0;
		else flg_start <= 1'b1;
    end
	
    //��Ƶ����
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
	
    //����ʱ��
    always @(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)clk_square <= 1'b0;
        else if(freq_register[0] == 1'b1 && clk_cnt == freq_register - 1)clk_square <= ~clk_square;
        else if(freq_register[0] == 1'b1 && clk_cnt == freq_register[FACTOR_BIT - 1:1])clk_square <= ~clk_square;
        else if(freq_register[0] == 1'b0 && clk_cnt == freq_register[FACTOR_BIT - 1:1] - 1)clk_square <= ~clk_square;
        else clk_square <= clk_square;
    end
    
    //����ʱ��
	always @(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_pulse <= 1'b0;
		else if(clk_cnt == 0)clk_pulse <= 1'b0;
		else if(clk_cnt == freq_register[FACTOR_BIT - 1:1])clk_pulse <= 1'b1;
		else clk_pulse <= 1'b0;
	end
	
endmodule

//ż����Ƶģ��
module Clock_Divider_Even
#(
	parameter FACTOR_BIT = 5'd31
)
(					
	input i_clk,
	input i_rstn,
	input [FACTOR_BIT - 1:0]i_clk_mode,			//��Ƶϵ��
	
	//------------ʱ�����ͨ��----------//
	output o_clk_out,							//����ʱ�����
	output o_clk_ls,							//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
	output o_clk_lc,							//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
	output o_clk_hs,							//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
	output o_clk_hc								//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
);
	//����
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//����ź�
	reg clk_out_o = 0;
	reg clk_ls_o = 0;
	reg clk_lc_o = 0;
	reg clk_hs_o = 0;
	reg clk_hc_o = 0;
	
	//���ʱ������
	assign o_clk_out = clk_out_o;
	assign o_clk_ls = clk_ls_o;
	assign o_clk_lc = clk_lc_o;
	assign o_clk_hs = clk_hs_o;
	assign o_clk_hc = clk_hc_o;
	
	//----------------------------ʱ�ӱ�־λ�����-------------------------------//
	//�͵�ƽ��ʼλ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_ls_o <= 1'b0;
		else if(clk_cnt == 1)clk_ls_o <= 1'b1;
		else clk_ls_o <= 1'b0;
	end
	
	//�͵�ƽ����λ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_lc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_lc_o <= 1'b1;
		else clk_lc_o <= 1'b0;
	end
	
	//�ߵ�ƽ��ʼλ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hs_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + 1)clk_hs_o <= 1'b1;
		else clk_hs_o <= 1'b0;
	end
	
	//�ߵ�ƽ����λ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_hc_o <= 1'b1;
		else clk_hc_o <= 1'b0;
	end
	
	//-----------------------------ʱ�Ӽ����Ȳ���-------------------------------//
	//����ʱ��
	always@(posedge i_clk or negedge i_rstn) begin
		if(i_rstn == 1'b0)clk_out_o <= 1'b0;
		else if(clk_cnt == 0)clk_out_o <= ~clk_out_o;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])clk_out_o <= ~clk_out_o;
		else clk_out_o <= clk_out_o;
	end
	
	//��Ƶ����
	always@(posedge i_clk or negedge i_rstn) begin
		if(i_rstn == 1'b0)clk_cnt <= {FACTOR_BIT{1'b0}};
		else if(clk_cnt == i_clk_mode - 1)clk_cnt <= {FACTOR_BIT{1'b0}};
		else clk_cnt <= clk_cnt + 1;
	end
	
endmodule

//������Ƶģ��
module Clock_Divider_Odd
#(
	parameter FACTOR_BIT = 5'd31
)
(					
	input i_clk,
	input i_rstn,
	input [FACTOR_BIT - 1:0]i_clk_mode,			//��Ƶϵ��
	
	//------------ʱ�����ͨ��----------//
	output o_clk_out,							//����ʱ�����
	output o_clk_ls,							//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
	output o_clk_lc,							//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
	output o_clk_hs,							//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
	output o_clk_hc								//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
);
	
	//����
	reg [FACTOR_BIT - 1:0]clk_cnt = 0;
	
	//��־
	reg flg_half = 0;				//���������ڷ�ת��־
	
	//����ź�
	reg clk_out_o = 0;
	reg clk_ls_o = 0;
	reg clk_lc_o = 0;
	reg clk_hs_o = 0;
	reg clk_hc_o = 0;
	
	//���ʱ������
	assign o_clk_out = clk_out_o | flg_half;
	assign o_clk_ls = clk_ls_o;
	assign o_clk_lc = clk_lc_o;
	assign o_clk_hs = clk_hs_o;
	assign o_clk_hc = clk_hc_o;
	
	//----------------------------ʱ�ӱ�־λ�����-------------------------------//
	//�͵�ƽ��ʼλ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_ls_o <= 1'b0;
		else if(clk_cnt == 1)clk_ls_o <= 1'b1;
		else clk_ls_o <= 1'b0;
	end
	
	//�͵�ƽ����λ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_lc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_lc_o <= 1'b1;
		else clk_lc_o <= 1'b0;
	end
	
	//�ߵ�ƽ��ʼλ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hs_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + 1)clk_hs_o <= 1'b1;
		else clk_hs_o <= 1'b0;
	end
	
	//�ߵ�ƽ����λ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)clk_hc_o <= 1'b0;
		else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1] + i_clk_mode[FACTOR_BIT - 1:2] + 1)clk_hc_o <= 1'b1;
		else clk_hc_o <= 1'b0;
	end
	
	//-----------------------------ʱ�Ӽ����Ȳ���-------------------------------//
	//����ʱ��
    always @(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)clk_out_o <= 1'b0;
        else if(clk_cnt == i_clk_mode - 1)clk_out_o <= ~clk_out_o;
        else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])clk_out_o <= ~clk_out_o;
        else clk_out_o <= clk_out_o;
    end
	
	//�����ڷ�ת��־
	always@(negedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)flg_half <= 1'b0;
        else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])flg_half <= 1'b1;
        else flg_half <= 1'b0;
    end
	
	//��Ƶ����
	always @(posedge i_clk or negedge i_rstn)begin
        if(i_rstn == 1'b0)clk_cnt <= {FACTOR_BIT{1'b0}};
        else if(clk_cnt == i_clk_mode - 1)clk_cnt <= {FACTOR_BIT{1'b0}};
        else if(clk_cnt == i_clk_mode[FACTOR_BIT - 1:1])clk_cnt <= clk_cnt + 1;
		else clk_cnt <= clk_cnt + 1;
    end
	
endmodule
