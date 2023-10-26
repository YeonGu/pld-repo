`timescale 1ns / 1ps

////////////////////////////////////English///////////////////////////////////////
// Company:			Disp301 Experiment in SouthEast University
// Engineer:		Erie
// 
// Create Date: 	2019/10/07 15:32:10
// Design Name: 	IIC Driver
// Module Name: 	IIC_Interface
// Description: 	None
// 
// Dependencies: 	None
//
// Dependent modules:
// 	 Module Name				    Version
// Clock_Interface					 V2.3
//
// Version:			V2.0
// Revision Date:	2021/10/16 13:51:24
// History:		
//    Time			   Version	   Revised by			Contents
// 2019/10/07			V1.0		 Erie		Create File and Driver_IIC module.
// 2019/10/08			V1.1		 Erie		Write IIC driver, support single address read and write.
// 2019/10/16			V1.2		 Erie		Fix the problem of signal conflict between read and write requests.
// 2020/04/24			V1.3		 Erie		Optimize timing, add dual address read and write mode.
// 2020/07/18			V1.4		 Erie		Renamed to Driver_Master_IIC, adding IIC frequency adjustment parameters.
// 2020/08/02			V1.5		 Erie		Add read response signal optional, 1 is non-response NACK, 0 is response ACK.
// 2021/10/16			V2.0		 Erie		Renamed to IIC_Interface, adding support for write response verification/continuous writing/continuous reading.
///////////////////////////////////Chinese////////////////////////////////////////
// 版权归属:		东南大学显示中心301实验室
// 开发人员:		Erie
// 
// 创建日期: 		2019年10月07日
// 设计名称: 		IIC Driver
// 模块名称: 		IIC_Interface
// 相关名称: 		None
// 
// 依赖资料: 		None
//
// 依赖模块:
// 	  模块名称						 版本
// Clock_Interface					 V2.3
//
// 当前版本:		V2.0
// 修订日期:		2021年10月16日
// 修订历史:
//		时间			版本		修订人				修订内容	
// 2019年10月07日		V1.0		 Erie		创建文件,编写IIC驱动模块(Driver_IIC)
// 2019年10月08日		V1.1		 Erie		编写IIC驱动,支持单地址读写
// 2019年10月16日		V1.2		 Erie		修复读写请求信号冲突问题
// 2020年04月24日		V1.3		 Erie		优化时序,增加双地址读写模式
// 2020年07月18日		V1.4		 Erie		更名为Driver_Master_IIC,增加IIC频率调节参数
// 2020年08月02日		V1.5		 Erie		增加读应答信号可选,1为非应答NACK,0为应答ACK
// 2021年10月16日		V2.0		 Erie		更名为IIC_Interface,增加对写应答校验/连续写/连续读的功能支持

//IIC接口
module IIC_Interface
#(
	parameter CLOCK_FREQ_MHZ 	= 13'd100,                                                                                                                       
	parameter IIC_Clock_KHz 	= 13'd100
)
(
	input i_clk,
	input i_rstn,
	
	//-------------外部控制信号-------------//
	//配置模式信号
	input i_mbus_rwslave_addr_mode,			//配置IIC从机地址模式,1'b0代表原始地址,需要左移7位,低位补零;1'b1代表移位之后地址,不需要再移位
	input i_mbus_rwaddr_mode,				//配置IIC读写地址模式,1'b1代表双地址位;1'b0代表单地址位,此时低位地址有效
	input i_mbus_rack,			            //配置IIC读应答信号,1为非应答NACK;0为应答ACK
	input i_mbus_wack_enable,				//配置IIC写应答检测校验使能
	input i_mbus_wack,			        	//配置IIC写应答信号校验值,1为非应答NACK;0为应答ACK
	input i_mbus_rwmode,					//配置IIC读写数据模式,1'b1代表单字节读写;1'b0代表连续读写
	
	//配置数据信号
	input [7:0]i_mbus_rwslave_addr,			//配置IIC读写从机地址
	input [7:0]i_mbus_rwaddr_h,				//配置IIC读写寄存器地址,高8位
	input [7:0]i_mbus_rwaddr_l,				//配置IIC读写寄存器地址,低8位
	
	//写通道
	input i_mbus_wrq,						//写请求,高电平有效
	input [7:0]i_mbus_wdata,				//写数据
	input i_mbus_wvalid,					//写数据有效信号
	input i_mbus_wlast,						//写最后一个
	output o_mbus_wready,					//写准备好信号
	
	//读通道
	input i_mbus_rrq,						//读请求,高电平有效
	input i_mbus_rready,					//读准备好
	input i_mbus_rlast,						//读最后一个
	output [7:0]o_mbus_rdata,				//读数据
	output o_mbus_rvalid,					//读数据有效信号
	
	//忙通道
	output o_mbus_rwbusy,					//读写忙信号,高电平代表忙碌,低电平代表空闲
	output o_mbus_rwack_err,				//应答错误
	
	//--------------IIC管脚信号-------------//
	input i_iic_sda,						//IIC输入SDA数据信号
	output o_iic_scl,						//IIC输出SCL时钟信号
	output o_iic_sda,						//IIC输出SDA数据信号
	output o_iic_sda_dir					//IIC输出SDA信号方向
);

	//----------------IIC时钟参数---------------//
	localparam CLOCK_FACTOR = (CLOCK_FREQ_MHZ * 500) / (IIC_Clock_KHz);			//时钟分频系数,降频一半
	localparam FACTOR_BIT = 5'd16;
	localparam CLOCK_MODE = 1'b1;												//时钟分频模式,0为脉冲时钟;1为方波时钟
	localparam NEGEDGE_ENABLE = 1'b0;											//主时钟下降沿反转检测使能,0为不开启检测(奇数分频方波时钟会存在一个主时钟偏差);1为开启检测(50%占空比方波时钟)
	localparam DIVIDER_MODE = {1'b0,~CLOCK_FACTOR[0],CLOCK_FACTOR[0],1'b0};		//分频模式,4'bxxx1代表整数分频;4'bxx10代表奇数分频;4'bx100代表偶数分频;4'b1000代表小数分频
	
	//------------------状态参数----------------//
	localparam ST_IDLE = 0;
	localparam ST_WR_WAIT = 1;
	localparam ST_RD_ADDR = 2;
	localparam ST_RD_START = 3;
	localparam ST_RD_DATA = 4;
	localparam ST_RD_WAIT = 5;
	localparam ST_END = 6;
	
	//------------实例化模块接口信号------------//
	//发送控制模块
	reg [1:0]wr_mbus_wslave_addr_mode = 0;
	reg [3:0]wr_mbus_wmode = 0;
	reg wr_mbus_wrq = 0;
	wire wr_mbus_werr;
	wire wr_mbus_wbusy;
		
	//接收数据模块--配置通道
	reg rd_dbus_rstop = 0;
	
	//接收数据模块--读通道
	reg rd_dbus_rrq = 0;
	reg rd_dbus_rlast = 0;
	wire [7:0]rd_dbus_rdata;
	wire rd_dbus_rvalid;
	wire rd_dbus_rbusy;
	
	//接收数据模块--管脚信号
	wire rd_dbus_iic_sda;
	wire rd_dbus_iic_sda_dir;

	//发送数据模块--配置通道
	wire wr_dbus_wstart;
	wire wr_dbus_wstop_is;
	wire wr_dbus_wchange;
	
	//发送数据模块--写应答
	wire wr_dbus_wack_sel;
	wire wr_dbus_wack;
	
	//发送数据模块--写通道
	wire wr_dbus_wrq;
	wire [7:0]wr_dbus_wdata;
	wire wr_dbus_wvalid;
	wire wr_dbus_wlast;
	wire wr_dbus_wready;
	wire wr_dbus_wstop;
	wire wr_dbus_wbusy;
	
	//发送数据模块--管脚信号
	wire wr_dbus_iic_sda;
	wire wr_dbus_iic_sda_dir;
	
	//------------------时钟信号----------------//
	//IIC时钟信号
	wire clk_IIC;
	reg [1:0]clk_IIC_buffer = 0;
	
	//------------------标志信号----------------//
	wire flag_scl_hs;							//SCL高起始标志,未用到
	wire flag_scl_hc;							//SCL高中心标志
	wire flag_scl_ls;							//SCL低起始标志,未用到
	wire flag_scl_lc;							//SCL低中心标志
	
	//状态机
	reg [2:0]state_current = 0;
	reg [2:0]state_next = 0;
	
	//----------------其他缓存信号--------------//
	reg [1:0]wr_mbus_wbusy_buff = 0;
	reg [1:0]rd_dbus_rbusy_buff = 0;
	
	//----------------输入缓存信号--------------//
	//配置模块信号
	reg mbus_rwmode_i = 0;
	
	//外部控制信号--读通道
	reg mbus_rready_i = 0;
	reg mbus_rlast_i = 0;
	
	//------------------输出信号----------------//
	//外部控制信号--忙通道
	reg mbus_rwbusy_o = 0;
	
	//管脚信号
	reg iic_scl_o = 1'b1;
	reg iic_sda_o = 1'b1;
	reg iic_sda_dir_o = 0;
	
	//----------------标志信号连线--------------//
	assign flag_scl_hs = (clk_IIC_buffer == 2'b01) && (iic_scl_o == 1'b0);		//SCL高起始标志,未用到
	assign flag_scl_hc = (clk_IIC_buffer == 2'b10) && (iic_scl_o == 1'b1);		//SCL高中心标志
	assign flag_scl_ls = (clk_IIC_buffer == 2'b01) && (iic_scl_o == 1'b1);		//SCL低起始标志,未用到
	assign flag_scl_lc = (clk_IIC_buffer == 2'b10) && (iic_scl_o == 1'b0);		//SCL低中心标志
	
	//----------------输出信号连线--------------//
	//外部控制信号--读通道
	assign o_mbus_rdata = rd_dbus_rdata;
	assign o_mbus_rvalid = rd_dbus_rvalid;

	//外部控制信号--忙通道
	assign o_mbus_rwbusy = mbus_rwbusy_o;
	assign o_mbus_rwack_err = wr_mbus_werr;
	
	//管脚信号
	assign o_iic_scl = iic_scl_o;
	assign o_iic_sda = iic_sda_o;
	assign o_iic_sda_dir = iic_sda_dir_o;
	
	//----------------信号输出区域--------------//
	//外部控制信号--忙通道
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rwbusy_o <= 1'b0;
		else if(state_current == ST_IDLE)mbus_rwbusy_o <= i_mbus_wrq | i_mbus_rrq;
		else if(state_current == ST_END)mbus_rwbusy_o <= 1'b0;
		else mbus_rwbusy_o <= mbus_rwbusy_o;
	end
	
	//IIC时钟输出
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_scl_o <= 1'b1;
		else if(clk_IIC_buffer == 2'b01)iic_scl_o <= ~iic_scl_o;
		else iic_scl_o <= iic_scl_o;
	end
	
	//IIC数据线输出
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			iic_sda_o <= 1'b1;
			iic_sda_dir_o <= 1'b1;
		end else begin
			iic_sda_o <= wr_dbus_iic_sda & rd_dbus_iic_sda;
			iic_sda_dir_o <= wr_dbus_iic_sda_dir & rd_dbus_iic_sda_dir;
		end
	end
	
	//-------------------状态机----------------//
	//主状态机
	always@(*)begin
		case(state_current)
			ST_IDLE:begin
				if(i_mbus_wrq == 1'b1)state_next <= ST_WR_WAIT;
				else if(i_mbus_rrq == 1'b1 && mbus_rwmode_i == 1'b1)state_next <= ST_RD_ADDR;	//单字节读取,Random Read
				else if(i_mbus_rrq == 1'b1)state_next <= ST_RD_START;							//连续读取,也可读取当前地址1字节
				else state_next <= ST_IDLE;
			end
			ST_WR_WAIT:begin
				if(wr_mbus_wbusy_buff == 2'b10)state_next <= ST_END;
				else state_next <= ST_WR_WAIT;
			end
			ST_RD_ADDR:begin
				if(wr_mbus_wbusy_buff == 2'b10)state_next <= ST_RD_START;
				else state_next <= ST_RD_ADDR;
			end
			ST_RD_START:begin
				if(wr_mbus_wbusy_buff == 2'b10)state_next <= ST_RD_DATA;
				else state_next <= ST_RD_START;
			end
			ST_RD_DATA:begin
				if(mbus_rlast_i == 1'b1)state_next <= ST_RD_WAIT;
				else state_next <= ST_RD_DATA;
			end
			ST_RD_WAIT:begin
				if(rd_dbus_rbusy_buff == 2'b10)state_next <= ST_END;			//读数据结束
				else state_next <= ST_RD_WAIT;
			end
			ST_END:state_next <= ST_IDLE;
			default:state_next <= ST_IDLE;
		endcase
	end
	
	//状态转换
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------状态任务处理-------------//
	//IIC写控制--配置从机地址模式
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)wr_mbus_wslave_addr_mode <= 2'd0;
		else if(state_current == ST_RD_START)wr_mbus_wslave_addr_mode <= {1'b1,i_mbus_rwslave_addr_mode};
		else wr_mbus_wslave_addr_mode <= {1'b0,i_mbus_rwslave_addr_mode};
	end
	
	//IIC写控制--配置写数据模式
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)wr_mbus_wmode <= 4'd0;
		else if(state_current == ST_RD_ADDR)wr_mbus_wmode <= 4'b1000;
		else if(state_current == ST_RD_START)wr_mbus_wmode <= 4'b0100;
		else wr_mbus_wmode <= {2'd0,~mbus_rwmode_i,mbus_rwmode_i};
	end
	
	//IIC写控制--写请求信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)wr_mbus_wrq <= 1'b0;
		else if(wr_mbus_wbusy_buff[0] == 1'b1 || wr_mbus_wbusy_buff[1] == 1'b1)wr_mbus_wrq <= 1'b0;
		else if(state_current == ST_WR_WAIT)wr_mbus_wrq <= 1'b1;
		else if(state_current == ST_RD_ADDR)wr_mbus_wrq <= 1'b1;
		else if(state_current == ST_RD_START)wr_mbus_wrq <= 1'b1;
		else wr_mbus_wrq <= 1'b0;
	end
	
	//读数据--停止信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)rd_dbus_rstop <= 1'b0;
		else if(state_current == ST_RD_WAIT)rd_dbus_rstop <= 1'b1;
		else rd_dbus_rstop <= 1'b0;
	end
	
	//读数据--读请求信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)rd_dbus_rrq <= 1'b0;
		else if(state_current == ST_RD_DATA)rd_dbus_rrq <= 1'b1;
		else rd_dbus_rrq <= 1'b0;
	end
	
	//读数据--读最后一个数据信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)rd_dbus_rlast <= 1'b0;
		else if(state_current == ST_RD_WAIT)rd_dbus_rlast <= 1'b1;
		else rd_dbus_rlast <= 1'b0;
	end
		
	//IIC写控制器实例化
	IIC_Write_Ctrl IIC_Write_Ctrl_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),

		//------------外部控制信号----------//
		//配置模式信号
		.i_mbus_wslave_addr_mode(wr_mbus_wslave_addr_mode),	//配置IIC从机地址模式,2'bx0代表原始地址,需要左移7位,低位补零;2'bx1代表移位之后地址,不需要再移位;2'b1x代表地址最低位需要或1
		.i_mbus_waddr_mode(i_mbus_rwaddr_mode),				//配置IIC写地址模式,1'b1代表双地址位;1'b0代表单地址位,此时低位地址有效
		.i_mbus_wack_enable(i_mbus_wack_enable),			//配置IIC写应答检测校验使能
		.i_mbus_wack(i_mbus_wack),			        		//配置IIC写应答信号校验值,1为非应答NACK;0为应答ACK
		.i_mbus_wmode(wr_mbus_wmode),						//配置IIC写数据模式,4'bxxx1代表单字节写;4'bxx10代表连续写;4'bx100代表只写器件地址;4'b1000代表写入器件地址和寄存器地址

		//配置数据信号
		.i_mbus_wslave_addr(i_mbus_rwslave_addr),			//配置IIC写从机地址
		.i_mbus_waddr_h(i_mbus_rwaddr_h),					//配置IIC写寄存器地址,高8位
		.i_mbus_waddr_l(i_mbus_rwaddr_l),					//配置IIC写寄存器地址,低8位
		
		//写通道
		.i_mbus_wrq(wr_mbus_wrq),							//写请求信号,高电平有效
		.i_mbus_wdata(i_mbus_wdata),						//写数据信号
		.i_mbus_wvalid(i_mbus_wvalid),						//写数据有效信号
		.i_mbus_wlast(i_mbus_wlast),						//写数据最后一个
		.o_mbus_wready(o_mbus_wready),						//写准备好
		.o_mbus_werr(wr_mbus_werr),							//写出错,没有响应停止信号,拉高有效,在下一次请求时自动复位低电平
		.o_mbus_wbusy(wr_mbus_wbusy),						//写忙碌
		
		//------------外设控制信号----------//
		//配置通道
		.o_dbus_wstart(wr_dbus_wstart),						//有无起始信号,高电平代表有;低电平代表没有
		.o_dbus_wstop(wr_dbus_wstop_is),					//有无结束信号,高电平代表有;低电平代表没有
		.o_dbus_wchange(wr_dbus_wchange),					//切换
		
		//写应答
		.o_dbus_wack_sel(wr_dbus_wack_sel),					//有无应答信号判断,高电平代表有;低电平代表无
		.o_dbus_wack(wr_dbus_wack),							//应答信号模式,1为非应答NACK;0为应答ACK
		
		//写通道
		.o_dbus_wrq(wr_dbus_wrq),							//写请求信号,高电平有效
		.o_dbus_wdata(wr_dbus_wdata),						//写数据
		.o_dbus_wvalid(wr_dbus_wvalid),						//写数据有效
		.o_dbus_wlast(wr_dbus_wlast),						//写数据最后一个
		.i_dbus_wready(wr_dbus_wready),						//写准备好
		.i_dbus_wstop(wr_dbus_wstop),						//没有响应停止信号,拉高有效,在下一次请求时自动复位低电平
		.i_dbus_wbusy(wr_dbus_wbusy)						//写忙碌
	);

	//IIC写数据实例化
	IIC_Write_Data IIC_Write_Data_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------控制信号------------//
		//配置通道
		.i_mbus_wstart(wr_dbus_wstart),						//有无起始信号,高电平代表有;低电平代表没有
		.i_mbus_wstop(wr_dbus_wstop_is),					//有无结束信号,高电平代表有;低电平代表没有
		.i_mbus_wchange(wr_dbus_wchange),					//切换
		.i_mbus_whc(flag_scl_hc),							//写时钟高电平中心
		.i_mbus_wlc(flag_scl_lc),							//写时钟低电平中心
		
		//写应答
		.i_mbus_wack_sel(wr_dbus_wack_sel),					//有无应答信号判断,高电平代表有;低电平代表无
		.i_mbus_wack(wr_dbus_wack),							//应答信号模式,1为非应答NACK;0为应答ACK
		
		//写通道
		.i_mbus_wrq(wr_dbus_wrq),							//写请求信号,高电平有效
		.i_mbus_wdata(wr_dbus_wdata),						//写数据
		.i_mbus_wvalid(wr_dbus_wvalid),						//写数据有效
		.i_mbus_wlast(wr_dbus_wlast),						//写数据最后一个
		.o_mbus_wready(wr_dbus_wready),						//写准备好
		.o_mbus_wstop(wr_dbus_wstop),						//没有响应停止信号,拉高有效,在下一次请求时自动复位低电平
		.o_mbus_wbusy(wr_dbus_wbusy),						//写忙碌
		
		//--------------管脚信号------------//
		.i_iic_sda(i_iic_sda),								//IIC输入SDA数据信号
		.o_iic_sda(wr_dbus_iic_sda),						//IIC输出SDA数据信号
		.o_iic_sda_dir(wr_dbus_iic_sda_dir)					//IIC输出SDA信号方向
	);

	//IIC读数据模块实例化
	IIC_Read_Data IIC_Read_Data_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------控制信号------------//
		//配置通道
		.i_mbus_rstop(rd_dbus_rstop),						//有无结束信号,高电平代表有;低电平代表没有
		.i_mbus_rhc(flag_scl_hc),							//读时钟高电平中心
		.i_mbus_rlc(flag_scl_lc),							//读时钟低电平中心
		
		//读应答
		.i_mbus_rack(i_mbus_rack),							//应答信号模式,1为非应答NACK;0为应答ACK
		
		//读通道
		.i_mbus_rrq(rd_dbus_rrq),							//读请求信号,高电平有效
		.i_mbus_rlast(rd_dbus_rlast),						//读数据最后一个
		.i_mbus_rready(i_mbus_rready),						//读准备好
		.o_mbus_rdata(rd_dbus_rdata),						//读数据
		.o_mbus_rvalid(rd_dbus_rvalid),						//读数据有效
		.o_mbus_rbusy(rd_dbus_rbusy),						//读忙碌
		
		//--------------管脚信号------------//
		.i_iic_sda(i_iic_sda),								//IIC输入SDA数据信号
		.o_iic_sda(rd_dbus_iic_sda),						//IIC输出SDA数据信号
		.o_iic_sda_dir(rd_dbus_iic_sda_dir)					//IIC输出SDA信号方向
	);

	//IIC时钟产生
	Clock_Interface	#(	.FACTOR_BIT(FACTOR_BIT),.CLOCK_MODE(CLOCK_MODE),
						.NEGEDGE_ENABLE(NEGEDGE_ENABLE),.DIVIDER_MODE(DIVIDER_MODE))Clock_Interface_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//------------时钟输出通道----------//
		.o_clk_out(clk_IIC),
		.o_clk_ls(),						//正常时钟的低电平起始位置,一个基准clock脉冲
		.o_clk_lc(),						//正常时钟的低电平中心位置,一个基准clock脉冲
		.o_clk_hs(),						//正常时钟的高电平起始位置,一个基准clock脉冲
		.o_clk_hc(),						//正常时钟的高电平中心位置,一个基准clock脉冲
	
		//------------分频参数通道----------//
		.i_clk_dividend(CLOCK_FACTOR),		//整数/奇数/偶数分频模式下作为分频系数;小数分频模式下作为被除数
		.i_clk_divisor(0),					//整数/奇数/偶数分频模式下不使用;小数分频模式下作为除数
		.i_clk_quotient(0),					//整数/奇数/偶数分频模式下不使用;小数分频模式下作为商
		.i_clk_remainder(0)					//整数/奇数/偶数分频模式下不使用;小数分频模式下作为余数
	);
	
	//----------------其他信号缓存-------------//
	//IIC时钟信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			clk_IIC_buffer <= 2'd0;
		end else begin
			clk_IIC_buffer <= {clk_IIC_buffer[0],clk_IIC};
		end
	end
	
	//忙信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			wr_mbus_wbusy_buff <= 2'd0;
			rd_dbus_rbusy_buff <= 2'd0;
		end else begin
			wr_mbus_wbusy_buff <= {wr_mbus_wbusy_buff[0],wr_mbus_wbusy};
			rd_dbus_rbusy_buff <= {rd_dbus_rbusy_buff[0],rd_dbus_rbusy};
		end
	end

	//----------------输入信号缓存-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			mbus_rwmode_i <= 1'b0;
			mbus_rready_i <= 1'b0;
			mbus_rlast_i <= 1'b0;
		end else begin
			mbus_rwmode_i <= i_mbus_rwmode;
			mbus_rready_i <= i_mbus_rready;
			mbus_rlast_i <= i_mbus_rlast;
		end
	end

endmodule

//IIC写控制
module IIC_Write_Ctrl
(
	input i_clk,
	input i_rstn,
	
	//------------外部控制信号----------//
	//配置模式信号
	input [1:0]i_mbus_wslave_addr_mode,	//配置IIC从机地址模式,2'bx0代表原始地址,需要左移7位,低位补零;2'bx1代表移位之后地址,不需要再移位;2'b1x代表地址最低位需要或1
	input i_mbus_waddr_mode,			//配置IIC写地址模式,1'b1代表双地址位;1'b0代表单地址位,此时低位地址有效
	input i_mbus_wack_enable,			//配置IIC写应答检测校验使能
	input i_mbus_wack,			        //配置IIC写应答信号校验值,1为非应答NACK;0为应答ACK
	input [3:0]i_mbus_wmode,			//配置IIC写数据模式,4'bxxx1代表单字节写;4'bxx10代表连续写;4'bx100代表只写器件地址;4'b1000代表写入器件地址和寄存器地址;
	
	//配置数据信号
	input [7:0]i_mbus_wslave_addr,		//配置IIC写从机地址
	input [7:0]i_mbus_waddr_h,			//配置IIC写寄存器地址,高8位
	input [7:0]i_mbus_waddr_l,			//配置IIC写寄存器地址,低8位
	
	//写通道
	input i_mbus_wrq,					//写请求信号,高电平有效
	input [7:0]i_mbus_wdata,			//写数据信号
	input i_mbus_wvalid,				//写数据有效信号
	input i_mbus_wlast,					//写数据最后一个
	output o_mbus_wready,				//写准备好
	output o_mbus_werr,					//写出错,没有响应停止信号,拉高有效,在下一次请求时自动复位低电平
	output o_mbus_wbusy,				//写忙碌
	
	//------------外设控制信号----------//
	//配置通道
	output o_dbus_wstart,				//有无起始信号,高电平代表有;低电平代表没有
	output o_dbus_wstop,				//有无结束信号,高电平代表有;低电平代表没有
	output o_dbus_wchange,				//切换
	
	//写应答
	output o_dbus_wack_sel,				//有无应答信号判断,高电平代表有;低电平代表无
	output o_dbus_wack,					//应答信号模式,1为非应答NACK;0为应答ACK
	
	//写通道
	output o_dbus_wrq,					//写请求信号,高电平有效
	output [7:0]o_dbus_wdata,			//写数据
	output o_dbus_wvalid,				//写数据有效
	output o_dbus_wlast,				//写数据最后一个
	input i_dbus_wready,				//写准备好
	input i_dbus_wstop,					//没有响应停止信号,拉高有效,在下一次请求时自动复位低电平
	input i_dbus_wbusy					//写忙碌
);
	//------------------状态参数----------------//
	localparam ST_WR_IDLE = 7'b0000001;
	localparam ST_WR_SADDR = 7'b0000010;
	localparam ST_WR_ADDR_H = 7'b0000100;
	localparam ST_WR_ADDR_L = 7'b0001000;
	localparam ST_WR_DATA = 7'b0010000;
	localparam ST_WR_WAIT = 7'b0100000;
	localparam ST_WR_END = 7'b1000000;
	
	//状态机
	reg [6:0]state_current = ST_WR_IDLE;
	reg [6:0]state_next = ST_WR_IDLE;
	
	//----------------输入缓存信号--------------//
	//外部控制信号--配置模式信号
	reg mbus_waddr_mode_i = 0;
	reg [3:0]mbus_wmode_i = 0;
	
	//外部控制信号--配置数据信号
	reg [7:0]mbus_wslave_addr_i = 0;
	reg [7:0]mbus_waddr_h_i = 0;
	reg [7:0]mbus_waddr_l_i = 0;
	
	//外部控制信号--写通道
	reg [7:0]mbus_wdata_i = 0;
	reg mbus_wvalid_i = 0;
	reg mbus_wlast_i = 0;
	
	//外设控制信号--写通道
	reg [1:0]dbus_wready_i = 0;
	reg dbus_wstop_i = 0;
	reg [1:0]dbus_wbusy_i = 0;
	
	//------------------输出信号---------------//
	//外部控制信号--写通道
	reg mbus_wready_o = 0;
	reg mbus_werr_o = 0;
	reg mbus_wbusy_o = 0;
	
	//外设控制信号--配置通道
	reg dbus_wstart_o = 0;
	reg dbus_wstop_o = 0;
	reg dbus_wchange_o = 0;
	
	//外设控制信号--写通道
	reg dbus_wrq_o = 0;
	reg [7:0]dbus_wdata_o = 0;
	reg dbus_wvalid_o = 0;
	reg dbus_wlast_o = 0;
	
	//----------------输出信号连线-------------//
	//外部控制信号--写通道
	assign o_mbus_wready = mbus_wready_o;
	assign o_mbus_werr = mbus_werr_o;
	assign o_mbus_wbusy = mbus_wbusy_o;
	
	//外设控制信号--配置通道
	assign o_dbus_wstart = dbus_wstart_o;
	assign o_dbus_wstop = dbus_wstop_o;
	assign o_dbus_wchange = dbus_wchange_o;
	
	//外设控制信号--写应答
	assign o_dbus_wack_sel = i_mbus_wack_enable;
	assign o_dbus_wack = i_mbus_wack;
	
	//外设控制信号--写通道
	assign o_dbus_wrq = dbus_wrq_o;
	assign o_dbus_wdata = dbus_wdata_o;
	assign o_dbus_wvalid = dbus_wvalid_o;
	assign o_dbus_wlast = dbus_wlast_o;
	
	//------------------信号输出---------------//
	//写准备好信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wready_o <= 1'b0;
		else if(state_current == ST_WR_DATA)mbus_wready_o <=  dbus_wready_i[0] | dbus_wready_i[1];
		else mbus_wready_o <= 1'b0;
	end
	
	//写无响应停止信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_werr_o <= 1'b0;
		else if(dbus_wbusy_i == 2'b10 && dbus_wstop_i == 1'b1)mbus_werr_o <= 1'b1;
		else if(state_current == ST_WR_SADDR)mbus_werr_o <= 1'b0;
		else mbus_werr_o <= mbus_werr_o;
	end
	
	//写忙信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_END)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_SADDR)mbus_wbusy_o <= 1'b1;
		else mbus_wbusy_o <= mbus_wbusy_o;
	end
	
	//-------------------状态机----------------//
	//主状态机
	always@(*)begin
		case(state_current)
			ST_WR_IDLE:begin
				if(i_mbus_wrq == 1'b1)state_next <= ST_WR_SADDR;
				else state_next <= ST_WR_IDLE;
			end
			ST_WR_SADDR:begin
				if(mbus_wmode_i[2] == 1'b1 && dbus_wready_i == 2'b10)state_next <= ST_WR_WAIT;			//只写入器件地址
				else if(mbus_waddr_mode_i == 1'b1 && dbus_wready_i == 2'b10)state_next <= ST_WR_ADDR_H;	//双地址位
				else if(dbus_wready_i == 2'b10)state_next <= ST_WR_ADDR_L;								//单地址位
				else state_next <= ST_WR_SADDR;
			end
			ST_WR_ADDR_H:begin
				if(dbus_wready_i == 2'b10)state_next <= ST_WR_ADDR_L;
				else state_next <= ST_WR_ADDR_H;
			end
			ST_WR_ADDR_L:begin
				if(mbus_wmode_i[3] == 1'b1 && dbus_wready_i == 2'b10)state_next <= ST_WR_WAIT;		//只写入器件地址和寄存器地址
				else if(dbus_wready_i == 2'b10)state_next <= ST_WR_DATA;
				else state_next <= ST_WR_ADDR_L;
			end
			ST_WR_DATA:begin
				if(dbus_wready_i == 2'b01 && mbus_wlast_i == 1'b1)state_next <= ST_WR_WAIT;		//最后一个数据
				else state_next <= ST_WR_DATA;
			end
			ST_WR_WAIT:begin
				if(dbus_wbusy_i == 2'b10)state_next <= ST_WR_END;		//等待结束
				else state_next <= ST_WR_WAIT;
			end
			ST_WR_END:state_next <= ST_WR_IDLE;
			default:state_next <= ST_WR_IDLE;
		endcase
	end
	
	//状态转换
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_WR_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------状态任务处理-------------//
	//外设信号输出--起始信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wstart_o <= 1'b0;
		else if(state_current == ST_WR_SADDR)dbus_wstart_o <= 1'b1;
		else if(dbus_wready_i == 2'b01)dbus_wstart_o <= 1'b0;
		else dbus_wstart_o <= dbus_wstart_o;
	end
	
	//外设信号输出--结束信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wstop_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wstop_o <= mbus_wmode_i[0] | mbus_wmode_i[1];
		else dbus_wstop_o <= 1'b0;
	end
	
	//外设信号输出--切换信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wchange_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wchange_o <= mbus_wmode_i[0] | mbus_wmode_i[1] | mbus_wmode_i[2] | mbus_wmode_i[3];
		else dbus_wchange_o <= 1'b0;
	end
	
	//外设信号输出--写请求信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wrq_o <= 1'b0;
		else if(state_current == ST_WR_SADDR)dbus_wrq_o <= 1'b1;
		else dbus_wrq_o <= 1'b0;
	end

	//外设信号输出--写数据信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wdata_o <= 8'd0;
		else if(state_current == ST_WR_SADDR)dbus_wdata_o <= mbus_wslave_addr_i;
		else if(state_current == ST_WR_ADDR_H)dbus_wdata_o <= mbus_waddr_h_i;
		else if(state_current == ST_WR_ADDR_L)dbus_wdata_o <= mbus_waddr_l_i;
		else if(state_current == ST_WR_DATA)dbus_wdata_o <= mbus_wdata_i;
		else dbus_wdata_o <= dbus_wdata_o;
	end
	
	//外设信号输出--写数据有效信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wvalid_o <= 1'b0;
		else if(dbus_wready_i == 2'b00)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_IDLE)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_END)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_DATA)dbus_wvalid_o <= mbus_wvalid_i;
		else dbus_wvalid_o <= 1'b1;
	end
	
	//外设信号输出--写数据结束信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wlast_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wlast_o <= 1'b1;
		else dbus_wlast_o <= 1'b0;
	end
	
	//----------------输入信号缓存-------------//
	//外部控制信号--配置从机地址
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			mbus_wslave_addr_i <= 8'd0;
		end else if(i_mbus_wslave_addr_mode[0] == 1'b0)begin
			mbus_wslave_addr_i <= {i_mbus_wslave_addr[6:0],i_mbus_wslave_addr_mode[1]};
		end else begin
			mbus_wslave_addr_i <= i_mbus_wslave_addr | {7'd0,i_mbus_wslave_addr_mode[1]};
		end
	end
	
	//外部控制信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			mbus_waddr_mode_i <= 1'b0;
			mbus_wmode_i <= 4'd0;
			mbus_waddr_h_i <= 8'd0;
			mbus_waddr_l_i <= 8'd0;
			mbus_wdata_i <= 8'd0;
			mbus_wvalid_i <= 1'b0;
			mbus_wlast_i <= 1'b0;
		end else begin
			mbus_waddr_mode_i <= i_mbus_waddr_mode;
			mbus_wmode_i <= i_mbus_wmode;
			mbus_waddr_h_i <= i_mbus_waddr_h;
			mbus_waddr_l_i <= i_mbus_waddr_l;
			mbus_wdata_i <= i_mbus_wdata;
			mbus_wvalid_i <= i_mbus_wvalid;
			mbus_wlast_i <= i_mbus_wlast;
		end
	end
	
	//外设控制信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			dbus_wready_i <= 2'd0;
			dbus_wstop_i <= 1'b0;
			dbus_wbusy_i <= 2'd0;
		end else begin
			dbus_wready_i <= {dbus_wready_i[0],i_dbus_wready};
			dbus_wstop_i <= i_dbus_wstop;
			dbus_wbusy_i <= {dbus_wbusy_i[0],i_dbus_wbusy};
		end
	end
	
endmodule


//IIC写数据
module IIC_Write_Data
(
	input i_clk,
	input i_rstn,
	
	//--------------控制信号------------//
	//配置通道
	input i_mbus_wstart,				//有无起始信号,高电平代表有;低电平代表没有
	input i_mbus_wstop,					//有无结束信号,高电平代表有;低电平代表没有
	input i_mbus_wchange,				//切换
	input i_mbus_whc,					//写时钟高电平中心
	input i_mbus_wlc,					//写时钟低电平中心
	
	//写应答
	input i_mbus_wack_sel,				//有无应答信号判断,高电平代表有;低电平代表无
	input i_mbus_wack,					//应答信号模式,1为非应答NACK;0为应答ACK
	
	//写通道
	input i_mbus_wrq,					//写请求信号,高电平有效
	input [7:0]i_mbus_wdata,			//写数据
	input i_mbus_wvalid,				//写数据有效
	input i_mbus_wlast,					//写数据最后一个
	output o_mbus_wready,				//写准备好
	output o_mbus_wstop,				//没有响应停止信号,拉高有效,在下一次请求时自动复位低电平
	output o_mbus_wbusy,				//写忙碌
	
	//--------------管脚信号------------//
	input i_iic_sda,					//IIC输入SDA数据信号
	output o_iic_sda,					//IIC输出SDA数据信号
	output o_iic_sda_dir				//IIC输出SDA信号方向
);
	//------------------状态参数----------------//
	localparam ST_WR_IDLE = 2'd0;
	localparam ST_WR_DATA = 2'd1;
	localparam ST_WR_WAIT = 2'd2;
	localparam ST_WR_END = 2'd3;
	
	//---------------模块实例化信号-------------//
	//写数据
	reg dbus_wrq = 0;
	reg [7:0]dbus_wdata = 0;
	wire dbus_wbusy;
	wire dbus_wnack;
	
	//缓存
	reg [1:0]dbus_wbusy_buff = 0;
	reg dbus_wnack_buff = 0;
	
	//状态机
	reg [1:0]state_current = ST_WR_IDLE;
	reg [1:0]state_next = ST_WR_IDLE;
	
	//----------------输入缓存信号--------------//
	//写通道
	reg [7:0]mbus_wdata_i = 0;
	reg mbus_wvalid_i = 0;
	reg mbus_wlast_i = 0;
	
	//------------------输出信号---------------//
	//写通道
	reg mbus_wready_o = 0;
	reg mbus_wstop_o = 0;
	reg mbus_wbusy_o = 0;
	
	//----------------输出信号连线-------------//
	//写通道
	assign o_mbus_wready = mbus_wready_o;
	assign o_mbus_wstop = mbus_wstop_o;
	assign o_mbus_wbusy = mbus_wbusy_o;
	
	//------------------信号输出---------------//
	//写准备好信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wready_o <= 1'b0;
		else if(state_current == ST_WR_DATA && dbus_wbusy_buff == 2'b00)mbus_wready_o <= 1'b1;
		else mbus_wready_o <= 1'b0;
	end
	
	//写无响应停止信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wstop_o <= 1'b0;
		else if(dbus_wbusy_buff == 2'b10 && dbus_wnack_buff == 1'b1)mbus_wstop_o <= 1'b1;
		else if(state_current == ST_WR_IDLE)mbus_wstop_o <= 1'b0;
		else mbus_wstop_o <= mbus_wstop_o;
	end
	
	//写忙信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_END)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_DATA)mbus_wbusy_o <= 1'b1;
		else mbus_wbusy_o <= mbus_wbusy_o;
	end
	
	//-------------------状态机----------------//
	//主状态机
	always@(*)begin
		case(state_current)
			ST_WR_IDLE:begin
				if(i_mbus_wrq == 1'b1)state_next <= ST_WR_DATA;
				else state_next <= ST_WR_IDLE;
			end
			ST_WR_DATA:begin
				if(mbus_wlast_i == 1'b1)state_next <= ST_WR_WAIT;
				else state_next <= ST_WR_DATA;
			end
			ST_WR_WAIT:begin
				if(dbus_wbusy_buff == 2'b10)state_next <= ST_WR_END;
				else state_next <= ST_WR_WAIT;
			end
			ST_WR_END:state_next <= ST_WR_IDLE;
		endcase
	end
	
	//状态转换
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_WR_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------状态任务处理-------------//
	//实例化模块--写请求信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wrq <= 1'b0;
		else if(dbus_wbusy_buff == 2'b11)dbus_wrq <= 1'b0;
		else if(state_current == ST_WR_DATA && mbus_wvalid_i == 1'b1)dbus_wrq <= 1'b1;
		else dbus_wrq <= dbus_wrq;
	end
	
	//实例化模块--写数据信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wdata <= 8'd0;
		else if(state_current == ST_WR_DATA && mbus_wvalid_i == 1'b1)dbus_wdata <= mbus_wdata_i;
		else dbus_wdata <= dbus_wdata;
	end
	
	//IIC发送1字节,8比特数据模块实例化
	IIC_Send_Byte IIC_Send_Byte_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------控制信号------------//
		//写配置
		.i_dbus_wstart(i_mbus_wstart),		//有无起始信号,高电平代表有;低电平代表没有
		.i_dbus_wstop(i_mbus_wstop),		//有无结束信号,高电平代表有;低电平代表没有
		.i_dbus_wchange(i_mbus_wchange),	//切换
		.i_dbus_whc(i_mbus_whc),			//写时钟高电平中心
		.i_dbus_wlc(i_mbus_wlc),			//写时钟低电平中心
		
		//写应答
		.i_dbus_wack_sel(i_mbus_wack_sel),	//有无应答信号判断,高电平代表有;低电平代表无
		.i_dbus_wack(i_mbus_wack),			//应答信号模式,1为非应答NACK;0为应答ACK
		
		//写数据
		.i_dbus_wrq(dbus_wrq),				//写请求信号,高电平有效
		.i_dbus_wdata(dbus_wdata),			//需要发送的数据,共8位
		.o_dbus_wbusy(dbus_wbusy),			//发送忙信号,高电平代表忙碌;低电平代表空闲
		.o_dbus_nack(dbus_wnack),			//没有响应,下一次写请求时自动复位

		//--------------管脚信号------------//
		.i_iic_sda(i_iic_sda),				//IIC输入SDA数据信号
		.o_iic_sda(o_iic_sda),				//IIC输出SDA数据信号
		.o_iic_sda_dir(o_iic_sda_dir)		//IIC输出SDA信号方向
	);
	
	//----------------其他信号缓存-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			dbus_wbusy_buff <= 2'd0;
			dbus_wnack_buff <= 1'b0;
		end else begin
			dbus_wbusy_buff <= {dbus_wbusy_buff[0],dbus_wbusy};
			dbus_wnack_buff <= dbus_wnack;
		end
	end
	
	//----------------输入信号缓存-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			mbus_wdata_i <= 8'd0;
			mbus_wvalid_i <= 1'b0;
			mbus_wlast_i <= 1'b0;
		end else begin
			mbus_wdata_i <= i_mbus_wdata;
			mbus_wvalid_i <= i_mbus_wvalid;
			mbus_wlast_i <= i_mbus_wlast;
		end
	end
	
endmodule

//IIC读数据
module IIC_Read_Data
(
	input i_clk,
	input i_rstn,
	
	//--------------控制信号------------//
	//配置通道
	input i_mbus_rstop,					//有无结束信号,高电平代表有;低电平代表没有
	input i_mbus_rhc,					//读时钟高电平中心
	input i_mbus_rlc,					//读时钟低电平中心
	
	//读应答
	input i_mbus_rack,					//应答信号模式,1为非应答NACK;0为应答ACK
	
	//读通道
	input i_mbus_rrq,					//读请求信号,高电平有效
	input i_mbus_rlast,					//读数据最后一个
	input i_mbus_rready,				//读准备好
	output [7:0]o_mbus_rdata,			//读数据
	output o_mbus_rvalid,				//读数据有效
	output o_mbus_rbusy,				//读忙碌
	
	//--------------管脚信号------------//
	input i_iic_sda,					//IIC输入SDA数据信号
	output o_iic_sda,					//IIC输出SDA数据信号
	output o_iic_sda_dir				//IIC输出SDA信号方向
);
	//------------------状态参数----------------//
	localparam ST_RD_IDLE = 2'd0;
	localparam ST_RD_DATA = 2'd1;
	localparam ST_RD_WAIT = 2'd2;
	localparam ST_RD_END = 2'd3;
	
	//---------------模块实例化信号-------------//
	//读数据
	reg dbus_rrq = 0;
	wire [7:0]dbus_rdata;
	wire dbus_rbusy;
	
	//缓存
	reg [1:0]dbus_rbusy_buff = 0;
	
	//状态机
	reg [1:0]state_current = ST_RD_IDLE;
	reg [1:0]state_next = ST_RD_IDLE;
	
	//----------------输入缓存信号--------------//
	//读通道
	reg mbus_rready_i = 0;
	reg mbus_rlast_i = 0;
	
	//------------------输出信号---------------//
	//读通道
	reg [7:0]mbus_rdata_o = 0;
	reg mbus_rvalid_o = 0;
	reg mbus_rbusy_o = 0;
	
	//----------------输出信号连线-------------//
	//写通道
	assign o_mbus_rdata = mbus_rdata_o;
	assign o_mbus_rvalid = mbus_rvalid_o;
	assign o_mbus_rbusy = mbus_rbusy_o;
	
	//------------------信号输出---------------//
	//读数据信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rdata_o <= 8'd0;
		else if(dbus_rbusy_buff == 2'b10)mbus_rdata_o <= dbus_rdata;
		else mbus_rdata_o <= mbus_rdata_o;
	end
	
	//读数据有效信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rvalid_o <= 1'b0;
		else if(dbus_rbusy_buff == 2'b10)mbus_rvalid_o <= 1'b1;
		else mbus_rvalid_o <= 1'b0;
	end
	
	//读忙信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_END)mbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_DATA)mbus_rbusy_o <= 1'b1;
		else mbus_rbusy_o <= mbus_rbusy_o;
	end
	
	//-------------------状态机----------------//
	//主状态机
	always@(*)begin
		case(state_current)
			ST_RD_IDLE:begin
				if(i_mbus_rrq == 1'b1)state_next <= ST_RD_DATA;
				else state_next <= ST_RD_IDLE;
			end
			ST_RD_DATA:begin
				if(mbus_rlast_i == 1'b1)state_next <= ST_RD_WAIT;
				else state_next <= ST_RD_DATA;
			end
			ST_RD_WAIT:begin
				if(dbus_rbusy_buff == 2'b10)state_next <= ST_RD_END;
				else state_next <= ST_RD_WAIT;
			end
			ST_RD_END:state_next <= ST_RD_IDLE;
		endcase
	end
	
	//状态转换
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_RD_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------状态任务处理-------------//
	//实例化模块--读请求信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_rrq <= 1'b0;
		else if(dbus_rbusy_buff == 2'b11)dbus_rrq <= 1'b0;
		else if(state_current == ST_RD_DATA && mbus_rready_i == 1'b1)dbus_rrq <= 1'b1;
		else dbus_rrq <= dbus_rrq;
	end

	//IIC接收1字节,8比特数据模块实例化
	IIC_Recv_Byte IIC_Recv_Byte_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------控制信号------------//
		//读配置
		.i_dbus_rstop(i_mbus_rstop),		//有无结束信号,高电平代表有;低电平代表没有
		.i_dbus_rhc(i_mbus_rhc),			//读时钟高电平中心
		.i_dbus_rlc(i_mbus_rlc),			//读时钟低电平中心
		
		//读应答
		.i_dbus_rack(i_mbus_rack),			//应答信号模式,1为非应答NACK;0为应答ACK
		
		//读数据
		.i_dbus_rrq(dbus_rrq),				//读请求信号,高电平有效
		.o_dbus_rdata(dbus_rdata),			//读数据,共8位
		.o_dbus_rbusy(dbus_rbusy),			//读忙信号,高电平代表忙碌;低电平代表空闲
		
		//--------------管脚信号------------//
		.i_iic_sda(i_iic_sda),				//IIC输入SDA数据信号
		.o_iic_sda(o_iic_sda),				//IIC输出SDA数据信号
		.o_iic_sda_dir(o_iic_sda_dir)		//IIC输出SDA信号方向
	);
	
	//----------------其他信号缓存-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			dbus_rbusy_buff <= 2'd0;
		end else begin
			dbus_rbusy_buff <= {dbus_rbusy_buff[0],dbus_rbusy};
		end
	end
	
	//----------------输入信号缓存-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			mbus_rready_i <= 1'b0;
			mbus_rlast_i <= 1'b0;
		end else begin
			mbus_rready_i <= i_mbus_rready;
			mbus_rlast_i <= i_mbus_rlast;
		end
	end
	
endmodule

//发送数据8位
module IIC_Send_Byte(
	input i_clk,
	input i_rstn,
	
	//--------------控制信号------------//
	//写配置
	input i_dbus_wstart,				//有无起始信号,高电平代表有;低电平代表没有
	input i_dbus_wstop,					//有无结束信号,高电平代表有;低电平代表没有
	input i_dbus_wchange,				//切换
	input i_dbus_whc,					//写时钟高电平中心
	input i_dbus_wlc,					//写时钟低电平中心
	
	//写应答
	input i_dbus_wack_sel,				//有无应答信号判断,高电平代表有;低电平代表无
	input i_dbus_wack,					//应答信号模式,1为非应答NACK;0为应答ACK
	
	//写数据
	input i_dbus_wrq,					//写请求信号,高电平有效
	input [7:0]i_dbus_wdata,			//需要发送的数据,共8位
	output o_dbus_wbusy,				//发送忙信号,高电平代表忙碌;低电平代表空闲
	output o_dbus_nack,					//没有响应,下一次写请求时自动复位
	
	//--------------管脚信号------------//
	input i_iic_sda,					//IIC输入SDA数据信号
	output o_iic_sda,					//IIC输出SDA数据信号
	output o_iic_sda_dir				//IIC输出SDA信号方向
);
	
	//------------------状态参数----------------//
	localparam ST_WR_IDLE = 6'b000001;
	localparam ST_WR_START = 6'b000010;
	localparam ST_WR_DATA = 6'b000100;
	localparam ST_WR_ACK = 6'b001000;
	localparam ST_WR_STOP = 6'b010000;
	localparam ST_WR_END = 6'b100000;
	
	//计数
	reg [3:0]send_cnt = 0;
	
	//状态机
	reg [5:0]state_current = ST_WR_IDLE;
	reg [5:0]state_next = ST_WR_IDLE;
	
	//----------------输入缓存信号--------------//
	//写配置
	reg dbus_wstart_i = 0;
	reg dbus_wstop_i = 0;
	reg dbus_wchange_i = 0;
	reg dbus_whc_i = 0;
	reg dbus_wlc_i = 0;
	
	//写应答
	reg dbus_wack_sel_i = 0;
	reg dbus_wack_i = 0;
	
	//写数据
	reg [7:0]dbus_wdata_i = 0;
	
	//管脚信号
	reg iic_sda_i = 0;
	
	//------------------输出信号---------------//
	//写数据
	reg dbus_wbusy_o = 1'b0;
	reg dbus_nack_o = 1'b0;
	
	//管脚信号
	reg iic_sda_o = 1'b1;
	reg iic_sda_dir_o = 0;
	
	//----------------输出信号连线-------------//
	//写数据
	assign o_dbus_wbusy = dbus_wbusy_o;
	assign o_dbus_nack = dbus_nack_o;
	
	//管脚信号
	assign o_iic_sda = iic_sda_o;
	assign o_iic_sda_dir = iic_sda_dir_o;
	
	//------------------信号输出---------------//
	//写忙碌信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_START)dbus_wbusy_o <= 1'b1;
		else if(state_current == ST_WR_DATA)dbus_wbusy_o <= 1'b1;
		else if(state_current == ST_WR_END)dbus_wbusy_o <= 1'b0;
		else dbus_wbusy_o <= dbus_wbusy_o;
	end
	
	//没有响应信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_nack_o <= 1'b0;
		else if(state_current == ST_WR_DATA)dbus_nack_o <= 1'b0;
		else if(state_current == ST_WR_ACK && dbus_wlc_i == 1'b1 && dbus_wack_sel_i == 1'b1)dbus_nack_o <= (dbus_wack_i ^ iic_sda_i);
		else dbus_nack_o <= dbus_nack_o;
	end
	
	//IIC管脚信号---数据线
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_sda_o <= 1'b1;
		else if(state_next == ST_WR_IDLE)iic_sda_o <= 1'b1;
		else if(state_next == ST_WR_START)iic_sda_o <= 1'b0;
		else if(state_next == ST_WR_DATA && dbus_wlc_i == 1'b1)iic_sda_o <= dbus_wdata_i[7 - send_cnt[2:0]];
		else if(state_next == ST_WR_ACK)iic_sda_o <= 1'b1;
		else if(state_next == ST_WR_STOP && dbus_wlc_i == 1'b1)iic_sda_o <= 1'b0;
		else if(state_next == ST_WR_STOP && dbus_whc_i == 1'b1)iic_sda_o <= 1'b1;
		else iic_sda_o <= iic_sda_o;
	end
	
	//IIC管脚信号---数据输出方向
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_sda_dir_o <= 1'b1;
		else if(state_next == ST_WR_DATA && send_cnt == 4'd0)iic_sda_dir_o <= dbus_wstart_i;
		else if(state_next == ST_WR_ACK)iic_sda_dir_o <= 1'b0;
		else iic_sda_dir_o <= 1'b1;
	end
	
	//-------------------状态机----------------//
	//主状态机
	always@(*)begin
		case(state_current)
			ST_WR_IDLE:begin
				if(i_dbus_wrq == 1'b1 && dbus_wstart_i == 1'b0)state_next <= ST_WR_DATA;
				else if(i_dbus_wrq == 1'b1 && dbus_whc_i == 1'b1)state_next <= ST_WR_START;
				else state_next <= ST_WR_IDLE;
			end
			ST_WR_START:begin
				if(dbus_wlc_i == 1'b1)state_next <= ST_WR_DATA;
				else state_next <= ST_WR_START;
			end
			ST_WR_DATA:begin
				if(dbus_wlc_i == 1'b1 && send_cnt == 4'd8)state_next <= ST_WR_ACK;
				else state_next <= ST_WR_DATA;
			end
			ST_WR_ACK:begin
				if(dbus_wlc_i == 1'b0 && dbus_wchange_i == 1'b1)state_next <= ST_WR_ACK;
				else if(dbus_wack_sel_i == 1'b0 && dbus_wstop_i == 1'b0)state_next <= ST_WR_END;
				else if(dbus_wack_sel_i == 1'b1 && dbus_wack_i == iic_sda_i && dbus_wstop_i == 1'b0)state_next <= ST_WR_END;
				else state_next <= ST_WR_STOP;
			end
			ST_WR_STOP:begin
				if(dbus_wlc_i == 1'b1)state_next <= ST_WR_END;
				else state_next <= ST_WR_STOP;
			end
			ST_WR_END:state_next <= ST_WR_IDLE;
			default:state_next <= ST_WR_IDLE;
		endcase
	end
	
	//状态转换
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_WR_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------状态任务处理-------------//
	//发送计数
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)send_cnt <= 4'd0;
		else if(state_next == ST_WR_DATA && dbus_wlc_i == 1'b1)send_cnt <= send_cnt + 4'd1;
		else if(state_next == ST_WR_DATA)send_cnt <= send_cnt;
		else send_cnt <= 4'd0;
	end
	
	//----------------输入信号缓存-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			dbus_wstart_i <= 1'b0;
			dbus_wstop_i <= 1'b0;
			dbus_wchange_i <= 1'b0;
			dbus_whc_i <= 1'b0;
			dbus_wlc_i <= 1'b0;
			dbus_wack_sel_i <= 1'b0;
			dbus_wack_i <= 1'b0;
			dbus_wdata_i <= 8'd0;
			iic_sda_i <= 1'b0;
		end else begin
			dbus_wstart_i <= i_dbus_wstart;
			dbus_wstop_i <= i_dbus_wstop;
			dbus_wchange_i <= i_dbus_wchange;
			dbus_whc_i <= i_dbus_whc;
			dbus_wlc_i <= i_dbus_wlc;
			dbus_wack_sel_i <= i_dbus_wack_sel;
			dbus_wack_i <= i_dbus_wack;
			dbus_wdata_i <= i_dbus_wdata;
			iic_sda_i <= i_iic_sda;
		end
	end
	
endmodule

//接收数据8位
module IIC_Recv_Byte(
	input i_clk,
	input i_rstn,
	
	//--------------控制信号------------//
	//读配置
	input i_dbus_rstop,					//有无结束信号,高电平代表有;低电平代表没有
	input i_dbus_rhc,					//读时钟高电平中心
	input i_dbus_rlc,					//读时钟低电平中心
	
	//读应答
	input i_dbus_rack,					//应答信号模式,1为非应答NACK;0为应答ACK
	
	//读数据
	input i_dbus_rrq,					//读请求信号,高电平有效
	output [7:0]o_dbus_rdata,			//读数据,共8位
	output o_dbus_rbusy,				//读忙信号,高电平代表忙碌;低电平代表空闲
	
	//--------------管脚信号------------//
	input i_iic_sda,					//IIC输入SDA数据信号
	output o_iic_sda,					//IIC输出SDA数据信号
	output o_iic_sda_dir				//IIC输出SDA信号方向
);
	
	//------------------状态参数----------------//
	localparam ST_RD_IDLE = 5'b00001;
	localparam ST_RD_DATA = 5'b00010;
	localparam ST_RD_ACK = 5'b00100;
	localparam ST_RD_STOP = 5'b01000;
	localparam ST_RD_END = 5'b10000;
	
	//数据
	reg [7:0]read_data = 0;
	
	//计数
	reg [3:0]recv_cnt = 0;
	
	//状态机
	reg [4:0]state_current = ST_RD_IDLE;
	reg [4:0]state_next = ST_RD_IDLE;
	
	//----------------输入缓存信号--------------//
	//读配置
	reg dbus_rstop_i = 0;
	reg dbus_rhc_i = 0;
	reg dbus_rlc_i = 0;
	
	//读应答
	reg dbus_rack_i = 0;
	
	//管脚信号
	reg iic_sda_i = 0;
	
	//------------------输出信号---------------//
	//读数据
	reg [7:0]dbus_rdata_o = 0;
	reg dbus_rbusy_o = 0;
	
	//管脚信号
	reg iic_sda_o = 1'b1;
	reg iic_sda_dir_o = 0;
	
	//----------------输出信号连线-------------//
	//读数据
	assign o_dbus_rdata = dbus_rdata_o;
	assign o_dbus_rbusy = dbus_rbusy_o;
	
	//管脚信号
	assign o_iic_sda = iic_sda_o;
	assign o_iic_sda_dir = iic_sda_dir_o;
	
	//------------------信号输出---------------//
	//读数据信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_rdata_o <= 8'd0;
		else if(state_current == ST_RD_END)dbus_rdata_o <= read_data;
		else dbus_rdata_o <= dbus_rdata_o;
	end
	
	//读数据准备好信号
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_END)dbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_DATA)dbus_rbusy_o <= 1'b1;
		else dbus_rbusy_o <= dbus_rbusy_o;
	end
	
	//IIC管脚信号---数据线
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_sda_o <= 1'b1;
		else if(state_next == ST_RD_DATA)iic_sda_o <= 1'b1;
		else if(state_next == ST_RD_ACK)iic_sda_o <= dbus_rack_i;
		else if(state_next == ST_RD_STOP && dbus_rlc_i == 1'b1)iic_sda_o <= 1'b0;
		else if(state_next == ST_RD_STOP && dbus_rhc_i == 1'b1)iic_sda_o <= 1'b1;
		else iic_sda_o <= iic_sda_o;
	end
	
	//IIC管脚信号---数据输出方向
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_sda_dir_o <= 1'b1;
		else if(state_next == ST_RD_DATA)iic_sda_dir_o <= 1'b0;
		else iic_sda_dir_o <= 1'b1;
	end
	
	//-------------------状态机----------------//
	//主状态机
	always@(*)begin
		case(state_current)
			ST_RD_IDLE:begin
				if(i_dbus_rrq == 1'b1)state_next <= ST_RD_DATA;
				else state_next <= ST_RD_IDLE;
			end
			ST_RD_DATA:begin
				if(dbus_rlc_i == 1'b1 && recv_cnt == 4'd8)state_next <= ST_RD_ACK;
				else state_next <= ST_RD_DATA;
			end
			ST_RD_ACK:begin
				if(dbus_rlc_i == 1'b0 && dbus_rstop_i == 1'b1)state_next <= ST_RD_ACK;
				else if(dbus_rstop_i == 1'b1)state_next <= ST_RD_STOP;
				else state_next <= ST_RD_END;
			end
			ST_RD_STOP:begin
				if(dbus_rlc_i == 1'b1)state_next <= ST_RD_END;
				else state_next <= ST_RD_STOP;
			end
			ST_RD_END:state_next <= ST_RD_IDLE;
			default:state_next <= ST_RD_IDLE;
		endcase
	end
	
	//状态转换
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_RD_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------状态任务处理-------------//
	//接收计数
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)recv_cnt <= 4'd0;
		else if(state_next == ST_RD_DATA && dbus_rhc_i == 1'b1)recv_cnt <= recv_cnt + 4'd1;
		else if(state_next == ST_RD_DATA)recv_cnt <= recv_cnt;
		else recv_cnt <= 4'd0;
	end
	
	//读数据
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)read_data <= 8'd0;
		else if(state_next == ST_RD_DATA && dbus_rhc_i == 1'b1)read_data <= {read_data[6:0],iic_sda_i};
		else read_data <= read_data;
	end
	
	//----------------输入信号缓存-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			dbus_rstop_i <= 1'b0;
			dbus_rhc_i <= 1'b0;
			dbus_rlc_i <= 1'b0;
			dbus_rack_i <= 1'b0;
			iic_sda_i <= 1'b0;
		end else begin
			dbus_rstop_i <= i_dbus_rstop;
			dbus_rhc_i <= i_dbus_rhc;
			dbus_rlc_i <= i_dbus_rlc;
			dbus_rack_i <= i_dbus_rack;
			iic_sda_i <= i_iic_sda;
		end
	end
	
endmodule