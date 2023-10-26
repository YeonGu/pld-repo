`timescale 1ns / 1ps

////////////////////////////////////English///////////////////////////////////////
// Company:			Disp301 Experiment in SouthEast University
// Engineer:		Erie
// 
// Create Date: 	2020/07/24 18:42:36
// Design Name: 	OV5640 Driver
// Module Name: 	OV5640_Interface
// Description: 	None
// 
// Dependencies: 	None
//
// Dependent modules:
// 	 Module Name				    Version
// IIC_Interface					 V2.0
//
// Version:			V1.5
// Revision Date:	2021/10/19 17:13:27
// History:		
//    Time			   Version	   Revised by			Contents
// 2020/07/24			V1.0		 Erie		Create File and Driver_OV5640 module.
// 2020/10/14			V1.1		 Erie		Fix the problem of abnormal camera output video image caused by configuration error.
// 2020/10/30			V1.2		 Erie		Fix the problem of camera image resolution error.
// 2020/11/02			V1.3		 Erie		Change the IIC dependent version and modify the supporting OV5640_Config file.
// 2021/10/17			V1.4		 Erie		Change the IIC dependent version and integrate the OV5640 configuration file into this module.
// 2021/10/19			V1.5		 Erie		Renamed to OV5640_Interface, Add JPEG/RGB565 data format parameter selection, exposure compensation/white balance/auto focus/saturation/brightness/contrast/sharpness/special effects and other parameter settings.
///////////////////////////////////Chinese////////////////////////////////////////
// 版权归属:		东南大学显示中心301实验室
// 开发人员:		Erie
// 
// 创建日期: 		2020年07月24日
// 设计名称: 		OV5640 Driver
// 模块名称: 		OV5640_Interface
// 相关名称: 		None
// 
// 依赖资料: 		None
//
// 依赖模块:
// 	  模块名称						 版本
// IIC_Interface					 V2.0
//
// 当前版本:		V1.5
// 修订日期:		2021年10月19日
// 修订历史:
//		时间			版本		修订人				修订内容	
// 2020年07月24日		V1.0		 Erie		创建文件,编写OV5640驱动模块(Driver_OV5640)
// 2020年10月14日		V1.1		 Erie		修复因配置错误导致的摄像头输出视频图像异常问题
// 2020年10月30日		V1.2		 Erie		修复摄像头图像分辨率错误问题
// 2020年11月02日		V1.3		 Erie		更换IIC依赖版本,修改配套的OV5640_Config文件
// 2021年10月17日		V1.4		 Erie		更换IIC依赖版本,将OV5640配置文件集成进本模块
// 2021年10月19日		V1.5		 Erie		更名为OV5640_Interface,增加JPEG/RGB565数据格式参数选择,曝光补偿/白平衡/自动聚焦/饱和度/亮度/对比度/锐度/特效等参数设置

module OV5640_Interface #(
    parameter CLOCK_FREQ_MHZ = 13'd100,
    parameter IIC_Clock_KHz  = 13'd100
) (
    input i_clk,
    input i_rstn,

    //--------------IIC管脚信号-------------//
    input  i_iic_sda,     //IIC输入SDA数据信号
    output o_iic_scl,     //IIC输出SCL时钟信号
    output o_iic_sda,     //IIC输出SDA数据信号
    output o_iic_sda_dir  //IIC输出SDA信号方向
);

    //------------模块实例化信号------------//
    //配置模式信号
    wire       iic_mbus_rwslave_addr_mode;
    wire       iic_mbus_rwaddr_mode;
    wire       iic_mbus_rack;
    wire       iic_mbus_wack_enable;
    wire       iic_mbus_wack;
    wire       iic_mbus_rwmode;

    //配置数据信号
    wire [7:0] iic_mbus_rwslave_addr;
    wire [7:0] iic_mbus_rwaddr_h;
    wire [7:0] iic_mbus_rwaddr_l;

    //写通道
    wire       iic_mbus_wrq;
    wire [7:0] iic_mbus_wdata;
    wire       iic_mbus_wvalid;
    wire       iic_mbus_wlast;
    wire       iic_mbus_wready;

    //读通道
    wire       iic_mbus_rrq;
    wire       iic_mbus_rready;
    wire       iic_mbus_rlast;
    wire [7:0] iic_mbus_rdata;
    wire       iic_mbus_rvalid;

    //忙通道
    wire       iic_mbus_rwbusy;
    wire       iic_mbus_rwack_err;

    //OV5640配置模块实例化
    OV5640_Config #(
        .CLOCK_FREQ_MHZ       (CLOCK_FREQ_MHZ),
        .WAIT_TIME_MS         (500),             //上电后等待时间
        .COLD_TIME_MS         (5000),            //自动对焦冷却时间
        .DEVICE_ADDRESS       (8'h78),           //OV5640设备地址
        .IMAGE_MODE           (1'd0),            //输出图像模式,0:RGB565格式;1:JPEG格式;
        .IMAGE_SIZE_H         (16'd640),        //行像素,RGB565模式不得超过1280;JPEG模式不得超过2592
        .IMAGE_SIZE_V         (16'd480),         //场像素,RGB565模式不得超过800;JPEG模式不得超过1944
        .IMAGE_OFFEST_H       (16'd4),           //行开窗偏移值
        .IMAGE_OFFEST_V       (16'd0),           //场开窗偏移值
        .AUTO_FOCUS_MODE      (1'd0),            //自动聚焦模式,0:关闭自动聚焦模式;1:开启自动聚焦模式,需要耗费大量存储资源来进行聚焦配置
        .AUTO_FOCUS_CONFIG_NUM(16'd4085),        //聚焦配置数
        .WHITE_BALANCE_MODE   (3'd0),            //白平衡模式,0:自动;1:日光;2:办公室;3:阴天;4:家里;
        .SATURATION_MODE      (3'd3),            //饱和度模式,0~6对应-3~3
        .BRIGHTNESS_MODE      (4'd4),            //亮度模式,0~8对应-4~4
        .CONTRAST_MODE        (3'd3),            //对比度模式,0~6对应-3~3
        .SHARPNESS_MODE       (8'd33),           //锐度模式,0~32为人工配置模式;33~?为自动锐度模式
        .SPECIAL_EFECTS_MODE  (3'd0),            //特效模式,0:正常;1:冷色;2:暖色;3:黑白;4:偏黄;5:反色;6:偏绿;
        .EXPOSURE_MODE        (3'd3)             //曝光补偿模式,0~6对应-3~3
    ) OV5640_Config_Inst (
        .i_clk (i_clk),
        .i_rstn(i_rstn),

        //-------------外部控制信号-------------//
        //配置模式信号
        .o_mbus_rwslave_addr_mode(iic_mbus_rwslave_addr_mode),  //配置IIC从机地址模式,1'b0代表原始地址,需要左移7位,低位补零;1'b1代表移位之后地址,不需要再移位
        .o_mbus_rwaddr_mode      (iic_mbus_rwaddr_mode),        //配置IIC读写地址模式,1'b1代表双地址位;1'b0代表单地址位,此时低位地址有效
        .o_mbus_rack             (iic_mbus_rack),               //配置IIC读应答信号,1为非应答NACK;0为应答ACK
        .o_mbus_wack_enable      (iic_mbus_wack_enable),        //配置IIC写应答检测校验使能
        .o_mbus_wack             (iic_mbus_wack),               //配置IIC写应答信号校验值,1为非应答NACK;0为应答ACK
        .o_mbus_rwmode           (iic_mbus_rwmode),             //配置IIC读写数据模式,1'b1代表单字节读写;1'b0代表连续读写

        //配置数据信号
        .o_mbus_rwslave_addr(iic_mbus_rwslave_addr),  //配置IIC读写从机地址
        .o_mbus_rwaddr_h    (iic_mbus_rwaddr_h),      //配置IIC读写寄存器地址,高8位
        .o_mbus_rwaddr_l    (iic_mbus_rwaddr_l),      //配置IIC读写寄存器地址,低8位

        //写通道
        .o_mbus_wrq   (iic_mbus_wrq),     //写请求,高电平有效
        .o_mbus_wdata (iic_mbus_wdata),   //写数据
        .o_mbus_wvalid(iic_mbus_wvalid),  //写数据有效信号
        .o_mbus_wlast (iic_mbus_wlast),   //写最后一个
        .i_mbus_wready(iic_mbus_wready),  //写准备好信号*

        //读通道
        .o_mbus_rrq   (iic_mbus_rrq),     //读请求,高电平有效
        .o_mbus_rready(iic_mbus_rready),  //读准备好
        .o_mbus_rlast (iic_mbus_rlast),   //读最后一个
        .i_mbus_rdata (iic_mbus_rdata),   //读数据
        .i_mbus_rvalid(iic_mbus_rvalid),  //读数据有效信号

        //忙通道
        .i_mbus_rwbusy   (iic_mbus_rwbusy),    //读写忙信号,高电平代表忙碌,低电平代表空闲
        .i_mbus_rwack_err(iic_mbus_rwack_err)  //应答错误*
    );

    //IIC接口实例化
    IIC_Interface #(
        .CLOCK_FREQ_MHZ(CLOCK_FREQ_MHZ),
        .IIC_Clock_KHz (IIC_Clock_KHz)
    ) IIC_Interface_Inst (
        .i_clk (i_clk),
        .i_rstn(i_rstn),

        //-------------外部控制信号-------------//
        //配置模式信号
        .i_mbus_rwslave_addr_mode(iic_mbus_rwslave_addr_mode),  //配置IIC从机地址模式,1'b0代表原始地址,需要左移7位,低位补零;1'b1代表移位之后地址,不需要再移位
        .i_mbus_rwaddr_mode      (iic_mbus_rwaddr_mode),        //配置IIC读写地址模式,1'b1代表双地址位;1'b0代表单地址位,此时低位地址有效
        .i_mbus_rack             (iic_mbus_rack),               //配置IIC读应答信号,1为非应答NACK;0为应答ACK
        .i_mbus_wack_enable      (iic_mbus_wack_enable),        //配置IIC写应答检测校验使能
        .i_mbus_wack             (iic_mbus_wack),               //配置IIC写应答信号校验值,1为非应答NACK;0为应答ACK
        .i_mbus_rwmode           (iic_mbus_rwmode),             //配置IIC读写数据模式,1'b1代表单字节读写;1'b0代表连续读写

        //配置数据信号
        .i_mbus_rwslave_addr(iic_mbus_rwslave_addr),  //配置IIC读写从机地址
        .i_mbus_rwaddr_h    (iic_mbus_rwaddr_h),      //配置IIC读写寄存器地址,高8位
        .i_mbus_rwaddr_l    (iic_mbus_rwaddr_l),      //配置IIC读写寄存器地址,低8位

        //写通道
        .i_mbus_wrq   (iic_mbus_wrq),     //写请求,高电平有效
        .i_mbus_wdata (iic_mbus_wdata),   //写数据
        .i_mbus_wvalid(iic_mbus_wvalid),  //写数据有效信号
        .i_mbus_wlast (iic_mbus_wlast),   //写最后一个
        .o_mbus_wready(iic_mbus_wready),  //写准备好信号

        //读通道
        .i_mbus_rrq   (iic_mbus_rrq),     //读请求,高电平有效
        .i_mbus_rready(iic_mbus_rready),  //读准备好
        .i_mbus_rlast (iic_mbus_rlast),   //读最后一个
        .o_mbus_rdata (iic_mbus_rdata),   //读数据
        .o_mbus_rvalid(iic_mbus_rvalid),  //读数据有效信号

        //忙通道
        .o_mbus_rwbusy   (iic_mbus_rwbusy),    //读写忙信号,高电平代表忙碌,低电平代表空闲
        .o_mbus_rwack_err(iic_mbus_rwack_err), //应答错误

        //--------------IIC管脚信号-------------//
        .i_iic_sda    (i_iic_sda),     //IIC输入SDA数据信号
        .o_iic_scl    (o_iic_scl),     //IIC输出SCL时钟信号
        .o_iic_sda    (o_iic_sda),     //IIC输出SDA数据信号
        .o_iic_sda_dir(o_iic_sda_dir)  //IIC输出SDA信号方向
    );

endmodule

//OV5640配置模块
module OV5640_Config #(
    parameter CLOCK_FREQ_MHZ        = 13'd100,
    parameter WAIT_TIME_MS          = 500,       //上电后等待时间
    parameter COLD_TIME_MS          = 5000,      //自动对焦冷却时间
    parameter DEVICE_ADDRESS        = 8'h78,     //OV5640设备地址
    parameter IMAGE_MODE            = 1'd0,      //输出图像模式,0:RGB565格式;1:JPEG格式;
    parameter IMAGE_SIZE_H          = 16'd1024,  //行像素,RGB565模式不得超过1280;JPEG模式不得超过2592
    parameter IMAGE_SIZE_V          = 16'd768,   //场像素,RGB565模式不得超过800;JPEG模式不得超过1944
    parameter IMAGE_OFFEST_H        = 16'd0,     //行开窗偏移值
    parameter IMAGE_OFFEST_V        = 16'd0,     //场开窗偏移值
    parameter AUTO_FOCUS_MODE       = 1'd0,      //自动聚焦模式,0:关闭自动聚焦模式;1:开启自动聚焦模式,需要耗费大量存储资源来进行聚焦配置
    parameter AUTO_FOCUS_CONFIG_NUM = 16'd4085,  //聚焦配置数
    parameter WHITE_BALANCE_MODE    = 3'd0,      //白平衡模式,0:自动;1:日光;2:办公室;3:阴天;4:家里;
    parameter SATURATION_MODE       = 3'd3,      //饱和度模式,0~6对应-3~3
    parameter BRIGHTNESS_MODE       = 4'd4,      //亮度模式,0~8对应-4~4
    parameter CONTRAST_MODE         = 3'd3,      //对比度模式,0~6对应-3~3
    parameter SHARPNESS_MODE        = 8'd33,     //锐度模式,0~32为人工配置模式;33~?为自动锐度模式
    parameter SPECIAL_EFECTS_MODE   = 3'd0,      //特效模式,0:正常;1:冷色;2:暖色;3:黑白;4:偏黄;5:反色;6:偏绿;
    parameter EXPOSURE_MODE         = 3'd3       //曝光补偿模式,0~6对应-3~3
) (
    input i_clk,
    input i_rstn,

    //-------------外部控制信号-------------//
    //配置模式信号
    output o_mbus_rwslave_addr_mode,  //配置IIC从机地址模式,1'b0代表原始地址,需要左移7位,低位补零;1'b1代表移位之后地址,不需要再移位
    output o_mbus_rwaddr_mode,        //配置IIC读写地址模式,1'b1代表双地址位;1'b0代表单地址位,此时低位地址有效
    output o_mbus_rack,               //配置IIC读应答信号,1为非应答NACK;0为应答ACK
    output o_mbus_wack_enable,        //配置IIC写应答检测校验使能
    output o_mbus_wack,               //配置IIC写应答信号校验值,1为非应答NACK;0为应答ACK
    output o_mbus_rwmode,             //配置IIC读写数据模式,1'b1代表单字节读写;1'b0代表连续读写

    //配置数据信号
    output [7:0] o_mbus_rwslave_addr,  //配置IIC读写从机地址
    output [7:0] o_mbus_rwaddr_h,      //配置IIC读写寄存器地址,高8位
    output [7:0] o_mbus_rwaddr_l,      //配置IIC读写寄存器地址,低8位

    //写通道
    output       o_mbus_wrq,     //写请求,高电平有效
    output [7:0] o_mbus_wdata,   //写数据
    output       o_mbus_wvalid,  //写数据有效信号
    output       o_mbus_wlast,   //写最后一个
    input        i_mbus_wready,  //写准备好信号*

    //读通道
    output       o_mbus_rrq,     //读请求,高电平有效
    output       o_mbus_rready,  //读准备好
    output       o_mbus_rlast,   //读最后一个
    input  [7:0] i_mbus_rdata,   //读数据
    input        i_mbus_rvalid,  //读数据有效信号

    //忙通道
    input i_mbus_rwbusy,    //读写忙信号,高电平代表忙碌,低电平代表空闲
    input i_mbus_rwack_err  //应答错误*
);
    //------------------其他参数----------------//
    //时间计数
    localparam WAIT_NUM = CLOCK_FREQ_MHZ * WAIT_TIME_MS * 1000;
    localparam COLD_NUM = CLOCK_FREQ_MHZ * COLD_TIME_MS * 1000;

    //长度配置
    localparam IMAGE_H_END = IMAGE_OFFEST_H + IMAGE_SIZE_H - 1;
    localparam IMAGE_V_END = IMAGE_OFFEST_V + IMAGE_SIZE_V - 1;

    //配置长度
    localparam CONFIG_INIT_NUM = 16'd330 - IMAGE_MODE * 4;

    //------------------状态参数----------------//
    localparam ST_WR_IDLE = 3'd0;
    localparam ST_WR_WAIT = 3'd1;
    localparam ST_WR_START = 3'd2;
    localparam ST_WR_EXPOSURE_WAIT = 3'd3;
    localparam ST_WR_EXPOSURE = 3'd4;
    localparam ST_WR_END = 3'd5;

    //ROM数据
    wire [55:0] rom_lut_data_white_balance;
    wire [47:0] rom_lut_data_saturation;
    wire [15:0] rom_lut_data_brightness;
    wire [15:0] rom_lut_data_contrast;
    wire [23:0] rom_lut_data_special_effects;
    wire [47:0] rom_lut_data_exposure;
    wire [23:0] rom_lut_data_auto_focus;

    //计数
    reg  [31:0] wait_cnt = 0;  //初始化等待计数
    reg  [15:0] send_cnt = 0;  //发送计数
    reg  [15:0] af_cnt = 0;  //自动对焦配置计数
    reg  [31:0] cold_cnt = 0;  //冷却计数

    //LUT数据
    reg  [23:0] LUT_Data = 0;

    //状态机
    reg  [ 2:0] state_current = 0;
    reg  [ 2:0] state_next = 0;

    //----------------输入缓存信号--------------//
    //写通道
    reg  [ 1:0] mbus_wready_i = 0;

    //忙通道
    reg  [ 1:0] mbus_rwbusy_i = 0;
    reg         mbus_rwack_err_i = 0;

    //------------------输出信号---------------//
    //配置数据信号
    reg  [ 7:0] mbus_rwaddr_h_o = 0;
    reg  [ 7:0] mbus_rwaddr_l_o = 0;

    //写通道
    reg         mbus_wrq_o = 0;
    reg  [ 7:0] mbus_wdata_o = 0;

    //----------------输出信号连线-------------//
    //配置模式信号
    assign o_mbus_rwslave_addr_mode = 1'b1;  //移位之后地址,不需要再移位
    assign o_mbus_rwaddr_mode       = 1'b1;  //双地址位
    assign o_mbus_rack              = 1'b0;  //0为应答ACK
    assign o_mbus_wack_enable       = 1'b0;  //写应答检测校验使能关闭
    assign o_mbus_wack              = 1'b0;  //0为应答ACK
    assign o_mbus_rwmode            = 1'b1;  //单字节读写

    //数据信号
    assign o_mbus_rwslave_addr      = DEVICE_ADDRESS;  //IIC读写从机地址为默认器件地址
    assign o_mbus_rwaddr_h          = mbus_rwaddr_h_o;  //寄存器地址,高8位
    assign o_mbus_rwaddr_l          = mbus_rwaddr_l_o;  //寄存器地址,低8位

    //写通道
    assign o_mbus_wrq               = mbus_wrq_o;  //写请求,高电平有效
    assign o_mbus_wdata             = mbus_wdata_o;  //写数据
    assign o_mbus_wvalid            = 1'b1;  //写数据有效信号
    assign o_mbus_wlast             = 1'b1;  //写最后一个,每次只写1个

    //读通道
    assign o_mbus_rrq               = 1'b0;  //读请求,高电平有效,默认无读操作
    assign o_mbus_rready            = 1'b0;  //读准备好,默认无读操作
    assign o_mbus_rlast             = 1'b0;  //每次只读1个,默认无读操作

    //------------------信号输出---------------//
    //数据信号--寄存器地址-高8位
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) mbus_rwaddr_h_o <= 8'd0;
        else if (state_current == ST_WR_WAIT) mbus_rwaddr_h_o <= LUT_Data[23:16];
        else if (state_current == ST_WR_EXPOSURE_WAIT) mbus_rwaddr_h_o <= rom_lut_data_auto_focus[23:16];
        else if (state_current == ST_WR_END) mbus_rwaddr_h_o <= 8'h30;
        else mbus_rwaddr_h_o <= mbus_rwaddr_h_o;
    end

    //数据信号--寄存器地址-低8位
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) mbus_rwaddr_l_o <= 8'd0;
        else if (state_current == ST_WR_WAIT) mbus_rwaddr_l_o <= LUT_Data[15:8];
        else if (state_current == ST_WR_EXPOSURE_WAIT) mbus_rwaddr_l_o <= rom_lut_data_auto_focus[15:8];
        else if (state_current == ST_WR_END) mbus_rwaddr_l_o <= 8'h22;
        else mbus_rwaddr_l_o <= mbus_rwaddr_l_o;
    end

    //写通道--写请求信号
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) mbus_wrq_o <= 1'd0;
        else if (state_current == ST_WR_WAIT) mbus_wrq_o <= 1'd1;
        else if (state_current == ST_WR_EXPOSURE_WAIT) mbus_wrq_o <= 1'd1;
        else if (AUTO_FOCUS_MODE == 1'b0) mbus_wrq_o <= 1'd0;
        else if (state_current == ST_WR_END && cold_cnt == COLD_NUM) mbus_wrq_o <= 1'd1;  //执行自动聚焦指令
        else mbus_wrq_o <= 1'd0;
    end

    //写通道--写数据信号
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) mbus_wdata_o <= 8'd0;
        else if (state_current == ST_WR_WAIT) mbus_wdata_o <= LUT_Data[7:0];
        else if (state_current == ST_WR_EXPOSURE_WAIT) mbus_wdata_o <= rom_lut_data_auto_focus[7:0];
        else if (state_current == ST_WR_END) mbus_wdata_o <= 8'h03;
        else mbus_wdata_o <= mbus_wdata_o;
    end

    //-------------------状态机----------------//
    //主状态机
    always @(*) begin
        case (state_current)
            ST_WR_IDLE: begin
                if (wait_cnt >= WAIT_NUM) state_next <= ST_WR_WAIT;
                else state_next <= ST_WR_IDLE;
            end
            ST_WR_WAIT: state_next <= ST_WR_START;
            ST_WR_START: begin
                if (mbus_rwbusy_i == 2'b10 && send_cnt > CONFIG_INIT_NUM && AUTO_FOCUS_MODE == 1'b0) state_next <= ST_WR_END;
                else if (mbus_rwbusy_i == 2'b10 && send_cnt > CONFIG_INIT_NUM) state_next <= ST_WR_EXPOSURE_WAIT;
                else if (mbus_rwbusy_i == 2'b10) state_next <= ST_WR_WAIT;
                else state_next <= ST_WR_START;
            end
            ST_WR_EXPOSURE_WAIT: state_next <= ST_WR_EXPOSURE;
            ST_WR_EXPOSURE: begin
                if (mbus_rwbusy_i == 2'b10 && af_cnt > AUTO_FOCUS_CONFIG_NUM) state_next <= ST_WR_END;
                else if (mbus_rwbusy_i == 2'b10) state_next <= ST_WR_EXPOSURE_WAIT;
                else state_next <= ST_WR_EXPOSURE;
            end
            ST_WR_END: state_next <= ST_WR_END;
            default: state_next <= ST_WR_IDLE;
        endcase
    end

    //状态转换
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) begin
            state_current <= ST_WR_IDLE;
        end else begin
            state_current <= state_next;
        end
    end

    //----------------状态任务处理-------------//
    //等待计数
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) wait_cnt <= 32'd0;
        else if (state_current == ST_WR_IDLE) wait_cnt <= wait_cnt + 32'd1;
        else wait_cnt <= 32'd0;
    end

    //发送计数
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) send_cnt <= 16'd0;
        else if (state_current == ST_WR_IDLE) send_cnt <= 16'd0;
        else if (state_current == ST_WR_START && mbus_rwbusy_i == 2'b10) send_cnt <= send_cnt + 16'd1;
        else send_cnt <= send_cnt;
    end

    //曝光计数
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) af_cnt <= 16'd0;
        else if (state_current == ST_WR_IDLE) af_cnt <= 16'd0;
        else if (state_current == ST_WR_EXPOSURE_WAIT && mbus_rwbusy_i == 2'b10) af_cnt <= af_cnt + 16'd1;
        else af_cnt <= af_cnt;
    end

    //自动对焦计数
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) cold_cnt <= 32'd0;
        else if (state_current == ST_WR_END) cold_cnt <= cold_cnt + 32'd1;
        else if (state_current == ST_WR_END && mbus_rwbusy_i == 2'b10) cold_cnt <= 32'd0;
        else cold_cnt <= 32'd0;
    end

    //白平衡存储ROM模块实例化
    ROM_OV5640_White_Balance ROM_OV5640_White_Balance_Inst (
        .i_index   (WHITE_BALANCE_MODE),
        .o_lut_data(rom_lut_data_white_balance)
    );

    //饱和度存储ROM模块实例化
    ROM_OV5640_Saturation ROM_OV5640_Saturation_Inst (
        .i_index   (SATURATION_MODE),
        .o_lut_data(rom_lut_data_saturation)
    );

    //亮度存储ROM模块实例化
    ROM_OV5640_Brightness ROM_OV5640_Brightness_Inst (
        .i_bright  (BRIGHTNESS_MODE),
        .o_lut_data(rom_lut_data_brightness)
    );

    //对比度存储ROM模块实例化
    ROM_OV5640_Contrast ROM_OV5640_Contrast_Inst (
        .i_contrast(CONTRAST_MODE),
        .o_lut_data(rom_lut_data_contrast)
    );

    //特效存储ROM模块实例化
    ROM_OV5640_Special_Effects ROM_OV5640_Special_Effects_Inst (
        .i_index   (SPECIAL_EFECTS_MODE),
        .o_lut_data(rom_lut_data_special_effects)
    );

    //曝光补偿存储ROM模块实例化
    ROM_OV5640_Exposure ROM_OV5640_Exposure_Inst (
        .i_index   (EXPOSURE_MODE),
        .o_lut_data(rom_lut_data_exposure)
    );

    //自动对焦存储ROM模块实例化
    ROM_OV5640_Auto_Focus ROM_OV5640_Auto_Focus_Inst (
        .i_index   (af_cnt),
        .o_lut_data(rom_lut_data_auto_focus)
    );

    //----------------输入信号缓存-------------//
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) begin
            mbus_wready_i    <= 2'd0;
            mbus_rwbusy_i    <= 2'd0;
            mbus_rwack_err_i <= 1'd0;
        end else begin
            mbus_wready_i    <= {mbus_wready_i[0], i_mbus_wready};
            mbus_rwbusy_i    <= {mbus_rwbusy_i[0], i_mbus_rwbusy};
            mbus_rwack_err_i <= i_mbus_rwack_err;
        end
    end

    //------------------LUT查找表--------------//
    //RGB565模式
    generate
        if (IMAGE_MODE == 1'b0) begin : gen_RGB565_CONFIG
            always @(*) begin
                case (send_cnt)
                    16'd0: LUT_Data <= {8'h31, 8'h03, 8'h11};  // system clock from pad, bit[1]
                    16'd1: LUT_Data <= {8'h30, 8'h08, 8'h82};  // 软复位

                    // 24MHz input clock, 24MHz PCLK
                    16'd2: LUT_Data <= {8'h30, 8'h08, 8'h42};  // software power down, bit[6]
                    16'd3: LUT_Data <= {8'h31, 8'h03, 8'h03};  // system clock from PLL, bit[1]
                    16'd4: LUT_Data <= {8'h30, 8'h17, 8'hff};  // FREX, Vsync, HREF, PCLK, D[9:6] output enable
                    16'd5: LUT_Data <= {8'h30, 8'h18, 8'hff};  // D[5:0], GPIO[1:0] output enable
                    16'd6: LUT_Data <= {8'h30, 8'h34, 8'h1a};  // MIPI 10-bit
                    16'd7: LUT_Data <= {8'h30, 8'h37, 8'h13};  // PLL root divider, bit[4], PLL pre-divider, bit[3:0]
                    16'd8: LUT_Data <= {8'h31, 8'h08, 8'h01};  // PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2]

                    // SCLK root divider, bit[1:0]
                    16'd9:  LUT_Data <= {8'h36, 8'h30, 8'h36};
                    16'd10: LUT_Data <= {8'h36, 8'h31, 8'h0e};
                    16'd11: LUT_Data <= {8'h36, 8'h32, 8'he2};
                    16'd12: LUT_Data <= {8'h36, 8'h33, 8'h12};
                    16'd13: LUT_Data <= {8'h36, 8'h21, 8'he0};
                    16'd14: LUT_Data <= {8'h37, 8'h04, 8'ha0};
                    16'd15: LUT_Data <= {8'h37, 8'h03, 8'h5a};
                    16'd16: LUT_Data <= {8'h37, 8'h15, 8'h78};
                    16'd17: LUT_Data <= {8'h37, 8'h17, 8'h01};
                    16'd18: LUT_Data <= {8'h37, 8'h0b, 8'h60};
                    16'd19: LUT_Data <= {8'h37, 8'h05, 8'h1a};
                    16'd20: LUT_Data <= {8'h39, 8'h05, 8'h02};
                    16'd21: LUT_Data <= {8'h39, 8'h06, 8'h10};
                    16'd22: LUT_Data <= {8'h39, 8'h01, 8'h0a};
                    16'd23: LUT_Data <= {8'h37, 8'h31, 8'h12};
                    16'd24: LUT_Data <= {8'h36, 8'h00, 8'h08};  // VCM control
                    16'd25: LUT_Data <= {8'h36, 8'h01, 8'h33};  // VCM control
                    16'd26: LUT_Data <= {8'h30, 8'h2d, 8'h60};  // system control
                    16'd27: LUT_Data <= {8'h36, 8'h20, 8'h52};
                    16'd28: LUT_Data <= {8'h37, 8'h1b, 8'h20};
                    16'd29: LUT_Data <= {8'h47, 8'h1c, 8'h50};
                    16'd30: LUT_Data <= {8'h3a, 8'h13, 8'h43};  // pre-gain = 1.047x
                    16'd31: LUT_Data <= {8'h3a, 8'h18, 8'h00};  // gain ceiling
                    16'd32: LUT_Data <= {8'h3a, 8'h19, 8'hf8};  // gain ceiling = 15.5x
                    16'd33: LUT_Data <= {8'h36, 8'h35, 8'h13};
                    16'd34: LUT_Data <= {8'h36, 8'h36, 8'h03};
                    16'd35: LUT_Data <= {8'h36, 8'h34, 8'h40};
                    16'd36: LUT_Data <= {8'h36, 8'h22, 8'h01};

                    // 50/60Hz detection 50/60Hz 灯光条纹过滤
                    16'd37: LUT_Data <= {8'h3c, 8'h01, 8'h34};  // Band auto, bit[7]
                    16'd38: LUT_Data <= {8'h3c, 8'h04, 8'h28};  // threshold low sum
                    16'd39: LUT_Data <= {8'h3c, 8'h05, 8'h98};  // threshold high sum
                    16'd40: LUT_Data <= {8'h3c, 8'h06, 8'h00};  // light meter 1 threshold[15:8]
                    16'd41: LUT_Data <= {8'h3c, 8'h07, 8'h08};  // light meter 1 threshold[7:0]
                    16'd42: LUT_Data <= {8'h3c, 8'h08, 8'h00};  // light meter 2 threshold[15:8]
                    16'd43: LUT_Data <= {8'h3c, 8'h09, 8'h1c};  // light meter 2 threshold[7:0]
                    16'd44: LUT_Data <= {8'h3c, 8'h0a, 8'h9c};  // sample number[15:8]
                    16'd45: LUT_Data <= {8'h3c, 8'h0b, 8'h40};  // sample number[7:0]
                    16'd46: LUT_Data <= {8'h38, 8'h10, 8'h00};  // Timing Hoffset[11:8]
                    16'd47: LUT_Data <= {8'h38, 8'h11, 8'h10};  // Timing Hoffset[7:0]
                    16'd48: LUT_Data <= {8'h38, 8'h12, 8'h00};  // Timing Voffset[10:8]
                    16'd49: LUT_Data <= {8'h37, 8'h08, 8'h64};
                    16'd50: LUT_Data <= {8'h40, 8'h01, 8'h02};  // BLC start from line 2
                    16'd51: LUT_Data <= {8'h40, 8'h05, 8'h1a};  // BLC always update
                    16'd52: LUT_Data <= {8'h30, 8'h00, 8'h00};  // enable blocks
                    16'd53: LUT_Data <= {8'h30, 8'h04, 8'hff};  // enable clocks
                    16'd54: LUT_Data <= {8'h30, 8'h0e, 8'h58};  // MIPI power down, DVP enable
                    16'd55: LUT_Data <= {8'h30, 8'h2e, 8'h00};
                    16'd56: LUT_Data <= {8'h43, 8'h00, 8'h30};  // YUV 422, YUYV
                    16'd57: LUT_Data <= {8'h50, 8'h1f, 8'h00};  // YUV 422
                    16'd58: LUT_Data <= {8'h44, 8'h0e, 8'h00};
                    16'd59: LUT_Data <= {8'h50, 8'h00, 8'ha7};  // Lenc on, raw gamma on, BPC on, WPC on, CIP on

                    // AEC target 自动曝光控制
                    16'd60: LUT_Data <= {8'h3a, 8'h0f, 8'h30};  // stable range in high
                    16'd61: LUT_Data <= {8'h3a, 8'h10, 8'h28};  // stable range in low
                    16'd62: LUT_Data <= {8'h3a, 8'h1b, 8'h30};  // stable range out high
                    16'd63: LUT_Data <= {8'h3a, 8'h1e, 8'h26};  // stable range out low
                    16'd64: LUT_Data <= {8'h3a, 8'h11, 8'h60};  // fast zone high
                    16'd65: LUT_Data <= {8'h3a, 8'h1f, 8'h14};  // fast zone low

                    // Lens correction for ? 镜头补偿
                    16'd66:  LUT_Data <= {8'h58, 8'h00, 8'h23};
                    16'd67:  LUT_Data <= {8'h58, 8'h01, 8'h14};
                    16'd68:  LUT_Data <= {8'h58, 8'h02, 8'h0f};
                    16'd69:  LUT_Data <= {8'h58, 8'h03, 8'h0f};
                    16'd70:  LUT_Data <= {8'h58, 8'h04, 8'h12};
                    16'd71:  LUT_Data <= {8'h58, 8'h05, 8'h26};
                    16'd72:  LUT_Data <= {8'h58, 8'h06, 8'h0c};
                    16'd73:  LUT_Data <= {8'h58, 8'h07, 8'h08};
                    16'd74:  LUT_Data <= {8'h58, 8'h08, 8'h05};
                    16'd75:  LUT_Data <= {8'h58, 8'h09, 8'h05};
                    16'd76:  LUT_Data <= {8'h58, 8'h0a, 8'h08};
                    16'd77:  LUT_Data <= {8'h58, 8'h0b, 8'h0d};
                    16'd78:  LUT_Data <= {8'h58, 8'h0c, 8'h08};
                    16'd79:  LUT_Data <= {8'h58, 8'h0d, 8'h03};
                    16'd80:  LUT_Data <= {8'h58, 8'h0e, 8'h00};
                    16'd81:  LUT_Data <= {8'h58, 8'h0f, 8'h00};
                    16'd82:  LUT_Data <= {8'h58, 8'h10, 8'h03};
                    16'd83:  LUT_Data <= {8'h58, 8'h11, 8'h09};
                    16'd84:  LUT_Data <= {8'h58, 8'h12, 8'h07};
                    16'd85:  LUT_Data <= {8'h58, 8'h13, 8'h03};
                    16'd86:  LUT_Data <= {8'h58, 8'h14, 8'h00};
                    16'd87:  LUT_Data <= {8'h58, 8'h15, 8'h01};
                    16'd88:  LUT_Data <= {8'h58, 8'h16, 8'h03};
                    16'd89:  LUT_Data <= {8'h58, 8'h17, 8'h08};
                    16'd90:  LUT_Data <= {8'h58, 8'h18, 8'h0d};
                    16'd91:  LUT_Data <= {8'h58, 8'h19, 8'h08};
                    16'd92:  LUT_Data <= {8'h58, 8'h1a, 8'h05};
                    16'd93:  LUT_Data <= {8'h58, 8'h1b, 8'h06};
                    16'd94:  LUT_Data <= {8'h58, 8'h1c, 8'h08};
                    16'd95:  LUT_Data <= {8'h58, 8'h1d, 8'h0e};
                    16'd96:  LUT_Data <= {8'h58, 8'h1e, 8'h29};
                    16'd97:  LUT_Data <= {8'h58, 8'h1f, 8'h17};
                    16'd98:  LUT_Data <= {8'h58, 8'h20, 8'h11};
                    16'd99:  LUT_Data <= {8'h58, 8'h21, 8'h11};
                    16'd100: LUT_Data <= {8'h58, 8'h22, 8'h15};
                    16'd101: LUT_Data <= {8'h58, 8'h23, 8'h28};
                    16'd102: LUT_Data <= {8'h58, 8'h24, 8'h46};
                    16'd103: LUT_Data <= {8'h58, 8'h25, 8'h26};
                    16'd104: LUT_Data <= {8'h58, 8'h26, 8'h08};
                    16'd105: LUT_Data <= {8'h58, 8'h27, 8'h26};
                    16'd106: LUT_Data <= {8'h58, 8'h28, 8'h64};
                    16'd107: LUT_Data <= {8'h58, 8'h29, 8'h26};
                    16'd108: LUT_Data <= {8'h58, 8'h2a, 8'h24};
                    16'd109: LUT_Data <= {8'h58, 8'h2b, 8'h22};
                    16'd110: LUT_Data <= {8'h58, 8'h2c, 8'h24};
                    16'd111: LUT_Data <= {8'h58, 8'h2d, 8'h24};
                    16'd112: LUT_Data <= {8'h58, 8'h2e, 8'h06};
                    16'd113: LUT_Data <= {8'h58, 8'h2f, 8'h22};
                    16'd114: LUT_Data <= {8'h58, 8'h30, 8'h40};
                    16'd115: LUT_Data <= {8'h58, 8'h31, 8'h42};
                    16'd116: LUT_Data <= {8'h58, 8'h32, 8'h24};
                    16'd117: LUT_Data <= {8'h58, 8'h33, 8'h26};
                    16'd118: LUT_Data <= {8'h58, 8'h34, 8'h24};
                    16'd119: LUT_Data <= {8'h58, 8'h35, 8'h22};
                    16'd120: LUT_Data <= {8'h58, 8'h36, 8'h22};
                    16'd121: LUT_Data <= {8'h58, 8'h37, 8'h26};
                    16'd122: LUT_Data <= {8'h58, 8'h38, 8'h44};
                    16'd123: LUT_Data <= {8'h58, 8'h39, 8'h24};
                    16'd124: LUT_Data <= {8'h58, 8'h3a, 8'h26};
                    16'd125: LUT_Data <= {8'h58, 8'h3b, 8'h28};
                    16'd126: LUT_Data <= {8'h58, 8'h3c, 8'h42};
                    16'd127: LUT_Data <= {8'h58, 8'h3d, 8'hce};  // lenc BR offset

                    // AWB 自动白平衡
                    16'd128: LUT_Data <= {8'h51, 8'h80, 8'hff};  // AWB B block
                    16'd129: LUT_Data <= {8'h51, 8'h81, 8'hf2};  // AWB control
                    16'd130: LUT_Data <= {8'h51, 8'h82, 8'h00};  // [7:4] max local counter, [3:0] max fast counter
                    16'd131: LUT_Data <= {8'h51, 8'h83, 8'h14};  // AWB advanced
                    16'd132: LUT_Data <= {8'h51, 8'h84, 8'h25};
                    16'd133: LUT_Data <= {8'h51, 8'h85, 8'h24};
                    16'd134: LUT_Data <= {8'h51, 8'h86, 8'h09};
                    16'd135: LUT_Data <= {8'h51, 8'h87, 8'h09};
                    16'd136: LUT_Data <= {8'h51, 8'h88, 8'h09};
                    16'd137: LUT_Data <= {8'h51, 8'h89, 8'h75};
                    16'd138: LUT_Data <= {8'h51, 8'h8a, 8'h54};
                    16'd139: LUT_Data <= {8'h51, 8'h8b, 8'he0};
                    16'd140: LUT_Data <= {8'h51, 8'h8c, 8'hb2};
                    16'd141: LUT_Data <= {8'h51, 8'h8d, 8'h42};
                    16'd142: LUT_Data <= {8'h51, 8'h8e, 8'h3d};
                    16'd143: LUT_Data <= {8'h51, 8'h8f, 8'h56};
                    16'd144: LUT_Data <= {8'h51, 8'h90, 8'h46};
                    16'd145: LUT_Data <= {8'h51, 8'h91, 8'hf8};  // AWB top limit
                    16'd146: LUT_Data <= {8'h51, 8'h92, 8'h04};  // AWB bottom limit
                    16'd147: LUT_Data <= {8'h51, 8'h93, 8'h70};  // red limit
                    16'd148: LUT_Data <= {8'h51, 8'h94, 8'hf0};  // green limit
                    16'd149: LUT_Data <= {8'h51, 8'h95, 8'hf0};  // blue limit
                    16'd150: LUT_Data <= {8'h51, 8'h96, 8'h03};  // AWB control
                    16'd151: LUT_Data <= {8'h51, 8'h97, 8'h01};  // local limit
                    16'd152: LUT_Data <= {8'h51, 8'h98, 8'h04};
                    16'd153: LUT_Data <= {8'h51, 8'h99, 8'h12};
                    16'd154: LUT_Data <= {8'h51, 8'h9a, 8'h04};
                    16'd155: LUT_Data <= {8'h51, 8'h9b, 8'h00};
                    16'd156: LUT_Data <= {8'h51, 8'h9c, 8'h06};
                    16'd157: LUT_Data <= {8'h51, 8'h9d, 8'h82};
                    16'd158: LUT_Data <= {8'h51, 8'h9e, 8'h38};  // AWB control

                    // Gamma 伽玛曲线
                    16'd159: LUT_Data <= {8'h54, 8'h80, 8'h01};  // Gamma bias plus on, bit[0]
                    16'd160: LUT_Data <= {8'h54, 8'h81, 8'h08};
                    16'd161: LUT_Data <= {8'h54, 8'h82, 8'h14};
                    16'd162: LUT_Data <= {8'h54, 8'h83, 8'h28};
                    16'd163: LUT_Data <= {8'h54, 8'h84, 8'h51};
                    16'd164: LUT_Data <= {8'h54, 8'h85, 8'h65};
                    16'd165: LUT_Data <= {8'h54, 8'h86, 8'h71};
                    16'd166: LUT_Data <= {8'h54, 8'h87, 8'h7d};
                    16'd167: LUT_Data <= {8'h54, 8'h88, 8'h87};
                    16'd168: LUT_Data <= {8'h54, 8'h89, 8'h91};
                    16'd169: LUT_Data <= {8'h54, 8'h8a, 8'h9a};
                    16'd170: LUT_Data <= {8'h54, 8'h8b, 8'haa};
                    16'd171: LUT_Data <= {8'h54, 8'h8c, 8'hb8};
                    16'd172: LUT_Data <= {8'h54, 8'h8d, 8'hcd};
                    16'd173: LUT_Data <= {8'h54, 8'h8e, 8'hdd};
                    16'd174: LUT_Data <= {8'h54, 8'h8f, 8'hea};
                    16'd175: LUT_Data <= {8'h54, 8'h90, 8'h1d};

                    // color matrix 色彩矩阵	
                    16'd176: LUT_Data <= {8'h53, 8'h81, 8'h1e};  // CMX1 for Y
                    16'd177: LUT_Data <= {8'h53, 8'h82, 8'h5b};  // CMX2 for Y
                    16'd178: LUT_Data <= {8'h53, 8'h83, 8'h08};  // CMX3 for Y
                    16'd179: LUT_Data <= {8'h53, 8'h84, 8'h0a};  // CMX4 for U
                    16'd180: LUT_Data <= {8'h53, 8'h85, 8'h7e};  // CMX5 for U
                    16'd181: LUT_Data <= {8'h53, 8'h86, 8'h88};  // CMX6 for U
                    16'd182: LUT_Data <= {8'h53, 8'h87, 8'h7c};  // CMX7 for V
                    16'd183: LUT_Data <= {8'h53, 8'h88, 8'h6c};  // CMX8 for V
                    16'd184: LUT_Data <= {8'h53, 8'h89, 8'h10};  // CMX9 for V
                    16'd185: LUT_Data <= {8'h53, 8'h8a, 8'h01};  // sign[9]
                    16'd186: LUT_Data <= {8'h53, 8'h8b, 8'h98};  // sign[8:1]

                    // UV adjust UV 色彩饱和度调整
                    16'd187: LUT_Data <= {8'h55, 8'h80, 8'h06};  // saturation on, bit[1]
                    16'd188: LUT_Data <= {8'h55, 8'h83, 8'h40};
                    16'd189: LUT_Data <= {8'h55, 8'h84, 8'h10};
                    16'd190: LUT_Data <= {8'h55, 8'h89, 8'h10};
                    16'd191: LUT_Data <= {8'h55, 8'h8a, 8'h00};
                    16'd192: LUT_Data <= {8'h55, 8'h8b, 8'hf8};
                    16'd193: LUT_Data <= {8'h50, 8'h1d, 8'h40};  // enable manual offset of contrast

                    // CIP 锐化和降噪
                    16'd194: LUT_Data <= {8'h53, 8'h00, 8'h08};  // CIP sharpen MT threshold 1
                    16'd195: LUT_Data <= {8'h53, 8'h01, 8'h30};  // CIP sharpen MT threshold 2
                    16'd196: LUT_Data <= {8'h53, 8'h02, 8'h10};  // CIP sharpen MT offset 1
                    16'd197: LUT_Data <= {8'h53, 8'h03, 8'h00};  // CIP sharpen MT offset 2
                    16'd198: LUT_Data <= {8'h53, 8'h04, 8'h08};  // CIP DNS threshold 1
                    16'd199: LUT_Data <= {8'h53, 8'h05, 8'h30};  // CIP DNS threshold 2
                    16'd200: LUT_Data <= {8'h53, 8'h06, 8'h08};  // CIP DNS offset 1
                    16'd201: LUT_Data <= {8'h53, 8'h07, 8'h16};  // CIP DNS offset 2
                    16'd202: LUT_Data <= {8'h53, 8'h09, 8'h08};  // CIP sharpen TH threshold 1
                    16'd203: LUT_Data <= {8'h53, 8'h0a, 8'h30};  // CIP sharpen TH threshold 2
                    16'd204: LUT_Data <= {8'h53, 8'h0b, 8'h04};  // CIP sharpen TH offset 1
                    16'd205: LUT_Data <= {8'h53, 8'h0c, 8'h06};  // CIP sharpen TH offset 2
                    16'd206: LUT_Data <= {8'h50, 8'h25, 8'h00};
                    16'd207: LUT_Data <= {8'h30, 8'h08, 8'h02};  // wake up from standby, bit[6]

                    //自行添加的设置
                    16'd208: LUT_Data <= {8'h47, 8'h40, 8'h21};  // PCLK下降沿更新,bit[5];VSYNC高有效,bit[0];HSYNC低有效bit[1]

                    //----------------------RGB565数据模式-------------------------//
                    16'd209: LUT_Data <= {8'h43, 8'h00, 8'h60};  //RGB565, B5G6R5
                    16'd210: LUT_Data <= {8'h50, 8'h1F, 8'h01};

                    // 1280x800, 15fps
                    // input clock 24Mhz, PCLK 42Mhz
                    16'd211: LUT_Data <= {8'h30, 8'h35, 8'h21};  // PLL
                    16'd212: LUT_Data <= {8'h30, 8'h36, 8'h69};  // PLL
                    16'd213: LUT_Data <= {8'h3c, 8'h07, 8'h07};  // lightmeter 1 threshold[7:0]
                    16'd214: LUT_Data <= {8'h38, 8'h20, 8'h46};  // flip
                    16'd215: LUT_Data <= {8'h38, 8'h21, 8'h00};  // mirror
                    16'd216: LUT_Data <= {8'h38, 8'h14, 8'h31};  // timing X inc
                    16'd217: LUT_Data <= {8'h38, 8'h15, 8'h31};  // timing Y inc
                    16'd218: LUT_Data <= {8'h38, 8'h00, 8'h00};  // HS
                    16'd219: LUT_Data <= {8'h38, 8'h01, 8'h00};  // HS
                    16'd220: LUT_Data <= {8'h38, 8'h02, 8'h00};  // VS
                    16'd221: LUT_Data <= {8'h38, 8'h03, 8'h00};  // VS
                    16'd222: LUT_Data <= {8'h38, 8'h04, 8'h0a};  // HW (HE)
                    16'd223: LUT_Data <= {8'h38, 8'h05, 8'h3f};  // HW (HE)
                    16'd224: LUT_Data <= {8'h38, 8'h06, 8'h06};  // VH (VE)
                    16'd225: LUT_Data <= {8'h38, 8'h07, 8'ha9};  // VH (VE)
                    16'd226: LUT_Data <= {8'h38, 8'h08, 8'h05};  // DVPHO
                    16'd227: LUT_Data <= {8'h38, 8'h09, 8'h00};  // DVPHO
                    16'd228: LUT_Data <= {8'h38, 8'h0a, 8'h02};  // DVPVO
                    16'd229: LUT_Data <= {8'h38, 8'h0b, 8'hd0};  // DVPVO
                    16'd230: LUT_Data <= {8'h38, 8'h0c, 8'h05};  // HTS
                    16'd231: LUT_Data <= {8'h38, 8'h0d, 8'hF8};  // HTS
                    16'd232: LUT_Data <= {8'h38, 8'h0e, 8'h03};  // VTS
                    16'd233: LUT_Data <= {8'h38, 8'h0f, 8'h84};  // VTS
                    16'd234: LUT_Data <= {8'h38, 8'h13, 8'h04};  // timing V offset
                    16'd235: LUT_Data <= {8'h36, 8'h18, 8'h00};
                    16'd236: LUT_Data <= {8'h36, 8'h12, 8'h29};
                    16'd237: LUT_Data <= {8'h37, 8'h09, 8'h52};
                    16'd238: LUT_Data <= {8'h37, 8'h0c, 8'h03};
                    16'd239: LUT_Data <= {8'h3a, 8'h02, 8'h02};  // 60Hz max exposure
                    16'd240: LUT_Data <= {8'h3a, 8'h03, 8'he0};  // 60Hz max exposure 

                    16'd241: LUT_Data <= {8'h3a, 8'h14, 8'h02};  // 50Hz max exposure
                    16'd242: LUT_Data <= {8'h3a, 8'h15, 8'he0};  // 50Hz max exposure
                    16'd243: LUT_Data <= {8'h40, 8'h04, 8'h02};  // BLC line number
                    16'd244: LUT_Data <= {8'h30, 8'h02, 8'h1c};  // reset JFIFO, SFIFO, JPG
                    16'd245: LUT_Data <= {8'h30, 8'h06, 8'hc3};  // disable clock of JPEG2x, JPEG
                    16'd246: LUT_Data <= {8'h47, 8'h13, 8'h03};  // JPEG mode 3
                    16'd247: LUT_Data <= {8'h44, 8'h07, 8'h04};  // Quantization scale
                    16'd248: LUT_Data <= {8'h46, 8'h0b, 8'h37};
                    16'd249: LUT_Data <= {8'h46, 8'h0c, 8'h20};
                    16'd250: LUT_Data <= {8'h48, 8'h37, 8'h16};  // MIPI global timing
                    16'd251: LUT_Data <= {8'h38, 8'h24, 8'h04};  // PCLK manual divider
                    16'd252: LUT_Data <= {8'h50, 8'h01, 8'hA3};  // SDE on, scale on, UV average off, color matrix on, AWB on
                    16'd253: LUT_Data <= {8'h35, 8'h03, 8'h00};  // AEC/AGC on

                    //-------------------------白平衡模式-------------------------//
                    16'd254: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd255: LUT_Data <= {8'h34, 8'h00, rom_lut_data_white_balance[7:0]};
                    16'd256: LUT_Data <= {8'h34, 8'h01, rom_lut_data_white_balance[15:8]};
                    16'd257: LUT_Data <= {8'h34, 8'h02, rom_lut_data_white_balance[23:16]};
                    16'd258: LUT_Data <= {8'h34, 8'h03, rom_lut_data_white_balance[31:24]};
                    16'd259: LUT_Data <= {8'h34, 8'h04, rom_lut_data_white_balance[39:32]};
                    16'd260: LUT_Data <= {8'h34, 8'h05, rom_lut_data_white_balance[47:40]};
                    16'd261: LUT_Data <= {8'h34, 8'h06, rom_lut_data_white_balance[55:48]};
                    16'd262: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd263: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //-------------------------饱和度设置-------------------------//
                    16'd264: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd265: LUT_Data <= {8'h53, 8'h81, 8'h1c};
                    16'd266: LUT_Data <= {8'h53, 8'h82, 8'h5a};
                    16'd267: LUT_Data <= {8'h53, 8'h83, 8'h06};
                    16'd268: LUT_Data <= {8'h53, 8'h84, rom_lut_data_saturation[7:0]};
                    16'd269: LUT_Data <= {8'h53, 8'h85, rom_lut_data_saturation[15:8]};
                    16'd270: LUT_Data <= {8'h53, 8'h86, rom_lut_data_saturation[23:16]};
                    16'd271: LUT_Data <= {8'h53, 8'h87, rom_lut_data_saturation[29:24]};
                    16'd272: LUT_Data <= {8'h53, 8'h88, rom_lut_data_saturation[39:30]};
                    16'd273: LUT_Data <= {8'h53, 8'h89, rom_lut_data_saturation[47:40]};
                    16'd274: LUT_Data <= {8'h53, 8'h8b, 8'h98};
                    16'd275: LUT_Data <= {8'h53, 8'h8a, 8'h98};
                    16'd276: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd277: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //--------------------------亮度设置--------------------------//
                    16'd278: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd279: LUT_Data <= {8'h55, 8'h87, rom_lut_data_brightness[7:0]};
                    16'd280: LUT_Data <= {8'h55, 8'h88, rom_lut_data_brightness[15:8]};
                    16'd281: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd282: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //-------------------------对比度设置-------------------------//
                    16'd283: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd284: LUT_Data <= {8'h55, 8'h85, rom_lut_data_contrast[7:0]};
                    16'd285: LUT_Data <= {8'h55, 8'h86, rom_lut_data_contrast[15:8]};
                    16'd286: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd287: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //------------------------自动锐度设置------------------------//
                    16'd288: LUT_Data <= {8'h53, 8'h08, 8'h25};
                    16'd289: LUT_Data <= {8'h53, 8'h00, 8'h08};
                    16'd290: LUT_Data <= {8'h53, 8'h00, 8'h30};
                    16'd291: LUT_Data <= {8'h53, 8'h00, 8'h10};
                    16'd292: LUT_Data <= {8'h53, 8'h00, 8'h00};
                    16'd293: LUT_Data <= {8'h53, 8'h00, 8'h08};
                    16'd294: LUT_Data <= {8'h53, 8'h00, 8'h30};
                    16'd295: LUT_Data <= {8'h53, 8'h00, 8'h04};
                    16'd296: LUT_Data <= {8'h53, 8'h00, 8'h06};

                    //--------------------------特效设置--------------------------//
                    16'd297: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd298: LUT_Data <= {8'h55, 8'h80, rom_lut_data_special_effects[7:0]};
                    16'd299: LUT_Data <= {8'h55, 8'h83, rom_lut_data_special_effects[15:8]};
                    16'd300: LUT_Data <= {8'h55, 8'h84, rom_lut_data_special_effects[23:16]};
                    16'd301: LUT_Data <= {8'h50, 8'h03, 8'h08};
                    16'd302: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd303: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //------------------------曝光补偿设置------------------------//
                    16'd304: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd305: LUT_Data <= {8'h3a, 8'h0f, rom_lut_data_exposure[7:0]};
                    16'd306: LUT_Data <= {8'h3a, 8'h10, rom_lut_data_exposure[15:8]};
                    16'd307: LUT_Data <= {8'h3a, 8'h1b, rom_lut_data_exposure[23:16]};
                    16'd308: LUT_Data <= {8'h3a, 8'h1e, rom_lut_data_exposure[31:24]};
                    16'd309: LUT_Data <= {8'h3a, 8'h11, rom_lut_data_exposure[39:32]};
                    16'd310: LUT_Data <= {8'h3a, 8'h1f, rom_lut_data_exposure[47:40]};
                    16'd311: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd312: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //----------------------图像输出开窗设置----------------------//
                    16'd313: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd314: LUT_Data <= {8'h38, 8'h00, IMAGE_OFFEST_H[15:8]};
                    16'd315: LUT_Data <= {8'h38, 8'h01, IMAGE_OFFEST_H[7:0]};
                    16'd316: LUT_Data <= {8'h38, 8'h02, IMAGE_OFFEST_V[15:8]};
                    16'd317: LUT_Data <= {8'h38, 8'h03, IMAGE_OFFEST_V[7:0]};
                    //16'd318:LUT_Data <= {8'h38,8'h04,IMAGE_H_END[15:8]};
                    //16'd319:LUT_Data <= {8'h38,8'h05,IMAGE_H_END[7:0]};
                    //16'd320:LUT_Data <= {8'h38,8'h06,IMAGE_V_END[15:8]};
                    //16'd321:LUT_Data <= {8'h38,8'h07,IMAGE_V_END[7:0]};
                    16'd322: LUT_Data <= {8'h38, 8'h08, IMAGE_SIZE_H[15:8]};
                    16'd323: LUT_Data <= {8'h38, 8'h09, IMAGE_SIZE_H[7:0]};
                    16'd324: LUT_Data <= {8'h38, 8'h0a, IMAGE_SIZE_V[15:8]};
                    16'd325: LUT_Data <= {8'h38, 8'h0b, IMAGE_SIZE_V[7:0]};
                    16'd326: LUT_Data <= {8'h38, 8'h10, IMAGE_OFFEST_H[15:8]};
                    16'd327: LUT_Data <= {8'h38, 8'h11, IMAGE_OFFEST_H[7:0]};
                    16'd328: LUT_Data <= {8'h38, 8'h12, IMAGE_OFFEST_V[15:8]};
                    16'd329: LUT_Data <= {8'h38, 8'h13, IMAGE_OFFEST_V[7:0]};
                    16'd330: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd331: LUT_Data <= {8'h32, 8'h12, 8'ha3};
                    default: LUT_Data <= {8'h00, 8'h00, 8'h00};
                endcase
            end
        end  //JPEG模式
        else begin
            always @(*) begin
                case (send_cnt)
                    16'd0: LUT_Data <= {8'h31, 8'h03, 8'h11};  // system clock from pad, bit[1]
                    16'd1: LUT_Data <= {8'h30, 8'h08, 8'h82};  // 软复位

                    // 24MHz input clock, 24MHz PCLK
                    16'd2: LUT_Data <= {8'h30, 8'h08, 8'h42};  // software power down, bit[6]
                    16'd3: LUT_Data <= {8'h31, 8'h03, 8'h03};  // system clock from PLL, bit[1]
                    16'd4: LUT_Data <= {8'h30, 8'h17, 8'hff};  // FREX, Vsync, HREF, PCLK, D[9:6] output enable
                    16'd5: LUT_Data <= {8'h30, 8'h18, 8'hff};  // D[5:0], GPIO[1:0] output enable
                    16'd6: LUT_Data <= {8'h30, 8'h34, 8'h1a};  // MIPI 10-bit
                    16'd7: LUT_Data <= {8'h30, 8'h37, 8'h13};  // PLL root divider, bit[4], PLL pre-divider, bit[3:0]
                    16'd8: LUT_Data <= {8'h31, 8'h08, 8'h01};  // PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2]

                    // SCLK root divider, bit[1:0]
                    16'd9:  LUT_Data <= {8'h36, 8'h30, 8'h36};
                    16'd10: LUT_Data <= {8'h36, 8'h31, 8'h0e};
                    16'd11: LUT_Data <= {8'h36, 8'h32, 8'he2};
                    16'd12: LUT_Data <= {8'h36, 8'h33, 8'h12};
                    16'd13: LUT_Data <= {8'h36, 8'h21, 8'he0};
                    16'd14: LUT_Data <= {8'h37, 8'h04, 8'ha0};
                    16'd15: LUT_Data <= {8'h37, 8'h03, 8'h5a};
                    16'd16: LUT_Data <= {8'h37, 8'h15, 8'h78};
                    16'd17: LUT_Data <= {8'h37, 8'h17, 8'h01};
                    16'd18: LUT_Data <= {8'h37, 8'h0b, 8'h60};
                    16'd19: LUT_Data <= {8'h37, 8'h05, 8'h1a};
                    16'd20: LUT_Data <= {8'h39, 8'h05, 8'h02};
                    16'd21: LUT_Data <= {8'h39, 8'h06, 8'h10};
                    16'd22: LUT_Data <= {8'h39, 8'h01, 8'h0a};
                    16'd23: LUT_Data <= {8'h37, 8'h31, 8'h12};
                    16'd24: LUT_Data <= {8'h36, 8'h00, 8'h08};  // VCM control
                    16'd25: LUT_Data <= {8'h36, 8'h01, 8'h33};  // VCM control
                    16'd26: LUT_Data <= {8'h30, 8'h2d, 8'h60};  // system control
                    16'd27: LUT_Data <= {8'h36, 8'h20, 8'h52};
                    16'd28: LUT_Data <= {8'h37, 8'h1b, 8'h20};
                    16'd29: LUT_Data <= {8'h47, 8'h1c, 8'h50};
                    16'd30: LUT_Data <= {8'h3a, 8'h13, 8'h43};  // pre-gain = 1.047x
                    16'd31: LUT_Data <= {8'h3a, 8'h18, 8'h00};  // gain ceiling
                    16'd32: LUT_Data <= {8'h3a, 8'h19, 8'hf8};  // gain ceiling = 15.5x
                    16'd33: LUT_Data <= {8'h36, 8'h35, 8'h13};
                    16'd34: LUT_Data <= {8'h36, 8'h36, 8'h03};
                    16'd35: LUT_Data <= {8'h36, 8'h34, 8'h40};
                    16'd36: LUT_Data <= {8'h36, 8'h22, 8'h01};

                    // 50/60Hz detection 50/60Hz 灯光条纹过滤
                    16'd37: LUT_Data <= {8'h3c, 8'h01, 8'h34};  // Band auto, bit[7]
                    16'd38: LUT_Data <= {8'h3c, 8'h04, 8'h28};  // threshold low sum
                    16'd39: LUT_Data <= {8'h3c, 8'h05, 8'h98};  // threshold high sum
                    16'd40: LUT_Data <= {8'h3c, 8'h06, 8'h00};  // light meter 1 threshold[15:8]
                    16'd41: LUT_Data <= {8'h3c, 8'h07, 8'h08};  // light meter 1 threshold[7:0]
                    16'd42: LUT_Data <= {8'h3c, 8'h08, 8'h00};  // light meter 2 threshold[15:8]
                    16'd43: LUT_Data <= {8'h3c, 8'h09, 8'h1c};  // light meter 2 threshold[7:0]
                    16'd44: LUT_Data <= {8'h3c, 8'h0a, 8'h9c};  // sample number[15:8]
                    16'd45: LUT_Data <= {8'h3c, 8'h0b, 8'h40};  // sample number[7:0]
                    16'd46: LUT_Data <= {8'h38, 8'h10, 8'h00};  // Timing Hoffset[11:8]
                    16'd47: LUT_Data <= {8'h38, 8'h11, 8'h10};  // Timing Hoffset[7:0]
                    16'd48: LUT_Data <= {8'h38, 8'h12, 8'h00};  // Timing Voffset[10:8]
                    16'd49: LUT_Data <= {8'h37, 8'h08, 8'h64};
                    16'd50: LUT_Data <= {8'h40, 8'h01, 8'h02};  // BLC start from line 2
                    16'd51: LUT_Data <= {8'h40, 8'h05, 8'h1a};  // BLC always update
                    16'd52: LUT_Data <= {8'h30, 8'h00, 8'h00};  // enable blocks
                    16'd53: LUT_Data <= {8'h30, 8'h04, 8'hff};  // enable clocks
                    16'd54: LUT_Data <= {8'h30, 8'h0e, 8'h58};  // MIPI power down, DVP enable
                    16'd55: LUT_Data <= {8'h30, 8'h2e, 8'h00};
                    16'd56: LUT_Data <= {8'h43, 8'h00, 8'h30};  // YUV 422, YUYV
                    16'd57: LUT_Data <= {8'h50, 8'h1f, 8'h00};  // YUV 422
                    16'd58: LUT_Data <= {8'h44, 8'h0e, 8'h00};
                    16'd59: LUT_Data <= {8'h50, 8'h00, 8'ha7};  // Lenc on, raw gamma on, BPC on, WPC on, CIP on

                    // AEC target 自动曝光控制
                    16'd60: LUT_Data <= {8'h3a, 8'h0f, 8'h30};  // stable range in high
                    16'd61: LUT_Data <= {8'h3a, 8'h10, 8'h28};  // stable range in low
                    16'd62: LUT_Data <= {8'h3a, 8'h1b, 8'h30};  // stable range out high
                    16'd63: LUT_Data <= {8'h3a, 8'h1e, 8'h26};  // stable range out low
                    16'd64: LUT_Data <= {8'h3a, 8'h11, 8'h60};  // fast zone high
                    16'd65: LUT_Data <= {8'h3a, 8'h1f, 8'h14};  // fast zone low

                    // Lens correction for ? 镜头补偿
                    16'd66:  LUT_Data <= {8'h58, 8'h00, 8'h23};
                    16'd67:  LUT_Data <= {8'h58, 8'h01, 8'h14};
                    16'd68:  LUT_Data <= {8'h58, 8'h02, 8'h0f};
                    16'd69:  LUT_Data <= {8'h58, 8'h03, 8'h0f};
                    16'd70:  LUT_Data <= {8'h58, 8'h04, 8'h12};
                    16'd71:  LUT_Data <= {8'h58, 8'h05, 8'h26};
                    16'd72:  LUT_Data <= {8'h58, 8'h06, 8'h0c};
                    16'd73:  LUT_Data <= {8'h58, 8'h07, 8'h08};
                    16'd74:  LUT_Data <= {8'h58, 8'h08, 8'h05};
                    16'd75:  LUT_Data <= {8'h58, 8'h09, 8'h05};
                    16'd76:  LUT_Data <= {8'h58, 8'h0a, 8'h08};
                    16'd77:  LUT_Data <= {8'h58, 8'h0b, 8'h0d};
                    16'd78:  LUT_Data <= {8'h58, 8'h0c, 8'h08};
                    16'd79:  LUT_Data <= {8'h58, 8'h0d, 8'h03};
                    16'd80:  LUT_Data <= {8'h58, 8'h0e, 8'h00};
                    16'd81:  LUT_Data <= {8'h58, 8'h0f, 8'h00};
                    16'd82:  LUT_Data <= {8'h58, 8'h10, 8'h03};
                    16'd83:  LUT_Data <= {8'h58, 8'h11, 8'h09};
                    16'd84:  LUT_Data <= {8'h58, 8'h12, 8'h07};
                    16'd85:  LUT_Data <= {8'h58, 8'h13, 8'h03};
                    16'd86:  LUT_Data <= {8'h58, 8'h14, 8'h00};
                    16'd87:  LUT_Data <= {8'h58, 8'h15, 8'h01};
                    16'd88:  LUT_Data <= {8'h58, 8'h16, 8'h03};
                    16'd89:  LUT_Data <= {8'h58, 8'h17, 8'h08};
                    16'd90:  LUT_Data <= {8'h58, 8'h18, 8'h0d};
                    16'd91:  LUT_Data <= {8'h58, 8'h19, 8'h08};
                    16'd92:  LUT_Data <= {8'h58, 8'h1a, 8'h05};
                    16'd93:  LUT_Data <= {8'h58, 8'h1b, 8'h06};
                    16'd94:  LUT_Data <= {8'h58, 8'h1c, 8'h08};
                    16'd95:  LUT_Data <= {8'h58, 8'h1d, 8'h0e};
                    16'd96:  LUT_Data <= {8'h58, 8'h1e, 8'h29};
                    16'd97:  LUT_Data <= {8'h58, 8'h1f, 8'h17};
                    16'd98:  LUT_Data <= {8'h58, 8'h20, 8'h11};
                    16'd99:  LUT_Data <= {8'h58, 8'h21, 8'h11};
                    16'd100: LUT_Data <= {8'h58, 8'h22, 8'h15};
                    16'd101: LUT_Data <= {8'h58, 8'h23, 8'h28};
                    16'd102: LUT_Data <= {8'h58, 8'h24, 8'h46};
                    16'd103: LUT_Data <= {8'h58, 8'h25, 8'h26};
                    16'd104: LUT_Data <= {8'h58, 8'h26, 8'h08};
                    16'd105: LUT_Data <= {8'h58, 8'h27, 8'h26};
                    16'd106: LUT_Data <= {8'h58, 8'h28, 8'h64};
                    16'd107: LUT_Data <= {8'h58, 8'h29, 8'h26};
                    16'd108: LUT_Data <= {8'h58, 8'h2a, 8'h24};
                    16'd109: LUT_Data <= {8'h58, 8'h2b, 8'h22};
                    16'd110: LUT_Data <= {8'h58, 8'h2c, 8'h24};
                    16'd111: LUT_Data <= {8'h58, 8'h2d, 8'h24};
                    16'd112: LUT_Data <= {8'h58, 8'h2e, 8'h06};
                    16'd113: LUT_Data <= {8'h58, 8'h2f, 8'h22};
                    16'd114: LUT_Data <= {8'h58, 8'h30, 8'h40};
                    16'd115: LUT_Data <= {8'h58, 8'h31, 8'h42};
                    16'd116: LUT_Data <= {8'h58, 8'h32, 8'h24};
                    16'd117: LUT_Data <= {8'h58, 8'h33, 8'h26};
                    16'd118: LUT_Data <= {8'h58, 8'h34, 8'h24};
                    16'd119: LUT_Data <= {8'h58, 8'h35, 8'h22};
                    16'd120: LUT_Data <= {8'h58, 8'h36, 8'h22};
                    16'd121: LUT_Data <= {8'h58, 8'h37, 8'h26};
                    16'd122: LUT_Data <= {8'h58, 8'h38, 8'h44};
                    16'd123: LUT_Data <= {8'h58, 8'h39, 8'h24};
                    16'd124: LUT_Data <= {8'h58, 8'h3a, 8'h26};
                    16'd125: LUT_Data <= {8'h58, 8'h3b, 8'h28};
                    16'd126: LUT_Data <= {8'h58, 8'h3c, 8'h42};
                    16'd127: LUT_Data <= {8'h58, 8'h3d, 8'hce};  // lenc BR offset

                    // AWB 自动白平衡
                    16'd128: LUT_Data <= {8'h51, 8'h80, 8'hff};  // AWB B block
                    16'd129: LUT_Data <= {8'h51, 8'h81, 8'hf2};  // AWB control
                    16'd130: LUT_Data <= {8'h51, 8'h82, 8'h00};  // [7:4] max local counter, [3:0] max fast counter
                    16'd131: LUT_Data <= {8'h51, 8'h83, 8'h14};  // AWB advanced
                    16'd132: LUT_Data <= {8'h51, 8'h84, 8'h25};
                    16'd133: LUT_Data <= {8'h51, 8'h85, 8'h24};
                    16'd134: LUT_Data <= {8'h51, 8'h86, 8'h09};
                    16'd135: LUT_Data <= {8'h51, 8'h87, 8'h09};
                    16'd136: LUT_Data <= {8'h51, 8'h88, 8'h09};
                    16'd137: LUT_Data <= {8'h51, 8'h89, 8'h75};
                    16'd138: LUT_Data <= {8'h51, 8'h8a, 8'h54};
                    16'd139: LUT_Data <= {8'h51, 8'h8b, 8'he0};
                    16'd140: LUT_Data <= {8'h51, 8'h8c, 8'hb2};
                    16'd141: LUT_Data <= {8'h51, 8'h8d, 8'h42};
                    16'd142: LUT_Data <= {8'h51, 8'h8e, 8'h3d};
                    16'd143: LUT_Data <= {8'h51, 8'h8f, 8'h56};
                    16'd144: LUT_Data <= {8'h51, 8'h90, 8'h46};
                    16'd145: LUT_Data <= {8'h51, 8'h91, 8'hf8};  // AWB top limit
                    16'd146: LUT_Data <= {8'h51, 8'h92, 8'h04};  // AWB bottom limit
                    16'd147: LUT_Data <= {8'h51, 8'h93, 8'h70};  // red limit
                    16'd148: LUT_Data <= {8'h51, 8'h94, 8'hf0};  // green limit
                    16'd149: LUT_Data <= {8'h51, 8'h95, 8'hf0};  // blue limit
                    16'd150: LUT_Data <= {8'h51, 8'h96, 8'h03};  // AWB control
                    16'd151: LUT_Data <= {8'h51, 8'h97, 8'h01};  // local limit
                    16'd152: LUT_Data <= {8'h51, 8'h98, 8'h04};
                    16'd153: LUT_Data <= {8'h51, 8'h99, 8'h12};
                    16'd154: LUT_Data <= {8'h51, 8'h9a, 8'h04};
                    16'd155: LUT_Data <= {8'h51, 8'h9b, 8'h00};
                    16'd156: LUT_Data <= {8'h51, 8'h9c, 8'h06};
                    16'd157: LUT_Data <= {8'h51, 8'h9d, 8'h82};
                    16'd158: LUT_Data <= {8'h51, 8'h9e, 8'h38};  // AWB control

                    // Gamma 伽玛曲线
                    16'd159: LUT_Data <= {8'h54, 8'h80, 8'h01};  // Gamma bias plus on, bit[0]
                    16'd160: LUT_Data <= {8'h54, 8'h81, 8'h08};
                    16'd161: LUT_Data <= {8'h54, 8'h82, 8'h14};
                    16'd162: LUT_Data <= {8'h54, 8'h83, 8'h28};
                    16'd163: LUT_Data <= {8'h54, 8'h84, 8'h51};
                    16'd164: LUT_Data <= {8'h54, 8'h85, 8'h65};
                    16'd165: LUT_Data <= {8'h54, 8'h86, 8'h71};
                    16'd166: LUT_Data <= {8'h54, 8'h87, 8'h7d};
                    16'd167: LUT_Data <= {8'h54, 8'h88, 8'h87};
                    16'd168: LUT_Data <= {8'h54, 8'h89, 8'h91};
                    16'd169: LUT_Data <= {8'h54, 8'h8a, 8'h9a};
                    16'd170: LUT_Data <= {8'h54, 8'h8b, 8'haa};
                    16'd171: LUT_Data <= {8'h54, 8'h8c, 8'hb8};
                    16'd172: LUT_Data <= {8'h54, 8'h8d, 8'hcd};
                    16'd173: LUT_Data <= {8'h54, 8'h8e, 8'hdd};
                    16'd174: LUT_Data <= {8'h54, 8'h8f, 8'hea};
                    16'd175: LUT_Data <= {8'h54, 8'h90, 8'h1d};

                    // color matrix 色彩矩阵	
                    16'd176: LUT_Data <= {8'h53, 8'h81, 8'h1e};  // CMX1 for Y
                    16'd177: LUT_Data <= {8'h53, 8'h82, 8'h5b};  // CMX2 for Y
                    16'd178: LUT_Data <= {8'h53, 8'h83, 8'h08};  // CMX3 for Y
                    16'd179: LUT_Data <= {8'h53, 8'h84, 8'h0a};  // CMX4 for U
                    16'd180: LUT_Data <= {8'h53, 8'h85, 8'h7e};  // CMX5 for U
                    16'd181: LUT_Data <= {8'h53, 8'h86, 8'h88};  // CMX6 for U
                    16'd182: LUT_Data <= {8'h53, 8'h87, 8'h7c};  // CMX7 for V
                    16'd183: LUT_Data <= {8'h53, 8'h88, 8'h6c};  // CMX8 for V
                    16'd184: LUT_Data <= {8'h53, 8'h89, 8'h10};  // CMX9 for V
                    16'd185: LUT_Data <= {8'h53, 8'h8a, 8'h01};  // sign[9]
                    16'd186: LUT_Data <= {8'h53, 8'h8b, 8'h98};  // sign[8:1]

                    // UV adjust UV 色彩饱和度调整
                    16'd187: LUT_Data <= {8'h55, 8'h80, 8'h06};  // saturation on, bit[1]
                    16'd188: LUT_Data <= {8'h55, 8'h83, 8'h40};
                    16'd189: LUT_Data <= {8'h55, 8'h84, 8'h10};
                    16'd190: LUT_Data <= {8'h55, 8'h89, 8'h10};
                    16'd191: LUT_Data <= {8'h55, 8'h8a, 8'h00};
                    16'd192: LUT_Data <= {8'h55, 8'h8b, 8'hf8};
                    16'd193: LUT_Data <= {8'h50, 8'h1d, 8'h40};  // enable manual offset of contrast

                    // CIP 锐化和降噪
                    16'd194: LUT_Data <= {8'h53, 8'h00, 8'h08};  // CIP sharpen MT threshold 1
                    16'd195: LUT_Data <= {8'h53, 8'h01, 8'h30};  // CIP sharpen MT threshold 2
                    16'd196: LUT_Data <= {8'h53, 8'h02, 8'h10};  // CIP sharpen MT offset 1
                    16'd197: LUT_Data <= {8'h53, 8'h03, 8'h00};  // CIP sharpen MT offset 2
                    16'd198: LUT_Data <= {8'h53, 8'h04, 8'h08};  // CIP DNS threshold 1
                    16'd199: LUT_Data <= {8'h53, 8'h05, 8'h30};  // CIP DNS threshold 2
                    16'd200: LUT_Data <= {8'h53, 8'h06, 8'h08};  // CIP DNS offset 1
                    16'd201: LUT_Data <= {8'h53, 8'h07, 8'h16};  // CIP DNS offset 2
                    16'd202: LUT_Data <= {8'h53, 8'h09, 8'h08};  // CIP sharpen TH threshold 1
                    16'd203: LUT_Data <= {8'h53, 8'h0a, 8'h30};  // CIP sharpen TH threshold 2
                    16'd204: LUT_Data <= {8'h53, 8'h0b, 8'h04};  // CIP sharpen TH offset 1
                    16'd205: LUT_Data <= {8'h53, 8'h0c, 8'h06};  // CIP sharpen TH offset 2
                    16'd206: LUT_Data <= {8'h50, 8'h25, 8'h00};
                    16'd207: LUT_Data <= {8'h30, 8'h08, 8'h02};  // wake up from standby, bit[6]

                    //自行添加的设置
                    16'd208: LUT_Data <= {8'h47, 8'h40, 8'h21};  // PCLK下降沿更新,bit[5];VSYNC高有效,bit[0];HSYNC低有效bit[1]

                    //------------------------JPEG数据模式------------------------//
                    16'd209: LUT_Data <= {8'h43, 8'h00, 8'h30};  // YUV 422, YUYV
                    16'd210: LUT_Data <= {8'h50, 8'h1f, 8'h00};  // YUV 422
                    // 2592x1944, 7.5fps
                    // Input clock = 24Mhz
                    16'd211: LUT_Data <= {8'h30, 8'h35, 8'h21};  // PLL  
                    16'd212: LUT_Data <= {8'h30, 8'h36, 8'h69};  // PLL 
                    16'd213: LUT_Data <= {8'h3c, 8'h07, 8'h07};  // lightmeter 1 threshold[7:0] 
                    16'd214: LUT_Data <= {8'h38, 8'h20, 8'h46};  // flip
                    16'd215: LUT_Data <= {8'h38, 8'h21, 8'h20};  // mirror
                    16'd216: LUT_Data <= {8'h38, 8'h14, 8'h11};  // timing X inc
                    16'd217: LUT_Data <= {8'h38, 8'h15, 8'h11};  // timing Y inc 
                    16'd218: LUT_Data <= {8'h38, 8'h00, 8'h00};  // HS
                    16'd219: LUT_Data <= {8'h38, 8'h01, 8'h00};  // HS
                    16'd220: LUT_Data <= {8'h38, 8'h02, 8'h00};  // VS
                    16'd221: LUT_Data <= {8'h38, 8'h03, 8'h00};  // VS
                    16'd222: LUT_Data <= {8'h38, 8'h04, 8'h0a};  // HW (HE)
                    16'd223: LUT_Data <= {8'h38, 8'h05, 8'h3f};  // HW (HE)
                    16'd224: LUT_Data <= {8'h38, 8'h06, 8'h07};  // VH (VE)
                    16'd225: LUT_Data <= {8'h38, 8'h07, 8'h9f};  // VH (VE)

                    16'd226: LUT_Data <= {8'h38, 8'h08, 8'h02};  // DVPHO 	   
                    16'd227: LUT_Data <= {8'h38, 8'h09, 8'h80};  // DVPHO 
                    16'd228: LUT_Data <= {8'h38, 8'h0a, 8'h01};  // DVPVO 		
                    16'd229: LUT_Data <= {8'h38, 8'h0b, 8'he0};  // DVPVO

                    16'd230: LUT_Data <= {8'h38, 8'h0c, 8'h0b};  // HTS
                    16'd231: LUT_Data <= {8'h38, 8'h0d, 8'h1c};  // HTS
                    16'd232: LUT_Data <= {8'h38, 8'h0e, 8'h07};  // VTS
                    16'd233: LUT_Data <= {8'h38, 8'h0f, 8'hb0};  // VTS 
                    16'd234: LUT_Data <= {8'h38, 8'h13, 8'h04};  // timing V offset   04
                    16'd235: LUT_Data <= {8'h36, 8'h18, 8'h04};
                    16'd236: LUT_Data <= {8'h36, 8'h12, 8'h2b};
                    16'd237: LUT_Data <= {8'h37, 8'h09, 8'h12};
                    16'd238: LUT_Data <= {8'h37, 8'h0c, 8'h00};

                    16'd239: LUT_Data <= {8'h40, 8'h04, 8'h06};  // BLC line number 
                    16'd240: LUT_Data <= {8'h30, 8'h02, 8'h00};  // enable JFIFO, SFIFO, JPG 
                    16'd241: LUT_Data <= {8'h30, 8'h06, 8'hff};  // enable clock of JPEG2x, JPEG
                    16'd242: LUT_Data <= {8'h47, 8'h13, 8'h03};  // JPEG mode 3
                    16'd243: LUT_Data <= {8'h44, 8'h07, 8'h01};  // Quantization sacle 
                    16'd244: LUT_Data <= {8'h46, 8'h0b, 8'h35};
                    16'd245: LUT_Data <= {8'h46, 8'h0c, 8'h22};
                    16'd246: LUT_Data <= {8'h48, 8'h37, 8'h16};  // MIPI global timing 
                    16'd247: LUT_Data <= {8'h38, 8'h24, 8'h02};  // PCLK manual divider 
                    16'd248: LUT_Data <= {8'h50, 8'h01, 8'hA3};  // SDE on, Scaling on, CMX on, AWB on 
                    16'd249: LUT_Data <= {8'h35, 8'h03, 8'h00};  // AEC/AGC on	

                    //-------------------------白平衡模式-------------------------//
                    16'd250: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd251: LUT_Data <= {8'h34, 8'h00, rom_lut_data_white_balance[7:0]};
                    16'd252: LUT_Data <= {8'h34, 8'h01, rom_lut_data_white_balance[15:8]};
                    16'd253: LUT_Data <= {8'h34, 8'h02, rom_lut_data_white_balance[23:16]};
                    16'd254: LUT_Data <= {8'h34, 8'h03, rom_lut_data_white_balance[31:24]};
                    16'd255: LUT_Data <= {8'h34, 8'h04, rom_lut_data_white_balance[39:32]};
                    16'd256: LUT_Data <= {8'h34, 8'h05, rom_lut_data_white_balance[47:40]};
                    16'd257: LUT_Data <= {8'h34, 8'h06, rom_lut_data_white_balance[55:48]};
                    16'd258: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd259: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //-------------------------饱和度设置-------------------------//
                    16'd260: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd261: LUT_Data <= {8'h53, 8'h81, 8'h1c};
                    16'd262: LUT_Data <= {8'h53, 8'h82, 8'h5a};
                    16'd263: LUT_Data <= {8'h53, 8'h83, 8'h06};
                    16'd264: LUT_Data <= {8'h53, 8'h84, rom_lut_data_saturation[7:0]};
                    16'd265: LUT_Data <= {8'h53, 8'h85, rom_lut_data_saturation[15:8]};
                    16'd266: LUT_Data <= {8'h53, 8'h86, rom_lut_data_saturation[23:16]};
                    16'd267: LUT_Data <= {8'h53, 8'h87, rom_lut_data_saturation[29:24]};
                    16'd268: LUT_Data <= {8'h53, 8'h88, rom_lut_data_saturation[39:30]};
                    16'd269: LUT_Data <= {8'h53, 8'h89, rom_lut_data_saturation[47:40]};
                    16'd270: LUT_Data <= {8'h53, 8'h8b, 8'h98};
                    16'd271: LUT_Data <= {8'h53, 8'h8a, 8'h98};
                    16'd272: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd273: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //--------------------------亮度设置--------------------------//
                    16'd274: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd275: LUT_Data <= {8'h55, 8'h87, rom_lut_data_brightness[7:0]};
                    16'd276: LUT_Data <= {8'h55, 8'h88, rom_lut_data_brightness[15:8]};
                    16'd277: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd278: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //-------------------------对比度设置-------------------------//
                    16'd279: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd280: LUT_Data <= {8'h55, 8'h85, rom_lut_data_contrast[7:0]};
                    16'd281: LUT_Data <= {8'h55, 8'h86, rom_lut_data_contrast[15:8]};
                    16'd282: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd283: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //------------------------自动锐度设置------------------------//
                    16'd284: LUT_Data <= {8'h53, 8'h08, 8'h25};
                    16'd285: LUT_Data <= {8'h53, 8'h00, 8'h08};
                    16'd286: LUT_Data <= {8'h53, 8'h00, 8'h30};
                    16'd287: LUT_Data <= {8'h53, 8'h00, 8'h10};
                    16'd288: LUT_Data <= {8'h53, 8'h00, 8'h00};
                    16'd289: LUT_Data <= {8'h53, 8'h00, 8'h08};
                    16'd290: LUT_Data <= {8'h53, 8'h00, 8'h30};
                    16'd291: LUT_Data <= {8'h53, 8'h00, 8'h04};
                    16'd292: LUT_Data <= {8'h53, 8'h00, 8'h06};

                    //--------------------------特效设置--------------------------//
                    16'd293: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd294: LUT_Data <= {8'h55, 8'h80, rom_lut_data_special_effects[7:0]};
                    16'd295: LUT_Data <= {8'h55, 8'h83, rom_lut_data_special_effects[15:8]};
                    16'd296: LUT_Data <= {8'h55, 8'h84, rom_lut_data_special_effects[23:16]};
                    16'd297: LUT_Data <= {8'h50, 8'h03, 8'h08};
                    16'd298: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd299: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //------------------------曝光补偿设置------------------------//
                    16'd300: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd301: LUT_Data <= {8'h3a, 8'h0f, rom_lut_data_exposure[7:0]};
                    16'd302: LUT_Data <= {8'h3a, 8'h10, rom_lut_data_exposure[15:8]};
                    16'd303: LUT_Data <= {8'h3a, 8'h1b, rom_lut_data_exposure[23:16]};
                    16'd304: LUT_Data <= {8'h3a, 8'h1e, rom_lut_data_exposure[31:24]};
                    16'd305: LUT_Data <= {8'h3a, 8'h11, rom_lut_data_exposure[39:32]};
                    16'd306: LUT_Data <= {8'h3a, 8'h1f, rom_lut_data_exposure[47:40]};
                    16'd307: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd308: LUT_Data <= {8'h32, 8'h12, 8'ha3};

                    //----------------------图像输出开窗设置----------------------//
                    16'd309: LUT_Data <= {8'h32, 8'h12, 8'h03};
                    16'd310: LUT_Data <= {8'h38, 8'h00, IMAGE_OFFEST_H[15:8]};
                    16'd311: LUT_Data <= {8'h38, 8'h01, IMAGE_OFFEST_H[7:0]};
                    16'd312: LUT_Data <= {8'h38, 8'h02, IMAGE_OFFEST_V[15:8]};
                    16'd313: LUT_Data <= {8'h38, 8'h03, IMAGE_OFFEST_V[7:0]};
                    //16'd314:LUT_Data <= {8'h38,8'h04,IMAGE_H_END[15:8]};
                    //16'd315:LUT_Data <= {8'h38,8'h05,IMAGE_H_END[7:0]};
                    //16'd316:LUT_Data <= {8'h38,8'h06,IMAGE_V_END[15:8]};
                    //16'd317:LUT_Data <= {8'h38,8'h07,IMAGE_V_END[7:0]};
                    16'd318: LUT_Data <= {8'h38, 8'h08, IMAGE_SIZE_H[15:8]};
                    16'd319: LUT_Data <= {8'h38, 8'h09, IMAGE_SIZE_H[7:0]};
                    16'd320: LUT_Data <= {8'h38, 8'h0a, IMAGE_SIZE_V[15:8]};
                    16'd321: LUT_Data <= {8'h38, 8'h0b, IMAGE_SIZE_V[7:0]};
                    16'd322: LUT_Data <= {8'h38, 8'h10, IMAGE_OFFEST_H[15:8]};
                    16'd323: LUT_Data <= {8'h38, 8'h11, IMAGE_OFFEST_H[7:0]};
                    16'd324: LUT_Data <= {8'h38, 8'h12, IMAGE_OFFEST_V[15:8]};
                    16'd325: LUT_Data <= {8'h38, 8'h13, IMAGE_OFFEST_V[7:0]};
                    16'd326: LUT_Data <= {8'h32, 8'h12, 8'h13};
                    16'd327: LUT_Data <= {8'h32, 8'h12, 8'ha3};
                    default: LUT_Data <= {8'h00, 8'h00, 8'h00};
                endcase
            end

        end
    endgenerate
endmodule

//白平衡存储ROM
module ROM_OV5640_White_Balance (
    input  [ 2:0] i_index,
    output [55:0] o_lut_data
);
    //------------------输出信号---------------//
    reg [39:0] lut_data_o = 0;

    //----------------输出信号连线-------------//
    assign o_lut_data = {lut_data_o[39:16], 8'h00, 8'h04, lut_data_o[15:0]};

    //-----------------初始化ROM---------------//
    always @(*) begin
        case (i_index)
            3'd0: lut_data_o <= {8'h00, 8'h00, 8'h04, 8'h00, 8'h04};  //0:自动;
            3'd1: lut_data_o <= {8'h01, 8'hf3, 8'h04, 8'h1c, 8'h06};  //1:日光;
            3'd2: lut_data_o <= {8'h01, 8'hcf, 8'h07, 8'h48, 8'h05};  //2:办公室;
            3'd3: lut_data_o <= {8'h01, 8'hd3, 8'h04, 8'h48, 8'h06};  //3:阴天;
            3'd4: lut_data_o <= {8'h01, 8'h40, 8'h08, 8'h10, 8'h04};  //4:家里;
            default: lut_data_o <= {8'h00, 8'h00, 8'h04, 8'h00, 8'h04};  //默认为自动白平衡
        endcase
    end

endmodule

//饱和度存储ROM:-3~3
module ROM_OV5640_Saturation (
    input  [ 2:0] i_index,
    output [47:0] o_lut_data
);
    //------------------输出信号---------------//
    reg [47:0] lut_data_o = 0;

    //----------------输出信号连线-------------//
    assign o_lut_data = lut_data_o;

    //-----------------初始化ROM---------------//
    always @(*) begin
        case (i_index)
            3'd0: lut_data_o <= {8'h01, 8'h3d, 8'h3e, 8'h3d, 8'h30, 8'h0c};  //-3
            3'd1: lut_data_o <= {8'h01, 8'h4d, 8'h4e, 8'h4d, 8'h3d, 8'h10};  //-2
            3'd2: lut_data_o <= {8'h02, 8'h66, 8'h68, 8'h66, 8'h52, 8'h15};  //-1
            3'd4: lut_data_o <= {8'h02, 8'h9a, 8'h9c, 8'h9a, 8'h7a, 8'h1f};  //+1
            3'd5: lut_data_o <= {8'h03, 8'hb3, 8'hb6, 8'hb3, 8'h8f, 8'h24};  //+2
            3'd6: lut_data_o <= {8'h04, 8'hd6, 8'hda, 8'hda, 8'hab, 8'h2b};  //+3
            default: lut_data_o <= {8'h02, 8'h80, 8'h82, 8'h80, 8'h66, 8'h1a};  //+0,默认饱和度为0
        endcase
    end

endmodule

//亮度存储ROM:-4~4
module ROM_OV5640_Brightness (
    input  [ 3:0] i_bright,
    output [15:0] o_lut_data
);
    //------------------输出信号---------------//
    reg [11:0] lut_data_o = 0;

    //----------------输出信号连线-------------//
    assign o_lut_data = {lut_data_o, 4'd0};

    //-----------------初始化ROM---------------//
    always @(*) begin
        case (i_bright)
            4'd0: lut_data_o <= {8'h09, 4'd4};  //-4
            4'd1: lut_data_o <= {8'h09, 4'd3};  //-3
            4'd2: lut_data_o <= {8'h09, 4'd2};  //-2
            4'd3: lut_data_o <= {8'h09, 4'd1};  //-1
            4'd5: lut_data_o <= {8'h01, 4'd1};  //+1
            4'd6: lut_data_o <= {8'h01, 4'd2};  //+2
            4'd7: lut_data_o <= {8'h01, 4'd3};  //+3
            4'd8: lut_data_o <= {8'h01, 4'd4};  //+4
            default: lut_data_o <= {8'h01, 4'd0};  //+0,默认亮度为0
        endcase
    end

endmodule

//对比度存储ROM:-3~3
module ROM_OV5640_Contrast (
    input  [ 2:0] i_contrast,
    output [15:0] o_lut_data
);
    //------------------输出信号---------------//
    reg [15:0] lut_data_o = 0;

    //----------------输出信号连线-------------//
    assign o_lut_data = lut_data_o;

    //-----------------初始化ROM---------------//
    always @(*) begin
        case (i_contrast)
            3'd0: lut_data_o <= {8'h14, 8'h14};  //-3
            3'd1: lut_data_o <= {8'h18, 8'h18};  //-2
            3'd2: lut_data_o <= {8'h1c, 8'h1c};  //-1
            3'd4: lut_data_o <= {8'h24, 8'h10};  //+1
            3'd5: lut_data_o <= {8'h28, 8'h18};  //+2
            3'd6: lut_data_o <= {8'h2c, 8'h1c};  //+3
            default: lut_data_o <= {8'h20, 8'h00};  //+0,默认对比度
        endcase
    end

endmodule

//特效存储ROM:0~6
module ROM_OV5640_Special_Effects (
    input  [ 2:0] i_index,
    output [23:0] o_lut_data
);
    //------------------输出信号---------------//
    reg [23:0] lut_data_o = 0;

    //----------------输出信号连线-------------//
    assign o_lut_data = lut_data_o;

    //-----------------初始化ROM---------------//
    always @(*) begin
        case (i_index)
            3'd1: lut_data_o <= {8'h40, 8'ha0, 8'h1e};  //1:冷色
            3'd2: lut_data_o <= {8'hc0, 8'h80, 8'h1e};  //2:暖色
            3'd3: lut_data_o <= {8'h80, 8'h80, 8'h1e};  //3:黑白
            3'd4: lut_data_o <= {8'ha0, 8'h40, 8'h1e};  //4:泛黄
            3'd5: lut_data_o <= {8'h10, 8'h40, 8'h40};  //5:反色
            3'd6: lut_data_o <= {8'h60, 8'h60, 8'h1e};  //6:偏绿
            default: lut_data_o <= {8'h10, 8'h40, 8'h06};  //0:默认正常
        endcase
    end

endmodule

//曝光补偿存储ROM:-3~3
module ROM_OV5640_Exposure (
    input  [ 2:0] i_index,
    output [47:0] o_lut_data
);
    //------------------输出信号---------------//
    reg [47:0] lut_data_o = 0;

    //----------------输出信号连线-------------//
    assign o_lut_data = lut_data_o;

    //-----------------初始化ROM---------------//
    always @(*) begin
        case (i_index)
            3'd0: lut_data_o <= {8'h10, 8'h20, 8'h08, 8'h10, 8'h08, 8'h10};  //-3
            3'd1: lut_data_o <= {8'h10, 8'h18, 8'h20, 8'h41, 8'h18, 8'h20};  //-2
            3'd2: lut_data_o <= {8'h10, 8'h28, 8'h30, 8'h61, 8'h28, 8'h30};  //-1
            3'd4: lut_data_o <= {8'h10, 8'h38, 8'h40, 8'h71, 8'h38, 8'h40};  //+1
            3'd5: lut_data_o <= {8'h20, 8'h48, 8'h50, 8'h90, 8'h48, 8'h50};  //+2
            3'd6: lut_data_o <= {8'h20, 8'h58, 8'h60, 8'ha0, 8'h58, 8'h60};  //+3
            default: lut_data_o <= {8'h10, 8'h30, 8'h38, 8'h61, 8'h30, 8'h38};  //+0,默认曝光补偿为0
        endcase
    end

endmodule

//聚焦配置
module ROM_OV5640_Auto_Focus (
    input  [15:0] i_index,
    output [23:0] o_lut_data
);
    //------------------输出信号---------------//
    reg [23:0] lut_data_o = 0;

    //----------------输出信号连线-------------//
    assign o_lut_data = lut_data_o;

    //-----------------初始化ROM---------------//
    always @(*) begin
        case (i_index)
            16'd0: lut_data_o <= {16'h3000, 8'h20};
            16'd1: lut_data_o <= {16'h8001, 8'h02};
            16'd2: lut_data_o <= {16'h8002, 8'h0f};
            16'd3: lut_data_o <= {16'h8003, 8'hd6};
            16'd4: lut_data_o <= {16'h8004, 8'h02};
            16'd5: lut_data_o <= {16'h8005, 8'h0a};
            16'd6: lut_data_o <= {16'h8006, 8'h39};
            16'd7: lut_data_o <= {16'h8007, 8'hc2};
            16'd8: lut_data_o <= {16'h8008, 8'h01};
            16'd9: lut_data_o <= {16'h8009, 8'h22};
            16'd10: lut_data_o <= {16'h800a, 8'h22};
            16'd11: lut_data_o <= {16'h800b, 8'h00};
            16'd12: lut_data_o <= {16'h800c, 8'h02};
            16'd13: lut_data_o <= {16'h800d, 8'h0f};
            16'd14: lut_data_o <= {16'h800e, 8'hb2};
            16'd15: lut_data_o <= {16'h800f, 8'he5};
            16'd16: lut_data_o <= {16'h8010, 8'h1f};
            16'd17: lut_data_o <= {16'h8011, 8'h70};
            16'd18: lut_data_o <= {16'h8012, 8'h72};
            16'd19: lut_data_o <= {16'h8013, 8'hf5};
            16'd20: lut_data_o <= {16'h8014, 8'h1e};
            16'd21: lut_data_o <= {16'h8015, 8'hd2};
            16'd22: lut_data_o <= {16'h8016, 8'h35};
            16'd23: lut_data_o <= {16'h8017, 8'hff};
            16'd24: lut_data_o <= {16'h8018, 8'hef};
            16'd25: lut_data_o <= {16'h8019, 8'h25};
            16'd26: lut_data_o <= {16'h801a, 8'he0};
            16'd27: lut_data_o <= {16'h801b, 8'h24};
            16'd28: lut_data_o <= {16'h801c, 8'h4e};
            16'd29: lut_data_o <= {16'h801d, 8'hf8};
            16'd30: lut_data_o <= {16'h801e, 8'he4};
            16'd31: lut_data_o <= {16'h801f, 8'hf6};
            16'd32: lut_data_o <= {16'h8020, 8'h08};
            16'd33: lut_data_o <= {16'h8021, 8'hf6};
            16'd34: lut_data_o <= {16'h8022, 8'h0f};
            16'd35: lut_data_o <= {16'h8023, 8'hbf};
            16'd36: lut_data_o <= {16'h8024, 8'h34};
            16'd37: lut_data_o <= {16'h8025, 8'hf2};
            16'd38: lut_data_o <= {16'h8026, 8'h90};
            16'd39: lut_data_o <= {16'h8027, 8'h0e};
            16'd40: lut_data_o <= {16'h8028, 8'h93};
            16'd41: lut_data_o <= {16'h8029, 8'he4};
            16'd42: lut_data_o <= {16'h802a, 8'h93};
            16'd43: lut_data_o <= {16'h802b, 8'hff};
            16'd44: lut_data_o <= {16'h802c, 8'he5};
            16'd45: lut_data_o <= {16'h802d, 8'h4b};
            16'd46: lut_data_o <= {16'h802e, 8'hc3};
            16'd47: lut_data_o <= {16'h802f, 8'h9f};
            16'd48: lut_data_o <= {16'h8030, 8'h50};
            16'd49: lut_data_o <= {16'h8031, 8'h04};
            16'd50: lut_data_o <= {16'h8032, 8'h7f};
            16'd51: lut_data_o <= {16'h8033, 8'h05};
            16'd52: lut_data_o <= {16'h8034, 8'h80};
            16'd53: lut_data_o <= {16'h8035, 8'h02};
            16'd54: lut_data_o <= {16'h8036, 8'h7f};
            16'd55: lut_data_o <= {16'h8037, 8'hfb};
            16'd56: lut_data_o <= {16'h8038, 8'h78};
            16'd57: lut_data_o <= {16'h8039, 8'hbd};
            16'd58: lut_data_o <= {16'h803a, 8'ha6};
            16'd59: lut_data_o <= {16'h803b, 8'h07};
            16'd60: lut_data_o <= {16'h803c, 8'h12};
            16'd61: lut_data_o <= {16'h803d, 8'h0f};
            16'd62: lut_data_o <= {16'h803e, 8'h04};
            16'd63: lut_data_o <= {16'h803f, 8'h40};
            16'd64: lut_data_o <= {16'h8040, 8'h04};
            16'd65: lut_data_o <= {16'h8041, 8'h7f};
            16'd66: lut_data_o <= {16'h8042, 8'h03};
            16'd67: lut_data_o <= {16'h8043, 8'h80};
            16'd68: lut_data_o <= {16'h8044, 8'h02};
            16'd69: lut_data_o <= {16'h8045, 8'h7f};
            16'd70: lut_data_o <= {16'h8046, 8'h30};
            16'd71: lut_data_o <= {16'h8047, 8'h78};
            16'd72: lut_data_o <= {16'h8048, 8'hbc};
            16'd73: lut_data_o <= {16'h8049, 8'ha6};
            16'd74: lut_data_o <= {16'h804a, 8'h07};
            16'd75: lut_data_o <= {16'h804b, 8'he6};
            16'd76: lut_data_o <= {16'h804c, 8'h18};
            16'd77: lut_data_o <= {16'h804d, 8'hf6};
            16'd78: lut_data_o <= {16'h804e, 8'h08};
            16'd79: lut_data_o <= {16'h804f, 8'he6};
            16'd80: lut_data_o <= {16'h8050, 8'h78};
            16'd81: lut_data_o <= {16'h8051, 8'hb9};
            16'd82: lut_data_o <= {16'h8052, 8'hf6};
            16'd83: lut_data_o <= {16'h8053, 8'h78};
            16'd84: lut_data_o <= {16'h8054, 8'hbc};
            16'd85: lut_data_o <= {16'h8055, 8'he6};
            16'd86: lut_data_o <= {16'h8056, 8'h78};
            16'd87: lut_data_o <= {16'h8057, 8'hba};
            16'd88: lut_data_o <= {16'h8058, 8'hf6};
            16'd89: lut_data_o <= {16'h8059, 8'h78};
            16'd90: lut_data_o <= {16'h805a, 8'hbf};
            16'd91: lut_data_o <= {16'h805b, 8'h76};
            16'd92: lut_data_o <= {16'h805c, 8'h33};
            16'd93: lut_data_o <= {16'h805d, 8'he4};
            16'd94: lut_data_o <= {16'h805e, 8'h08};
            16'd95: lut_data_o <= {16'h805f, 8'hf6};
            16'd96: lut_data_o <= {16'h8060, 8'h78};
            16'd97: lut_data_o <= {16'h8061, 8'hb8};
            16'd98: lut_data_o <= {16'h8062, 8'h76};
            16'd99: lut_data_o <= {16'h8063, 8'h01};
            16'd100: lut_data_o <= {16'h8064, 8'h75};
            16'd101: lut_data_o <= {16'h8065, 8'h4a};
            16'd102: lut_data_o <= {16'h8066, 8'h02};
            16'd103: lut_data_o <= {16'h8067, 8'h78};
            16'd104: lut_data_o <= {16'h8068, 8'hb6};
            16'd105: lut_data_o <= {16'h8069, 8'hf6};
            16'd106: lut_data_o <= {16'h806a, 8'h08};
            16'd107: lut_data_o <= {16'h806b, 8'hf6};
            16'd108: lut_data_o <= {16'h806c, 8'h74};
            16'd109: lut_data_o <= {16'h806d, 8'hff};
            16'd110: lut_data_o <= {16'h806e, 8'h78};
            16'd111: lut_data_o <= {16'h806f, 8'hc1};
            16'd112: lut_data_o <= {16'h8070, 8'hf6};
            16'd113: lut_data_o <= {16'h8071, 8'h08};
            16'd114: lut_data_o <= {16'h8072, 8'hf6};
            16'd115: lut_data_o <= {16'h8073, 8'h75};
            16'd116: lut_data_o <= {16'h8074, 8'h1f};
            16'd117: lut_data_o <= {16'h8075, 8'h01};
            16'd118: lut_data_o <= {16'h8076, 8'h78};
            16'd119: lut_data_o <= {16'h8077, 8'hbc};
            16'd120: lut_data_o <= {16'h8078, 8'he6};
            16'd121: lut_data_o <= {16'h8079, 8'h75};
            16'd122: lut_data_o <= {16'h807a, 8'hf0};
            16'd123: lut_data_o <= {16'h807b, 8'h05};
            16'd124: lut_data_o <= {16'h807c, 8'ha4};
            16'd125: lut_data_o <= {16'h807d, 8'hf5};
            16'd126: lut_data_o <= {16'h807e, 8'h4b};
            16'd127: lut_data_o <= {16'h807f, 8'h12};
            16'd128: lut_data_o <= {16'h8080, 8'h0a};
            16'd129: lut_data_o <= {16'h8081, 8'hff};
            16'd130: lut_data_o <= {16'h8082, 8'hc2};
            16'd131: lut_data_o <= {16'h8083, 8'h37};
            16'd132: lut_data_o <= {16'h8084, 8'h22};
            16'd133: lut_data_o <= {16'h8085, 8'h78};
            16'd134: lut_data_o <= {16'h8086, 8'hb8};
            16'd135: lut_data_o <= {16'h8087, 8'he6};
            16'd136: lut_data_o <= {16'h8088, 8'hd3};
            16'd137: lut_data_o <= {16'h8089, 8'h94};
            16'd138: lut_data_o <= {16'h808a, 8'h00};
            16'd139: lut_data_o <= {16'h808b, 8'h40};
            16'd140: lut_data_o <= {16'h808c, 8'h02};
            16'd141: lut_data_o <= {16'h808d, 8'h16};
            16'd142: lut_data_o <= {16'h808e, 8'h22};
            16'd143: lut_data_o <= {16'h808f, 8'he5};
            16'd144: lut_data_o <= {16'h8090, 8'h1f};
            16'd145: lut_data_o <= {16'h8091, 8'hb4};
            16'd146: lut_data_o <= {16'h8092, 8'h05};
            16'd147: lut_data_o <= {16'h8093, 8'h23};
            16'd148: lut_data_o <= {16'h8094, 8'he4};
            16'd149: lut_data_o <= {16'h8095, 8'hf5};
            16'd150: lut_data_o <= {16'h8096, 8'h1f};
            16'd151: lut_data_o <= {16'h8097, 8'hc2};
            16'd152: lut_data_o <= {16'h8098, 8'h01};
            16'd153: lut_data_o <= {16'h8099, 8'h78};
            16'd154: lut_data_o <= {16'h809a, 8'hb6};
            16'd155: lut_data_o <= {16'h809b, 8'he6};
            16'd156: lut_data_o <= {16'h809c, 8'hfe};
            16'd157: lut_data_o <= {16'h809d, 8'h08};
            16'd158: lut_data_o <= {16'h809e, 8'he6};
            16'd159: lut_data_o <= {16'h809f, 8'hff};
            16'd160: lut_data_o <= {16'h80a0, 8'h78};
            16'd161: lut_data_o <= {16'h80a1, 8'h4e};
            16'd162: lut_data_o <= {16'h80a2, 8'ha6};
            16'd163: lut_data_o <= {16'h80a3, 8'h06};
            16'd164: lut_data_o <= {16'h80a4, 8'h08};
            16'd165: lut_data_o <= {16'h80a5, 8'ha6};
            16'd166: lut_data_o <= {16'h80a6, 8'h07};
            16'd167: lut_data_o <= {16'h80a7, 8'ha2};
            16'd168: lut_data_o <= {16'h80a8, 8'h37};
            16'd169: lut_data_o <= {16'h80a9, 8'he4};
            16'd170: lut_data_o <= {16'h80aa, 8'h33};
            16'd171: lut_data_o <= {16'h80ab, 8'hf5};
            16'd172: lut_data_o <= {16'h80ac, 8'h3c};
            16'd173: lut_data_o <= {16'h80ad, 8'h90};
            16'd174: lut_data_o <= {16'h80ae, 8'h30};
            16'd175: lut_data_o <= {16'h80af, 8'h28};
            16'd176: lut_data_o <= {16'h80b0, 8'hf0};
            16'd177: lut_data_o <= {16'h80b1, 8'h75};
            16'd178: lut_data_o <= {16'h80b2, 8'h1e};
            16'd179: lut_data_o <= {16'h80b3, 8'h10};
            16'd180: lut_data_o <= {16'h80b4, 8'hd2};
            16'd181: lut_data_o <= {16'h80b5, 8'h35};
            16'd182: lut_data_o <= {16'h80b6, 8'h22};
            16'd183: lut_data_o <= {16'h80b7, 8'he5};
            16'd184: lut_data_o <= {16'h80b8, 8'h4b};
            16'd185: lut_data_o <= {16'h80b9, 8'h75};
            16'd186: lut_data_o <= {16'h80ba, 8'hf0};
            16'd187: lut_data_o <= {16'h80bb, 8'h05};
            16'd188: lut_data_o <= {16'h80bc, 8'h84};
            16'd189: lut_data_o <= {16'h80bd, 8'h78};
            16'd190: lut_data_o <= {16'h80be, 8'hbc};
            16'd191: lut_data_o <= {16'h80bf, 8'hf6};
            16'd192: lut_data_o <= {16'h80c0, 8'h90};
            16'd193: lut_data_o <= {16'h80c1, 8'h0e};
            16'd194: lut_data_o <= {16'h80c2, 8'h8c};
            16'd195: lut_data_o <= {16'h80c3, 8'he4};
            16'd196: lut_data_o <= {16'h80c4, 8'h93};
            16'd197: lut_data_o <= {16'h80c5, 8'hff};
            16'd198: lut_data_o <= {16'h80c6, 8'h25};
            16'd199: lut_data_o <= {16'h80c7, 8'he0};
            16'd200: lut_data_o <= {16'h80c8, 8'h24};
            16'd201: lut_data_o <= {16'h80c9, 8'h0a};
            16'd202: lut_data_o <= {16'h80ca, 8'hf8};
            16'd203: lut_data_o <= {16'h80cb, 8'he6};
            16'd204: lut_data_o <= {16'h80cc, 8'hfc};
            16'd205: lut_data_o <= {16'h80cd, 8'h08};
            16'd206: lut_data_o <= {16'h80ce, 8'he6};
            16'd207: lut_data_o <= {16'h80cf, 8'hfd};
            16'd208: lut_data_o <= {16'h80d0, 8'h78};
            16'd209: lut_data_o <= {16'h80d1, 8'hbc};
            16'd210: lut_data_o <= {16'h80d2, 8'he6};
            16'd211: lut_data_o <= {16'h80d3, 8'h25};
            16'd212: lut_data_o <= {16'h80d4, 8'he0};
            16'd213: lut_data_o <= {16'h80d5, 8'h24};
            16'd214: lut_data_o <= {16'h80d6, 8'h4e};
            16'd215: lut_data_o <= {16'h80d7, 8'hf8};
            16'd216: lut_data_o <= {16'h80d8, 8'ha6};
            16'd217: lut_data_o <= {16'h80d9, 8'h04};
            16'd218: lut_data_o <= {16'h80da, 8'h08};
            16'd219: lut_data_o <= {16'h80db, 8'ha6};
            16'd220: lut_data_o <= {16'h80dc, 8'h05};
            16'd221: lut_data_o <= {16'h80dd, 8'hef};
            16'd222: lut_data_o <= {16'h80de, 8'h12};
            16'd223: lut_data_o <= {16'h80df, 8'h0f};
            16'd224: lut_data_o <= {16'h80e0, 8'h0b};
            16'd225: lut_data_o <= {16'h80e1, 8'hd3};
            16'd226: lut_data_o <= {16'h80e2, 8'h78};
            16'd227: lut_data_o <= {16'h80e3, 8'hb7};
            16'd228: lut_data_o <= {16'h80e4, 8'h96};
            16'd229: lut_data_o <= {16'h80e5, 8'hee};
            16'd230: lut_data_o <= {16'h80e6, 8'h18};
            16'd231: lut_data_o <= {16'h80e7, 8'h96};
            16'd232: lut_data_o <= {16'h80e8, 8'h40};
            16'd233: lut_data_o <= {16'h80e9, 8'h0d};
            16'd234: lut_data_o <= {16'h80ea, 8'h78};
            16'd235: lut_data_o <= {16'h80eb, 8'hbc};
            16'd236: lut_data_o <= {16'h80ec, 8'he6};
            16'd237: lut_data_o <= {16'h80ed, 8'h78};
            16'd238: lut_data_o <= {16'h80ee, 8'hb9};
            16'd239: lut_data_o <= {16'h80ef, 8'hf6};
            16'd240: lut_data_o <= {16'h80f0, 8'h78};
            16'd241: lut_data_o <= {16'h80f1, 8'hb6};
            16'd242: lut_data_o <= {16'h80f2, 8'ha6};
            16'd243: lut_data_o <= {16'h80f3, 8'h06};
            16'd244: lut_data_o <= {16'h80f4, 8'h08};
            16'd245: lut_data_o <= {16'h80f5, 8'ha6};
            16'd246: lut_data_o <= {16'h80f6, 8'h07};
            16'd247: lut_data_o <= {16'h80f7, 8'h90};
            16'd248: lut_data_o <= {16'h80f8, 8'h0e};
            16'd249: lut_data_o <= {16'h80f9, 8'h8c};
            16'd250: lut_data_o <= {16'h80fa, 8'he4};
            16'd251: lut_data_o <= {16'h80fb, 8'h93};
            16'd252: lut_data_o <= {16'h80fc, 8'h12};
            16'd253: lut_data_o <= {16'h80fd, 8'h0f};
            16'd254: lut_data_o <= {16'h80fe, 8'h0b};
            16'd255: lut_data_o <= {16'h80ff, 8'hc3};
            16'd256: lut_data_o <= {16'h8100, 8'h78};
            16'd257: lut_data_o <= {16'h8101, 8'hc2};
            16'd258: lut_data_o <= {16'h8102, 8'h96};
            16'd259: lut_data_o <= {16'h8103, 8'hee};
            16'd260: lut_data_o <= {16'h8104, 8'h18};
            16'd261: lut_data_o <= {16'h8105, 8'h96};
            16'd262: lut_data_o <= {16'h8106, 8'h50};
            16'd263: lut_data_o <= {16'h8107, 8'h0d};
            16'd264: lut_data_o <= {16'h8108, 8'h78};
            16'd265: lut_data_o <= {16'h8109, 8'hbc};
            16'd266: lut_data_o <= {16'h810a, 8'he6};
            16'd267: lut_data_o <= {16'h810b, 8'h78};
            16'd268: lut_data_o <= {16'h810c, 8'hba};
            16'd269: lut_data_o <= {16'h810d, 8'hf6};
            16'd270: lut_data_o <= {16'h810e, 8'h78};
            16'd271: lut_data_o <= {16'h810f, 8'hc1};
            16'd272: lut_data_o <= {16'h8110, 8'ha6};
            16'd273: lut_data_o <= {16'h8111, 8'h06};
            16'd274: lut_data_o <= {16'h8112, 8'h08};
            16'd275: lut_data_o <= {16'h8113, 8'ha6};
            16'd276: lut_data_o <= {16'h8114, 8'h07};
            16'd277: lut_data_o <= {16'h8115, 8'h78};
            16'd278: lut_data_o <= {16'h8116, 8'hb6};
            16'd279: lut_data_o <= {16'h8117, 8'he6};
            16'd280: lut_data_o <= {16'h8118, 8'hfe};
            16'd281: lut_data_o <= {16'h8119, 8'h08};
            16'd282: lut_data_o <= {16'h811a, 8'he6};
            16'd283: lut_data_o <= {16'h811b, 8'hc3};
            16'd284: lut_data_o <= {16'h811c, 8'h78};
            16'd285: lut_data_o <= {16'h811d, 8'hc2};
            16'd286: lut_data_o <= {16'h811e, 8'h96};
            16'd287: lut_data_o <= {16'h811f, 8'hff};
            16'd288: lut_data_o <= {16'h8120, 8'hee};
            16'd289: lut_data_o <= {16'h8121, 8'h18};
            16'd290: lut_data_o <= {16'h8122, 8'h96};
            16'd291: lut_data_o <= {16'h8123, 8'h78};
            16'd292: lut_data_o <= {16'h8124, 8'hc3};
            16'd293: lut_data_o <= {16'h8125, 8'hf6};
            16'd294: lut_data_o <= {16'h8126, 8'h08};
            16'd295: lut_data_o <= {16'h8127, 8'ha6};
            16'd296: lut_data_o <= {16'h8128, 8'h07};
            16'd297: lut_data_o <= {16'h8129, 8'h90};
            16'd298: lut_data_o <= {16'h812a, 8'h0e};
            16'd299: lut_data_o <= {16'h812b, 8'h95};
            16'd300: lut_data_o <= {16'h812c, 8'he4};
            16'd301: lut_data_o <= {16'h812d, 8'h18};
            16'd302: lut_data_o <= {16'h812e, 8'h12};
            16'd303: lut_data_o <= {16'h812f, 8'h0e};
            16'd304: lut_data_o <= {16'h8130, 8'he9};
            16'd305: lut_data_o <= {16'h8131, 8'h40};
            16'd306: lut_data_o <= {16'h8132, 8'h02};
            16'd307: lut_data_o <= {16'h8133, 8'hd2};
            16'd308: lut_data_o <= {16'h8134, 8'h37};
            16'd309: lut_data_o <= {16'h8135, 8'h78};
            16'd310: lut_data_o <= {16'h8136, 8'hbc};
            16'd311: lut_data_o <= {16'h8137, 8'he6};
            16'd312: lut_data_o <= {16'h8138, 8'h08};
            16'd313: lut_data_o <= {16'h8139, 8'h26};
            16'd314: lut_data_o <= {16'h813a, 8'h08};
            16'd315: lut_data_o <= {16'h813b, 8'hf6};
            16'd316: lut_data_o <= {16'h813c, 8'he5};
            16'd317: lut_data_o <= {16'h813d, 8'h1f};
            16'd318: lut_data_o <= {16'h813e, 8'h64};
            16'd319: lut_data_o <= {16'h813f, 8'h01};
            16'd320: lut_data_o <= {16'h8140, 8'h70};
            16'd321: lut_data_o <= {16'h8141, 8'h4a};
            16'd322: lut_data_o <= {16'h8142, 8'he6};
            16'd323: lut_data_o <= {16'h8143, 8'hc3};
            16'd324: lut_data_o <= {16'h8144, 8'h78};
            16'd325: lut_data_o <= {16'h8145, 8'hc0};
            16'd326: lut_data_o <= {16'h8146, 8'h12};
            16'd327: lut_data_o <= {16'h8147, 8'h0e};
            16'd328: lut_data_o <= {16'h8148, 8'hdf};
            16'd329: lut_data_o <= {16'h8149, 8'h40};
            16'd330: lut_data_o <= {16'h814a, 8'h05};
            16'd331: lut_data_o <= {16'h814b, 8'h12};
            16'd332: lut_data_o <= {16'h814c, 8'h0e};
            16'd333: lut_data_o <= {16'h814d, 8'hda};
            16'd334: lut_data_o <= {16'h814e, 8'h40};
            16'd335: lut_data_o <= {16'h814f, 8'h39};
            16'd336: lut_data_o <= {16'h8150, 8'h12};
            16'd337: lut_data_o <= {16'h8151, 8'h0f};
            16'd338: lut_data_o <= {16'h8152, 8'h02};
            16'd339: lut_data_o <= {16'h8153, 8'h40};
            16'd340: lut_data_o <= {16'h8154, 8'h04};
            16'd341: lut_data_o <= {16'h8155, 8'h7f};
            16'd342: lut_data_o <= {16'h8156, 8'hfe};
            16'd343: lut_data_o <= {16'h8157, 8'h80};
            16'd344: lut_data_o <= {16'h8158, 8'h02};
            16'd345: lut_data_o <= {16'h8159, 8'h7f};
            16'd346: lut_data_o <= {16'h815a, 8'h02};
            16'd347: lut_data_o <= {16'h815b, 8'h78};
            16'd348: lut_data_o <= {16'h815c, 8'hbd};
            16'd349: lut_data_o <= {16'h815d, 8'ha6};
            16'd350: lut_data_o <= {16'h815e, 8'h07};
            16'd351: lut_data_o <= {16'h815f, 8'h78};
            16'd352: lut_data_o <= {16'h8160, 8'hb9};
            16'd353: lut_data_o <= {16'h8161, 8'he6};
            16'd354: lut_data_o <= {16'h8162, 8'h24};
            16'd355: lut_data_o <= {16'h8163, 8'h03};
            16'd356: lut_data_o <= {16'h8164, 8'h78};
            16'd357: lut_data_o <= {16'h8165, 8'hbf};
            16'd358: lut_data_o <= {16'h8166, 8'hf6};
            16'd359: lut_data_o <= {16'h8167, 8'h78};
            16'd360: lut_data_o <= {16'h8168, 8'hb9};
            16'd361: lut_data_o <= {16'h8169, 8'he6};
            16'd362: lut_data_o <= {16'h816a, 8'h24};
            16'd363: lut_data_o <= {16'h816b, 8'hfd};
            16'd364: lut_data_o <= {16'h816c, 8'h78};
            16'd365: lut_data_o <= {16'h816d, 8'hc0};
            16'd366: lut_data_o <= {16'h816e, 8'hf6};
            16'd367: lut_data_o <= {16'h816f, 8'h12};
            16'd368: lut_data_o <= {16'h8170, 8'h0f};
            16'd369: lut_data_o <= {16'h8171, 8'h02};
            16'd370: lut_data_o <= {16'h8172, 8'h40};
            16'd371: lut_data_o <= {16'h8173, 8'h06};
            16'd372: lut_data_o <= {16'h8174, 8'h78};
            16'd373: lut_data_o <= {16'h8175, 8'hc0};
            16'd374: lut_data_o <= {16'h8176, 8'he6};
            16'd375: lut_data_o <= {16'h8177, 8'hff};
            16'd376: lut_data_o <= {16'h8178, 8'h80};
            16'd377: lut_data_o <= {16'h8179, 8'h04};
            16'd378: lut_data_o <= {16'h817a, 8'h78};
            16'd379: lut_data_o <= {16'h817b, 8'hbf};
            16'd380: lut_data_o <= {16'h817c, 8'he6};
            16'd381: lut_data_o <= {16'h817d, 8'hff};
            16'd382: lut_data_o <= {16'h817e, 8'h78};
            16'd383: lut_data_o <= {16'h817f, 8'hbe};
            16'd384: lut_data_o <= {16'h8180, 8'ha6};
            16'd385: lut_data_o <= {16'h8181, 8'h07};
            16'd386: lut_data_o <= {16'h8182, 8'h75};
            16'd387: lut_data_o <= {16'h8183, 8'h1f};
            16'd388: lut_data_o <= {16'h8184, 8'h02};
            16'd389: lut_data_o <= {16'h8185, 8'h78};
            16'd390: lut_data_o <= {16'h8186, 8'hb8};
            16'd391: lut_data_o <= {16'h8187, 8'h76};
            16'd392: lut_data_o <= {16'h8188, 8'h01};
            16'd393: lut_data_o <= {16'h8189, 8'h02};
            16'd394: lut_data_o <= {16'h818a, 8'h02};
            16'd395: lut_data_o <= {16'h818b, 8'h4a};
            16'd396: lut_data_o <= {16'h818c, 8'he5};
            16'd397: lut_data_o <= {16'h818d, 8'h1f};
            16'd398: lut_data_o <= {16'h818e, 8'h64};
            16'd399: lut_data_o <= {16'h818f, 8'h02};
            16'd400: lut_data_o <= {16'h8190, 8'h60};
            16'd401: lut_data_o <= {16'h8191, 8'h03};
            16'd402: lut_data_o <= {16'h8192, 8'h02};
            16'd403: lut_data_o <= {16'h8193, 8'h02};
            16'd404: lut_data_o <= {16'h8194, 8'h2a};
            16'd405: lut_data_o <= {16'h8195, 8'h78};
            16'd406: lut_data_o <= {16'h8196, 8'hbe};
            16'd407: lut_data_o <= {16'h8197, 8'he6};
            16'd408: lut_data_o <= {16'h8198, 8'hff};
            16'd409: lut_data_o <= {16'h8199, 8'hc3};
            16'd410: lut_data_o <= {16'h819a, 8'h78};
            16'd411: lut_data_o <= {16'h819b, 8'hc0};
            16'd412: lut_data_o <= {16'h819c, 8'h12};
            16'd413: lut_data_o <= {16'h819d, 8'h0e};
            16'd414: lut_data_o <= {16'h819e, 8'he0};
            16'd415: lut_data_o <= {16'h819f, 8'h40};
            16'd416: lut_data_o <= {16'h81a0, 8'h08};
            16'd417: lut_data_o <= {16'h81a1, 8'h12};
            16'd418: lut_data_o <= {16'h81a2, 8'h0e};
            16'd419: lut_data_o <= {16'h81a3, 8'hda};
            16'd420: lut_data_o <= {16'h81a4, 8'h50};
            16'd421: lut_data_o <= {16'h81a5, 8'h03};
            16'd422: lut_data_o <= {16'h81a6, 8'h02};
            16'd423: lut_data_o <= {16'h81a7, 8'h02};
            16'd424: lut_data_o <= {16'h81a8, 8'h28};
            16'd425: lut_data_o <= {16'h81a9, 8'h12};
            16'd426: lut_data_o <= {16'h81aa, 8'h0f};
            16'd427: lut_data_o <= {16'h81ab, 8'h02};
            16'd428: lut_data_o <= {16'h81ac, 8'h40};
            16'd429: lut_data_o <= {16'h81ad, 8'h04};
            16'd430: lut_data_o <= {16'h81ae, 8'h7f};
            16'd431: lut_data_o <= {16'h81af, 8'hff};
            16'd432: lut_data_o <= {16'h81b0, 8'h80};
            16'd433: lut_data_o <= {16'h81b1, 8'h02};
            16'd434: lut_data_o <= {16'h81b2, 8'h7f};
            16'd435: lut_data_o <= {16'h81b3, 8'h01};
            16'd436: lut_data_o <= {16'h81b4, 8'h78};
            16'd437: lut_data_o <= {16'h81b5, 8'hbd};
            16'd438: lut_data_o <= {16'h81b6, 8'ha6};
            16'd439: lut_data_o <= {16'h81b7, 8'h07};
            16'd440: lut_data_o <= {16'h81b8, 8'h78};
            16'd441: lut_data_o <= {16'h81b9, 8'hb9};
            16'd442: lut_data_o <= {16'h81ba, 8'he6};
            16'd443: lut_data_o <= {16'h81bb, 8'h04};
            16'd444: lut_data_o <= {16'h81bc, 8'h78};
            16'd445: lut_data_o <= {16'h81bd, 8'hbf};
            16'd446: lut_data_o <= {16'h81be, 8'hf6};
            16'd447: lut_data_o <= {16'h81bf, 8'h78};
            16'd448: lut_data_o <= {16'h81c0, 8'hb9};
            16'd449: lut_data_o <= {16'h81c1, 8'he6};
            16'd450: lut_data_o <= {16'h81c2, 8'h14};
            16'd451: lut_data_o <= {16'h81c3, 8'h78};
            16'd452: lut_data_o <= {16'h81c4, 8'hc0};
            16'd453: lut_data_o <= {16'h81c5, 8'hf6};
            16'd454: lut_data_o <= {16'h81c6, 8'h18};
            16'd455: lut_data_o <= {16'h81c7, 8'h12};
            16'd456: lut_data_o <= {16'h81c8, 8'h0f};
            16'd457: lut_data_o <= {16'h81c9, 8'h04};
            16'd458: lut_data_o <= {16'h81ca, 8'h40};
            16'd459: lut_data_o <= {16'h81cb, 8'h04};
            16'd460: lut_data_o <= {16'h81cc, 8'he6};
            16'd461: lut_data_o <= {16'h81cd, 8'hff};
            16'd462: lut_data_o <= {16'h81ce, 8'h80};
            16'd463: lut_data_o <= {16'h81cf, 8'h02};
            16'd464: lut_data_o <= {16'h81d0, 8'h7f};
            16'd465: lut_data_o <= {16'h81d1, 8'h00};
            16'd466: lut_data_o <= {16'h81d2, 8'h78};
            16'd467: lut_data_o <= {16'h81d3, 8'hbf};
            16'd468: lut_data_o <= {16'h81d4, 8'ha6};
            16'd469: lut_data_o <= {16'h81d5, 8'h07};
            16'd470: lut_data_o <= {16'h81d6, 8'hd3};
            16'd471: lut_data_o <= {16'h81d7, 8'h08};
            16'd472: lut_data_o <= {16'h81d8, 8'he6};
            16'd473: lut_data_o <= {16'h81d9, 8'h64};
            16'd474: lut_data_o <= {16'h81da, 8'h80};
            16'd475: lut_data_o <= {16'h81db, 8'h94};
            16'd476: lut_data_o <= {16'h81dc, 8'h80};
            16'd477: lut_data_o <= {16'h81dd, 8'h40};
            16'd478: lut_data_o <= {16'h81de, 8'h04};
            16'd479: lut_data_o <= {16'h81df, 8'he6};
            16'd480: lut_data_o <= {16'h81e0, 8'hff};
            16'd481: lut_data_o <= {16'h81e1, 8'h80};
            16'd482: lut_data_o <= {16'h81e2, 8'h02};
            16'd483: lut_data_o <= {16'h81e3, 8'h7f};
            16'd484: lut_data_o <= {16'h81e4, 8'h00};
            16'd485: lut_data_o <= {16'h81e5, 8'h78};
            16'd486: lut_data_o <= {16'h81e6, 8'hc0};
            16'd487: lut_data_o <= {16'h81e7, 8'ha6};
            16'd488: lut_data_o <= {16'h81e8, 8'h07};
            16'd489: lut_data_o <= {16'h81e9, 8'hc3};
            16'd490: lut_data_o <= {16'h81ea, 8'h18};
            16'd491: lut_data_o <= {16'h81eb, 8'he6};
            16'd492: lut_data_o <= {16'h81ec, 8'h64};
            16'd493: lut_data_o <= {16'h81ed, 8'h80};
            16'd494: lut_data_o <= {16'h81ee, 8'h94};
            16'd495: lut_data_o <= {16'h81ef, 8'hb3};
            16'd496: lut_data_o <= {16'h81f0, 8'h50};
            16'd497: lut_data_o <= {16'h81f1, 8'h04};
            16'd498: lut_data_o <= {16'h81f2, 8'he6};
            16'd499: lut_data_o <= {16'h81f3, 8'hff};
            16'd500: lut_data_o <= {16'h81f4, 8'h80};
            16'd501: lut_data_o <= {16'h81f5, 8'h02};
            16'd502: lut_data_o <= {16'h81f6, 8'h7f};
            16'd503: lut_data_o <= {16'h81f7, 8'h33};
            16'd504: lut_data_o <= {16'h81f8, 8'h78};
            16'd505: lut_data_o <= {16'h81f9, 8'hbf};
            16'd506: lut_data_o <= {16'h81fa, 8'ha6};
            16'd507: lut_data_o <= {16'h81fb, 8'h07};
            16'd508: lut_data_o <= {16'h81fc, 8'hc3};
            16'd509: lut_data_o <= {16'h81fd, 8'h08};
            16'd510: lut_data_o <= {16'h81fe, 8'he6};
            16'd511: lut_data_o <= {16'h81ff, 8'h64};
            16'd512: lut_data_o <= {16'h8200, 8'h80};
            16'd513: lut_data_o <= {16'h8201, 8'h94};
            16'd514: lut_data_o <= {16'h8202, 8'hb3};
            16'd515: lut_data_o <= {16'h8203, 8'h50};
            16'd516: lut_data_o <= {16'h8204, 8'h04};
            16'd517: lut_data_o <= {16'h8205, 8'he6};
            16'd518: lut_data_o <= {16'h8206, 8'hff};
            16'd519: lut_data_o <= {16'h8207, 8'h80};
            16'd520: lut_data_o <= {16'h8208, 8'h02};
            16'd521: lut_data_o <= {16'h8209, 8'h7f};
            16'd522: lut_data_o <= {16'h820a, 8'h33};
            16'd523: lut_data_o <= {16'h820b, 8'h78};
            16'd524: lut_data_o <= {16'h820c, 8'hc0};
            16'd525: lut_data_o <= {16'h820d, 8'ha6};
            16'd526: lut_data_o <= {16'h820e, 8'h07};
            16'd527: lut_data_o <= {16'h820f, 8'h12};
            16'd528: lut_data_o <= {16'h8210, 8'h0f};
            16'd529: lut_data_o <= {16'h8211, 8'h02};
            16'd530: lut_data_o <= {16'h8212, 8'h40};
            16'd531: lut_data_o <= {16'h8213, 8'h06};
            16'd532: lut_data_o <= {16'h8214, 8'h78};
            16'd533: lut_data_o <= {16'h8215, 8'hc0};
            16'd534: lut_data_o <= {16'h8216, 8'he6};
            16'd535: lut_data_o <= {16'h8217, 8'hff};
            16'd536: lut_data_o <= {16'h8218, 8'h80};
            16'd537: lut_data_o <= {16'h8219, 8'h04};
            16'd538: lut_data_o <= {16'h821a, 8'h78};
            16'd539: lut_data_o <= {16'h821b, 8'hbf};
            16'd540: lut_data_o <= {16'h821c, 8'he6};
            16'd541: lut_data_o <= {16'h821d, 8'hff};
            16'd542: lut_data_o <= {16'h821e, 8'h78};
            16'd543: lut_data_o <= {16'h821f, 8'hbe};
            16'd544: lut_data_o <= {16'h8220, 8'ha6};
            16'd545: lut_data_o <= {16'h8221, 8'h07};
            16'd546: lut_data_o <= {16'h8222, 8'h75};
            16'd547: lut_data_o <= {16'h8223, 8'h1f};
            16'd548: lut_data_o <= {16'h8224, 8'h03};
            16'd549: lut_data_o <= {16'h8225, 8'h78};
            16'd550: lut_data_o <= {16'h8226, 8'hb8};
            16'd551: lut_data_o <= {16'h8227, 8'h76};
            16'd552: lut_data_o <= {16'h8228, 8'h01};
            16'd553: lut_data_o <= {16'h8229, 8'h80};
            16'd554: lut_data_o <= {16'h822a, 8'h20};
            16'd555: lut_data_o <= {16'h822b, 8'he5};
            16'd556: lut_data_o <= {16'h822c, 8'h1f};
            16'd557: lut_data_o <= {16'h822d, 8'h64};
            16'd558: lut_data_o <= {16'h822e, 8'h03};
            16'd559: lut_data_o <= {16'h822f, 8'h70};
            16'd560: lut_data_o <= {16'h8230, 8'h26};
            16'd561: lut_data_o <= {16'h8231, 8'h78};
            16'd562: lut_data_o <= {16'h8232, 8'hbe};
            16'd563: lut_data_o <= {16'h8233, 8'he6};
            16'd564: lut_data_o <= {16'h8234, 8'hff};
            16'd565: lut_data_o <= {16'h8235, 8'hc3};
            16'd566: lut_data_o <= {16'h8236, 8'h78};
            16'd567: lut_data_o <= {16'h8237, 8'hc0};
            16'd568: lut_data_o <= {16'h8238, 8'h12};
            16'd569: lut_data_o <= {16'h8239, 8'h0e};
            16'd570: lut_data_o <= {16'h823a, 8'he0};
            16'd571: lut_data_o <= {16'h823b, 8'h40};
            16'd572: lut_data_o <= {16'h823c, 8'h05};
            16'd573: lut_data_o <= {16'h823d, 8'h12};
            16'd574: lut_data_o <= {16'h823e, 8'h0e};
            16'd575: lut_data_o <= {16'h823f, 8'hda};
            16'd576: lut_data_o <= {16'h8240, 8'h40};
            16'd577: lut_data_o <= {16'h8241, 8'h09};
            16'd578: lut_data_o <= {16'h8242, 8'h78};
            16'd579: lut_data_o <= {16'h8243, 8'hb9};
            16'd580: lut_data_o <= {16'h8244, 8'he6};
            16'd581: lut_data_o <= {16'h8245, 8'h78};
            16'd582: lut_data_o <= {16'h8246, 8'hbe};
            16'd583: lut_data_o <= {16'h8247, 8'hf6};
            16'd584: lut_data_o <= {16'h8248, 8'h75};
            16'd585: lut_data_o <= {16'h8249, 8'h1f};
            16'd586: lut_data_o <= {16'h824a, 8'h04};
            16'd587: lut_data_o <= {16'h824b, 8'h78};
            16'd588: lut_data_o <= {16'h824c, 8'hbe};
            16'd589: lut_data_o <= {16'h824d, 8'he6};
            16'd590: lut_data_o <= {16'h824e, 8'h75};
            16'd591: lut_data_o <= {16'h824f, 8'hf0};
            16'd592: lut_data_o <= {16'h8250, 8'h05};
            16'd593: lut_data_o <= {16'h8251, 8'ha4};
            16'd594: lut_data_o <= {16'h8252, 8'hf5};
            16'd595: lut_data_o <= {16'h8253, 8'h4b};
            16'd596: lut_data_o <= {16'h8254, 8'h02};
            16'd597: lut_data_o <= {16'h8255, 8'h0a};
            16'd598: lut_data_o <= {16'h8256, 8'hff};
            16'd599: lut_data_o <= {16'h8257, 8'he5};
            16'd600: lut_data_o <= {16'h8258, 8'h1f};
            16'd601: lut_data_o <= {16'h8259, 8'hb4};
            16'd602: lut_data_o <= {16'h825a, 8'h04};
            16'd603: lut_data_o <= {16'h825b, 8'h10};
            16'd604: lut_data_o <= {16'h825c, 8'h90};
            16'd605: lut_data_o <= {16'h825d, 8'h0e};
            16'd606: lut_data_o <= {16'h825e, 8'h94};
            16'd607: lut_data_o <= {16'h825f, 8'he4};
            16'd608: lut_data_o <= {16'h8260, 8'h78};
            16'd609: lut_data_o <= {16'h8261, 8'hc3};
            16'd610: lut_data_o <= {16'h8262, 8'h12};
            16'd611: lut_data_o <= {16'h8263, 8'h0e};
            16'd612: lut_data_o <= {16'h8264, 8'he9};
            16'd613: lut_data_o <= {16'h8265, 8'h40};
            16'd614: lut_data_o <= {16'h8266, 8'h02};
            16'd615: lut_data_o <= {16'h8267, 8'hd2};
            16'd616: lut_data_o <= {16'h8268, 8'h37};
            16'd617: lut_data_o <= {16'h8269, 8'h75};
            16'd618: lut_data_o <= {16'h826a, 8'h1f};
            16'd619: lut_data_o <= {16'h826b, 8'h05};
            16'd620: lut_data_o <= {16'h826c, 8'h22};
            16'd621: lut_data_o <= {16'h826d, 8'h30};
            16'd622: lut_data_o <= {16'h826e, 8'h01};
            16'd623: lut_data_o <= {16'h826f, 8'h03};
            16'd624: lut_data_o <= {16'h8270, 8'h02};
            16'd625: lut_data_o <= {16'h8271, 8'h04};
            16'd626: lut_data_o <= {16'h8272, 8'hc0};
            16'd627: lut_data_o <= {16'h8273, 8'h30};
            16'd628: lut_data_o <= {16'h8274, 8'h02};
            16'd629: lut_data_o <= {16'h8275, 8'h03};
            16'd630: lut_data_o <= {16'h8276, 8'h02};
            16'd631: lut_data_o <= {16'h8277, 8'h04};
            16'd632: lut_data_o <= {16'h8278, 8'hc0};
            16'd633: lut_data_o <= {16'h8279, 8'h90};
            16'd634: lut_data_o <= {16'h827a, 8'h51};
            16'd635: lut_data_o <= {16'h827b, 8'ha5};
            16'd636: lut_data_o <= {16'h827c, 8'he0};
            16'd637: lut_data_o <= {16'h827d, 8'h78};
            16'd638: lut_data_o <= {16'h827e, 8'h93};
            16'd639: lut_data_o <= {16'h827f, 8'hf6};
            16'd640: lut_data_o <= {16'h8280, 8'ha3};
            16'd641: lut_data_o <= {16'h8281, 8'he0};
            16'd642: lut_data_o <= {16'h8282, 8'h08};
            16'd643: lut_data_o <= {16'h8283, 8'hf6};
            16'd644: lut_data_o <= {16'h8284, 8'ha3};
            16'd645: lut_data_o <= {16'h8285, 8'he0};
            16'd646: lut_data_o <= {16'h8286, 8'h08};
            16'd647: lut_data_o <= {16'h8287, 8'hf6};
            16'd648: lut_data_o <= {16'h8288, 8'he5};
            16'd649: lut_data_o <= {16'h8289, 8'h1f};
            16'd650: lut_data_o <= {16'h828a, 8'h70};
            16'd651: lut_data_o <= {16'h828b, 8'h3c};
            16'd652: lut_data_o <= {16'h828c, 8'h75};
            16'd653: lut_data_o <= {16'h828d, 8'h1e};
            16'd654: lut_data_o <= {16'h828e, 8'h20};
            16'd655: lut_data_o <= {16'h828f, 8'hd2};
            16'd656: lut_data_o <= {16'h8290, 8'h35};
            16'd657: lut_data_o <= {16'h8291, 8'h12};
            16'd658: lut_data_o <= {16'h8292, 8'h0c};
            16'd659: lut_data_o <= {16'h8293, 8'h7a};
            16'd660: lut_data_o <= {16'h8294, 8'h78};
            16'd661: lut_data_o <= {16'h8295, 8'h7e};
            16'd662: lut_data_o <= {16'h8296, 8'ha6};
            16'd663: lut_data_o <= {16'h8297, 8'h06};
            16'd664: lut_data_o <= {16'h8298, 8'h08};
            16'd665: lut_data_o <= {16'h8299, 8'ha6};
            16'd666: lut_data_o <= {16'h829a, 8'h07};
            16'd667: lut_data_o <= {16'h829b, 8'h78};
            16'd668: lut_data_o <= {16'h829c, 8'h8b};
            16'd669: lut_data_o <= {16'h829d, 8'ha6};
            16'd670: lut_data_o <= {16'h829e, 8'h09};
            16'd671: lut_data_o <= {16'h829f, 8'h18};
            16'd672: lut_data_o <= {16'h82a0, 8'h76};
            16'd673: lut_data_o <= {16'h82a1, 8'h01};
            16'd674: lut_data_o <= {16'h82a2, 8'h12};
            16'd675: lut_data_o <= {16'h82a3, 8'h0c};
            16'd676: lut_data_o <= {16'h82a4, 8'h5b};
            16'd677: lut_data_o <= {16'h82a5, 8'h78};
            16'd678: lut_data_o <= {16'h82a6, 8'h4e};
            16'd679: lut_data_o <= {16'h82a7, 8'ha6};
            16'd680: lut_data_o <= {16'h82a8, 8'h06};
            16'd681: lut_data_o <= {16'h82a9, 8'h08};
            16'd682: lut_data_o <= {16'h82aa, 8'ha6};
            16'd683: lut_data_o <= {16'h82ab, 8'h07};
            16'd684: lut_data_o <= {16'h82ac, 8'h78};
            16'd685: lut_data_o <= {16'h82ad, 8'h8b};
            16'd686: lut_data_o <= {16'h82ae, 8'he6};
            16'd687: lut_data_o <= {16'h82af, 8'h78};
            16'd688: lut_data_o <= {16'h82b0, 8'h6e};
            16'd689: lut_data_o <= {16'h82b1, 8'hf6};
            16'd690: lut_data_o <= {16'h82b2, 8'h75};
            16'd691: lut_data_o <= {16'h82b3, 8'h1f};
            16'd692: lut_data_o <= {16'h82b4, 8'h01};
            16'd693: lut_data_o <= {16'h82b5, 8'h78};
            16'd694: lut_data_o <= {16'h82b6, 8'h93};
            16'd695: lut_data_o <= {16'h82b7, 8'he6};
            16'd696: lut_data_o <= {16'h82b8, 8'h78};
            16'd697: lut_data_o <= {16'h82b9, 8'h90};
            16'd698: lut_data_o <= {16'h82ba, 8'hf6};
            16'd699: lut_data_o <= {16'h82bb, 8'h78};
            16'd700: lut_data_o <= {16'h82bc, 8'h94};
            16'd701: lut_data_o <= {16'h82bd, 8'he6};
            16'd702: lut_data_o <= {16'h82be, 8'h78};
            16'd703: lut_data_o <= {16'h82bf, 8'h91};
            16'd704: lut_data_o <= {16'h82c0, 8'hf6};
            16'd705: lut_data_o <= {16'h82c1, 8'h78};
            16'd706: lut_data_o <= {16'h82c2, 8'h95};
            16'd707: lut_data_o <= {16'h82c3, 8'he6};
            16'd708: lut_data_o <= {16'h82c4, 8'h78};
            16'd709: lut_data_o <= {16'h82c5, 8'h92};
            16'd710: lut_data_o <= {16'h82c6, 8'hf6};
            16'd711: lut_data_o <= {16'h82c7, 8'h22};
            16'd712: lut_data_o <= {16'h82c8, 8'h79};
            16'd713: lut_data_o <= {16'h82c9, 8'h90};
            16'd714: lut_data_o <= {16'h82ca, 8'he7};
            16'd715: lut_data_o <= {16'h82cb, 8'hd3};
            16'd716: lut_data_o <= {16'h82cc, 8'h78};
            16'd717: lut_data_o <= {16'h82cd, 8'h93};
            16'd718: lut_data_o <= {16'h82ce, 8'h96};
            16'd719: lut_data_o <= {16'h82cf, 8'h40};
            16'd720: lut_data_o <= {16'h82d0, 8'h05};
            16'd721: lut_data_o <= {16'h82d1, 8'he7};
            16'd722: lut_data_o <= {16'h82d2, 8'h96};
            16'd723: lut_data_o <= {16'h82d3, 8'hff};
            16'd724: lut_data_o <= {16'h82d4, 8'h80};
            16'd725: lut_data_o <= {16'h82d5, 8'h08};
            16'd726: lut_data_o <= {16'h82d6, 8'hc3};
            16'd727: lut_data_o <= {16'h82d7, 8'h79};
            16'd728: lut_data_o <= {16'h82d8, 8'h93};
            16'd729: lut_data_o <= {16'h82d9, 8'he7};
            16'd730: lut_data_o <= {16'h82da, 8'h78};
            16'd731: lut_data_o <= {16'h82db, 8'h90};
            16'd732: lut_data_o <= {16'h82dc, 8'h96};
            16'd733: lut_data_o <= {16'h82dd, 8'hff};
            16'd734: lut_data_o <= {16'h82de, 8'h78};
            16'd735: lut_data_o <= {16'h82df, 8'h88};
            16'd736: lut_data_o <= {16'h82e0, 8'h76};
            16'd737: lut_data_o <= {16'h82e1, 8'h00};
            16'd738: lut_data_o <= {16'h82e2, 8'h08};
            16'd739: lut_data_o <= {16'h82e3, 8'ha6};
            16'd740: lut_data_o <= {16'h82e4, 8'h07};
            16'd741: lut_data_o <= {16'h82e5, 8'h79};
            16'd742: lut_data_o <= {16'h82e6, 8'h91};
            16'd743: lut_data_o <= {16'h82e7, 8'he7};
            16'd744: lut_data_o <= {16'h82e8, 8'hd3};
            16'd745: lut_data_o <= {16'h82e9, 8'h78};
            16'd746: lut_data_o <= {16'h82ea, 8'h94};
            16'd747: lut_data_o <= {16'h82eb, 8'h96};
            16'd748: lut_data_o <= {16'h82ec, 8'h40};
            16'd749: lut_data_o <= {16'h82ed, 8'h05};
            16'd750: lut_data_o <= {16'h82ee, 8'he7};
            16'd751: lut_data_o <= {16'h82ef, 8'h96};
            16'd752: lut_data_o <= {16'h82f0, 8'hff};
            16'd753: lut_data_o <= {16'h82f1, 8'h80};
            16'd754: lut_data_o <= {16'h82f2, 8'h08};
            16'd755: lut_data_o <= {16'h82f3, 8'hc3};
            16'd756: lut_data_o <= {16'h82f4, 8'h79};
            16'd757: lut_data_o <= {16'h82f5, 8'h94};
            16'd758: lut_data_o <= {16'h82f6, 8'he7};
            16'd759: lut_data_o <= {16'h82f7, 8'h78};
            16'd760: lut_data_o <= {16'h82f8, 8'h91};
            16'd761: lut_data_o <= {16'h82f9, 8'h96};
            16'd762: lut_data_o <= {16'h82fa, 8'hff};
            16'd763: lut_data_o <= {16'h82fb, 8'h12};
            16'd764: lut_data_o <= {16'h82fc, 8'h0c};
            16'd765: lut_data_o <= {16'h82fd, 8'h8e};
            16'd766: lut_data_o <= {16'h82fe, 8'h79};
            16'd767: lut_data_o <= {16'h82ff, 8'h92};
            16'd768: lut_data_o <= {16'h8300, 8'he7};
            16'd769: lut_data_o <= {16'h8301, 8'hd3};
            16'd770: lut_data_o <= {16'h8302, 8'h78};
            16'd771: lut_data_o <= {16'h8303, 8'h95};
            16'd772: lut_data_o <= {16'h8304, 8'h96};
            16'd773: lut_data_o <= {16'h8305, 8'h40};
            16'd774: lut_data_o <= {16'h8306, 8'h05};
            16'd775: lut_data_o <= {16'h8307, 8'he7};
            16'd776: lut_data_o <= {16'h8308, 8'h96};
            16'd777: lut_data_o <= {16'h8309, 8'hff};
            16'd778: lut_data_o <= {16'h830a, 8'h80};
            16'd779: lut_data_o <= {16'h830b, 8'h08};
            16'd780: lut_data_o <= {16'h830c, 8'hc3};
            16'd781: lut_data_o <= {16'h830d, 8'h79};
            16'd782: lut_data_o <= {16'h830e, 8'h95};
            16'd783: lut_data_o <= {16'h830f, 8'he7};
            16'd784: lut_data_o <= {16'h8310, 8'h78};
            16'd785: lut_data_o <= {16'h8311, 8'h92};
            16'd786: lut_data_o <= {16'h8312, 8'h96};
            16'd787: lut_data_o <= {16'h8313, 8'hff};
            16'd788: lut_data_o <= {16'h8314, 8'h12};
            16'd789: lut_data_o <= {16'h8315, 8'h0c};
            16'd790: lut_data_o <= {16'h8316, 8'h8e};
            16'd791: lut_data_o <= {16'h8317, 8'h12};
            16'd792: lut_data_o <= {16'h8318, 8'h0c};
            16'd793: lut_data_o <= {16'h8319, 8'h5b};
            16'd794: lut_data_o <= {16'h831a, 8'h78};
            16'd795: lut_data_o <= {16'h831b, 8'h8a};
            16'd796: lut_data_o <= {16'h831c, 8'he6};
            16'd797: lut_data_o <= {16'h831d, 8'h25};
            16'd798: lut_data_o <= {16'h831e, 8'he0};
            16'd799: lut_data_o <= {16'h831f, 8'h24};
            16'd800: lut_data_o <= {16'h8320, 8'h4e};
            16'd801: lut_data_o <= {16'h8321, 8'hf8};
            16'd802: lut_data_o <= {16'h8322, 8'ha6};
            16'd803: lut_data_o <= {16'h8323, 8'h06};
            16'd804: lut_data_o <= {16'h8324, 8'h08};
            16'd805: lut_data_o <= {16'h8325, 8'ha6};
            16'd806: lut_data_o <= {16'h8326, 8'h07};
            16'd807: lut_data_o <= {16'h8327, 8'h78};
            16'd808: lut_data_o <= {16'h8328, 8'h8a};
            16'd809: lut_data_o <= {16'h8329, 8'he6};
            16'd810: lut_data_o <= {16'h832a, 8'h24};
            16'd811: lut_data_o <= {16'h832b, 8'h6e};
            16'd812: lut_data_o <= {16'h832c, 8'hf8};
            16'd813: lut_data_o <= {16'h832d, 8'ha6};
            16'd814: lut_data_o <= {16'h832e, 8'h09};
            16'd815: lut_data_o <= {16'h832f, 8'h78};
            16'd816: lut_data_o <= {16'h8330, 8'h8a};
            16'd817: lut_data_o <= {16'h8331, 8'he6};
            16'd818: lut_data_o <= {16'h8332, 8'h24};
            16'd819: lut_data_o <= {16'h8333, 8'h01};
            16'd820: lut_data_o <= {16'h8334, 8'hff};
            16'd821: lut_data_o <= {16'h8335, 8'he4};
            16'd822: lut_data_o <= {16'h8336, 8'h33};
            16'd823: lut_data_o <= {16'h8337, 8'hfe};
            16'd824: lut_data_o <= {16'h8338, 8'hd3};
            16'd825: lut_data_o <= {16'h8339, 8'hef};
            16'd826: lut_data_o <= {16'h833a, 8'h94};
            16'd827: lut_data_o <= {16'h833b, 8'h0f};
            16'd828: lut_data_o <= {16'h833c, 8'hee};
            16'd829: lut_data_o <= {16'h833d, 8'h64};
            16'd830: lut_data_o <= {16'h833e, 8'h80};
            16'd831: lut_data_o <= {16'h833f, 8'h94};
            16'd832: lut_data_o <= {16'h8340, 8'h80};
            16'd833: lut_data_o <= {16'h8341, 8'h40};
            16'd834: lut_data_o <= {16'h8342, 8'h04};
            16'd835: lut_data_o <= {16'h8343, 8'h7f};
            16'd836: lut_data_o <= {16'h8344, 8'h00};
            16'd837: lut_data_o <= {16'h8345, 8'h80};
            16'd838: lut_data_o <= {16'h8346, 8'h05};
            16'd839: lut_data_o <= {16'h8347, 8'h78};
            16'd840: lut_data_o <= {16'h8348, 8'h8a};
            16'd841: lut_data_o <= {16'h8349, 8'he6};
            16'd842: lut_data_o <= {16'h834a, 8'h04};
            16'd843: lut_data_o <= {16'h834b, 8'hff};
            16'd844: lut_data_o <= {16'h834c, 8'h78};
            16'd845: lut_data_o <= {16'h834d, 8'h8a};
            16'd846: lut_data_o <= {16'h834e, 8'ha6};
            16'd847: lut_data_o <= {16'h834f, 8'h07};
            16'd848: lut_data_o <= {16'h8350, 8'he5};
            16'd849: lut_data_o <= {16'h8351, 8'h1f};
            16'd850: lut_data_o <= {16'h8352, 8'hb4};
            16'd851: lut_data_o <= {16'h8353, 8'h01};
            16'd852: lut_data_o <= {16'h8354, 8'h0a};
            16'd853: lut_data_o <= {16'h8355, 8'he6};
            16'd854: lut_data_o <= {16'h8356, 8'h60};
            16'd855: lut_data_o <= {16'h8357, 8'h03};
            16'd856: lut_data_o <= {16'h8358, 8'h02};
            16'd857: lut_data_o <= {16'h8359, 8'h04};
            16'd858: lut_data_o <= {16'h835a, 8'hc0};
            16'd859: lut_data_o <= {16'h835b, 8'h75};
            16'd860: lut_data_o <= {16'h835c, 8'h1f};
            16'd861: lut_data_o <= {16'h835d, 8'h02};
            16'd862: lut_data_o <= {16'h835e, 8'h22};
            16'd863: lut_data_o <= {16'h835f, 8'h12};
            16'd864: lut_data_o <= {16'h8360, 8'h0c};
            16'd865: lut_data_o <= {16'h8361, 8'h7a};
            16'd866: lut_data_o <= {16'h8362, 8'h78};
            16'd867: lut_data_o <= {16'h8363, 8'h80};
            16'd868: lut_data_o <= {16'h8364, 8'ha6};
            16'd869: lut_data_o <= {16'h8365, 8'h06};
            16'd870: lut_data_o <= {16'h8366, 8'h08};
            16'd871: lut_data_o <= {16'h8367, 8'ha6};
            16'd872: lut_data_o <= {16'h8368, 8'h07};
            16'd873: lut_data_o <= {16'h8369, 8'h12};
            16'd874: lut_data_o <= {16'h836a, 8'h0c};
            16'd875: lut_data_o <= {16'h836b, 8'h7a};
            16'd876: lut_data_o <= {16'h836c, 8'h78};
            16'd877: lut_data_o <= {16'h836d, 8'h82};
            16'd878: lut_data_o <= {16'h836e, 8'ha6};
            16'd879: lut_data_o <= {16'h836f, 8'h06};
            16'd880: lut_data_o <= {16'h8370, 8'h08};
            16'd881: lut_data_o <= {16'h8371, 8'ha6};
            16'd882: lut_data_o <= {16'h8372, 8'h07};
            16'd883: lut_data_o <= {16'h8373, 8'h78};
            16'd884: lut_data_o <= {16'h8374, 8'h6e};
            16'd885: lut_data_o <= {16'h8375, 8'he6};
            16'd886: lut_data_o <= {16'h8376, 8'h78};
            16'd887: lut_data_o <= {16'h8377, 8'h8c};
            16'd888: lut_data_o <= {16'h8378, 8'hf6};
            16'd889: lut_data_o <= {16'h8379, 8'h78};
            16'd890: lut_data_o <= {16'h837a, 8'h6e};
            16'd891: lut_data_o <= {16'h837b, 8'he6};
            16'd892: lut_data_o <= {16'h837c, 8'h78};
            16'd893: lut_data_o <= {16'h837d, 8'h8d};
            16'd894: lut_data_o <= {16'h837e, 8'hf6};
            16'd895: lut_data_o <= {16'h837f, 8'h7f};
            16'd896: lut_data_o <= {16'h8380, 8'h01};
            16'd897: lut_data_o <= {16'h8381, 8'hef};
            16'd898: lut_data_o <= {16'h8382, 8'h25};
            16'd899: lut_data_o <= {16'h8383, 8'he0};
            16'd900: lut_data_o <= {16'h8384, 8'h24};
            16'd901: lut_data_o <= {16'h8385, 8'h4f};
            16'd902: lut_data_o <= {16'h8386, 8'hf9};
            16'd903: lut_data_o <= {16'h8387, 8'hc3};
            16'd904: lut_data_o <= {16'h8388, 8'h78};
            16'd905: lut_data_o <= {16'h8389, 8'h81};
            16'd906: lut_data_o <= {16'h838a, 8'he6};
            16'd907: lut_data_o <= {16'h838b, 8'h97};
            16'd908: lut_data_o <= {16'h838c, 8'h18};
            16'd909: lut_data_o <= {16'h838d, 8'he6};
            16'd910: lut_data_o <= {16'h838e, 8'h19};
            16'd911: lut_data_o <= {16'h838f, 8'h97};
            16'd912: lut_data_o <= {16'h8390, 8'h50};
            16'd913: lut_data_o <= {16'h8391, 8'h0a};
            16'd914: lut_data_o <= {16'h8392, 8'h12};
            16'd915: lut_data_o <= {16'h8393, 8'h0c};
            16'd916: lut_data_o <= {16'h8394, 8'h82};
            16'd917: lut_data_o <= {16'h8395, 8'h78};
            16'd918: lut_data_o <= {16'h8396, 8'h80};
            16'd919: lut_data_o <= {16'h8397, 8'ha6};
            16'd920: lut_data_o <= {16'h8398, 8'h04};
            16'd921: lut_data_o <= {16'h8399, 8'h08};
            16'd922: lut_data_o <= {16'h839a, 8'ha6};
            16'd923: lut_data_o <= {16'h839b, 8'h05};
            16'd924: lut_data_o <= {16'h839c, 8'h74};
            16'd925: lut_data_o <= {16'h839d, 8'h6e};
            16'd926: lut_data_o <= {16'h839e, 8'h2f};
            16'd927: lut_data_o <= {16'h839f, 8'hf9};
            16'd928: lut_data_o <= {16'h83a0, 8'h78};
            16'd929: lut_data_o <= {16'h83a1, 8'h8c};
            16'd930: lut_data_o <= {16'h83a2, 8'he6};
            16'd931: lut_data_o <= {16'h83a3, 8'hc3};
            16'd932: lut_data_o <= {16'h83a4, 8'h97};
            16'd933: lut_data_o <= {16'h83a5, 8'h50};
            16'd934: lut_data_o <= {16'h83a6, 8'h08};
            16'd935: lut_data_o <= {16'h83a7, 8'h74};
            16'd936: lut_data_o <= {16'h83a8, 8'h6e};
            16'd937: lut_data_o <= {16'h83a9, 8'h2f};
            16'd938: lut_data_o <= {16'h83aa, 8'hf8};
            16'd939: lut_data_o <= {16'h83ab, 8'he6};
            16'd940: lut_data_o <= {16'h83ac, 8'h78};
            16'd941: lut_data_o <= {16'h83ad, 8'h8c};
            16'd942: lut_data_o <= {16'h83ae, 8'hf6};
            16'd943: lut_data_o <= {16'h83af, 8'hef};
            16'd944: lut_data_o <= {16'h83b0, 8'h25};
            16'd945: lut_data_o <= {16'h83b1, 8'he0};
            16'd946: lut_data_o <= {16'h83b2, 8'h24};
            16'd947: lut_data_o <= {16'h83b3, 8'h4f};
            16'd948: lut_data_o <= {16'h83b4, 8'hf9};
            16'd949: lut_data_o <= {16'h83b5, 8'hd3};
            16'd950: lut_data_o <= {16'h83b6, 8'h78};
            16'd951: lut_data_o <= {16'h83b7, 8'h83};
            16'd952: lut_data_o <= {16'h83b8, 8'he6};
            16'd953: lut_data_o <= {16'h83b9, 8'h97};
            16'd954: lut_data_o <= {16'h83ba, 8'h18};
            16'd955: lut_data_o <= {16'h83bb, 8'he6};
            16'd956: lut_data_o <= {16'h83bc, 8'h19};
            16'd957: lut_data_o <= {16'h83bd, 8'h97};
            16'd958: lut_data_o <= {16'h83be, 8'h40};
            16'd959: lut_data_o <= {16'h83bf, 8'h0a};
            16'd960: lut_data_o <= {16'h83c0, 8'h12};
            16'd961: lut_data_o <= {16'h83c1, 8'h0c};
            16'd962: lut_data_o <= {16'h83c2, 8'h82};
            16'd963: lut_data_o <= {16'h83c3, 8'h78};
            16'd964: lut_data_o <= {16'h83c4, 8'h82};
            16'd965: lut_data_o <= {16'h83c5, 8'ha6};
            16'd966: lut_data_o <= {16'h83c6, 8'h04};
            16'd967: lut_data_o <= {16'h83c7, 8'h08};
            16'd968: lut_data_o <= {16'h83c8, 8'ha6};
            16'd969: lut_data_o <= {16'h83c9, 8'h05};
            16'd970: lut_data_o <= {16'h83ca, 8'h74};
            16'd971: lut_data_o <= {16'h83cb, 8'h6e};
            16'd972: lut_data_o <= {16'h83cc, 8'h2f};
            16'd973: lut_data_o <= {16'h83cd, 8'hf9};
            16'd974: lut_data_o <= {16'h83ce, 8'h78};
            16'd975: lut_data_o <= {16'h83cf, 8'h8d};
            16'd976: lut_data_o <= {16'h83d0, 8'he6};
            16'd977: lut_data_o <= {16'h83d1, 8'hd3};
            16'd978: lut_data_o <= {16'h83d2, 8'h97};
            16'd979: lut_data_o <= {16'h83d3, 8'h40};
            16'd980: lut_data_o <= {16'h83d4, 8'h08};
            16'd981: lut_data_o <= {16'h83d5, 8'h74};
            16'd982: lut_data_o <= {16'h83d6, 8'h6e};
            16'd983: lut_data_o <= {16'h83d7, 8'h2f};
            16'd984: lut_data_o <= {16'h83d8, 8'hf8};
            16'd985: lut_data_o <= {16'h83d9, 8'he6};
            16'd986: lut_data_o <= {16'h83da, 8'h78};
            16'd987: lut_data_o <= {16'h83db, 8'h8d};
            16'd988: lut_data_o <= {16'h83dc, 8'hf6};
            16'd989: lut_data_o <= {16'h83dd, 8'h0f};
            16'd990: lut_data_o <= {16'h83de, 8'hef};
            16'd991: lut_data_o <= {16'h83df, 8'h64};
            16'd992: lut_data_o <= {16'h83e0, 8'h10};
            16'd993: lut_data_o <= {16'h83e1, 8'h70};
            16'd994: lut_data_o <= {16'h83e2, 8'h9e};
            16'd995: lut_data_o <= {16'h83e3, 8'hc3};
            16'd996: lut_data_o <= {16'h83e4, 8'h79};
            16'd997: lut_data_o <= {16'h83e5, 8'h81};
            16'd998: lut_data_o <= {16'h83e6, 8'he7};
            16'd999: lut_data_o <= {16'h83e7, 8'h78};
            16'd1000: lut_data_o <= {16'h83e8, 8'h83};
            16'd1001: lut_data_o <= {16'h83e9, 8'h96};
            16'd1002: lut_data_o <= {16'h83ea, 8'hff};
            16'd1003: lut_data_o <= {16'h83eb, 8'h19};
            16'd1004: lut_data_o <= {16'h83ec, 8'he7};
            16'd1005: lut_data_o <= {16'h83ed, 8'h18};
            16'd1006: lut_data_o <= {16'h83ee, 8'h96};
            16'd1007: lut_data_o <= {16'h83ef, 8'h78};
            16'd1008: lut_data_o <= {16'h83f0, 8'h84};
            16'd1009: lut_data_o <= {16'h83f1, 8'hf6};
            16'd1010: lut_data_o <= {16'h83f2, 8'h08};
            16'd1011: lut_data_o <= {16'h83f3, 8'ha6};
            16'd1012: lut_data_o <= {16'h83f4, 8'h07};
            16'd1013: lut_data_o <= {16'h83f5, 8'hc3};
            16'd1014: lut_data_o <= {16'h83f6, 8'h79};
            16'd1015: lut_data_o <= {16'h83f7, 8'h8c};
            16'd1016: lut_data_o <= {16'h83f8, 8'he7};
            16'd1017: lut_data_o <= {16'h83f9, 8'h78};
            16'd1018: lut_data_o <= {16'h83fa, 8'h8d};
            16'd1019: lut_data_o <= {16'h83fb, 8'h96};
            16'd1020: lut_data_o <= {16'h83fc, 8'h08};
            16'd1021: lut_data_o <= {16'h83fd, 8'hf6};
            16'd1022: lut_data_o <= {16'h83fe, 8'hd3};
            16'd1023: lut_data_o <= {16'h83ff, 8'h79};
            16'd1024: lut_data_o <= {16'h8400, 8'h81};
            16'd1025: lut_data_o <= {16'h8401, 8'he7};
            16'd1026: lut_data_o <= {16'h8402, 8'h78};
            16'd1027: lut_data_o <= {16'h8403, 8'h7f};
            16'd1028: lut_data_o <= {16'h8404, 8'h96};
            16'd1029: lut_data_o <= {16'h8405, 8'h19};
            16'd1030: lut_data_o <= {16'h8406, 8'he7};
            16'd1031: lut_data_o <= {16'h8407, 8'h18};
            16'd1032: lut_data_o <= {16'h8408, 8'h96};
            16'd1033: lut_data_o <= {16'h8409, 8'h40};
            16'd1034: lut_data_o <= {16'h840a, 8'h05};
            16'd1035: lut_data_o <= {16'h840b, 8'h09};
            16'd1036: lut_data_o <= {16'h840c, 8'he7};
            16'd1037: lut_data_o <= {16'h840d, 8'h08};
            16'd1038: lut_data_o <= {16'h840e, 8'h80};
            16'd1039: lut_data_o <= {16'h840f, 8'h06};
            16'd1040: lut_data_o <= {16'h8410, 8'hc3};
            16'd1041: lut_data_o <= {16'h8411, 8'h79};
            16'd1042: lut_data_o <= {16'h8412, 8'h7f};
            16'd1043: lut_data_o <= {16'h8413, 8'he7};
            16'd1044: lut_data_o <= {16'h8414, 8'h78};
            16'd1045: lut_data_o <= {16'h8415, 8'h81};
            16'd1046: lut_data_o <= {16'h8416, 8'h96};
            16'd1047: lut_data_o <= {16'h8417, 8'hff};
            16'd1048: lut_data_o <= {16'h8418, 8'h19};
            16'd1049: lut_data_o <= {16'h8419, 8'he7};
            16'd1050: lut_data_o <= {16'h841a, 8'h18};
            16'd1051: lut_data_o <= {16'h841b, 8'h96};
            16'd1052: lut_data_o <= {16'h841c, 8'hfe};
            16'd1053: lut_data_o <= {16'h841d, 8'h78};
            16'd1054: lut_data_o <= {16'h841e, 8'h86};
            16'd1055: lut_data_o <= {16'h841f, 8'ha6};
            16'd1056: lut_data_o <= {16'h8420, 8'h06};
            16'd1057: lut_data_o <= {16'h8421, 8'h08};
            16'd1058: lut_data_o <= {16'h8422, 8'ha6};
            16'd1059: lut_data_o <= {16'h8423, 8'h07};
            16'd1060: lut_data_o <= {16'h8424, 8'h79};
            16'd1061: lut_data_o <= {16'h8425, 8'h8c};
            16'd1062: lut_data_o <= {16'h8426, 8'he7};
            16'd1063: lut_data_o <= {16'h8427, 8'hd3};
            16'd1064: lut_data_o <= {16'h8428, 8'h78};
            16'd1065: lut_data_o <= {16'h8429, 8'h8b};
            16'd1066: lut_data_o <= {16'h842a, 8'h96};
            16'd1067: lut_data_o <= {16'h842b, 8'h40};
            16'd1068: lut_data_o <= {16'h842c, 8'h05};
            16'd1069: lut_data_o <= {16'h842d, 8'he7};
            16'd1070: lut_data_o <= {16'h842e, 8'h96};
            16'd1071: lut_data_o <= {16'h842f, 8'hff};
            16'd1072: lut_data_o <= {16'h8430, 8'h80};
            16'd1073: lut_data_o <= {16'h8431, 8'h08};
            16'd1074: lut_data_o <= {16'h8432, 8'hc3};
            16'd1075: lut_data_o <= {16'h8433, 8'h79};
            16'd1076: lut_data_o <= {16'h8434, 8'h8b};
            16'd1077: lut_data_o <= {16'h8435, 8'he7};
            16'd1078: lut_data_o <= {16'h8436, 8'h78};
            16'd1079: lut_data_o <= {16'h8437, 8'h8c};
            16'd1080: lut_data_o <= {16'h8438, 8'h96};
            16'd1081: lut_data_o <= {16'h8439, 8'hff};
            16'd1082: lut_data_o <= {16'h843a, 8'h78};
            16'd1083: lut_data_o <= {16'h843b, 8'h8f};
            16'd1084: lut_data_o <= {16'h843c, 8'ha6};
            16'd1085: lut_data_o <= {16'h843d, 8'h07};
            16'd1086: lut_data_o <= {16'h843e, 8'he5};
            16'd1087: lut_data_o <= {16'h843f, 8'h1f};
            16'd1088: lut_data_o <= {16'h8440, 8'h64};
            16'd1089: lut_data_o <= {16'h8441, 8'h02};
            16'd1090: lut_data_o <= {16'h8442, 8'h70};
            16'd1091: lut_data_o <= {16'h8443, 8'h69};
            16'd1092: lut_data_o <= {16'h8444, 8'h90};
            16'd1093: lut_data_o <= {16'h8445, 8'h0e};
            16'd1094: lut_data_o <= {16'h8446, 8'h91};
            16'd1095: lut_data_o <= {16'h8447, 8'h93};
            16'd1096: lut_data_o <= {16'h8448, 8'hff};
            16'd1097: lut_data_o <= {16'h8449, 8'h18};
            16'd1098: lut_data_o <= {16'h844a, 8'he6};
            16'd1099: lut_data_o <= {16'h844b, 8'hc3};
            16'd1100: lut_data_o <= {16'h844c, 8'h9f};
            16'd1101: lut_data_o <= {16'h844d, 8'h50};
            16'd1102: lut_data_o <= {16'h844e, 8'h72};
            16'd1103: lut_data_o <= {16'h844f, 8'h12};
            16'd1104: lut_data_o <= {16'h8450, 8'h0c};
            16'd1105: lut_data_o <= {16'h8451, 8'h4a};
            16'd1106: lut_data_o <= {16'h8452, 8'h12};
            16'd1107: lut_data_o <= {16'h8453, 8'h0c};
            16'd1108: lut_data_o <= {16'h8454, 8'h2f};
            16'd1109: lut_data_o <= {16'h8455, 8'h90};
            16'd1110: lut_data_o <= {16'h8456, 8'h0e};
            16'd1111: lut_data_o <= {16'h8457, 8'h8e};
            16'd1112: lut_data_o <= {16'h8458, 8'h12};
            16'd1113: lut_data_o <= {16'h8459, 8'h0c};
            16'd1114: lut_data_o <= {16'h845a, 8'h38};
            16'd1115: lut_data_o <= {16'h845b, 8'h78};
            16'd1116: lut_data_o <= {16'h845c, 8'h80};
            16'd1117: lut_data_o <= {16'h845d, 8'h12};
            16'd1118: lut_data_o <= {16'h845e, 8'h0c};
            16'd1119: lut_data_o <= {16'h845f, 8'h6b};
            16'd1120: lut_data_o <= {16'h8460, 8'h7b};
            16'd1121: lut_data_o <= {16'h8461, 8'h04};
            16'd1122: lut_data_o <= {16'h8462, 8'h12};
            16'd1123: lut_data_o <= {16'h8463, 8'h0c};
            16'd1124: lut_data_o <= {16'h8464, 8'h1d};
            16'd1125: lut_data_o <= {16'h8465, 8'hc3};
            16'd1126: lut_data_o <= {16'h8466, 8'h12};
            16'd1127: lut_data_o <= {16'h8467, 8'h06};
            16'd1128: lut_data_o <= {16'h8468, 8'h45};
            16'd1129: lut_data_o <= {16'h8469, 8'h50};
            16'd1130: lut_data_o <= {16'h846a, 8'h56};
            16'd1131: lut_data_o <= {16'h846b, 8'h90};
            16'd1132: lut_data_o <= {16'h846c, 8'h0e};
            16'd1133: lut_data_o <= {16'h846d, 8'h92};
            16'd1134: lut_data_o <= {16'h846e, 8'he4};
            16'd1135: lut_data_o <= {16'h846f, 8'h93};
            16'd1136: lut_data_o <= {16'h8470, 8'hff};
            16'd1137: lut_data_o <= {16'h8471, 8'h78};
            16'd1138: lut_data_o <= {16'h8472, 8'h8f};
            16'd1139: lut_data_o <= {16'h8473, 8'he6};
            16'd1140: lut_data_o <= {16'h8474, 8'h9f};
            16'd1141: lut_data_o <= {16'h8475, 8'h40};
            16'd1142: lut_data_o <= {16'h8476, 8'h02};
            16'd1143: lut_data_o <= {16'h8477, 8'h80};
            16'd1144: lut_data_o <= {16'h8478, 8'h11};
            16'd1145: lut_data_o <= {16'h8479, 8'h90};
            16'd1146: lut_data_o <= {16'h847a, 8'h0e};
            16'd1147: lut_data_o <= {16'h847b, 8'h90};
            16'd1148: lut_data_o <= {16'h847c, 8'he4};
            16'd1149: lut_data_o <= {16'h847d, 8'h93};
            16'd1150: lut_data_o <= {16'h847e, 8'hff};
            16'd1151: lut_data_o <= {16'h847f, 8'hd3};
            16'd1152: lut_data_o <= {16'h8480, 8'h78};
            16'd1153: lut_data_o <= {16'h8481, 8'h89};
            16'd1154: lut_data_o <= {16'h8482, 8'he6};
            16'd1155: lut_data_o <= {16'h8483, 8'h9f};
            16'd1156: lut_data_o <= {16'h8484, 8'h18};
            16'd1157: lut_data_o <= {16'h8485, 8'he6};
            16'd1158: lut_data_o <= {16'h8486, 8'h94};
            16'd1159: lut_data_o <= {16'h8487, 8'h00};
            16'd1160: lut_data_o <= {16'h8488, 8'h40};
            16'd1161: lut_data_o <= {16'h8489, 8'h03};
            16'd1162: lut_data_o <= {16'h848a, 8'h75};
            16'd1163: lut_data_o <= {16'h848b, 8'h1f};
            16'd1164: lut_data_o <= {16'h848c, 8'h05};
            16'd1165: lut_data_o <= {16'h848d, 8'h12};
            16'd1166: lut_data_o <= {16'h848e, 8'h0c};
            16'd1167: lut_data_o <= {16'h848f, 8'h4a};
            16'd1168: lut_data_o <= {16'h8490, 8'h12};
            16'd1169: lut_data_o <= {16'h8491, 8'h0c};
            16'd1170: lut_data_o <= {16'h8492, 8'h2f};
            16'd1171: lut_data_o <= {16'h8493, 8'h90};
            16'd1172: lut_data_o <= {16'h8494, 8'h0e};
            16'd1173: lut_data_o <= {16'h8495, 8'h8f};
            16'd1174: lut_data_o <= {16'h8496, 8'h12};
            16'd1175: lut_data_o <= {16'h8497, 8'h0c};
            16'd1176: lut_data_o <= {16'h8498, 8'h38};
            16'd1177: lut_data_o <= {16'h8499, 8'h78};
            16'd1178: lut_data_o <= {16'h849a, 8'h7e};
            16'd1179: lut_data_o <= {16'h849b, 8'h12};
            16'd1180: lut_data_o <= {16'h849c, 8'h0c};
            16'd1181: lut_data_o <= {16'h849d, 8'h6b};
            16'd1182: lut_data_o <= {16'h849e, 8'h7b};
            16'd1183: lut_data_o <= {16'h849f, 8'h40};
            16'd1184: lut_data_o <= {16'h84a0, 8'h12};
            16'd1185: lut_data_o <= {16'h84a1, 8'h0c};
            16'd1186: lut_data_o <= {16'h84a2, 8'h1d};
            16'd1187: lut_data_o <= {16'h84a3, 8'hd3};
            16'd1188: lut_data_o <= {16'h84a4, 8'h12};
            16'd1189: lut_data_o <= {16'h84a5, 8'h06};
            16'd1190: lut_data_o <= {16'h84a6, 8'h45};
            16'd1191: lut_data_o <= {16'h84a7, 8'h40};
            16'd1192: lut_data_o <= {16'h84a8, 8'h18};
            16'd1193: lut_data_o <= {16'h84a9, 8'h75};
            16'd1194: lut_data_o <= {16'h84aa, 8'h1f};
            16'd1195: lut_data_o <= {16'h84ab, 8'h05};
            16'd1196: lut_data_o <= {16'h84ac, 8'h22};
            16'd1197: lut_data_o <= {16'h84ad, 8'he5};
            16'd1198: lut_data_o <= {16'h84ae, 8'h1f};
            16'd1199: lut_data_o <= {16'h84af, 8'hb4};
            16'd1200: lut_data_o <= {16'h84b0, 8'h05};
            16'd1201: lut_data_o <= {16'h84b1, 8'h0f};
            16'd1202: lut_data_o <= {16'h84b2, 8'hd2};
            16'd1203: lut_data_o <= {16'h84b3, 8'h01};
            16'd1204: lut_data_o <= {16'h84b4, 8'hc2};
            16'd1205: lut_data_o <= {16'h84b5, 8'h02};
            16'd1206: lut_data_o <= {16'h84b6, 8'he4};
            16'd1207: lut_data_o <= {16'h84b7, 8'hf5};
            16'd1208: lut_data_o <= {16'h84b8, 8'h1f};
            16'd1209: lut_data_o <= {16'h84b9, 8'hf5};
            16'd1210: lut_data_o <= {16'h84ba, 8'h1e};
            16'd1211: lut_data_o <= {16'h84bb, 8'hd2};
            16'd1212: lut_data_o <= {16'h84bc, 8'h35};
            16'd1213: lut_data_o <= {16'h84bd, 8'hd2};
            16'd1214: lut_data_o <= {16'h84be, 8'h33};
            16'd1215: lut_data_o <= {16'h84bf, 8'hd2};
            16'd1216: lut_data_o <= {16'h84c0, 8'h36};
            16'd1217: lut_data_o <= {16'h84c1, 8'h22};
            16'd1218: lut_data_o <= {16'h84c2, 8'hef};
            16'd1219: lut_data_o <= {16'h84c3, 8'h8d};
            16'd1220: lut_data_o <= {16'h84c4, 8'hf0};
            16'd1221: lut_data_o <= {16'h84c5, 8'ha4};
            16'd1222: lut_data_o <= {16'h84c6, 8'ha8};
            16'd1223: lut_data_o <= {16'h84c7, 8'hf0};
            16'd1224: lut_data_o <= {16'h84c8, 8'hcf};
            16'd1225: lut_data_o <= {16'h84c9, 8'h8c};
            16'd1226: lut_data_o <= {16'h84ca, 8'hf0};
            16'd1227: lut_data_o <= {16'h84cb, 8'ha4};
            16'd1228: lut_data_o <= {16'h84cc, 8'h28};
            16'd1229: lut_data_o <= {16'h84cd, 8'hce};
            16'd1230: lut_data_o <= {16'h84ce, 8'h8d};
            16'd1231: lut_data_o <= {16'h84cf, 8'hf0};
            16'd1232: lut_data_o <= {16'h84d0, 8'ha4};
            16'd1233: lut_data_o <= {16'h84d1, 8'h2e};
            16'd1234: lut_data_o <= {16'h84d2, 8'hfe};
            16'd1235: lut_data_o <= {16'h84d3, 8'h22};
            16'd1236: lut_data_o <= {16'h84d4, 8'hbc};
            16'd1237: lut_data_o <= {16'h84d5, 8'h00};
            16'd1238: lut_data_o <= {16'h84d6, 8'h0b};
            16'd1239: lut_data_o <= {16'h84d7, 8'hbe};
            16'd1240: lut_data_o <= {16'h84d8, 8'h00};
            16'd1241: lut_data_o <= {16'h84d9, 8'h29};
            16'd1242: lut_data_o <= {16'h84da, 8'hef};
            16'd1243: lut_data_o <= {16'h84db, 8'h8d};
            16'd1244: lut_data_o <= {16'h84dc, 8'hf0};
            16'd1245: lut_data_o <= {16'h84dd, 8'h84};
            16'd1246: lut_data_o <= {16'h84de, 8'hff};
            16'd1247: lut_data_o <= {16'h84df, 8'had};
            16'd1248: lut_data_o <= {16'h84e0, 8'hf0};
            16'd1249: lut_data_o <= {16'h84e1, 8'h22};
            16'd1250: lut_data_o <= {16'h84e2, 8'he4};
            16'd1251: lut_data_o <= {16'h84e3, 8'hcc};
            16'd1252: lut_data_o <= {16'h84e4, 8'hf8};
            16'd1253: lut_data_o <= {16'h84e5, 8'h75};
            16'd1254: lut_data_o <= {16'h84e6, 8'hf0};
            16'd1255: lut_data_o <= {16'h84e7, 8'h08};
            16'd1256: lut_data_o <= {16'h84e8, 8'hef};
            16'd1257: lut_data_o <= {16'h84e9, 8'h2f};
            16'd1258: lut_data_o <= {16'h84ea, 8'hff};
            16'd1259: lut_data_o <= {16'h84eb, 8'hee};
            16'd1260: lut_data_o <= {16'h84ec, 8'h33};
            16'd1261: lut_data_o <= {16'h84ed, 8'hfe};
            16'd1262: lut_data_o <= {16'h84ee, 8'hec};
            16'd1263: lut_data_o <= {16'h84ef, 8'h33};
            16'd1264: lut_data_o <= {16'h84f0, 8'hfc};
            16'd1265: lut_data_o <= {16'h84f1, 8'hee};
            16'd1266: lut_data_o <= {16'h84f2, 8'h9d};
            16'd1267: lut_data_o <= {16'h84f3, 8'hec};
            16'd1268: lut_data_o <= {16'h84f4, 8'h98};
            16'd1269: lut_data_o <= {16'h84f5, 8'h40};
            16'd1270: lut_data_o <= {16'h84f6, 8'h05};
            16'd1271: lut_data_o <= {16'h84f7, 8'hfc};
            16'd1272: lut_data_o <= {16'h84f8, 8'hee};
            16'd1273: lut_data_o <= {16'h84f9, 8'h9d};
            16'd1274: lut_data_o <= {16'h84fa, 8'hfe};
            16'd1275: lut_data_o <= {16'h84fb, 8'h0f};
            16'd1276: lut_data_o <= {16'h84fc, 8'hd5};
            16'd1277: lut_data_o <= {16'h84fd, 8'hf0};
            16'd1278: lut_data_o <= {16'h84fe, 8'he9};
            16'd1279: lut_data_o <= {16'h84ff, 8'he4};
            16'd1280: lut_data_o <= {16'h8500, 8'hce};
            16'd1281: lut_data_o <= {16'h8501, 8'hfd};
            16'd1282: lut_data_o <= {16'h8502, 8'h22};
            16'd1283: lut_data_o <= {16'h8503, 8'hed};
            16'd1284: lut_data_o <= {16'h8504, 8'hf8};
            16'd1285: lut_data_o <= {16'h8505, 8'hf5};
            16'd1286: lut_data_o <= {16'h8506, 8'hf0};
            16'd1287: lut_data_o <= {16'h8507, 8'hee};
            16'd1288: lut_data_o <= {16'h8508, 8'h84};
            16'd1289: lut_data_o <= {16'h8509, 8'h20};
            16'd1290: lut_data_o <= {16'h850a, 8'hd2};
            16'd1291: lut_data_o <= {16'h850b, 8'h1c};
            16'd1292: lut_data_o <= {16'h850c, 8'hfe};
            16'd1293: lut_data_o <= {16'h850d, 8'had};
            16'd1294: lut_data_o <= {16'h850e, 8'hf0};
            16'd1295: lut_data_o <= {16'h850f, 8'h75};
            16'd1296: lut_data_o <= {16'h8510, 8'hf0};
            16'd1297: lut_data_o <= {16'h8511, 8'h08};
            16'd1298: lut_data_o <= {16'h8512, 8'hef};
            16'd1299: lut_data_o <= {16'h8513, 8'h2f};
            16'd1300: lut_data_o <= {16'h8514, 8'hff};
            16'd1301: lut_data_o <= {16'h8515, 8'hed};
            16'd1302: lut_data_o <= {16'h8516, 8'h33};
            16'd1303: lut_data_o <= {16'h8517, 8'hfd};
            16'd1304: lut_data_o <= {16'h8518, 8'h40};
            16'd1305: lut_data_o <= {16'h8519, 8'h07};
            16'd1306: lut_data_o <= {16'h851a, 8'h98};
            16'd1307: lut_data_o <= {16'h851b, 8'h50};
            16'd1308: lut_data_o <= {16'h851c, 8'h06};
            16'd1309: lut_data_o <= {16'h851d, 8'hd5};
            16'd1310: lut_data_o <= {16'h851e, 8'hf0};
            16'd1311: lut_data_o <= {16'h851f, 8'hf2};
            16'd1312: lut_data_o <= {16'h8520, 8'h22};
            16'd1313: lut_data_o <= {16'h8521, 8'hc3};
            16'd1314: lut_data_o <= {16'h8522, 8'h98};
            16'd1315: lut_data_o <= {16'h8523, 8'hfd};
            16'd1316: lut_data_o <= {16'h8524, 8'h0f};
            16'd1317: lut_data_o <= {16'h8525, 8'hd5};
            16'd1318: lut_data_o <= {16'h8526, 8'hf0};
            16'd1319: lut_data_o <= {16'h8527, 8'hea};
            16'd1320: lut_data_o <= {16'h8528, 8'h22};
            16'd1321: lut_data_o <= {16'h8529, 8'he8};
            16'd1322: lut_data_o <= {16'h852a, 8'h8f};
            16'd1323: lut_data_o <= {16'h852b, 8'hf0};
            16'd1324: lut_data_o <= {16'h852c, 8'ha4};
            16'd1325: lut_data_o <= {16'h852d, 8'hcc};
            16'd1326: lut_data_o <= {16'h852e, 8'h8b};
            16'd1327: lut_data_o <= {16'h852f, 8'hf0};
            16'd1328: lut_data_o <= {16'h8530, 8'ha4};
            16'd1329: lut_data_o <= {16'h8531, 8'h2c};
            16'd1330: lut_data_o <= {16'h8532, 8'hfc};
            16'd1331: lut_data_o <= {16'h8533, 8'he9};
            16'd1332: lut_data_o <= {16'h8534, 8'h8e};
            16'd1333: lut_data_o <= {16'h8535, 8'hf0};
            16'd1334: lut_data_o <= {16'h8536, 8'ha4};
            16'd1335: lut_data_o <= {16'h8537, 8'h2c};
            16'd1336: lut_data_o <= {16'h8538, 8'hfc};
            16'd1337: lut_data_o <= {16'h8539, 8'h8a};
            16'd1338: lut_data_o <= {16'h853a, 8'hf0};
            16'd1339: lut_data_o <= {16'h853b, 8'hed};
            16'd1340: lut_data_o <= {16'h853c, 8'ha4};
            16'd1341: lut_data_o <= {16'h853d, 8'h2c};
            16'd1342: lut_data_o <= {16'h853e, 8'hfc};
            16'd1343: lut_data_o <= {16'h853f, 8'hea};
            16'd1344: lut_data_o <= {16'h8540, 8'h8e};
            16'd1345: lut_data_o <= {16'h8541, 8'hf0};
            16'd1346: lut_data_o <= {16'h8542, 8'ha4};
            16'd1347: lut_data_o <= {16'h8543, 8'hcd};
            16'd1348: lut_data_o <= {16'h8544, 8'ha8};
            16'd1349: lut_data_o <= {16'h8545, 8'hf0};
            16'd1350: lut_data_o <= {16'h8546, 8'h8b};
            16'd1351: lut_data_o <= {16'h8547, 8'hf0};
            16'd1352: lut_data_o <= {16'h8548, 8'ha4};
            16'd1353: lut_data_o <= {16'h8549, 8'h2d};
            16'd1354: lut_data_o <= {16'h854a, 8'hcc};
            16'd1355: lut_data_o <= {16'h854b, 8'h38};
            16'd1356: lut_data_o <= {16'h854c, 8'h25};
            16'd1357: lut_data_o <= {16'h854d, 8'hf0};
            16'd1358: lut_data_o <= {16'h854e, 8'hfd};
            16'd1359: lut_data_o <= {16'h854f, 8'he9};
            16'd1360: lut_data_o <= {16'h8550, 8'h8f};
            16'd1361: lut_data_o <= {16'h8551, 8'hf0};
            16'd1362: lut_data_o <= {16'h8552, 8'ha4};
            16'd1363: lut_data_o <= {16'h8553, 8'h2c};
            16'd1364: lut_data_o <= {16'h8554, 8'hcd};
            16'd1365: lut_data_o <= {16'h8555, 8'h35};
            16'd1366: lut_data_o <= {16'h8556, 8'hf0};
            16'd1367: lut_data_o <= {16'h8557, 8'hfc};
            16'd1368: lut_data_o <= {16'h8558, 8'heb};
            16'd1369: lut_data_o <= {16'h8559, 8'h8e};
            16'd1370: lut_data_o <= {16'h855a, 8'hf0};
            16'd1371: lut_data_o <= {16'h855b, 8'ha4};
            16'd1372: lut_data_o <= {16'h855c, 8'hfe};
            16'd1373: lut_data_o <= {16'h855d, 8'ha9};
            16'd1374: lut_data_o <= {16'h855e, 8'hf0};
            16'd1375: lut_data_o <= {16'h855f, 8'heb};
            16'd1376: lut_data_o <= {16'h8560, 8'h8f};
            16'd1377: lut_data_o <= {16'h8561, 8'hf0};
            16'd1378: lut_data_o <= {16'h8562, 8'ha4};
            16'd1379: lut_data_o <= {16'h8563, 8'hcf};
            16'd1380: lut_data_o <= {16'h8564, 8'hc5};
            16'd1381: lut_data_o <= {16'h8565, 8'hf0};
            16'd1382: lut_data_o <= {16'h8566, 8'h2e};
            16'd1383: lut_data_o <= {16'h8567, 8'hcd};
            16'd1384: lut_data_o <= {16'h8568, 8'h39};
            16'd1385: lut_data_o <= {16'h8569, 8'hfe};
            16'd1386: lut_data_o <= {16'h856a, 8'he4};
            16'd1387: lut_data_o <= {16'h856b, 8'h3c};
            16'd1388: lut_data_o <= {16'h856c, 8'hfc};
            16'd1389: lut_data_o <= {16'h856d, 8'hea};
            16'd1390: lut_data_o <= {16'h856e, 8'ha4};
            16'd1391: lut_data_o <= {16'h856f, 8'h2d};
            16'd1392: lut_data_o <= {16'h8570, 8'hce};
            16'd1393: lut_data_o <= {16'h8571, 8'h35};
            16'd1394: lut_data_o <= {16'h8572, 8'hf0};
            16'd1395: lut_data_o <= {16'h8573, 8'hfd};
            16'd1396: lut_data_o <= {16'h8574, 8'he4};
            16'd1397: lut_data_o <= {16'h8575, 8'h3c};
            16'd1398: lut_data_o <= {16'h8576, 8'hfc};
            16'd1399: lut_data_o <= {16'h8577, 8'h22};
            16'd1400: lut_data_o <= {16'h8578, 8'h75};
            16'd1401: lut_data_o <= {16'h8579, 8'hf0};
            16'd1402: lut_data_o <= {16'h857a, 8'h08};
            16'd1403: lut_data_o <= {16'h857b, 8'h75};
            16'd1404: lut_data_o <= {16'h857c, 8'h82};
            16'd1405: lut_data_o <= {16'h857d, 8'h00};
            16'd1406: lut_data_o <= {16'h857e, 8'hef};
            16'd1407: lut_data_o <= {16'h857f, 8'h2f};
            16'd1408: lut_data_o <= {16'h8580, 8'hff};
            16'd1409: lut_data_o <= {16'h8581, 8'hee};
            16'd1410: lut_data_o <= {16'h8582, 8'h33};
            16'd1411: lut_data_o <= {16'h8583, 8'hfe};
            16'd1412: lut_data_o <= {16'h8584, 8'hcd};
            16'd1413: lut_data_o <= {16'h8585, 8'h33};
            16'd1414: lut_data_o <= {16'h8586, 8'hcd};
            16'd1415: lut_data_o <= {16'h8587, 8'hcc};
            16'd1416: lut_data_o <= {16'h8588, 8'h33};
            16'd1417: lut_data_o <= {16'h8589, 8'hcc};
            16'd1418: lut_data_o <= {16'h858a, 8'hc5};
            16'd1419: lut_data_o <= {16'h858b, 8'h82};
            16'd1420: lut_data_o <= {16'h858c, 8'h33};
            16'd1421: lut_data_o <= {16'h858d, 8'hc5};
            16'd1422: lut_data_o <= {16'h858e, 8'h82};
            16'd1423: lut_data_o <= {16'h858f, 8'h9b};
            16'd1424: lut_data_o <= {16'h8590, 8'hed};
            16'd1425: lut_data_o <= {16'h8591, 8'h9a};
            16'd1426: lut_data_o <= {16'h8592, 8'hec};
            16'd1427: lut_data_o <= {16'h8593, 8'h99};
            16'd1428: lut_data_o <= {16'h8594, 8'he5};
            16'd1429: lut_data_o <= {16'h8595, 8'h82};
            16'd1430: lut_data_o <= {16'h8596, 8'h98};
            16'd1431: lut_data_o <= {16'h8597, 8'h40};
            16'd1432: lut_data_o <= {16'h8598, 8'h0c};
            16'd1433: lut_data_o <= {16'h8599, 8'hf5};
            16'd1434: lut_data_o <= {16'h859a, 8'h82};
            16'd1435: lut_data_o <= {16'h859b, 8'hee};
            16'd1436: lut_data_o <= {16'h859c, 8'h9b};
            16'd1437: lut_data_o <= {16'h859d, 8'hfe};
            16'd1438: lut_data_o <= {16'h859e, 8'hed};
            16'd1439: lut_data_o <= {16'h859f, 8'h9a};
            16'd1440: lut_data_o <= {16'h85a0, 8'hfd};
            16'd1441: lut_data_o <= {16'h85a1, 8'hec};
            16'd1442: lut_data_o <= {16'h85a2, 8'h99};
            16'd1443: lut_data_o <= {16'h85a3, 8'hfc};
            16'd1444: lut_data_o <= {16'h85a4, 8'h0f};
            16'd1445: lut_data_o <= {16'h85a5, 8'hd5};
            16'd1446: lut_data_o <= {16'h85a6, 8'hf0};
            16'd1447: lut_data_o <= {16'h85a7, 8'hd6};
            16'd1448: lut_data_o <= {16'h85a8, 8'he4};
            16'd1449: lut_data_o <= {16'h85a9, 8'hce};
            16'd1450: lut_data_o <= {16'h85aa, 8'hfb};
            16'd1451: lut_data_o <= {16'h85ab, 8'he4};
            16'd1452: lut_data_o <= {16'h85ac, 8'hcd};
            16'd1453: lut_data_o <= {16'h85ad, 8'hfa};
            16'd1454: lut_data_o <= {16'h85ae, 8'he4};
            16'd1455: lut_data_o <= {16'h85af, 8'hcc};
            16'd1456: lut_data_o <= {16'h85b0, 8'hf9};
            16'd1457: lut_data_o <= {16'h85b1, 8'ha8};
            16'd1458: lut_data_o <= {16'h85b2, 8'h82};
            16'd1459: lut_data_o <= {16'h85b3, 8'h22};
            16'd1460: lut_data_o <= {16'h85b4, 8'hb8};
            16'd1461: lut_data_o <= {16'h85b5, 8'h00};
            16'd1462: lut_data_o <= {16'h85b6, 8'hc1};
            16'd1463: lut_data_o <= {16'h85b7, 8'hb9};
            16'd1464: lut_data_o <= {16'h85b8, 8'h00};
            16'd1465: lut_data_o <= {16'h85b9, 8'h59};
            16'd1466: lut_data_o <= {16'h85ba, 8'hba};
            16'd1467: lut_data_o <= {16'h85bb, 8'h00};
            16'd1468: lut_data_o <= {16'h85bc, 8'h2d};
            16'd1469: lut_data_o <= {16'h85bd, 8'hec};
            16'd1470: lut_data_o <= {16'h85be, 8'h8b};
            16'd1471: lut_data_o <= {16'h85bf, 8'hf0};
            16'd1472: lut_data_o <= {16'h85c0, 8'h84};
            16'd1473: lut_data_o <= {16'h85c1, 8'hcf};
            16'd1474: lut_data_o <= {16'h85c2, 8'hce};
            16'd1475: lut_data_o <= {16'h85c3, 8'hcd};
            16'd1476: lut_data_o <= {16'h85c4, 8'hfc};
            16'd1477: lut_data_o <= {16'h85c5, 8'he5};
            16'd1478: lut_data_o <= {16'h85c6, 8'hf0};
            16'd1479: lut_data_o <= {16'h85c7, 8'hcb};
            16'd1480: lut_data_o <= {16'h85c8, 8'hf9};
            16'd1481: lut_data_o <= {16'h85c9, 8'h78};
            16'd1482: lut_data_o <= {16'h85ca, 8'h18};
            16'd1483: lut_data_o <= {16'h85cb, 8'hef};
            16'd1484: lut_data_o <= {16'h85cc, 8'h2f};
            16'd1485: lut_data_o <= {16'h85cd, 8'hff};
            16'd1486: lut_data_o <= {16'h85ce, 8'hee};
            16'd1487: lut_data_o <= {16'h85cf, 8'h33};
            16'd1488: lut_data_o <= {16'h85d0, 8'hfe};
            16'd1489: lut_data_o <= {16'h85d1, 8'hed};
            16'd1490: lut_data_o <= {16'h85d2, 8'h33};
            16'd1491: lut_data_o <= {16'h85d3, 8'hfd};
            16'd1492: lut_data_o <= {16'h85d4, 8'hec};
            16'd1493: lut_data_o <= {16'h85d5, 8'h33};
            16'd1494: lut_data_o <= {16'h85d6, 8'hfc};
            16'd1495: lut_data_o <= {16'h85d7, 8'heb};
            16'd1496: lut_data_o <= {16'h85d8, 8'h33};
            16'd1497: lut_data_o <= {16'h85d9, 8'hfb};
            16'd1498: lut_data_o <= {16'h85da, 8'h10};
            16'd1499: lut_data_o <= {16'h85db, 8'hd7};
            16'd1500: lut_data_o <= {16'h85dc, 8'h03};
            16'd1501: lut_data_o <= {16'h85dd, 8'h99};
            16'd1502: lut_data_o <= {16'h85de, 8'h40};
            16'd1503: lut_data_o <= {16'h85df, 8'h04};
            16'd1504: lut_data_o <= {16'h85e0, 8'heb};
            16'd1505: lut_data_o <= {16'h85e1, 8'h99};
            16'd1506: lut_data_o <= {16'h85e2, 8'hfb};
            16'd1507: lut_data_o <= {16'h85e3, 8'h0f};
            16'd1508: lut_data_o <= {16'h85e4, 8'hd8};
            16'd1509: lut_data_o <= {16'h85e5, 8'he5};
            16'd1510: lut_data_o <= {16'h85e6, 8'he4};
            16'd1511: lut_data_o <= {16'h85e7, 8'hf9};
            16'd1512: lut_data_o <= {16'h85e8, 8'hfa};
            16'd1513: lut_data_o <= {16'h85e9, 8'h22};
            16'd1514: lut_data_o <= {16'h85ea, 8'h78};
            16'd1515: lut_data_o <= {16'h85eb, 8'h18};
            16'd1516: lut_data_o <= {16'h85ec, 8'hef};
            16'd1517: lut_data_o <= {16'h85ed, 8'h2f};
            16'd1518: lut_data_o <= {16'h85ee, 8'hff};
            16'd1519: lut_data_o <= {16'h85ef, 8'hee};
            16'd1520: lut_data_o <= {16'h85f0, 8'h33};
            16'd1521: lut_data_o <= {16'h85f1, 8'hfe};
            16'd1522: lut_data_o <= {16'h85f2, 8'hed};
            16'd1523: lut_data_o <= {16'h85f3, 8'h33};
            16'd1524: lut_data_o <= {16'h85f4, 8'hfd};
            16'd1525: lut_data_o <= {16'h85f5, 8'hec};
            16'd1526: lut_data_o <= {16'h85f6, 8'h33};
            16'd1527: lut_data_o <= {16'h85f7, 8'hfc};
            16'd1528: lut_data_o <= {16'h85f8, 8'hc9};
            16'd1529: lut_data_o <= {16'h85f9, 8'h33};
            16'd1530: lut_data_o <= {16'h85fa, 8'hc9};
            16'd1531: lut_data_o <= {16'h85fb, 8'h10};
            16'd1532: lut_data_o <= {16'h85fc, 8'hd7};
            16'd1533: lut_data_o <= {16'h85fd, 8'h05};
            16'd1534: lut_data_o <= {16'h85fe, 8'h9b};
            16'd1535: lut_data_o <= {16'h85ff, 8'he9};
            16'd1536: lut_data_o <= {16'h8600, 8'h9a};
            16'd1537: lut_data_o <= {16'h8601, 8'h40};
            16'd1538: lut_data_o <= {16'h8602, 8'h07};
            16'd1539: lut_data_o <= {16'h8603, 8'hec};
            16'd1540: lut_data_o <= {16'h8604, 8'h9b};
            16'd1541: lut_data_o <= {16'h8605, 8'hfc};
            16'd1542: lut_data_o <= {16'h8606, 8'he9};
            16'd1543: lut_data_o <= {16'h8607, 8'h9a};
            16'd1544: lut_data_o <= {16'h8608, 8'hf9};
            16'd1545: lut_data_o <= {16'h8609, 8'h0f};
            16'd1546: lut_data_o <= {16'h860a, 8'hd8};
            16'd1547: lut_data_o <= {16'h860b, 8'he0};
            16'd1548: lut_data_o <= {16'h860c, 8'he4};
            16'd1549: lut_data_o <= {16'h860d, 8'hc9};
            16'd1550: lut_data_o <= {16'h860e, 8'hfa};
            16'd1551: lut_data_o <= {16'h860f, 8'he4};
            16'd1552: lut_data_o <= {16'h8610, 8'hcc};
            16'd1553: lut_data_o <= {16'h8611, 8'hfb};
            16'd1554: lut_data_o <= {16'h8612, 8'h22};
            16'd1555: lut_data_o <= {16'h8613, 8'h75};
            16'd1556: lut_data_o <= {16'h8614, 8'hf0};
            16'd1557: lut_data_o <= {16'h8615, 8'h10};
            16'd1558: lut_data_o <= {16'h8616, 8'hef};
            16'd1559: lut_data_o <= {16'h8617, 8'h2f};
            16'd1560: lut_data_o <= {16'h8618, 8'hff};
            16'd1561: lut_data_o <= {16'h8619, 8'hee};
            16'd1562: lut_data_o <= {16'h861a, 8'h33};
            16'd1563: lut_data_o <= {16'h861b, 8'hfe};
            16'd1564: lut_data_o <= {16'h861c, 8'hed};
            16'd1565: lut_data_o <= {16'h861d, 8'h33};
            16'd1566: lut_data_o <= {16'h861e, 8'hfd};
            16'd1567: lut_data_o <= {16'h861f, 8'hcc};
            16'd1568: lut_data_o <= {16'h8620, 8'h33};
            16'd1569: lut_data_o <= {16'h8621, 8'hcc};
            16'd1570: lut_data_o <= {16'h8622, 8'hc8};
            16'd1571: lut_data_o <= {16'h8623, 8'h33};
            16'd1572: lut_data_o <= {16'h8624, 8'hc8};
            16'd1573: lut_data_o <= {16'h8625, 8'h10};
            16'd1574: lut_data_o <= {16'h8626, 8'hd7};
            16'd1575: lut_data_o <= {16'h8627, 8'h07};
            16'd1576: lut_data_o <= {16'h8628, 8'h9b};
            16'd1577: lut_data_o <= {16'h8629, 8'hec};
            16'd1578: lut_data_o <= {16'h862a, 8'h9a};
            16'd1579: lut_data_o <= {16'h862b, 8'he8};
            16'd1580: lut_data_o <= {16'h862c, 8'h99};
            16'd1581: lut_data_o <= {16'h862d, 8'h40};
            16'd1582: lut_data_o <= {16'h862e, 8'h0a};
            16'd1583: lut_data_o <= {16'h862f, 8'hed};
            16'd1584: lut_data_o <= {16'h8630, 8'h9b};
            16'd1585: lut_data_o <= {16'h8631, 8'hfd};
            16'd1586: lut_data_o <= {16'h8632, 8'hec};
            16'd1587: lut_data_o <= {16'h8633, 8'h9a};
            16'd1588: lut_data_o <= {16'h8634, 8'hfc};
            16'd1589: lut_data_o <= {16'h8635, 8'he8};
            16'd1590: lut_data_o <= {16'h8636, 8'h99};
            16'd1591: lut_data_o <= {16'h8637, 8'hf8};
            16'd1592: lut_data_o <= {16'h8638, 8'h0f};
            16'd1593: lut_data_o <= {16'h8639, 8'hd5};
            16'd1594: lut_data_o <= {16'h863a, 8'hf0};
            16'd1595: lut_data_o <= {16'h863b, 8'hda};
            16'd1596: lut_data_o <= {16'h863c, 8'he4};
            16'd1597: lut_data_o <= {16'h863d, 8'hcd};
            16'd1598: lut_data_o <= {16'h863e, 8'hfb};
            16'd1599: lut_data_o <= {16'h863f, 8'he4};
            16'd1600: lut_data_o <= {16'h8640, 8'hcc};
            16'd1601: lut_data_o <= {16'h8641, 8'hfa};
            16'd1602: lut_data_o <= {16'h8642, 8'he4};
            16'd1603: lut_data_o <= {16'h8643, 8'hc8};
            16'd1604: lut_data_o <= {16'h8644, 8'hf9};
            16'd1605: lut_data_o <= {16'h8645, 8'h22};
            16'd1606: lut_data_o <= {16'h8646, 8'heb};
            16'd1607: lut_data_o <= {16'h8647, 8'h9f};
            16'd1608: lut_data_o <= {16'h8648, 8'hf5};
            16'd1609: lut_data_o <= {16'h8649, 8'hf0};
            16'd1610: lut_data_o <= {16'h864a, 8'hea};
            16'd1611: lut_data_o <= {16'h864b, 8'h9e};
            16'd1612: lut_data_o <= {16'h864c, 8'h42};
            16'd1613: lut_data_o <= {16'h864d, 8'hf0};
            16'd1614: lut_data_o <= {16'h864e, 8'he9};
            16'd1615: lut_data_o <= {16'h864f, 8'h9d};
            16'd1616: lut_data_o <= {16'h8650, 8'h42};
            16'd1617: lut_data_o <= {16'h8651, 8'hf0};
            16'd1618: lut_data_o <= {16'h8652, 8'he8};
            16'd1619: lut_data_o <= {16'h8653, 8'h9c};
            16'd1620: lut_data_o <= {16'h8654, 8'h45};
            16'd1621: lut_data_o <= {16'h8655, 8'hf0};
            16'd1622: lut_data_o <= {16'h8656, 8'h22};
            16'd1623: lut_data_o <= {16'h8657, 8'he8};
            16'd1624: lut_data_o <= {16'h8658, 8'h60};
            16'd1625: lut_data_o <= {16'h8659, 8'h0f};
            16'd1626: lut_data_o <= {16'h865a, 8'hec};
            16'd1627: lut_data_o <= {16'h865b, 8'hc3};
            16'd1628: lut_data_o <= {16'h865c, 8'h13};
            16'd1629: lut_data_o <= {16'h865d, 8'hfc};
            16'd1630: lut_data_o <= {16'h865e, 8'hed};
            16'd1631: lut_data_o <= {16'h865f, 8'h13};
            16'd1632: lut_data_o <= {16'h8660, 8'hfd};
            16'd1633: lut_data_o <= {16'h8661, 8'hee};
            16'd1634: lut_data_o <= {16'h8662, 8'h13};
            16'd1635: lut_data_o <= {16'h8663, 8'hfe};
            16'd1636: lut_data_o <= {16'h8664, 8'hef};
            16'd1637: lut_data_o <= {16'h8665, 8'h13};
            16'd1638: lut_data_o <= {16'h8666, 8'hff};
            16'd1639: lut_data_o <= {16'h8667, 8'hd8};
            16'd1640: lut_data_o <= {16'h8668, 8'hf1};
            16'd1641: lut_data_o <= {16'h8669, 8'h22};
            16'd1642: lut_data_o <= {16'h866a, 8'he8};
            16'd1643: lut_data_o <= {16'h866b, 8'h60};
            16'd1644: lut_data_o <= {16'h866c, 8'h0f};
            16'd1645: lut_data_o <= {16'h866d, 8'hef};
            16'd1646: lut_data_o <= {16'h866e, 8'hc3};
            16'd1647: lut_data_o <= {16'h866f, 8'h33};
            16'd1648: lut_data_o <= {16'h8670, 8'hff};
            16'd1649: lut_data_o <= {16'h8671, 8'hee};
            16'd1650: lut_data_o <= {16'h8672, 8'h33};
            16'd1651: lut_data_o <= {16'h8673, 8'hfe};
            16'd1652: lut_data_o <= {16'h8674, 8'hed};
            16'd1653: lut_data_o <= {16'h8675, 8'h33};
            16'd1654: lut_data_o <= {16'h8676, 8'hfd};
            16'd1655: lut_data_o <= {16'h8677, 8'hec};
            16'd1656: lut_data_o <= {16'h8678, 8'h33};
            16'd1657: lut_data_o <= {16'h8679, 8'hfc};
            16'd1658: lut_data_o <= {16'h867a, 8'hd8};
            16'd1659: lut_data_o <= {16'h867b, 8'hf1};
            16'd1660: lut_data_o <= {16'h867c, 8'h22};
            16'd1661: lut_data_o <= {16'h867d, 8'he4};
            16'd1662: lut_data_o <= {16'h867e, 8'h93};
            16'd1663: lut_data_o <= {16'h867f, 8'hfc};
            16'd1664: lut_data_o <= {16'h8680, 8'h74};
            16'd1665: lut_data_o <= {16'h8681, 8'h01};
            16'd1666: lut_data_o <= {16'h8682, 8'h93};
            16'd1667: lut_data_o <= {16'h8683, 8'hfd};
            16'd1668: lut_data_o <= {16'h8684, 8'h74};
            16'd1669: lut_data_o <= {16'h8685, 8'h02};
            16'd1670: lut_data_o <= {16'h8686, 8'h93};
            16'd1671: lut_data_o <= {16'h8687, 8'hfe};
            16'd1672: lut_data_o <= {16'h8688, 8'h74};
            16'd1673: lut_data_o <= {16'h8689, 8'h03};
            16'd1674: lut_data_o <= {16'h868a, 8'h93};
            16'd1675: lut_data_o <= {16'h868b, 8'hff};
            16'd1676: lut_data_o <= {16'h868c, 8'h22};
            16'd1677: lut_data_o <= {16'h868d, 8'he6};
            16'd1678: lut_data_o <= {16'h868e, 8'hfb};
            16'd1679: lut_data_o <= {16'h868f, 8'h08};
            16'd1680: lut_data_o <= {16'h8690, 8'he6};
            16'd1681: lut_data_o <= {16'h8691, 8'hf9};
            16'd1682: lut_data_o <= {16'h8692, 8'h08};
            16'd1683: lut_data_o <= {16'h8693, 8'he6};
            16'd1684: lut_data_o <= {16'h8694, 8'hfa};
            16'd1685: lut_data_o <= {16'h8695, 8'h08};
            16'd1686: lut_data_o <= {16'h8696, 8'he6};
            16'd1687: lut_data_o <= {16'h8697, 8'hcb};
            16'd1688: lut_data_o <= {16'h8698, 8'hf8};
            16'd1689: lut_data_o <= {16'h8699, 8'h22};
            16'd1690: lut_data_o <= {16'h869a, 8'hec};
            16'd1691: lut_data_o <= {16'h869b, 8'hf6};
            16'd1692: lut_data_o <= {16'h869c, 8'h08};
            16'd1693: lut_data_o <= {16'h869d, 8'hed};
            16'd1694: lut_data_o <= {16'h869e, 8'hf6};
            16'd1695: lut_data_o <= {16'h869f, 8'h08};
            16'd1696: lut_data_o <= {16'h86a0, 8'hee};
            16'd1697: lut_data_o <= {16'h86a1, 8'hf6};
            16'd1698: lut_data_o <= {16'h86a2, 8'h08};
            16'd1699: lut_data_o <= {16'h86a3, 8'hef};
            16'd1700: lut_data_o <= {16'h86a4, 8'hf6};
            16'd1701: lut_data_o <= {16'h86a5, 8'h22};
            16'd1702: lut_data_o <= {16'h86a6, 8'ha4};
            16'd1703: lut_data_o <= {16'h86a7, 8'h25};
            16'd1704: lut_data_o <= {16'h86a8, 8'h82};
            16'd1705: lut_data_o <= {16'h86a9, 8'hf5};
            16'd1706: lut_data_o <= {16'h86aa, 8'h82};
            16'd1707: lut_data_o <= {16'h86ab, 8'he5};
            16'd1708: lut_data_o <= {16'h86ac, 8'hf0};
            16'd1709: lut_data_o <= {16'h86ad, 8'h35};
            16'd1710: lut_data_o <= {16'h86ae, 8'h83};
            16'd1711: lut_data_o <= {16'h86af, 8'hf5};
            16'd1712: lut_data_o <= {16'h86b0, 8'h83};
            16'd1713: lut_data_o <= {16'h86b1, 8'h22};
            16'd1714: lut_data_o <= {16'h86b2, 8'hd0};
            16'd1715: lut_data_o <= {16'h86b3, 8'h83};
            16'd1716: lut_data_o <= {16'h86b4, 8'hd0};
            16'd1717: lut_data_o <= {16'h86b5, 8'h82};
            16'd1718: lut_data_o <= {16'h86b6, 8'hf8};
            16'd1719: lut_data_o <= {16'h86b7, 8'he4};
            16'd1720: lut_data_o <= {16'h86b8, 8'h93};
            16'd1721: lut_data_o <= {16'h86b9, 8'h70};
            16'd1722: lut_data_o <= {16'h86ba, 8'h12};
            16'd1723: lut_data_o <= {16'h86bb, 8'h74};
            16'd1724: lut_data_o <= {16'h86bc, 8'h01};
            16'd1725: lut_data_o <= {16'h86bd, 8'h93};
            16'd1726: lut_data_o <= {16'h86be, 8'h70};
            16'd1727: lut_data_o <= {16'h86bf, 8'h0d};
            16'd1728: lut_data_o <= {16'h86c0, 8'ha3};
            16'd1729: lut_data_o <= {16'h86c1, 8'ha3};
            16'd1730: lut_data_o <= {16'h86c2, 8'h93};
            16'd1731: lut_data_o <= {16'h86c3, 8'hf8};
            16'd1732: lut_data_o <= {16'h86c4, 8'h74};
            16'd1733: lut_data_o <= {16'h86c5, 8'h01};
            16'd1734: lut_data_o <= {16'h86c6, 8'h93};
            16'd1735: lut_data_o <= {16'h86c7, 8'hf5};
            16'd1736: lut_data_o <= {16'h86c8, 8'h82};
            16'd1737: lut_data_o <= {16'h86c9, 8'h88};
            16'd1738: lut_data_o <= {16'h86ca, 8'h83};
            16'd1739: lut_data_o <= {16'h86cb, 8'he4};
            16'd1740: lut_data_o <= {16'h86cc, 8'h73};
            16'd1741: lut_data_o <= {16'h86cd, 8'h74};
            16'd1742: lut_data_o <= {16'h86ce, 8'h02};
            16'd1743: lut_data_o <= {16'h86cf, 8'h93};
            16'd1744: lut_data_o <= {16'h86d0, 8'h68};
            16'd1745: lut_data_o <= {16'h86d1, 8'h60};
            16'd1746: lut_data_o <= {16'h86d2, 8'hef};
            16'd1747: lut_data_o <= {16'h86d3, 8'ha3};
            16'd1748: lut_data_o <= {16'h86d4, 8'ha3};
            16'd1749: lut_data_o <= {16'h86d5, 8'ha3};
            16'd1750: lut_data_o <= {16'h86d6, 8'h80};
            16'd1751: lut_data_o <= {16'h86d7, 8'hdf};
            16'd1752: lut_data_o <= {16'h86d8, 8'h90};
            16'd1753: lut_data_o <= {16'h86d9, 8'h38};
            16'd1754: lut_data_o <= {16'h86da, 8'h04};
            16'd1755: lut_data_o <= {16'h86db, 8'h78};
            16'd1756: lut_data_o <= {16'h86dc, 8'h52};
            16'd1757: lut_data_o <= {16'h86dd, 8'h12};
            16'd1758: lut_data_o <= {16'h86de, 8'h0b};
            16'd1759: lut_data_o <= {16'h86df, 8'hfd};
            16'd1760: lut_data_o <= {16'h86e0, 8'h90};
            16'd1761: lut_data_o <= {16'h86e1, 8'h38};
            16'd1762: lut_data_o <= {16'h86e2, 8'h00};
            16'd1763: lut_data_o <= {16'h86e3, 8'he0};
            16'd1764: lut_data_o <= {16'h86e4, 8'hfe};
            16'd1765: lut_data_o <= {16'h86e5, 8'ha3};
            16'd1766: lut_data_o <= {16'h86e6, 8'he0};
            16'd1767: lut_data_o <= {16'h86e7, 8'hfd};
            16'd1768: lut_data_o <= {16'h86e8, 8'hed};
            16'd1769: lut_data_o <= {16'h86e9, 8'hff};
            16'd1770: lut_data_o <= {16'h86ea, 8'hc3};
            16'd1771: lut_data_o <= {16'h86eb, 8'h12};
            16'd1772: lut_data_o <= {16'h86ec, 8'h0b};
            16'd1773: lut_data_o <= {16'h86ed, 8'h9e};
            16'd1774: lut_data_o <= {16'h86ee, 8'h90};
            16'd1775: lut_data_o <= {16'h86ef, 8'h38};
            16'd1776: lut_data_o <= {16'h86f0, 8'h10};
            16'd1777: lut_data_o <= {16'h86f1, 8'h12};
            16'd1778: lut_data_o <= {16'h86f2, 8'h0b};
            16'd1779: lut_data_o <= {16'h86f3, 8'h92};
            16'd1780: lut_data_o <= {16'h86f4, 8'h90};
            16'd1781: lut_data_o <= {16'h86f5, 8'h38};
            16'd1782: lut_data_o <= {16'h86f6, 8'h06};
            16'd1783: lut_data_o <= {16'h86f7, 8'h78};
            16'd1784: lut_data_o <= {16'h86f8, 8'h54};
            16'd1785: lut_data_o <= {16'h86f9, 8'h12};
            16'd1786: lut_data_o <= {16'h86fa, 8'h0b};
            16'd1787: lut_data_o <= {16'h86fb, 8'hfd};
            16'd1788: lut_data_o <= {16'h86fc, 8'h90};
            16'd1789: lut_data_o <= {16'h86fd, 8'h38};
            16'd1790: lut_data_o <= {16'h86fe, 8'h02};
            16'd1791: lut_data_o <= {16'h86ff, 8'he0};
            16'd1792: lut_data_o <= {16'h8700, 8'hfe};
            16'd1793: lut_data_o <= {16'h8701, 8'ha3};
            16'd1794: lut_data_o <= {16'h8702, 8'he0};
            16'd1795: lut_data_o <= {16'h8703, 8'hfd};
            16'd1796: lut_data_o <= {16'h8704, 8'hed};
            16'd1797: lut_data_o <= {16'h8705, 8'hff};
            16'd1798: lut_data_o <= {16'h8706, 8'hc3};
            16'd1799: lut_data_o <= {16'h8707, 8'h12};
            16'd1800: lut_data_o <= {16'h8708, 8'h0b};
            16'd1801: lut_data_o <= {16'h8709, 8'h9e};
            16'd1802: lut_data_o <= {16'h870a, 8'h90};
            16'd1803: lut_data_o <= {16'h870b, 8'h38};
            16'd1804: lut_data_o <= {16'h870c, 8'h12};
            16'd1805: lut_data_o <= {16'h870d, 8'h12};
            16'd1806: lut_data_o <= {16'h870e, 8'h0b};
            16'd1807: lut_data_o <= {16'h870f, 8'h92};
            16'd1808: lut_data_o <= {16'h8710, 8'ha3};
            16'd1809: lut_data_o <= {16'h8711, 8'he0};
            16'd1810: lut_data_o <= {16'h8712, 8'hb4};
            16'd1811: lut_data_o <= {16'h8713, 8'h31};
            16'd1812: lut_data_o <= {16'h8714, 8'h07};
            16'd1813: lut_data_o <= {16'h8715, 8'h78};
            16'd1814: lut_data_o <= {16'h8716, 8'h52};
            16'd1815: lut_data_o <= {16'h8717, 8'h79};
            16'd1816: lut_data_o <= {16'h8718, 8'h52};
            16'd1817: lut_data_o <= {16'h8719, 8'h12};
            16'd1818: lut_data_o <= {16'h871a, 8'h0c};
            16'd1819: lut_data_o <= {16'h871b, 8'h13};
            16'd1820: lut_data_o <= {16'h871c, 8'h90};
            16'd1821: lut_data_o <= {16'h871d, 8'h38};
            16'd1822: lut_data_o <= {16'h871e, 8'h14};
            16'd1823: lut_data_o <= {16'h871f, 8'he0};
            16'd1824: lut_data_o <= {16'h8720, 8'hb4};
            16'd1825: lut_data_o <= {16'h8721, 8'h71};
            16'd1826: lut_data_o <= {16'h8722, 8'h15};
            16'd1827: lut_data_o <= {16'h8723, 8'h78};
            16'd1828: lut_data_o <= {16'h8724, 8'h52};
            16'd1829: lut_data_o <= {16'h8725, 8'he6};
            16'd1830: lut_data_o <= {16'h8726, 8'hfe};
            16'd1831: lut_data_o <= {16'h8727, 8'h08};
            16'd1832: lut_data_o <= {16'h8728, 8'he6};
            16'd1833: lut_data_o <= {16'h8729, 8'h78};
            16'd1834: lut_data_o <= {16'h872a, 8'h02};
            16'd1835: lut_data_o <= {16'h872b, 8'hce};
            16'd1836: lut_data_o <= {16'h872c, 8'hc3};
            16'd1837: lut_data_o <= {16'h872d, 8'h13};
            16'd1838: lut_data_o <= {16'h872e, 8'hce};
            16'd1839: lut_data_o <= {16'h872f, 8'h13};
            16'd1840: lut_data_o <= {16'h8730, 8'hd8};
            16'd1841: lut_data_o <= {16'h8731, 8'hf9};
            16'd1842: lut_data_o <= {16'h8732, 8'h79};
            16'd1843: lut_data_o <= {16'h8733, 8'h53};
            16'd1844: lut_data_o <= {16'h8734, 8'hf7};
            16'd1845: lut_data_o <= {16'h8735, 8'hee};
            16'd1846: lut_data_o <= {16'h8736, 8'h19};
            16'd1847: lut_data_o <= {16'h8737, 8'hf7};
            16'd1848: lut_data_o <= {16'h8738, 8'h90};
            16'd1849: lut_data_o <= {16'h8739, 8'h38};
            16'd1850: lut_data_o <= {16'h873a, 8'h15};
            16'd1851: lut_data_o <= {16'h873b, 8'he0};
            16'd1852: lut_data_o <= {16'h873c, 8'hb4};
            16'd1853: lut_data_o <= {16'h873d, 8'h31};
            16'd1854: lut_data_o <= {16'h873e, 8'h07};
            16'd1855: lut_data_o <= {16'h873f, 8'h78};
            16'd1856: lut_data_o <= {16'h8740, 8'h54};
            16'd1857: lut_data_o <= {16'h8741, 8'h79};
            16'd1858: lut_data_o <= {16'h8742, 8'h54};
            16'd1859: lut_data_o <= {16'h8743, 8'h12};
            16'd1860: lut_data_o <= {16'h8744, 8'h0c};
            16'd1861: lut_data_o <= {16'h8745, 8'h13};
            16'd1862: lut_data_o <= {16'h8746, 8'h90};
            16'd1863: lut_data_o <= {16'h8747, 8'h38};
            16'd1864: lut_data_o <= {16'h8748, 8'h15};
            16'd1865: lut_data_o <= {16'h8749, 8'he0};
            16'd1866: lut_data_o <= {16'h874a, 8'hb4};
            16'd1867: lut_data_o <= {16'h874b, 8'h71};
            16'd1868: lut_data_o <= {16'h874c, 8'h15};
            16'd1869: lut_data_o <= {16'h874d, 8'h78};
            16'd1870: lut_data_o <= {16'h874e, 8'h54};
            16'd1871: lut_data_o <= {16'h874f, 8'he6};
            16'd1872: lut_data_o <= {16'h8750, 8'hfe};
            16'd1873: lut_data_o <= {16'h8751, 8'h08};
            16'd1874: lut_data_o <= {16'h8752, 8'he6};
            16'd1875: lut_data_o <= {16'h8753, 8'h78};
            16'd1876: lut_data_o <= {16'h8754, 8'h02};
            16'd1877: lut_data_o <= {16'h8755, 8'hce};
            16'd1878: lut_data_o <= {16'h8756, 8'hc3};
            16'd1879: lut_data_o <= {16'h8757, 8'h13};
            16'd1880: lut_data_o <= {16'h8758, 8'hce};
            16'd1881: lut_data_o <= {16'h8759, 8'h13};
            16'd1882: lut_data_o <= {16'h875a, 8'hd8};
            16'd1883: lut_data_o <= {16'h875b, 8'hf9};
            16'd1884: lut_data_o <= {16'h875c, 8'h79};
            16'd1885: lut_data_o <= {16'h875d, 8'h55};
            16'd1886: lut_data_o <= {16'h875e, 8'hf7};
            16'd1887: lut_data_o <= {16'h875f, 8'hee};
            16'd1888: lut_data_o <= {16'h8760, 8'h19};
            16'd1889: lut_data_o <= {16'h8761, 8'hf7};
            16'd1890: lut_data_o <= {16'h8762, 8'h79};
            16'd1891: lut_data_o <= {16'h8763, 8'h52};
            16'd1892: lut_data_o <= {16'h8764, 8'h12};
            16'd1893: lut_data_o <= {16'h8765, 8'h0b};
            16'd1894: lut_data_o <= {16'h8766, 8'hd9};
            16'd1895: lut_data_o <= {16'h8767, 8'h09};
            16'd1896: lut_data_o <= {16'h8768, 8'h12};
            16'd1897: lut_data_o <= {16'h8769, 8'h0b};
            16'd1898: lut_data_o <= {16'h876a, 8'hd9};
            16'd1899: lut_data_o <= {16'h876b, 8'haf};
            16'd1900: lut_data_o <= {16'h876c, 8'h47};
            16'd1901: lut_data_o <= {16'h876d, 8'h12};
            16'd1902: lut_data_o <= {16'h876e, 8'h0b};
            16'd1903: lut_data_o <= {16'h876f, 8'hb2};
            16'd1904: lut_data_o <= {16'h8770, 8'he5};
            16'd1905: lut_data_o <= {16'h8771, 8'h44};
            16'd1906: lut_data_o <= {16'h8772, 8'hfb};
            16'd1907: lut_data_o <= {16'h8773, 8'h7a};
            16'd1908: lut_data_o <= {16'h8774, 8'h00};
            16'd1909: lut_data_o <= {16'h8775, 8'hfd};
            16'd1910: lut_data_o <= {16'h8776, 8'h7c};
            16'd1911: lut_data_o <= {16'h8777, 8'h00};
            16'd1912: lut_data_o <= {16'h8778, 8'h12};
            16'd1913: lut_data_o <= {16'h8779, 8'h04};
            16'd1914: lut_data_o <= {16'h877a, 8'hd3};
            16'd1915: lut_data_o <= {16'h877b, 8'h78};
            16'd1916: lut_data_o <= {16'h877c, 8'h5a};
            16'd1917: lut_data_o <= {16'h877d, 8'ha6};
            16'd1918: lut_data_o <= {16'h877e, 8'h06};
            16'd1919: lut_data_o <= {16'h877f, 8'h08};
            16'd1920: lut_data_o <= {16'h8780, 8'ha6};
            16'd1921: lut_data_o <= {16'h8781, 8'h07};
            16'd1922: lut_data_o <= {16'h8782, 8'haf};
            16'd1923: lut_data_o <= {16'h8783, 8'h45};
            16'd1924: lut_data_o <= {16'h8784, 8'h12};
            16'd1925: lut_data_o <= {16'h8785, 8'h0b};
            16'd1926: lut_data_o <= {16'h8786, 8'hb2};
            16'd1927: lut_data_o <= {16'h8787, 8'had};
            16'd1928: lut_data_o <= {16'h8788, 8'h03};
            16'd1929: lut_data_o <= {16'h8789, 8'h7c};
            16'd1930: lut_data_o <= {16'h878a, 8'h00};
            16'd1931: lut_data_o <= {16'h878b, 8'h12};
            16'd1932: lut_data_o <= {16'h878c, 8'h04};
            16'd1933: lut_data_o <= {16'h878d, 8'hd3};
            16'd1934: lut_data_o <= {16'h878e, 8'h78};
            16'd1935: lut_data_o <= {16'h878f, 8'h56};
            16'd1936: lut_data_o <= {16'h8790, 8'ha6};
            16'd1937: lut_data_o <= {16'h8791, 8'h06};
            16'd1938: lut_data_o <= {16'h8792, 8'h08};
            16'd1939: lut_data_o <= {16'h8793, 8'ha6};
            16'd1940: lut_data_o <= {16'h8794, 8'h07};
            16'd1941: lut_data_o <= {16'h8795, 8'haf};
            16'd1942: lut_data_o <= {16'h8796, 8'h48};
            16'd1943: lut_data_o <= {16'h8797, 8'h78};
            16'd1944: lut_data_o <= {16'h8798, 8'h54};
            16'd1945: lut_data_o <= {16'h8799, 8'h12};
            16'd1946: lut_data_o <= {16'h879a, 8'h0b};
            16'd1947: lut_data_o <= {16'h879b, 8'hb4};
            16'd1948: lut_data_o <= {16'h879c, 8'he5};
            16'd1949: lut_data_o <= {16'h879d, 8'h43};
            16'd1950: lut_data_o <= {16'h879e, 8'hfb};
            16'd1951: lut_data_o <= {16'h879f, 8'hfd};
            16'd1952: lut_data_o <= {16'h87a0, 8'h7c};
            16'd1953: lut_data_o <= {16'h87a1, 8'h00};
            16'd1954: lut_data_o <= {16'h87a2, 8'h12};
            16'd1955: lut_data_o <= {16'h87a3, 8'h04};
            16'd1956: lut_data_o <= {16'h87a4, 8'hd3};
            16'd1957: lut_data_o <= {16'h87a5, 8'h78};
            16'd1958: lut_data_o <= {16'h87a6, 8'h5c};
            16'd1959: lut_data_o <= {16'h87a7, 8'ha6};
            16'd1960: lut_data_o <= {16'h87a8, 8'h06};
            16'd1961: lut_data_o <= {16'h87a9, 8'h08};
            16'd1962: lut_data_o <= {16'h87aa, 8'ha6};
            16'd1963: lut_data_o <= {16'h87ab, 8'h07};
            16'd1964: lut_data_o <= {16'h87ac, 8'haf};
            16'd1965: lut_data_o <= {16'h87ad, 8'h46};
            16'd1966: lut_data_o <= {16'h87ae, 8'h7e};
            16'd1967: lut_data_o <= {16'h87af, 8'h00};
            16'd1968: lut_data_o <= {16'h87b0, 8'h78};
            16'd1969: lut_data_o <= {16'h87b1, 8'h54};
            16'd1970: lut_data_o <= {16'h87b2, 8'h12};
            16'd1971: lut_data_o <= {16'h87b3, 8'h0b};
            16'd1972: lut_data_o <= {16'h87b4, 8'hb6};
            16'd1973: lut_data_o <= {16'h87b5, 8'had};
            16'd1974: lut_data_o <= {16'h87b6, 8'h03};
            16'd1975: lut_data_o <= {16'h87b7, 8'h7c};
            16'd1976: lut_data_o <= {16'h87b8, 8'h00};
            16'd1977: lut_data_o <= {16'h87b9, 8'h12};
            16'd1978: lut_data_o <= {16'h87ba, 8'h04};
            16'd1979: lut_data_o <= {16'h87bb, 8'hd3};
            16'd1980: lut_data_o <= {16'h87bc, 8'h78};
            16'd1981: lut_data_o <= {16'h87bd, 8'h58};
            16'd1982: lut_data_o <= {16'h87be, 8'ha6};
            16'd1983: lut_data_o <= {16'h87bf, 8'h06};
            16'd1984: lut_data_o <= {16'h87c0, 8'h08};
            16'd1985: lut_data_o <= {16'h87c1, 8'ha6};
            16'd1986: lut_data_o <= {16'h87c2, 8'h07};
            16'd1987: lut_data_o <= {16'h87c3, 8'hc3};
            16'd1988: lut_data_o <= {16'h87c4, 8'h78};
            16'd1989: lut_data_o <= {16'h87c5, 8'h5b};
            16'd1990: lut_data_o <= {16'h87c6, 8'he6};
            16'd1991: lut_data_o <= {16'h87c7, 8'h94};
            16'd1992: lut_data_o <= {16'h87c8, 8'h08};
            16'd1993: lut_data_o <= {16'h87c9, 8'h18};
            16'd1994: lut_data_o <= {16'h87ca, 8'he6};
            16'd1995: lut_data_o <= {16'h87cb, 8'h94};
            16'd1996: lut_data_o <= {16'h87cc, 8'h00};
            16'd1997: lut_data_o <= {16'h87cd, 8'h50};
            16'd1998: lut_data_o <= {16'h87ce, 8'h05};
            16'd1999: lut_data_o <= {16'h87cf, 8'h76};
            16'd2000: lut_data_o <= {16'h87d0, 8'h00};
            16'd2001: lut_data_o <= {16'h87d1, 8'h08};
            16'd2002: lut_data_o <= {16'h87d2, 8'h76};
            16'd2003: lut_data_o <= {16'h87d3, 8'h08};
            16'd2004: lut_data_o <= {16'h87d4, 8'hc3};
            16'd2005: lut_data_o <= {16'h87d5, 8'h78};
            16'd2006: lut_data_o <= {16'h87d6, 8'h5d};
            16'd2007: lut_data_o <= {16'h87d7, 8'he6};
            16'd2008: lut_data_o <= {16'h87d8, 8'h94};
            16'd2009: lut_data_o <= {16'h87d9, 8'h08};
            16'd2010: lut_data_o <= {16'h87da, 8'h18};
            16'd2011: lut_data_o <= {16'h87db, 8'he6};
            16'd2012: lut_data_o <= {16'h87dc, 8'h94};
            16'd2013: lut_data_o <= {16'h87dd, 8'h00};
            16'd2014: lut_data_o <= {16'h87de, 8'h50};
            16'd2015: lut_data_o <= {16'h87df, 8'h05};
            16'd2016: lut_data_o <= {16'h87e0, 8'h76};
            16'd2017: lut_data_o <= {16'h87e1, 8'h00};
            16'd2018: lut_data_o <= {16'h87e2, 8'h08};
            16'd2019: lut_data_o <= {16'h87e3, 8'h76};
            16'd2020: lut_data_o <= {16'h87e4, 8'h08};
            16'd2021: lut_data_o <= {16'h87e5, 8'h78};
            16'd2022: lut_data_o <= {16'h87e6, 8'h5a};
            16'd2023: lut_data_o <= {16'h87e7, 8'h12};
            16'd2024: lut_data_o <= {16'h87e8, 8'h0b};
            16'd2025: lut_data_o <= {16'h87e9, 8'hc6};
            16'd2026: lut_data_o <= {16'h87ea, 8'hff};
            16'd2027: lut_data_o <= {16'h87eb, 8'hd3};
            16'd2028: lut_data_o <= {16'h87ec, 8'h78};
            16'd2029: lut_data_o <= {16'h87ed, 8'h57};
            16'd2030: lut_data_o <= {16'h87ee, 8'he6};
            16'd2031: lut_data_o <= {16'h87ef, 8'h9f};
            16'd2032: lut_data_o <= {16'h87f0, 8'h18};
            16'd2033: lut_data_o <= {16'h87f1, 8'he6};
            16'd2034: lut_data_o <= {16'h87f2, 8'h9e};
            16'd2035: lut_data_o <= {16'h87f3, 8'h40};
            16'd2036: lut_data_o <= {16'h87f4, 8'h0e};
            16'd2037: lut_data_o <= {16'h87f5, 8'h78};
            16'd2038: lut_data_o <= {16'h87f6, 8'h5a};
            16'd2039: lut_data_o <= {16'h87f7, 8'he6};
            16'd2040: lut_data_o <= {16'h87f8, 8'h13};
            16'd2041: lut_data_o <= {16'h87f9, 8'hfe};
            16'd2042: lut_data_o <= {16'h87fa, 8'h08};
            16'd2043: lut_data_o <= {16'h87fb, 8'he6};
            16'd2044: lut_data_o <= {16'h87fc, 8'h78};
            16'd2045: lut_data_o <= {16'h87fd, 8'h57};
            16'd2046: lut_data_o <= {16'h87fe, 8'h12};
            16'd2047: lut_data_o <= {16'h87ff, 8'h0c};
            16'd2048: lut_data_o <= {16'h8800, 8'h08};
            16'd2049: lut_data_o <= {16'h8801, 8'h80};
            16'd2050: lut_data_o <= {16'h8802, 8'h04};
            16'd2051: lut_data_o <= {16'h8803, 8'h7e};
            16'd2052: lut_data_o <= {16'h8804, 8'h00};
            16'd2053: lut_data_o <= {16'h8805, 8'h7f};
            16'd2054: lut_data_o <= {16'h8806, 8'h00};
            16'd2055: lut_data_o <= {16'h8807, 8'h78};
            16'd2056: lut_data_o <= {16'h8808, 8'h5e};
            16'd2057: lut_data_o <= {16'h8809, 8'h12};
            16'd2058: lut_data_o <= {16'h880a, 8'h0b};
            16'd2059: lut_data_o <= {16'h880b, 8'hbe};
            16'd2060: lut_data_o <= {16'h880c, 8'hff};
            16'd2061: lut_data_o <= {16'h880d, 8'hd3};
            16'd2062: lut_data_o <= {16'h880e, 8'h78};
            16'd2063: lut_data_o <= {16'h880f, 8'h59};
            16'd2064: lut_data_o <= {16'h8810, 8'he6};
            16'd2065: lut_data_o <= {16'h8811, 8'h9f};
            16'd2066: lut_data_o <= {16'h8812, 8'h18};
            16'd2067: lut_data_o <= {16'h8813, 8'he6};
            16'd2068: lut_data_o <= {16'h8814, 8'h9e};
            16'd2069: lut_data_o <= {16'h8815, 8'h40};
            16'd2070: lut_data_o <= {16'h8816, 8'h0e};
            16'd2071: lut_data_o <= {16'h8817, 8'h78};
            16'd2072: lut_data_o <= {16'h8818, 8'h5c};
            16'd2073: lut_data_o <= {16'h8819, 8'he6};
            16'd2074: lut_data_o <= {16'h881a, 8'h13};
            16'd2075: lut_data_o <= {16'h881b, 8'hfe};
            16'd2076: lut_data_o <= {16'h881c, 8'h08};
            16'd2077: lut_data_o <= {16'h881d, 8'he6};
            16'd2078: lut_data_o <= {16'h881e, 8'h78};
            16'd2079: lut_data_o <= {16'h881f, 8'h59};
            16'd2080: lut_data_o <= {16'h8820, 8'h12};
            16'd2081: lut_data_o <= {16'h8821, 8'h0c};
            16'd2082: lut_data_o <= {16'h8822, 8'h08};
            16'd2083: lut_data_o <= {16'h8823, 8'h80};
            16'd2084: lut_data_o <= {16'h8824, 8'h04};
            16'd2085: lut_data_o <= {16'h8825, 8'h7e};
            16'd2086: lut_data_o <= {16'h8826, 8'h00};
            16'd2087: lut_data_o <= {16'h8827, 8'h7f};
            16'd2088: lut_data_o <= {16'h8828, 8'h00};
            16'd2089: lut_data_o <= {16'h8829, 8'he4};
            16'd2090: lut_data_o <= {16'h882a, 8'hfc};
            16'd2091: lut_data_o <= {16'h882b, 8'hfd};
            16'd2092: lut_data_o <= {16'h882c, 8'h78};
            16'd2093: lut_data_o <= {16'h882d, 8'h62};
            16'd2094: lut_data_o <= {16'h882e, 8'h12};
            16'd2095: lut_data_o <= {16'h882f, 8'h06};
            16'd2096: lut_data_o <= {16'h8830, 8'h99};
            16'd2097: lut_data_o <= {16'h8831, 8'h78};
            16'd2098: lut_data_o <= {16'h8832, 8'h5a};
            16'd2099: lut_data_o <= {16'h8833, 8'h12};
            16'd2100: lut_data_o <= {16'h8834, 8'h0b};
            16'd2101: lut_data_o <= {16'h8835, 8'hc6};
            16'd2102: lut_data_o <= {16'h8836, 8'h78};
            16'd2103: lut_data_o <= {16'h8837, 8'h57};
            16'd2104: lut_data_o <= {16'h8838, 8'h26};
            16'd2105: lut_data_o <= {16'h8839, 8'hff};
            16'd2106: lut_data_o <= {16'h883a, 8'hee};
            16'd2107: lut_data_o <= {16'h883b, 8'h18};
            16'd2108: lut_data_o <= {16'h883c, 8'h36};
            16'd2109: lut_data_o <= {16'h883d, 8'hfe};
            16'd2110: lut_data_o <= {16'h883e, 8'h78};
            16'd2111: lut_data_o <= {16'h883f, 8'h66};
            16'd2112: lut_data_o <= {16'h8840, 8'h12};
            16'd2113: lut_data_o <= {16'h8841, 8'h0b};
            16'd2114: lut_data_o <= {16'h8842, 8'hbe};
            16'd2115: lut_data_o <= {16'h8843, 8'h78};
            16'd2116: lut_data_o <= {16'h8844, 8'h59};
            16'd2117: lut_data_o <= {16'h8845, 8'h26};
            16'd2118: lut_data_o <= {16'h8846, 8'hff};
            16'd2119: lut_data_o <= {16'h8847, 8'hee};
            16'd2120: lut_data_o <= {16'h8848, 8'h18};
            16'd2121: lut_data_o <= {16'h8849, 8'h36};
            16'd2122: lut_data_o <= {16'h884a, 8'hfe};
            16'd2123: lut_data_o <= {16'h884b, 8'he4};
            16'd2124: lut_data_o <= {16'h884c, 8'hfc};
            16'd2125: lut_data_o <= {16'h884d, 8'hfd};
            16'd2126: lut_data_o <= {16'h884e, 8'h78};
            16'd2127: lut_data_o <= {16'h884f, 8'h6a};
            16'd2128: lut_data_o <= {16'h8850, 8'h12};
            16'd2129: lut_data_o <= {16'h8851, 8'h06};
            16'd2130: lut_data_o <= {16'h8852, 8'h99};
            16'd2131: lut_data_o <= {16'h8853, 8'h12};
            16'd2132: lut_data_o <= {16'h8854, 8'h0b};
            16'd2133: lut_data_o <= {16'h8855, 8'hce};
            16'd2134: lut_data_o <= {16'h8856, 8'h78};
            16'd2135: lut_data_o <= {16'h8857, 8'h66};
            16'd2136: lut_data_o <= {16'h8858, 8'h12};
            16'd2137: lut_data_o <= {16'h8859, 8'h06};
            16'd2138: lut_data_o <= {16'h885a, 8'h8c};
            16'd2139: lut_data_o <= {16'h885b, 8'hd3};
            16'd2140: lut_data_o <= {16'h885c, 8'h12};
            16'd2141: lut_data_o <= {16'h885d, 8'h06};
            16'd2142: lut_data_o <= {16'h885e, 8'h45};
            16'd2143: lut_data_o <= {16'h885f, 8'h40};
            16'd2144: lut_data_o <= {16'h8860, 8'h08};
            16'd2145: lut_data_o <= {16'h8861, 8'h12};
            16'd2146: lut_data_o <= {16'h8862, 8'h0b};
            16'd2147: lut_data_o <= {16'h8863, 8'hce};
            16'd2148: lut_data_o <= {16'h8864, 8'h78};
            16'd2149: lut_data_o <= {16'h8865, 8'h66};
            16'd2150: lut_data_o <= {16'h8866, 8'h12};
            16'd2151: lut_data_o <= {16'h8867, 8'h06};
            16'd2152: lut_data_o <= {16'h8868, 8'h99};
            16'd2153: lut_data_o <= {16'h8869, 8'h78};
            16'd2154: lut_data_o <= {16'h886a, 8'h54};
            16'd2155: lut_data_o <= {16'h886b, 8'h12};
            16'd2156: lut_data_o <= {16'h886c, 8'h0b};
            16'd2157: lut_data_o <= {16'h886d, 8'hd0};
            16'd2158: lut_data_o <= {16'h886e, 8'h78};
            16'd2159: lut_data_o <= {16'h886f, 8'h6a};
            16'd2160: lut_data_o <= {16'h8870, 8'h12};
            16'd2161: lut_data_o <= {16'h8871, 8'h06};
            16'd2162: lut_data_o <= {16'h8872, 8'h8c};
            16'd2163: lut_data_o <= {16'h8873, 8'hd3};
            16'd2164: lut_data_o <= {16'h8874, 8'h12};
            16'd2165: lut_data_o <= {16'h8875, 8'h06};
            16'd2166: lut_data_o <= {16'h8876, 8'h45};
            16'd2167: lut_data_o <= {16'h8877, 8'h40};
            16'd2168: lut_data_o <= {16'h8878, 8'h0a};
            16'd2169: lut_data_o <= {16'h8879, 8'h78};
            16'd2170: lut_data_o <= {16'h887a, 8'h54};
            16'd2171: lut_data_o <= {16'h887b, 8'h12};
            16'd2172: lut_data_o <= {16'h887c, 8'h0b};
            16'd2173: lut_data_o <= {16'h887d, 8'hd0};
            16'd2174: lut_data_o <= {16'h887e, 8'h78};
            16'd2175: lut_data_o <= {16'h887f, 8'h6a};
            16'd2176: lut_data_o <= {16'h8880, 8'h12};
            16'd2177: lut_data_o <= {16'h8881, 8'h06};
            16'd2178: lut_data_o <= {16'h8882, 8'h99};
            16'd2179: lut_data_o <= {16'h8883, 8'h78};
            16'd2180: lut_data_o <= {16'h8884, 8'h61};
            16'd2181: lut_data_o <= {16'h8885, 8'he6};
            16'd2182: lut_data_o <= {16'h8886, 8'h90};
            16'd2183: lut_data_o <= {16'h8887, 8'h60};
            16'd2184: lut_data_o <= {16'h8888, 8'h01};
            16'd2185: lut_data_o <= {16'h8889, 8'hf0};
            16'd2186: lut_data_o <= {16'h888a, 8'h78};
            16'd2187: lut_data_o <= {16'h888b, 8'h65};
            16'd2188: lut_data_o <= {16'h888c, 8'he6};
            16'd2189: lut_data_o <= {16'h888d, 8'ha3};
            16'd2190: lut_data_o <= {16'h888e, 8'hf0};
            16'd2191: lut_data_o <= {16'h888f, 8'h78};
            16'd2192: lut_data_o <= {16'h8890, 8'h69};
            16'd2193: lut_data_o <= {16'h8891, 8'he6};
            16'd2194: lut_data_o <= {16'h8892, 8'ha3};
            16'd2195: lut_data_o <= {16'h8893, 8'hf0};
            16'd2196: lut_data_o <= {16'h8894, 8'h78};
            16'd2197: lut_data_o <= {16'h8895, 8'h55};
            16'd2198: lut_data_o <= {16'h8896, 8'he6};
            16'd2199: lut_data_o <= {16'h8897, 8'ha3};
            16'd2200: lut_data_o <= {16'h8898, 8'hf0};
            16'd2201: lut_data_o <= {16'h8899, 8'h7d};
            16'd2202: lut_data_o <= {16'h889a, 8'h01};
            16'd2203: lut_data_o <= {16'h889b, 8'h78};
            16'd2204: lut_data_o <= {16'h889c, 8'h61};
            16'd2205: lut_data_o <= {16'h889d, 8'h12};
            16'd2206: lut_data_o <= {16'h889e, 8'h0b};
            16'd2207: lut_data_o <= {16'h889f, 8'he9};
            16'd2208: lut_data_o <= {16'h88a0, 8'h24};
            16'd2209: lut_data_o <= {16'h88a1, 8'h01};
            16'd2210: lut_data_o <= {16'h88a2, 8'h12};
            16'd2211: lut_data_o <= {16'h88a3, 8'h0b};
            16'd2212: lut_data_o <= {16'h88a4, 8'ha6};
            16'd2213: lut_data_o <= {16'h88a5, 8'h78};
            16'd2214: lut_data_o <= {16'h88a6, 8'h65};
            16'd2215: lut_data_o <= {16'h88a7, 8'h12};
            16'd2216: lut_data_o <= {16'h88a8, 8'h0b};
            16'd2217: lut_data_o <= {16'h88a9, 8'he9};
            16'd2218: lut_data_o <= {16'h88aa, 8'h24};
            16'd2219: lut_data_o <= {16'h88ab, 8'h02};
            16'd2220: lut_data_o <= {16'h88ac, 8'h12};
            16'd2221: lut_data_o <= {16'h88ad, 8'h0b};
            16'd2222: lut_data_o <= {16'h88ae, 8'ha6};
            16'd2223: lut_data_o <= {16'h88af, 8'h78};
            16'd2224: lut_data_o <= {16'h88b0, 8'h69};
            16'd2225: lut_data_o <= {16'h88b1, 8'h12};
            16'd2226: lut_data_o <= {16'h88b2, 8'h0b};
            16'd2227: lut_data_o <= {16'h88b3, 8'he9};
            16'd2228: lut_data_o <= {16'h88b4, 8'h24};
            16'd2229: lut_data_o <= {16'h88b5, 8'h03};
            16'd2230: lut_data_o <= {16'h88b6, 8'h12};
            16'd2231: lut_data_o <= {16'h88b7, 8'h0b};
            16'd2232: lut_data_o <= {16'h88b8, 8'ha6};
            16'd2233: lut_data_o <= {16'h88b9, 8'h78};
            16'd2234: lut_data_o <= {16'h88ba, 8'h6d};
            16'd2235: lut_data_o <= {16'h88bb, 8'h12};
            16'd2236: lut_data_o <= {16'h88bc, 8'h0b};
            16'd2237: lut_data_o <= {16'h88bd, 8'he9};
            16'd2238: lut_data_o <= {16'h88be, 8'h24};
            16'd2239: lut_data_o <= {16'h88bf, 8'h04};
            16'd2240: lut_data_o <= {16'h88c0, 8'h12};
            16'd2241: lut_data_o <= {16'h88c1, 8'h0b};
            16'd2242: lut_data_o <= {16'h88c2, 8'ha6};
            16'd2243: lut_data_o <= {16'h88c3, 8'h0d};
            16'd2244: lut_data_o <= {16'h88c4, 8'hbd};
            16'd2245: lut_data_o <= {16'h88c5, 8'h05};
            16'd2246: lut_data_o <= {16'h88c6, 8'hd4};
            16'd2247: lut_data_o <= {16'h88c7, 8'hc2};
            16'd2248: lut_data_o <= {16'h88c8, 8'h0e};
            16'd2249: lut_data_o <= {16'h88c9, 8'hc2};
            16'd2250: lut_data_o <= {16'h88ca, 8'h06};
            16'd2251: lut_data_o <= {16'h88cb, 8'h22};
            16'd2252: lut_data_o <= {16'h88cc, 8'h85};
            16'd2253: lut_data_o <= {16'h88cd, 8'h08};
            16'd2254: lut_data_o <= {16'h88ce, 8'h41};
            16'd2255: lut_data_o <= {16'h88cf, 8'h90};
            16'd2256: lut_data_o <= {16'h88d0, 8'h30};
            16'd2257: lut_data_o <= {16'h88d1, 8'h24};
            16'd2258: lut_data_o <= {16'h88d2, 8'he0};
            16'd2259: lut_data_o <= {16'h88d3, 8'hf5};
            16'd2260: lut_data_o <= {16'h88d4, 8'h3d};
            16'd2261: lut_data_o <= {16'h88d5, 8'ha3};
            16'd2262: lut_data_o <= {16'h88d6, 8'he0};
            16'd2263: lut_data_o <= {16'h88d7, 8'hf5};
            16'd2264: lut_data_o <= {16'h88d8, 8'h3e};
            16'd2265: lut_data_o <= {16'h88d9, 8'ha3};
            16'd2266: lut_data_o <= {16'h88da, 8'he0};
            16'd2267: lut_data_o <= {16'h88db, 8'hf5};
            16'd2268: lut_data_o <= {16'h88dc, 8'h3f};
            16'd2269: lut_data_o <= {16'h88dd, 8'ha3};
            16'd2270: lut_data_o <= {16'h88de, 8'he0};
            16'd2271: lut_data_o <= {16'h88df, 8'hf5};
            16'd2272: lut_data_o <= {16'h88e0, 8'h40};
            16'd2273: lut_data_o <= {16'h88e1, 8'ha3};
            16'd2274: lut_data_o <= {16'h88e2, 8'he0};
            16'd2275: lut_data_o <= {16'h88e3, 8'hf5};
            16'd2276: lut_data_o <= {16'h88e4, 8'h3c};
            16'd2277: lut_data_o <= {16'h88e5, 8'hd2};
            16'd2278: lut_data_o <= {16'h88e6, 8'h34};
            16'd2279: lut_data_o <= {16'h88e7, 8'he5};
            16'd2280: lut_data_o <= {16'h88e8, 8'h41};
            16'd2281: lut_data_o <= {16'h88e9, 8'h12};
            16'd2282: lut_data_o <= {16'h88ea, 8'h06};
            16'd2283: lut_data_o <= {16'h88eb, 8'hb1};
            16'd2284: lut_data_o <= {16'h88ec, 8'h09};
            16'd2285: lut_data_o <= {16'h88ed, 8'h31};
            16'd2286: lut_data_o <= {16'h88ee, 8'h03};
            16'd2287: lut_data_o <= {16'h88ef, 8'h09};
            16'd2288: lut_data_o <= {16'h88f0, 8'h35};
            16'd2289: lut_data_o <= {16'h88f1, 8'h04};
            16'd2290: lut_data_o <= {16'h88f2, 8'h09};
            16'd2291: lut_data_o <= {16'h88f3, 8'h3b};
            16'd2292: lut_data_o <= {16'h88f4, 8'h05};
            16'd2293: lut_data_o <= {16'h88f5, 8'h09};
            16'd2294: lut_data_o <= {16'h88f6, 8'h3e};
            16'd2295: lut_data_o <= {16'h88f7, 8'h06};
            16'd2296: lut_data_o <= {16'h88f8, 8'h09};
            16'd2297: lut_data_o <= {16'h88f9, 8'h41};
            16'd2298: lut_data_o <= {16'h88fa, 8'h07};
            16'd2299: lut_data_o <= {16'h88fb, 8'h09};
            16'd2300: lut_data_o <= {16'h88fc, 8'h4a};
            16'd2301: lut_data_o <= {16'h88fd, 8'h08};
            16'd2302: lut_data_o <= {16'h88fe, 8'h09};
            16'd2303: lut_data_o <= {16'h88ff, 8'h5b};
            16'd2304: lut_data_o <= {16'h8900, 8'h12};
            16'd2305: lut_data_o <= {16'h8901, 8'h09};
            16'd2306: lut_data_o <= {16'h8902, 8'h73};
            16'd2307: lut_data_o <= {16'h8903, 8'h18};
            16'd2308: lut_data_o <= {16'h8904, 8'h09};
            16'd2309: lut_data_o <= {16'h8905, 8'h89};
            16'd2310: lut_data_o <= {16'h8906, 8'h19};
            16'd2311: lut_data_o <= {16'h8907, 8'h09};
            16'd2312: lut_data_o <= {16'h8908, 8'h5e};
            16'd2313: lut_data_o <= {16'h8909, 8'h1a};
            16'd2314: lut_data_o <= {16'h890a, 8'h09};
            16'd2315: lut_data_o <= {16'h890b, 8'h6a};
            16'd2316: lut_data_o <= {16'h890c, 8'h1b};
            16'd2317: lut_data_o <= {16'h890d, 8'h09};
            16'd2318: lut_data_o <= {16'h890e, 8'had};
            16'd2319: lut_data_o <= {16'h890f, 8'h80};
            16'd2320: lut_data_o <= {16'h8910, 8'h09};
            16'd2321: lut_data_o <= {16'h8911, 8'hb2};
            16'd2322: lut_data_o <= {16'h8912, 8'h81};
            16'd2323: lut_data_o <= {16'h8913, 8'h0a};
            16'd2324: lut_data_o <= {16'h8914, 8'h1d};
            16'd2325: lut_data_o <= {16'h8915, 8'h8f};
            16'd2326: lut_data_o <= {16'h8916, 8'h0a};
            16'd2327: lut_data_o <= {16'h8917, 8'h09};
            16'd2328: lut_data_o <= {16'h8918, 8'h90};
            16'd2329: lut_data_o <= {16'h8919, 8'h0a};
            16'd2330: lut_data_o <= {16'h891a, 8'h1d};
            16'd2331: lut_data_o <= {16'h891b, 8'h91};
            16'd2332: lut_data_o <= {16'h891c, 8'h0a};
            16'd2333: lut_data_o <= {16'h891d, 8'h1d};
            16'd2334: lut_data_o <= {16'h891e, 8'h92};
            16'd2335: lut_data_o <= {16'h891f, 8'h0a};
            16'd2336: lut_data_o <= {16'h8920, 8'h1d};
            16'd2337: lut_data_o <= {16'h8921, 8'h93};
            16'd2338: lut_data_o <= {16'h8922, 8'h0a};
            16'd2339: lut_data_o <= {16'h8923, 8'h1d};
            16'd2340: lut_data_o <= {16'h8924, 8'h94};
            16'd2341: lut_data_o <= {16'h8925, 8'h0a};
            16'd2342: lut_data_o <= {16'h8926, 8'h1d};
            16'd2343: lut_data_o <= {16'h8927, 8'h98};
            16'd2344: lut_data_o <= {16'h8928, 8'h0a};
            16'd2345: lut_data_o <= {16'h8929, 8'h17};
            16'd2346: lut_data_o <= {16'h892a, 8'h9f};
            16'd2347: lut_data_o <= {16'h892b, 8'h0a};
            16'd2348: lut_data_o <= {16'h892c, 8'h1a};
            16'd2349: lut_data_o <= {16'h892d, 8'hec};
            16'd2350: lut_data_o <= {16'h892e, 8'h00};
            16'd2351: lut_data_o <= {16'h892f, 8'h00};
            16'd2352: lut_data_o <= {16'h8930, 8'h0a};
            16'd2353: lut_data_o <= {16'h8931, 8'h38};
            16'd2354: lut_data_o <= {16'h8932, 8'h12};
            16'd2355: lut_data_o <= {16'h8933, 8'h0f};
            16'd2356: lut_data_o <= {16'h8934, 8'h74};
            16'd2357: lut_data_o <= {16'h8935, 8'h22};
            16'd2358: lut_data_o <= {16'h8936, 8'h12};
            16'd2359: lut_data_o <= {16'h8937, 8'h0f};
            16'd2360: lut_data_o <= {16'h8938, 8'h74};
            16'd2361: lut_data_o <= {16'h8939, 8'hd2};
            16'd2362: lut_data_o <= {16'h893a, 8'h03};
            16'd2363: lut_data_o <= {16'h893b, 8'h22};
            16'd2364: lut_data_o <= {16'h893c, 8'hd2};
            16'd2365: lut_data_o <= {16'h893d, 8'h03};
            16'd2366: lut_data_o <= {16'h893e, 8'h22};
            16'd2367: lut_data_o <= {16'h893f, 8'hc2};
            16'd2368: lut_data_o <= {16'h8940, 8'h03};
            16'd2369: lut_data_o <= {16'h8941, 8'h22};
            16'd2370: lut_data_o <= {16'h8942, 8'ha2};
            16'd2371: lut_data_o <= {16'h8943, 8'h37};
            16'd2372: lut_data_o <= {16'h8944, 8'he4};
            16'd2373: lut_data_o <= {16'h8945, 8'h33};
            16'd2374: lut_data_o <= {16'h8946, 8'hf5};
            16'd2375: lut_data_o <= {16'h8947, 8'h3c};
            16'd2376: lut_data_o <= {16'h8948, 8'h02};
            16'd2377: lut_data_o <= {16'h8949, 8'h0a};
            16'd2378: lut_data_o <= {16'h894a, 8'h1d};
            16'd2379: lut_data_o <= {16'h894b, 8'hc2};
            16'd2380: lut_data_o <= {16'h894c, 8'h01};
            16'd2381: lut_data_o <= {16'h894d, 8'hc2};
            16'd2382: lut_data_o <= {16'h894e, 8'h02};
            16'd2383: lut_data_o <= {16'h894f, 8'hc2};
            16'd2384: lut_data_o <= {16'h8950, 8'h03};
            16'd2385: lut_data_o <= {16'h8951, 8'h12};
            16'd2386: lut_data_o <= {16'h8952, 8'h0d};
            16'd2387: lut_data_o <= {16'h8953, 8'h0d};
            16'd2388: lut_data_o <= {16'h8954, 8'h75};
            16'd2389: lut_data_o <= {16'h8955, 8'h1e};
            16'd2390: lut_data_o <= {16'h8956, 8'h70};
            16'd2391: lut_data_o <= {16'h8957, 8'hd2};
            16'd2392: lut_data_o <= {16'h8958, 8'h35};
            16'd2393: lut_data_o <= {16'h8959, 8'h02};
            16'd2394: lut_data_o <= {16'h895a, 8'h0a};
            16'd2395: lut_data_o <= {16'h895b, 8'h1d};
            16'd2396: lut_data_o <= {16'h895c, 8'h02};
            16'd2397: lut_data_o <= {16'h895d, 8'h0a};
            16'd2398: lut_data_o <= {16'h895e, 8'h04};
            16'd2399: lut_data_o <= {16'h895f, 8'h85};
            16'd2400: lut_data_o <= {16'h8960, 8'h40};
            16'd2401: lut_data_o <= {16'h8961, 8'h4a};
            16'd2402: lut_data_o <= {16'h8962, 8'h85};
            16'd2403: lut_data_o <= {16'h8963, 8'h3c};
            16'd2404: lut_data_o <= {16'h8964, 8'h4b};
            16'd2405: lut_data_o <= {16'h8965, 8'h12};
            16'd2406: lut_data_o <= {16'h8966, 8'h0a};
            16'd2407: lut_data_o <= {16'h8967, 8'hff};
            16'd2408: lut_data_o <= {16'h8968, 8'h02};
            16'd2409: lut_data_o <= {16'h8969, 8'h0a};
            16'd2410: lut_data_o <= {16'h896a, 8'h1d};
            16'd2411: lut_data_o <= {16'h896b, 8'h85};
            16'd2412: lut_data_o <= {16'h896c, 8'h4a};
            16'd2413: lut_data_o <= {16'h896d, 8'h40};
            16'd2414: lut_data_o <= {16'h896e, 8'h85};
            16'd2415: lut_data_o <= {16'h896f, 8'h4b};
            16'd2416: lut_data_o <= {16'h8970, 8'h3c};
            16'd2417: lut_data_o <= {16'h8971, 8'h02};
            16'd2418: lut_data_o <= {16'h8972, 8'h0a};
            16'd2419: lut_data_o <= {16'h8973, 8'h1d};
            16'd2420: lut_data_o <= {16'h8974, 8'he4};
            16'd2421: lut_data_o <= {16'h8975, 8'hf5};
            16'd2422: lut_data_o <= {16'h8976, 8'h22};
            16'd2423: lut_data_o <= {16'h8977, 8'hf5};
            16'd2424: lut_data_o <= {16'h8978, 8'h23};
            16'd2425: lut_data_o <= {16'h8979, 8'h85};
            16'd2426: lut_data_o <= {16'h897a, 8'h40};
            16'd2427: lut_data_o <= {16'h897b, 8'h31};
            16'd2428: lut_data_o <= {16'h897c, 8'h85};
            16'd2429: lut_data_o <= {16'h897d, 8'h3f};
            16'd2430: lut_data_o <= {16'h897e, 8'h30};
            16'd2431: lut_data_o <= {16'h897f, 8'h85};
            16'd2432: lut_data_o <= {16'h8980, 8'h3e};
            16'd2433: lut_data_o <= {16'h8981, 8'h2f};
            16'd2434: lut_data_o <= {16'h8982, 8'h85};
            16'd2435: lut_data_o <= {16'h8983, 8'h3d};
            16'd2436: lut_data_o <= {16'h8984, 8'h2e};
            16'd2437: lut_data_o <= {16'h8985, 8'h12};
            16'd2438: lut_data_o <= {16'h8986, 8'h0f};
            16'd2439: lut_data_o <= {16'h8987, 8'h46};
            16'd2440: lut_data_o <= {16'h8988, 8'h80};
            16'd2441: lut_data_o <= {16'h8989, 8'h1f};
            16'd2442: lut_data_o <= {16'h898a, 8'h75};
            16'd2443: lut_data_o <= {16'h898b, 8'h22};
            16'd2444: lut_data_o <= {16'h898c, 8'h00};
            16'd2445: lut_data_o <= {16'h898d, 8'h75};
            16'd2446: lut_data_o <= {16'h898e, 8'h23};
            16'd2447: lut_data_o <= {16'h898f, 8'h01};
            16'd2448: lut_data_o <= {16'h8990, 8'h74};
            16'd2449: lut_data_o <= {16'h8991, 8'hff};
            16'd2450: lut_data_o <= {16'h8992, 8'hf5};
            16'd2451: lut_data_o <= {16'h8993, 8'h2d};
            16'd2452: lut_data_o <= {16'h8994, 8'hf5};
            16'd2453: lut_data_o <= {16'h8995, 8'h2c};
            16'd2454: lut_data_o <= {16'h8996, 8'hf5};
            16'd2455: lut_data_o <= {16'h8997, 8'h2b};
            16'd2456: lut_data_o <= {16'h8998, 8'hf5};
            16'd2457: lut_data_o <= {16'h8999, 8'h2a};
            16'd2458: lut_data_o <= {16'h899a, 8'h12};
            16'd2459: lut_data_o <= {16'h899b, 8'h0f};
            16'd2460: lut_data_o <= {16'h899c, 8'h46};
            16'd2461: lut_data_o <= {16'h899d, 8'h85};
            16'd2462: lut_data_o <= {16'h899e, 8'h2d};
            16'd2463: lut_data_o <= {16'h899f, 8'h40};
            16'd2464: lut_data_o <= {16'h89a0, 8'h85};
            16'd2465: lut_data_o <= {16'h89a1, 8'h2c};
            16'd2466: lut_data_o <= {16'h89a2, 8'h3f};
            16'd2467: lut_data_o <= {16'h89a3, 8'h85};
            16'd2468: lut_data_o <= {16'h89a4, 8'h2b};
            16'd2469: lut_data_o <= {16'h89a5, 8'h3e};
            16'd2470: lut_data_o <= {16'h89a6, 8'h85};
            16'd2471: lut_data_o <= {16'h89a7, 8'h2a};
            16'd2472: lut_data_o <= {16'h89a8, 8'h3d};
            16'd2473: lut_data_o <= {16'h89a9, 8'he4};
            16'd2474: lut_data_o <= {16'h89aa, 8'hf5};
            16'd2475: lut_data_o <= {16'h89ab, 8'h3c};
            16'd2476: lut_data_o <= {16'h89ac, 8'h80};
            16'd2477: lut_data_o <= {16'h89ad, 8'h70};
            16'd2478: lut_data_o <= {16'h89ae, 8'h12};
            16'd2479: lut_data_o <= {16'h89af, 8'h0f};
            16'd2480: lut_data_o <= {16'h89b0, 8'h16};
            16'd2481: lut_data_o <= {16'h89b1, 8'h80};
            16'd2482: lut_data_o <= {16'h89b2, 8'h6b};
            16'd2483: lut_data_o <= {16'h89b3, 8'h85};
            16'd2484: lut_data_o <= {16'h89b4, 8'h3d};
            16'd2485: lut_data_o <= {16'h89b5, 8'h45};
            16'd2486: lut_data_o <= {16'h89b6, 8'h85};
            16'd2487: lut_data_o <= {16'h89b7, 8'h3e};
            16'd2488: lut_data_o <= {16'h89b8, 8'h46};
            16'd2489: lut_data_o <= {16'h89b9, 8'he5};
            16'd2490: lut_data_o <= {16'h89ba, 8'h47};
            16'd2491: lut_data_o <= {16'h89bb, 8'hc3};
            16'd2492: lut_data_o <= {16'h89bc, 8'h13};
            16'd2493: lut_data_o <= {16'h89bd, 8'hff};
            16'd2494: lut_data_o <= {16'h89be, 8'he5};
            16'd2495: lut_data_o <= {16'h89bf, 8'h45};
            16'd2496: lut_data_o <= {16'h89c0, 8'hc3};
            16'd2497: lut_data_o <= {16'h89c1, 8'h9f};
            16'd2498: lut_data_o <= {16'h89c2, 8'h50};
            16'd2499: lut_data_o <= {16'h89c3, 8'h02};
            16'd2500: lut_data_o <= {16'h89c4, 8'h8f};
            16'd2501: lut_data_o <= {16'h89c5, 8'h45};
            16'd2502: lut_data_o <= {16'h89c6, 8'he5};
            16'd2503: lut_data_o <= {16'h89c7, 8'h48};
            16'd2504: lut_data_o <= {16'h89c8, 8'hc3};
            16'd2505: lut_data_o <= {16'h89c9, 8'h13};
            16'd2506: lut_data_o <= {16'h89ca, 8'hff};
            16'd2507: lut_data_o <= {16'h89cb, 8'he5};
            16'd2508: lut_data_o <= {16'h89cc, 8'h46};
            16'd2509: lut_data_o <= {16'h89cd, 8'hc3};
            16'd2510: lut_data_o <= {16'h89ce, 8'h9f};
            16'd2511: lut_data_o <= {16'h89cf, 8'h50};
            16'd2512: lut_data_o <= {16'h89d0, 8'h02};
            16'd2513: lut_data_o <= {16'h89d1, 8'h8f};
            16'd2514: lut_data_o <= {16'h89d2, 8'h46};
            16'd2515: lut_data_o <= {16'h89d3, 8'he5};
            16'd2516: lut_data_o <= {16'h89d4, 8'h47};
            16'd2517: lut_data_o <= {16'h89d5, 8'hc3};
            16'd2518: lut_data_o <= {16'h89d6, 8'h13};
            16'd2519: lut_data_o <= {16'h89d7, 8'hff};
            16'd2520: lut_data_o <= {16'h89d8, 8'hfd};
            16'd2521: lut_data_o <= {16'h89d9, 8'he5};
            16'd2522: lut_data_o <= {16'h89da, 8'h45};
            16'd2523: lut_data_o <= {16'h89db, 8'h2d};
            16'd2524: lut_data_o <= {16'h89dc, 8'hfd};
            16'd2525: lut_data_o <= {16'h89dd, 8'he4};
            16'd2526: lut_data_o <= {16'h89de, 8'h33};
            16'd2527: lut_data_o <= {16'h89df, 8'hfc};
            16'd2528: lut_data_o <= {16'h89e0, 8'he5};
            16'd2529: lut_data_o <= {16'h89e1, 8'h44};
            16'd2530: lut_data_o <= {16'h89e2, 8'h12};
            16'd2531: lut_data_o <= {16'h89e3, 8'h0f};
            16'd2532: lut_data_o <= {16'h89e4, 8'h90};
            16'd2533: lut_data_o <= {16'h89e5, 8'h40};
            16'd2534: lut_data_o <= {16'h89e6, 8'h05};
            16'd2535: lut_data_o <= {16'h89e7, 8'he5};
            16'd2536: lut_data_o <= {16'h89e8, 8'h44};
            16'd2537: lut_data_o <= {16'h89e9, 8'h9f};
            16'd2538: lut_data_o <= {16'h89ea, 8'hf5};
            16'd2539: lut_data_o <= {16'h89eb, 8'h45};
            16'd2540: lut_data_o <= {16'h89ec, 8'he5};
            16'd2541: lut_data_o <= {16'h89ed, 8'h48};
            16'd2542: lut_data_o <= {16'h89ee, 8'hc3};
            16'd2543: lut_data_o <= {16'h89ef, 8'h13};
            16'd2544: lut_data_o <= {16'h89f0, 8'hff};
            16'd2545: lut_data_o <= {16'h89f1, 8'hfd};
            16'd2546: lut_data_o <= {16'h89f2, 8'he5};
            16'd2547: lut_data_o <= {16'h89f3, 8'h46};
            16'd2548: lut_data_o <= {16'h89f4, 8'h2d};
            16'd2549: lut_data_o <= {16'h89f5, 8'hfd};
            16'd2550: lut_data_o <= {16'h89f6, 8'he4};
            16'd2551: lut_data_o <= {16'h89f7, 8'h33};
            16'd2552: lut_data_o <= {16'h89f8, 8'hfc};
            16'd2553: lut_data_o <= {16'h89f9, 8'he5};
            16'd2554: lut_data_o <= {16'h89fa, 8'h43};
            16'd2555: lut_data_o <= {16'h89fb, 8'h12};
            16'd2556: lut_data_o <= {16'h89fc, 8'h0f};
            16'd2557: lut_data_o <= {16'h89fd, 8'h90};
            16'd2558: lut_data_o <= {16'h89fe, 8'h40};
            16'd2559: lut_data_o <= {16'h89ff, 8'h05};
            16'd2560: lut_data_o <= {16'h8a00, 8'he5};
            16'd2561: lut_data_o <= {16'h8a01, 8'h43};
            16'd2562: lut_data_o <= {16'h8a02, 8'h9f};
            16'd2563: lut_data_o <= {16'h8a03, 8'hf5};
            16'd2564: lut_data_o <= {16'h8a04, 8'h46};
            16'd2565: lut_data_o <= {16'h8a05, 8'h12};
            16'd2566: lut_data_o <= {16'h8a06, 8'h06};
            16'd2567: lut_data_o <= {16'h8a07, 8'hd7};
            16'd2568: lut_data_o <= {16'h8a08, 8'h80};
            16'd2569: lut_data_o <= {16'h8a09, 8'h14};
            16'd2570: lut_data_o <= {16'h8a0a, 8'h85};
            16'd2571: lut_data_o <= {16'h8a0b, 8'h40};
            16'd2572: lut_data_o <= {16'h8a0c, 8'h48};
            16'd2573: lut_data_o <= {16'h8a0d, 8'h85};
            16'd2574: lut_data_o <= {16'h8a0e, 8'h3f};
            16'd2575: lut_data_o <= {16'h8a0f, 8'h47};
            16'd2576: lut_data_o <= {16'h8a10, 8'h85};
            16'd2577: lut_data_o <= {16'h8a11, 8'h3e};
            16'd2578: lut_data_o <= {16'h8a12, 8'h46};
            16'd2579: lut_data_o <= {16'h8a13, 8'h85};
            16'd2580: lut_data_o <= {16'h8a14, 8'h3d};
            16'd2581: lut_data_o <= {16'h8a15, 8'h45};
            16'd2582: lut_data_o <= {16'h8a16, 8'h80};
            16'd2583: lut_data_o <= {16'h8a17, 8'h06};
            16'd2584: lut_data_o <= {16'h8a18, 8'h02};
            16'd2585: lut_data_o <= {16'h8a19, 8'h06};
            16'd2586: lut_data_o <= {16'h8a1a, 8'hd7};
            16'd2587: lut_data_o <= {16'h8a1b, 8'h12};
            16'd2588: lut_data_o <= {16'h8a1c, 8'h0d};
            16'd2589: lut_data_o <= {16'h8a1d, 8'h7e};
            16'd2590: lut_data_o <= {16'h8a1e, 8'h90};
            16'd2591: lut_data_o <= {16'h8a1f, 8'h30};
            16'd2592: lut_data_o <= {16'h8a20, 8'h24};
            16'd2593: lut_data_o <= {16'h8a21, 8'he5};
            16'd2594: lut_data_o <= {16'h8a22, 8'h3d};
            16'd2595: lut_data_o <= {16'h8a23, 8'hf0};
            16'd2596: lut_data_o <= {16'h8a24, 8'ha3};
            16'd2597: lut_data_o <= {16'h8a25, 8'he5};
            16'd2598: lut_data_o <= {16'h8a26, 8'h3e};
            16'd2599: lut_data_o <= {16'h8a27, 8'hf0};
            16'd2600: lut_data_o <= {16'h8a28, 8'ha3};
            16'd2601: lut_data_o <= {16'h8a29, 8'he5};
            16'd2602: lut_data_o <= {16'h8a2a, 8'h3f};
            16'd2603: lut_data_o <= {16'h8a2b, 8'hf0};
            16'd2604: lut_data_o <= {16'h8a2c, 8'ha3};
            16'd2605: lut_data_o <= {16'h8a2d, 8'he5};
            16'd2606: lut_data_o <= {16'h8a2e, 8'h40};
            16'd2607: lut_data_o <= {16'h8a2f, 8'hf0};
            16'd2608: lut_data_o <= {16'h8a30, 8'ha3};
            16'd2609: lut_data_o <= {16'h8a31, 8'he5};
            16'd2610: lut_data_o <= {16'h8a32, 8'h3c};
            16'd2611: lut_data_o <= {16'h8a33, 8'hf0};
            16'd2612: lut_data_o <= {16'h8a34, 8'h90};
            16'd2613: lut_data_o <= {16'h8a35, 8'h30};
            16'd2614: lut_data_o <= {16'h8a36, 8'h23};
            16'd2615: lut_data_o <= {16'h8a37, 8'he4};
            16'd2616: lut_data_o <= {16'h8a38, 8'hf0};
            16'd2617: lut_data_o <= {16'h8a39, 8'h22};
            16'd2618: lut_data_o <= {16'h8a3a, 8'hc0};
            16'd2619: lut_data_o <= {16'h8a3b, 8'he0};
            16'd2620: lut_data_o <= {16'h8a3c, 8'hc0};
            16'd2621: lut_data_o <= {16'h8a3d, 8'h83};
            16'd2622: lut_data_o <= {16'h8a3e, 8'hc0};
            16'd2623: lut_data_o <= {16'h8a3f, 8'h82};
            16'd2624: lut_data_o <= {16'h8a40, 8'hc0};
            16'd2625: lut_data_o <= {16'h8a41, 8'hd0};
            16'd2626: lut_data_o <= {16'h8a42, 8'h90};
            16'd2627: lut_data_o <= {16'h8a43, 8'h3f};
            16'd2628: lut_data_o <= {16'h8a44, 8'h0c};
            16'd2629: lut_data_o <= {16'h8a45, 8'he0};
            16'd2630: lut_data_o <= {16'h8a46, 8'hf5};
            16'd2631: lut_data_o <= {16'h8a47, 8'h32};
            16'd2632: lut_data_o <= {16'h8a48, 8'he5};
            16'd2633: lut_data_o <= {16'h8a49, 8'h32};
            16'd2634: lut_data_o <= {16'h8a4a, 8'h30};
            16'd2635: lut_data_o <= {16'h8a4b, 8'he3};
            16'd2636: lut_data_o <= {16'h8a4c, 8'h74};
            16'd2637: lut_data_o <= {16'h8a4d, 8'h30};
            16'd2638: lut_data_o <= {16'h8a4e, 8'h36};
            16'd2639: lut_data_o <= {16'h8a4f, 8'h66};
            16'd2640: lut_data_o <= {16'h8a50, 8'h90};
            16'd2641: lut_data_o <= {16'h8a51, 8'h60};
            16'd2642: lut_data_o <= {16'h8a52, 8'h19};
            16'd2643: lut_data_o <= {16'h8a53, 8'he0};
            16'd2644: lut_data_o <= {16'h8a54, 8'hf5};
            16'd2645: lut_data_o <= {16'h8a55, 8'h0a};
            16'd2646: lut_data_o <= {16'h8a56, 8'ha3};
            16'd2647: lut_data_o <= {16'h8a57, 8'he0};
            16'd2648: lut_data_o <= {16'h8a58, 8'hf5};
            16'd2649: lut_data_o <= {16'h8a59, 8'h0b};
            16'd2650: lut_data_o <= {16'h8a5a, 8'h90};
            16'd2651: lut_data_o <= {16'h8a5b, 8'h60};
            16'd2652: lut_data_o <= {16'h8a5c, 8'h1d};
            16'd2653: lut_data_o <= {16'h8a5d, 8'he0};
            16'd2654: lut_data_o <= {16'h8a5e, 8'hf5};
            16'd2655: lut_data_o <= {16'h8a5f, 8'h14};
            16'd2656: lut_data_o <= {16'h8a60, 8'ha3};
            16'd2657: lut_data_o <= {16'h8a61, 8'he0};
            16'd2658: lut_data_o <= {16'h8a62, 8'hf5};
            16'd2659: lut_data_o <= {16'h8a63, 8'h15};
            16'd2660: lut_data_o <= {16'h8a64, 8'h90};
            16'd2661: lut_data_o <= {16'h8a65, 8'h60};
            16'd2662: lut_data_o <= {16'h8a66, 8'h21};
            16'd2663: lut_data_o <= {16'h8a67, 8'he0};
            16'd2664: lut_data_o <= {16'h8a68, 8'hf5};
            16'd2665: lut_data_o <= {16'h8a69, 8'h0c};
            16'd2666: lut_data_o <= {16'h8a6a, 8'ha3};
            16'd2667: lut_data_o <= {16'h8a6b, 8'he0};
            16'd2668: lut_data_o <= {16'h8a6c, 8'hf5};
            16'd2669: lut_data_o <= {16'h8a6d, 8'h0d};
            16'd2670: lut_data_o <= {16'h8a6e, 8'h90};
            16'd2671: lut_data_o <= {16'h8a6f, 8'h60};
            16'd2672: lut_data_o <= {16'h8a70, 8'h29};
            16'd2673: lut_data_o <= {16'h8a71, 8'he0};
            16'd2674: lut_data_o <= {16'h8a72, 8'hf5};
            16'd2675: lut_data_o <= {16'h8a73, 8'h0e};
            16'd2676: lut_data_o <= {16'h8a74, 8'ha3};
            16'd2677: lut_data_o <= {16'h8a75, 8'he0};
            16'd2678: lut_data_o <= {16'h8a76, 8'hf5};
            16'd2679: lut_data_o <= {16'h8a77, 8'h0f};
            16'd2680: lut_data_o <= {16'h8a78, 8'h90};
            16'd2681: lut_data_o <= {16'h8a79, 8'h60};
            16'd2682: lut_data_o <= {16'h8a7a, 8'h31};
            16'd2683: lut_data_o <= {16'h8a7b, 8'he0};
            16'd2684: lut_data_o <= {16'h8a7c, 8'hf5};
            16'd2685: lut_data_o <= {16'h8a7d, 8'h10};
            16'd2686: lut_data_o <= {16'h8a7e, 8'ha3};
            16'd2687: lut_data_o <= {16'h8a7f, 8'he0};
            16'd2688: lut_data_o <= {16'h8a80, 8'hf5};
            16'd2689: lut_data_o <= {16'h8a81, 8'h11};
            16'd2690: lut_data_o <= {16'h8a82, 8'h90};
            16'd2691: lut_data_o <= {16'h8a83, 8'h60};
            16'd2692: lut_data_o <= {16'h8a84, 8'h39};
            16'd2693: lut_data_o <= {16'h8a85, 8'he0};
            16'd2694: lut_data_o <= {16'h8a86, 8'hf5};
            16'd2695: lut_data_o <= {16'h8a87, 8'h12};
            16'd2696: lut_data_o <= {16'h8a88, 8'ha3};
            16'd2697: lut_data_o <= {16'h8a89, 8'he0};
            16'd2698: lut_data_o <= {16'h8a8a, 8'hf5};
            16'd2699: lut_data_o <= {16'h8a8b, 8'h13};
            16'd2700: lut_data_o <= {16'h8a8c, 8'h30};
            16'd2701: lut_data_o <= {16'h8a8d, 8'h01};
            16'd2702: lut_data_o <= {16'h8a8e, 8'h06};
            16'd2703: lut_data_o <= {16'h8a8f, 8'h30};
            16'd2704: lut_data_o <= {16'h8a90, 8'h33};
            16'd2705: lut_data_o <= {16'h8a91, 8'h03};
            16'd2706: lut_data_o <= {16'h8a92, 8'hd3};
            16'd2707: lut_data_o <= {16'h8a93, 8'h80};
            16'd2708: lut_data_o <= {16'h8a94, 8'h01};
            16'd2709: lut_data_o <= {16'h8a95, 8'hc3};
            16'd2710: lut_data_o <= {16'h8a96, 8'h92};
            16'd2711: lut_data_o <= {16'h8a97, 8'h09};
            16'd2712: lut_data_o <= {16'h8a98, 8'h30};
            16'd2713: lut_data_o <= {16'h8a99, 8'h02};
            16'd2714: lut_data_o <= {16'h8a9a, 8'h06};
            16'd2715: lut_data_o <= {16'h8a9b, 8'h30};
            16'd2716: lut_data_o <= {16'h8a9c, 8'h33};
            16'd2717: lut_data_o <= {16'h8a9d, 8'h03};
            16'd2718: lut_data_o <= {16'h8a9e, 8'hd3};
            16'd2719: lut_data_o <= {16'h8a9f, 8'h80};
            16'd2720: lut_data_o <= {16'h8aa0, 8'h01};
            16'd2721: lut_data_o <= {16'h8aa1, 8'hc3};
            16'd2722: lut_data_o <= {16'h8aa2, 8'h92};
            16'd2723: lut_data_o <= {16'h8aa3, 8'h0a};
            16'd2724: lut_data_o <= {16'h8aa4, 8'h30};
            16'd2725: lut_data_o <= {16'h8aa5, 8'h33};
            16'd2726: lut_data_o <= {16'h8aa6, 8'h0c};
            16'd2727: lut_data_o <= {16'h8aa7, 8'h30};
            16'd2728: lut_data_o <= {16'h8aa8, 8'h03};
            16'd2729: lut_data_o <= {16'h8aa9, 8'h09};
            16'd2730: lut_data_o <= {16'h8aaa, 8'h20};
            16'd2731: lut_data_o <= {16'h8aab, 8'h02};
            16'd2732: lut_data_o <= {16'h8aac, 8'h06};
            16'd2733: lut_data_o <= {16'h8aad, 8'h20};
            16'd2734: lut_data_o <= {16'h8aae, 8'h01};
            16'd2735: lut_data_o <= {16'h8aaf, 8'h03};
            16'd2736: lut_data_o <= {16'h8ab0, 8'hd3};
            16'd2737: lut_data_o <= {16'h8ab1, 8'h80};
            16'd2738: lut_data_o <= {16'h8ab2, 8'h01};
            16'd2739: lut_data_o <= {16'h8ab3, 8'hc3};
            16'd2740: lut_data_o <= {16'h8ab4, 8'h92};
            16'd2741: lut_data_o <= {16'h8ab5, 8'h0b};
            16'd2742: lut_data_o <= {16'h8ab6, 8'h90};
            16'd2743: lut_data_o <= {16'h8ab7, 8'h30};
            16'd2744: lut_data_o <= {16'h8ab8, 8'h01};
            16'd2745: lut_data_o <= {16'h8ab9, 8'he0};
            16'd2746: lut_data_o <= {16'h8aba, 8'h44};
            16'd2747: lut_data_o <= {16'h8abb, 8'h40};
            16'd2748: lut_data_o <= {16'h8abc, 8'hf0};
            16'd2749: lut_data_o <= {16'h8abd, 8'he0};
            16'd2750: lut_data_o <= {16'h8abe, 8'h54};
            16'd2751: lut_data_o <= {16'h8abf, 8'hbf};
            16'd2752: lut_data_o <= {16'h8ac0, 8'hf0};
            16'd2753: lut_data_o <= {16'h8ac1, 8'he5};
            16'd2754: lut_data_o <= {16'h8ac2, 8'h32};
            16'd2755: lut_data_o <= {16'h8ac3, 8'h30};
            16'd2756: lut_data_o <= {16'h8ac4, 8'he1};
            16'd2757: lut_data_o <= {16'h8ac5, 8'h14};
            16'd2758: lut_data_o <= {16'h8ac6, 8'h30};
            16'd2759: lut_data_o <= {16'h8ac7, 8'h34};
            16'd2760: lut_data_o <= {16'h8ac8, 8'h11};
            16'd2761: lut_data_o <= {16'h8ac9, 8'h90};
            16'd2762: lut_data_o <= {16'h8aca, 8'h30};
            16'd2763: lut_data_o <= {16'h8acb, 8'h22};
            16'd2764: lut_data_o <= {16'h8acc, 8'he0};
            16'd2765: lut_data_o <= {16'h8acd, 8'hf5};
            16'd2766: lut_data_o <= {16'h8ace, 8'h08};
            16'd2767: lut_data_o <= {16'h8acf, 8'he4};
            16'd2768: lut_data_o <= {16'h8ad0, 8'hf0};
            16'd2769: lut_data_o <= {16'h8ad1, 8'h30};
            16'd2770: lut_data_o <= {16'h8ad2, 8'h00};
            16'd2771: lut_data_o <= {16'h8ad3, 8'h03};
            16'd2772: lut_data_o <= {16'h8ad4, 8'hd3};
            16'd2773: lut_data_o <= {16'h8ad5, 8'h80};
            16'd2774: lut_data_o <= {16'h8ad6, 8'h01};
            16'd2775: lut_data_o <= {16'h8ad7, 8'hc3};
            16'd2776: lut_data_o <= {16'h8ad8, 8'h92};
            16'd2777: lut_data_o <= {16'h8ad9, 8'h08};
            16'd2778: lut_data_o <= {16'h8ada, 8'he5};
            16'd2779: lut_data_o <= {16'h8adb, 8'h32};
            16'd2780: lut_data_o <= {16'h8adc, 8'h30};
            16'd2781: lut_data_o <= {16'h8add, 8'he5};
            16'd2782: lut_data_o <= {16'h8ade, 8'h12};
            16'd2783: lut_data_o <= {16'h8adf, 8'h90};
            16'd2784: lut_data_o <= {16'h8ae0, 8'h56};
            16'd2785: lut_data_o <= {16'h8ae1, 8'ha1};
            16'd2786: lut_data_o <= {16'h8ae2, 8'he0};
            16'd2787: lut_data_o <= {16'h8ae3, 8'hf5};
            16'd2788: lut_data_o <= {16'h8ae4, 8'h09};
            16'd2789: lut_data_o <= {16'h8ae5, 8'h30};
            16'd2790: lut_data_o <= {16'h8ae6, 8'h31};
            16'd2791: lut_data_o <= {16'h8ae7, 8'h09};
            16'd2792: lut_data_o <= {16'h8ae8, 8'h30};
            16'd2793: lut_data_o <= {16'h8ae9, 8'h05};
            16'd2794: lut_data_o <= {16'h8aea, 8'h03};
            16'd2795: lut_data_o <= {16'h8aeb, 8'hd3};
            16'd2796: lut_data_o <= {16'h8aec, 8'h80};
            16'd2797: lut_data_o <= {16'h8aed, 8'h01};
            16'd2798: lut_data_o <= {16'h8aee, 8'hc3};
            16'd2799: lut_data_o <= {16'h8aef, 8'h92};
            16'd2800: lut_data_o <= {16'h8af0, 8'h0d};
            16'd2801: lut_data_o <= {16'h8af1, 8'h90};
            16'd2802: lut_data_o <= {16'h8af2, 8'h3f};
            16'd2803: lut_data_o <= {16'h8af3, 8'h0c};
            16'd2804: lut_data_o <= {16'h8af4, 8'he5};
            16'd2805: lut_data_o <= {16'h8af5, 8'h32};
            16'd2806: lut_data_o <= {16'h8af6, 8'hf0};
            16'd2807: lut_data_o <= {16'h8af7, 8'hd0};
            16'd2808: lut_data_o <= {16'h8af8, 8'hd0};
            16'd2809: lut_data_o <= {16'h8af9, 8'hd0};
            16'd2810: lut_data_o <= {16'h8afa, 8'h82};
            16'd2811: lut_data_o <= {16'h8afb, 8'hd0};
            16'd2812: lut_data_o <= {16'h8afc, 8'h83};
            16'd2813: lut_data_o <= {16'h8afd, 8'hd0};
            16'd2814: lut_data_o <= {16'h8afe, 8'he0};
            16'd2815: lut_data_o <= {16'h8aff, 8'h32};
            16'd2816: lut_data_o <= {16'h8b00, 8'h90};
            16'd2817: lut_data_o <= {16'h8b01, 8'h0e};
            16'd2818: lut_data_o <= {16'h8b02, 8'h7e};
            16'd2819: lut_data_o <= {16'h8b03, 8'he4};
            16'd2820: lut_data_o <= {16'h8b04, 8'h93};
            16'd2821: lut_data_o <= {16'h8b05, 8'hfe};
            16'd2822: lut_data_o <= {16'h8b06, 8'h74};
            16'd2823: lut_data_o <= {16'h8b07, 8'h01};
            16'd2824: lut_data_o <= {16'h8b08, 8'h93};
            16'd2825: lut_data_o <= {16'h8b09, 8'hff};
            16'd2826: lut_data_o <= {16'h8b0a, 8'hc3};
            16'd2827: lut_data_o <= {16'h8b0b, 8'h90};
            16'd2828: lut_data_o <= {16'h8b0c, 8'h0e};
            16'd2829: lut_data_o <= {16'h8b0d, 8'h7c};
            16'd2830: lut_data_o <= {16'h8b0e, 8'h74};
            16'd2831: lut_data_o <= {16'h8b0f, 8'h01};
            16'd2832: lut_data_o <= {16'h8b10, 8'h93};
            16'd2833: lut_data_o <= {16'h8b11, 8'h9f};
            16'd2834: lut_data_o <= {16'h8b12, 8'hff};
            16'd2835: lut_data_o <= {16'h8b13, 8'he4};
            16'd2836: lut_data_o <= {16'h8b14, 8'h93};
            16'd2837: lut_data_o <= {16'h8b15, 8'h9e};
            16'd2838: lut_data_o <= {16'h8b16, 8'hfe};
            16'd2839: lut_data_o <= {16'h8b17, 8'he4};
            16'd2840: lut_data_o <= {16'h8b18, 8'h8f};
            16'd2841: lut_data_o <= {16'h8b19, 8'h3b};
            16'd2842: lut_data_o <= {16'h8b1a, 8'h8e};
            16'd2843: lut_data_o <= {16'h8b1b, 8'h3a};
            16'd2844: lut_data_o <= {16'h8b1c, 8'hf5};
            16'd2845: lut_data_o <= {16'h8b1d, 8'h39};
            16'd2846: lut_data_o <= {16'h8b1e, 8'hf5};
            16'd2847: lut_data_o <= {16'h8b1f, 8'h38};
            16'd2848: lut_data_o <= {16'h8b20, 8'hab};
            16'd2849: lut_data_o <= {16'h8b21, 8'h3b};
            16'd2850: lut_data_o <= {16'h8b22, 8'haa};
            16'd2851: lut_data_o <= {16'h8b23, 8'h3a};
            16'd2852: lut_data_o <= {16'h8b24, 8'ha9};
            16'd2853: lut_data_o <= {16'h8b25, 8'h39};
            16'd2854: lut_data_o <= {16'h8b26, 8'ha8};
            16'd2855: lut_data_o <= {16'h8b27, 8'h38};
            16'd2856: lut_data_o <= {16'h8b28, 8'haf};
            16'd2857: lut_data_o <= {16'h8b29, 8'h4b};
            16'd2858: lut_data_o <= {16'h8b2a, 8'hfc};
            16'd2859: lut_data_o <= {16'h8b2b, 8'hfd};
            16'd2860: lut_data_o <= {16'h8b2c, 8'hfe};
            16'd2861: lut_data_o <= {16'h8b2d, 8'h12};
            16'd2862: lut_data_o <= {16'h8b2e, 8'h05};
            16'd2863: lut_data_o <= {16'h8b2f, 8'h28};
            16'd2864: lut_data_o <= {16'h8b30, 8'h12};
            16'd2865: lut_data_o <= {16'h8b31, 8'h0d};
            16'd2866: lut_data_o <= {16'h8b32, 8'he1};
            16'd2867: lut_data_o <= {16'h8b33, 8'he4};
            16'd2868: lut_data_o <= {16'h8b34, 8'h7b};
            16'd2869: lut_data_o <= {16'h8b35, 8'hff};
            16'd2870: lut_data_o <= {16'h8b36, 8'hfa};
            16'd2871: lut_data_o <= {16'h8b37, 8'hf9};
            16'd2872: lut_data_o <= {16'h8b38, 8'hf8};
            16'd2873: lut_data_o <= {16'h8b39, 8'h12};
            16'd2874: lut_data_o <= {16'h8b3a, 8'h05};
            16'd2875: lut_data_o <= {16'h8b3b, 8'hb3};
            16'd2876: lut_data_o <= {16'h8b3c, 8'h12};
            16'd2877: lut_data_o <= {16'h8b3d, 8'h0d};
            16'd2878: lut_data_o <= {16'h8b3e, 8'he1};
            16'd2879: lut_data_o <= {16'h8b3f, 8'h90};
            16'd2880: lut_data_o <= {16'h8b40, 8'h0e};
            16'd2881: lut_data_o <= {16'h8b41, 8'h69};
            16'd2882: lut_data_o <= {16'h8b42, 8'he4};
            16'd2883: lut_data_o <= {16'h8b43, 8'h12};
            16'd2884: lut_data_o <= {16'h8b44, 8'h0d};
            16'd2885: lut_data_o <= {16'h8b45, 8'hf6};
            16'd2886: lut_data_o <= {16'h8b46, 8'h12};
            16'd2887: lut_data_o <= {16'h8b47, 8'h0d};
            16'd2888: lut_data_o <= {16'h8b48, 8'he1};
            16'd2889: lut_data_o <= {16'h8b49, 8'he4};
            16'd2890: lut_data_o <= {16'h8b4a, 8'h85};
            16'd2891: lut_data_o <= {16'h8b4b, 8'h4a};
            16'd2892: lut_data_o <= {16'h8b4c, 8'h37};
            16'd2893: lut_data_o <= {16'h8b4d, 8'hf5};
            16'd2894: lut_data_o <= {16'h8b4e, 8'h36};
            16'd2895: lut_data_o <= {16'h8b4f, 8'hf5};
            16'd2896: lut_data_o <= {16'h8b50, 8'h35};
            16'd2897: lut_data_o <= {16'h8b51, 8'hf5};
            16'd2898: lut_data_o <= {16'h8b52, 8'h34};
            16'd2899: lut_data_o <= {16'h8b53, 8'haf};
            16'd2900: lut_data_o <= {16'h8b54, 8'h37};
            16'd2901: lut_data_o <= {16'h8b55, 8'hae};
            16'd2902: lut_data_o <= {16'h8b56, 8'h36};
            16'd2903: lut_data_o <= {16'h8b57, 8'had};
            16'd2904: lut_data_o <= {16'h8b58, 8'h35};
            16'd2905: lut_data_o <= {16'h8b59, 8'hac};
            16'd2906: lut_data_o <= {16'h8b5a, 8'h34};
            16'd2907: lut_data_o <= {16'h8b5b, 8'ha3};
            16'd2908: lut_data_o <= {16'h8b5c, 8'h12};
            16'd2909: lut_data_o <= {16'h8b5d, 8'h0d};
            16'd2910: lut_data_o <= {16'h8b5e, 8'hf6};
            16'd2911: lut_data_o <= {16'h8b5f, 8'h8f};
            16'd2912: lut_data_o <= {16'h8b60, 8'h37};
            16'd2913: lut_data_o <= {16'h8b61, 8'h8e};
            16'd2914: lut_data_o <= {16'h8b62, 8'h36};
            16'd2915: lut_data_o <= {16'h8b63, 8'h8d};
            16'd2916: lut_data_o <= {16'h8b64, 8'h35};
            16'd2917: lut_data_o <= {16'h8b65, 8'h8c};
            16'd2918: lut_data_o <= {16'h8b66, 8'h34};
            16'd2919: lut_data_o <= {16'h8b67, 8'he5};
            16'd2920: lut_data_o <= {16'h8b68, 8'h3b};
            16'd2921: lut_data_o <= {16'h8b69, 8'h45};
            16'd2922: lut_data_o <= {16'h8b6a, 8'h37};
            16'd2923: lut_data_o <= {16'h8b6b, 8'hf5};
            16'd2924: lut_data_o <= {16'h8b6c, 8'h3b};
            16'd2925: lut_data_o <= {16'h8b6d, 8'he5};
            16'd2926: lut_data_o <= {16'h8b6e, 8'h3a};
            16'd2927: lut_data_o <= {16'h8b6f, 8'h45};
            16'd2928: lut_data_o <= {16'h8b70, 8'h36};
            16'd2929: lut_data_o <= {16'h8b71, 8'hf5};
            16'd2930: lut_data_o <= {16'h8b72, 8'h3a};
            16'd2931: lut_data_o <= {16'h8b73, 8'he5};
            16'd2932: lut_data_o <= {16'h8b74, 8'h39};
            16'd2933: lut_data_o <= {16'h8b75, 8'h45};
            16'd2934: lut_data_o <= {16'h8b76, 8'h35};
            16'd2935: lut_data_o <= {16'h8b77, 8'hf5};
            16'd2936: lut_data_o <= {16'h8b78, 8'h39};
            16'd2937: lut_data_o <= {16'h8b79, 8'he5};
            16'd2938: lut_data_o <= {16'h8b7a, 8'h38};
            16'd2939: lut_data_o <= {16'h8b7b, 8'h45};
            16'd2940: lut_data_o <= {16'h8b7c, 8'h34};
            16'd2941: lut_data_o <= {16'h8b7d, 8'hf5};
            16'd2942: lut_data_o <= {16'h8b7e, 8'h38};
            16'd2943: lut_data_o <= {16'h8b7f, 8'he4};
            16'd2944: lut_data_o <= {16'h8b80, 8'hf5};
            16'd2945: lut_data_o <= {16'h8b81, 8'h22};
            16'd2946: lut_data_o <= {16'h8b82, 8'hf5};
            16'd2947: lut_data_o <= {16'h8b83, 8'h23};
            16'd2948: lut_data_o <= {16'h8b84, 8'h85};
            16'd2949: lut_data_o <= {16'h8b85, 8'h3b};
            16'd2950: lut_data_o <= {16'h8b86, 8'h31};
            16'd2951: lut_data_o <= {16'h8b87, 8'h85};
            16'd2952: lut_data_o <= {16'h8b88, 8'h3a};
            16'd2953: lut_data_o <= {16'h8b89, 8'h30};
            16'd2954: lut_data_o <= {16'h8b8a, 8'h85};
            16'd2955: lut_data_o <= {16'h8b8b, 8'h39};
            16'd2956: lut_data_o <= {16'h8b8c, 8'h2f};
            16'd2957: lut_data_o <= {16'h8b8d, 8'h85};
            16'd2958: lut_data_o <= {16'h8b8e, 8'h38};
            16'd2959: lut_data_o <= {16'h8b8f, 8'h2e};
            16'd2960: lut_data_o <= {16'h8b90, 8'h02};
            16'd2961: lut_data_o <= {16'h8b91, 8'h0f};
            16'd2962: lut_data_o <= {16'h8b92, 8'h46};
            16'd2963: lut_data_o <= {16'h8b93, 8'he0};
            16'd2964: lut_data_o <= {16'h8b94, 8'ha3};
            16'd2965: lut_data_o <= {16'h8b95, 8'he0};
            16'd2966: lut_data_o <= {16'h8b96, 8'h75};
            16'd2967: lut_data_o <= {16'h8b97, 8'hf0};
            16'd2968: lut_data_o <= {16'h8b98, 8'h02};
            16'd2969: lut_data_o <= {16'h8b99, 8'ha4};
            16'd2970: lut_data_o <= {16'h8b9a, 8'hff};
            16'd2971: lut_data_o <= {16'h8b9b, 8'hae};
            16'd2972: lut_data_o <= {16'h8b9c, 8'hf0};
            16'd2973: lut_data_o <= {16'h8b9d, 8'hc3};
            16'd2974: lut_data_o <= {16'h8b9e, 8'h08};
            16'd2975: lut_data_o <= {16'h8b9f, 8'he6};
            16'd2976: lut_data_o <= {16'h8ba0, 8'h9f};
            16'd2977: lut_data_o <= {16'h8ba1, 8'hf6};
            16'd2978: lut_data_o <= {16'h8ba2, 8'h18};
            16'd2979: lut_data_o <= {16'h8ba3, 8'he6};
            16'd2980: lut_data_o <= {16'h8ba4, 8'h9e};
            16'd2981: lut_data_o <= {16'h8ba5, 8'hf6};
            16'd2982: lut_data_o <= {16'h8ba6, 8'h22};
            16'd2983: lut_data_o <= {16'h8ba7, 8'hff};
            16'd2984: lut_data_o <= {16'h8ba8, 8'he5};
            16'd2985: lut_data_o <= {16'h8ba9, 8'hf0};
            16'd2986: lut_data_o <= {16'h8baa, 8'h34};
            16'd2987: lut_data_o <= {16'h8bab, 8'h60};
            16'd2988: lut_data_o <= {16'h8bac, 8'h8f};
            16'd2989: lut_data_o <= {16'h8bad, 8'h82};
            16'd2990: lut_data_o <= {16'h8bae, 8'hf5};
            16'd2991: lut_data_o <= {16'h8baf, 8'h83};
            16'd2992: lut_data_o <= {16'h8bb0, 8'hec};
            16'd2993: lut_data_o <= {16'h8bb1, 8'hf0};
            16'd2994: lut_data_o <= {16'h8bb2, 8'h22};
            16'd2995: lut_data_o <= {16'h8bb3, 8'h78};
            16'd2996: lut_data_o <= {16'h8bb4, 8'h52};
            16'd2997: lut_data_o <= {16'h8bb5, 8'h7e};
            16'd2998: lut_data_o <= {16'h8bb6, 8'h00};
            16'd2999: lut_data_o <= {16'h8bb7, 8'he6};
            16'd3000: lut_data_o <= {16'h8bb8, 8'hfc};
            16'd3001: lut_data_o <= {16'h8bb9, 8'h08};
            16'd3002: lut_data_o <= {16'h8bba, 8'he6};
            16'd3003: lut_data_o <= {16'h8bbb, 8'hfd};
            16'd3004: lut_data_o <= {16'h8bbc, 8'h02};
            16'd3005: lut_data_o <= {16'h8bbd, 8'h04};
            16'd3006: lut_data_o <= {16'h8bbe, 8'hc1};
            16'd3007: lut_data_o <= {16'h8bbf, 8'he4};
            16'd3008: lut_data_o <= {16'h8bc0, 8'hfc};
            16'd3009: lut_data_o <= {16'h8bc1, 8'hfd};
            16'd3010: lut_data_o <= {16'h8bc2, 8'h12};
            16'd3011: lut_data_o <= {16'h8bc3, 8'h06};
            16'd3012: lut_data_o <= {16'h8bc4, 8'h99};
            16'd3013: lut_data_o <= {16'h8bc5, 8'h78};
            16'd3014: lut_data_o <= {16'h8bc6, 8'h5c};
            16'd3015: lut_data_o <= {16'h8bc7, 8'he6};
            16'd3016: lut_data_o <= {16'h8bc8, 8'hc3};
            16'd3017: lut_data_o <= {16'h8bc9, 8'h13};
            16'd3018: lut_data_o <= {16'h8bca, 8'hfe};
            16'd3019: lut_data_o <= {16'h8bcb, 8'h08};
            16'd3020: lut_data_o <= {16'h8bcc, 8'he6};
            16'd3021: lut_data_o <= {16'h8bcd, 8'h13};
            16'd3022: lut_data_o <= {16'h8bce, 8'h22};
            16'd3023: lut_data_o <= {16'h8bcf, 8'h78};
            16'd3024: lut_data_o <= {16'h8bd0, 8'h52};
            16'd3025: lut_data_o <= {16'h8bd1, 8'he6};
            16'd3026: lut_data_o <= {16'h8bd2, 8'hfe};
            16'd3027: lut_data_o <= {16'h8bd3, 8'h08};
            16'd3028: lut_data_o <= {16'h8bd4, 8'he6};
            16'd3029: lut_data_o <= {16'h8bd5, 8'hff};
            16'd3030: lut_data_o <= {16'h8bd6, 8'he4};
            16'd3031: lut_data_o <= {16'h8bd7, 8'hfc};
            16'd3032: lut_data_o <= {16'h8bd8, 8'hfd};
            16'd3033: lut_data_o <= {16'h8bd9, 8'h22};
            16'd3034: lut_data_o <= {16'h8bda, 8'he7};
            16'd3035: lut_data_o <= {16'h8bdb, 8'hc4};
            16'd3036: lut_data_o <= {16'h8bdc, 8'hf8};
            16'd3037: lut_data_o <= {16'h8bdd, 8'h54};
            16'd3038: lut_data_o <= {16'h8bde, 8'hf0};
            16'd3039: lut_data_o <= {16'h8bdf, 8'hc8};
            16'd3040: lut_data_o <= {16'h8be0, 8'h68};
            16'd3041: lut_data_o <= {16'h8be1, 8'hf7};
            16'd3042: lut_data_o <= {16'h8be2, 8'h09};
            16'd3043: lut_data_o <= {16'h8be3, 8'he7};
            16'd3044: lut_data_o <= {16'h8be4, 8'hc4};
            16'd3045: lut_data_o <= {16'h8be5, 8'h54};
            16'd3046: lut_data_o <= {16'h8be6, 8'h0f};
            16'd3047: lut_data_o <= {16'h8be7, 8'h48};
            16'd3048: lut_data_o <= {16'h8be8, 8'hf7};
            16'd3049: lut_data_o <= {16'h8be9, 8'h22};
            16'd3050: lut_data_o <= {16'h8bea, 8'he6};
            16'd3051: lut_data_o <= {16'h8beb, 8'hfc};
            16'd3052: lut_data_o <= {16'h8bec, 8'hed};
            16'd3053: lut_data_o <= {16'h8bed, 8'h75};
            16'd3054: lut_data_o <= {16'h8bee, 8'hf0};
            16'd3055: lut_data_o <= {16'h8bef, 8'h04};
            16'd3056: lut_data_o <= {16'h8bf0, 8'ha4};
            16'd3057: lut_data_o <= {16'h8bf1, 8'h22};
            16'd3058: lut_data_o <= {16'h8bf2, 8'h12};
            16'd3059: lut_data_o <= {16'h8bf3, 8'h06};
            16'd3060: lut_data_o <= {16'h8bf4, 8'h7c};
            16'd3061: lut_data_o <= {16'h8bf5, 8'h8f};
            16'd3062: lut_data_o <= {16'h8bf6, 8'h48};
            16'd3063: lut_data_o <= {16'h8bf7, 8'h8e};
            16'd3064: lut_data_o <= {16'h8bf8, 8'h47};
            16'd3065: lut_data_o <= {16'h8bf9, 8'h8d};
            16'd3066: lut_data_o <= {16'h8bfa, 8'h46};
            16'd3067: lut_data_o <= {16'h8bfb, 8'h8c};
            16'd3068: lut_data_o <= {16'h8bfc, 8'h45};
            16'd3069: lut_data_o <= {16'h8bfd, 8'h22};
            16'd3070: lut_data_o <= {16'h8bfe, 8'he0};
            16'd3071: lut_data_o <= {16'h8bff, 8'hfe};
            16'd3072: lut_data_o <= {16'h8c00, 8'ha3};
            16'd3073: lut_data_o <= {16'h8c01, 8'he0};
            16'd3074: lut_data_o <= {16'h8c02, 8'hfd};
            16'd3075: lut_data_o <= {16'h8c03, 8'hee};
            16'd3076: lut_data_o <= {16'h8c04, 8'hf6};
            16'd3077: lut_data_o <= {16'h8c05, 8'hed};
            16'd3078: lut_data_o <= {16'h8c06, 8'h08};
            16'd3079: lut_data_o <= {16'h8c07, 8'hf6};
            16'd3080: lut_data_o <= {16'h8c08, 8'h22};
            16'd3081: lut_data_o <= {16'h8c09, 8'h13};
            16'd3082: lut_data_o <= {16'h8c0a, 8'hff};
            16'd3083: lut_data_o <= {16'h8c0b, 8'hc3};
            16'd3084: lut_data_o <= {16'h8c0c, 8'he6};
            16'd3085: lut_data_o <= {16'h8c0d, 8'h9f};
            16'd3086: lut_data_o <= {16'h8c0e, 8'hff};
            16'd3087: lut_data_o <= {16'h8c0f, 8'h18};
            16'd3088: lut_data_o <= {16'h8c10, 8'he6};
            16'd3089: lut_data_o <= {16'h8c11, 8'h9e};
            16'd3090: lut_data_o <= {16'h8c12, 8'hfe};
            16'd3091: lut_data_o <= {16'h8c13, 8'h22};
            16'd3092: lut_data_o <= {16'h8c14, 8'he6};
            16'd3093: lut_data_o <= {16'h8c15, 8'hc3};
            16'd3094: lut_data_o <= {16'h8c16, 8'h13};
            16'd3095: lut_data_o <= {16'h8c17, 8'hf7};
            16'd3096: lut_data_o <= {16'h8c18, 8'h08};
            16'd3097: lut_data_o <= {16'h8c19, 8'he6};
            16'd3098: lut_data_o <= {16'h8c1a, 8'h13};
            16'd3099: lut_data_o <= {16'h8c1b, 8'h09};
            16'd3100: lut_data_o <= {16'h8c1c, 8'hf7};
            16'd3101: lut_data_o <= {16'h8c1d, 8'h22};
            16'd3102: lut_data_o <= {16'h8c1e, 8'had};
            16'd3103: lut_data_o <= {16'h8c1f, 8'h39};
            16'd3104: lut_data_o <= {16'h8c20, 8'hac};
            16'd3105: lut_data_o <= {16'h8c21, 8'h38};
            16'd3106: lut_data_o <= {16'h8c22, 8'hfa};
            16'd3107: lut_data_o <= {16'h8c23, 8'hf9};
            16'd3108: lut_data_o <= {16'h8c24, 8'hf8};
            16'd3109: lut_data_o <= {16'h8c25, 8'h12};
            16'd3110: lut_data_o <= {16'h8c26, 8'h05};
            16'd3111: lut_data_o <= {16'h8c27, 8'h28};
            16'd3112: lut_data_o <= {16'h8c28, 8'h8f};
            16'd3113: lut_data_o <= {16'h8c29, 8'h3b};
            16'd3114: lut_data_o <= {16'h8c2a, 8'h8e};
            16'd3115: lut_data_o <= {16'h8c2b, 8'h3a};
            16'd3116: lut_data_o <= {16'h8c2c, 8'h8d};
            16'd3117: lut_data_o <= {16'h8c2d, 8'h39};
            16'd3118: lut_data_o <= {16'h8c2e, 8'h8c};
            16'd3119: lut_data_o <= {16'h8c2f, 8'h38};
            16'd3120: lut_data_o <= {16'h8c30, 8'hab};
            16'd3121: lut_data_o <= {16'h8c31, 8'h37};
            16'd3122: lut_data_o <= {16'h8c32, 8'haa};
            16'd3123: lut_data_o <= {16'h8c33, 8'h36};
            16'd3124: lut_data_o <= {16'h8c34, 8'ha9};
            16'd3125: lut_data_o <= {16'h8c35, 8'h35};
            16'd3126: lut_data_o <= {16'h8c36, 8'ha8};
            16'd3127: lut_data_o <= {16'h8c37, 8'h34};
            16'd3128: lut_data_o <= {16'h8c38, 8'h22};
            16'd3129: lut_data_o <= {16'h8c39, 8'h93};
            16'd3130: lut_data_o <= {16'h8c3a, 8'hff};
            16'd3131: lut_data_o <= {16'h8c3b, 8'he4};
            16'd3132: lut_data_o <= {16'h8c3c, 8'hfc};
            16'd3133: lut_data_o <= {16'h8c3d, 8'hfd};
            16'd3134: lut_data_o <= {16'h8c3e, 8'hfe};
            16'd3135: lut_data_o <= {16'h8c3f, 8'h12};
            16'd3136: lut_data_o <= {16'h8c40, 8'h05};
            16'd3137: lut_data_o <= {16'h8c41, 8'h28};
            16'd3138: lut_data_o <= {16'h8c42, 8'h8f};
            16'd3139: lut_data_o <= {16'h8c43, 8'h37};
            16'd3140: lut_data_o <= {16'h8c44, 8'h8e};
            16'd3141: lut_data_o <= {16'h8c45, 8'h36};
            16'd3142: lut_data_o <= {16'h8c46, 8'h8d};
            16'd3143: lut_data_o <= {16'h8c47, 8'h35};
            16'd3144: lut_data_o <= {16'h8c48, 8'h8c};
            16'd3145: lut_data_o <= {16'h8c49, 8'h34};
            16'd3146: lut_data_o <= {16'h8c4a, 8'h22};
            16'd3147: lut_data_o <= {16'h8c4b, 8'h78};
            16'd3148: lut_data_o <= {16'h8c4c, 8'h84};
            16'd3149: lut_data_o <= {16'h8c4d, 8'he6};
            16'd3150: lut_data_o <= {16'h8c4e, 8'hfe};
            16'd3151: lut_data_o <= {16'h8c4f, 8'h08};
            16'd3152: lut_data_o <= {16'h8c50, 8'he6};
            16'd3153: lut_data_o <= {16'h8c51, 8'hff};
            16'd3154: lut_data_o <= {16'h8c52, 8'he4};
            16'd3155: lut_data_o <= {16'h8c53, 8'h8f};
            16'd3156: lut_data_o <= {16'h8c54, 8'h37};
            16'd3157: lut_data_o <= {16'h8c55, 8'h8e};
            16'd3158: lut_data_o <= {16'h8c56, 8'h36};
            16'd3159: lut_data_o <= {16'h8c57, 8'hf5};
            16'd3160: lut_data_o <= {16'h8c58, 8'h35};
            16'd3161: lut_data_o <= {16'h8c59, 8'hf5};
            16'd3162: lut_data_o <= {16'h8c5a, 8'h34};
            16'd3163: lut_data_o <= {16'h8c5b, 8'h22};
            16'd3164: lut_data_o <= {16'h8c5c, 8'h90};
            16'd3165: lut_data_o <= {16'h8c5d, 8'h0e};
            16'd3166: lut_data_o <= {16'h8c5e, 8'h8c};
            16'd3167: lut_data_o <= {16'h8c5f, 8'he4};
            16'd3168: lut_data_o <= {16'h8c60, 8'h93};
            16'd3169: lut_data_o <= {16'h8c61, 8'h25};
            16'd3170: lut_data_o <= {16'h8c62, 8'he0};
            16'd3171: lut_data_o <= {16'h8c63, 8'h24};
            16'd3172: lut_data_o <= {16'h8c64, 8'h0a};
            16'd3173: lut_data_o <= {16'h8c65, 8'hf8};
            16'd3174: lut_data_o <= {16'h8c66, 8'he6};
            16'd3175: lut_data_o <= {16'h8c67, 8'hfe};
            16'd3176: lut_data_o <= {16'h8c68, 8'h08};
            16'd3177: lut_data_o <= {16'h8c69, 8'he6};
            16'd3178: lut_data_o <= {16'h8c6a, 8'hff};
            16'd3179: lut_data_o <= {16'h8c6b, 8'h22};
            16'd3180: lut_data_o <= {16'h8c6c, 8'he6};
            16'd3181: lut_data_o <= {16'h8c6d, 8'hfe};
            16'd3182: lut_data_o <= {16'h8c6e, 8'h08};
            16'd3183: lut_data_o <= {16'h8c6f, 8'he6};
            16'd3184: lut_data_o <= {16'h8c70, 8'hff};
            16'd3185: lut_data_o <= {16'h8c71, 8'he4};
            16'd3186: lut_data_o <= {16'h8c72, 8'h8f};
            16'd3187: lut_data_o <= {16'h8c73, 8'h3b};
            16'd3188: lut_data_o <= {16'h8c74, 8'h8e};
            16'd3189: lut_data_o <= {16'h8c75, 8'h3a};
            16'd3190: lut_data_o <= {16'h8c76, 8'hf5};
            16'd3191: lut_data_o <= {16'h8c77, 8'h39};
            16'd3192: lut_data_o <= {16'h8c78, 8'hf5};
            16'd3193: lut_data_o <= {16'h8c79, 8'h38};
            16'd3194: lut_data_o <= {16'h8c7a, 8'h22};
            16'd3195: lut_data_o <= {16'h8c7b, 8'h78};
            16'd3196: lut_data_o <= {16'h8c7c, 8'h4e};
            16'd3197: lut_data_o <= {16'h8c7d, 8'he6};
            16'd3198: lut_data_o <= {16'h8c7e, 8'hfe};
            16'd3199: lut_data_o <= {16'h8c7f, 8'h08};
            16'd3200: lut_data_o <= {16'h8c80, 8'he6};
            16'd3201: lut_data_o <= {16'h8c81, 8'hff};
            16'd3202: lut_data_o <= {16'h8c82, 8'h22};
            16'd3203: lut_data_o <= {16'h8c83, 8'hef};
            16'd3204: lut_data_o <= {16'h8c84, 8'h25};
            16'd3205: lut_data_o <= {16'h8c85, 8'he0};
            16'd3206: lut_data_o <= {16'h8c86, 8'h24};
            16'd3207: lut_data_o <= {16'h8c87, 8'h4e};
            16'd3208: lut_data_o <= {16'h8c88, 8'hf8};
            16'd3209: lut_data_o <= {16'h8c89, 8'he6};
            16'd3210: lut_data_o <= {16'h8c8a, 8'hfc};
            16'd3211: lut_data_o <= {16'h8c8b, 8'h08};
            16'd3212: lut_data_o <= {16'h8c8c, 8'he6};
            16'd3213: lut_data_o <= {16'h8c8d, 8'hfd};
            16'd3214: lut_data_o <= {16'h8c8e, 8'h22};
            16'd3215: lut_data_o <= {16'h8c8f, 8'h78};
            16'd3216: lut_data_o <= {16'h8c90, 8'h89};
            16'd3217: lut_data_o <= {16'h8c91, 8'hef};
            16'd3218: lut_data_o <= {16'h8c92, 8'h26};
            16'd3219: lut_data_o <= {16'h8c93, 8'hf6};
            16'd3220: lut_data_o <= {16'h8c94, 8'h18};
            16'd3221: lut_data_o <= {16'h8c95, 8'he4};
            16'd3222: lut_data_o <= {16'h8c96, 8'h36};
            16'd3223: lut_data_o <= {16'h8c97, 8'hf6};
            16'd3224: lut_data_o <= {16'h8c98, 8'h22};
            16'd3225: lut_data_o <= {16'h8c99, 8'h75};
            16'd3226: lut_data_o <= {16'h8c9a, 8'h89};
            16'd3227: lut_data_o <= {16'h8c9b, 8'h03};
            16'd3228: lut_data_o <= {16'h8c9c, 8'h75};
            16'd3229: lut_data_o <= {16'h8c9d, 8'ha8};
            16'd3230: lut_data_o <= {16'h8c9e, 8'h01};
            16'd3231: lut_data_o <= {16'h8c9f, 8'h75};
            16'd3232: lut_data_o <= {16'h8ca0, 8'hb8};
            16'd3233: lut_data_o <= {16'h8ca1, 8'h04};
            16'd3234: lut_data_o <= {16'h8ca2, 8'h75};
            16'd3235: lut_data_o <= {16'h8ca3, 8'h34};
            16'd3236: lut_data_o <= {16'h8ca4, 8'hff};
            16'd3237: lut_data_o <= {16'h8ca5, 8'h75};
            16'd3238: lut_data_o <= {16'h8ca6, 8'h35};
            16'd3239: lut_data_o <= {16'h8ca7, 8'h0e};
            16'd3240: lut_data_o <= {16'h8ca8, 8'h75};
            16'd3241: lut_data_o <= {16'h8ca9, 8'h36};
            16'd3242: lut_data_o <= {16'h8caa, 8'h15};
            16'd3243: lut_data_o <= {16'h8cab, 8'h75};
            16'd3244: lut_data_o <= {16'h8cac, 8'h37};
            16'd3245: lut_data_o <= {16'h8cad, 8'h0d};
            16'd3246: lut_data_o <= {16'h8cae, 8'h12};
            16'd3247: lut_data_o <= {16'h8caf, 8'h0e};
            16'd3248: lut_data_o <= {16'h8cb0, 8'h9a};
            16'd3249: lut_data_o <= {16'h8cb1, 8'h12};
            16'd3250: lut_data_o <= {16'h8cb2, 8'h00};
            16'd3251: lut_data_o <= {16'h8cb3, 8'h09};
            16'd3252: lut_data_o <= {16'h8cb4, 8'h12};
            16'd3253: lut_data_o <= {16'h8cb5, 8'h0f};
            16'd3254: lut_data_o <= {16'h8cb6, 8'h16};
            16'd3255: lut_data_o <= {16'h8cb7, 8'h12};
            16'd3256: lut_data_o <= {16'h8cb8, 8'h00};
            16'd3257: lut_data_o <= {16'h8cb9, 8'h06};
            16'd3258: lut_data_o <= {16'h8cba, 8'hd2};
            16'd3259: lut_data_o <= {16'h8cbb, 8'h00};
            16'd3260: lut_data_o <= {16'h8cbc, 8'hd2};
            16'd3261: lut_data_o <= {16'h8cbd, 8'h34};
            16'd3262: lut_data_o <= {16'h8cbe, 8'hd2};
            16'd3263: lut_data_o <= {16'h8cbf, 8'haf};
            16'd3264: lut_data_o <= {16'h8cc0, 8'h75};
            16'd3265: lut_data_o <= {16'h8cc1, 8'h34};
            16'd3266: lut_data_o <= {16'h8cc2, 8'hff};
            16'd3267: lut_data_o <= {16'h8cc3, 8'h75};
            16'd3268: lut_data_o <= {16'h8cc4, 8'h35};
            16'd3269: lut_data_o <= {16'h8cc5, 8'h0e};
            16'd3270: lut_data_o <= {16'h8cc6, 8'h75};
            16'd3271: lut_data_o <= {16'h8cc7, 8'h36};
            16'd3272: lut_data_o <= {16'h8cc8, 8'h49};
            16'd3273: lut_data_o <= {16'h8cc9, 8'h75};
            16'd3274: lut_data_o <= {16'h8cca, 8'h37};
            16'd3275: lut_data_o <= {16'h8ccb, 8'h03};
            16'd3276: lut_data_o <= {16'h8ccc, 8'h12};
            16'd3277: lut_data_o <= {16'h8ccd, 8'h0e};
            16'd3278: lut_data_o <= {16'h8cce, 8'h9a};
            16'd3279: lut_data_o <= {16'h8ccf, 8'h30};
            16'd3280: lut_data_o <= {16'h8cd0, 8'h08};
            16'd3281: lut_data_o <= {16'h8cd1, 8'h09};
            16'd3282: lut_data_o <= {16'h8cd2, 8'hc2};
            16'd3283: lut_data_o <= {16'h8cd3, 8'h34};
            16'd3284: lut_data_o <= {16'h8cd4, 8'h12};
            16'd3285: lut_data_o <= {16'h8cd5, 8'h08};
            16'd3286: lut_data_o <= {16'h8cd6, 8'hcb};
            16'd3287: lut_data_o <= {16'h8cd7, 8'hc2};
            16'd3288: lut_data_o <= {16'h8cd8, 8'h08};
            16'd3289: lut_data_o <= {16'h8cd9, 8'hd2};
            16'd3290: lut_data_o <= {16'h8cda, 8'h34};
            16'd3291: lut_data_o <= {16'h8cdb, 8'h30};
            16'd3292: lut_data_o <= {16'h8cdc, 8'h0b};
            16'd3293: lut_data_o <= {16'h8cdd, 8'h09};
            16'd3294: lut_data_o <= {16'h8cde, 8'hc2};
            16'd3295: lut_data_o <= {16'h8cdf, 8'h36};
            16'd3296: lut_data_o <= {16'h8ce0, 8'h12};
            16'd3297: lut_data_o <= {16'h8ce1, 8'h02};
            16'd3298: lut_data_o <= {16'h8ce2, 8'h6c};
            16'd3299: lut_data_o <= {16'h8ce3, 8'hc2};
            16'd3300: lut_data_o <= {16'h8ce4, 8'h0b};
            16'd3301: lut_data_o <= {16'h8ce5, 8'hd2};
            16'd3302: lut_data_o <= {16'h8ce6, 8'h36};
            16'd3303: lut_data_o <= {16'h8ce7, 8'h30};
            16'd3304: lut_data_o <= {16'h8ce8, 8'h09};
            16'd3305: lut_data_o <= {16'h8ce9, 8'h09};
            16'd3306: lut_data_o <= {16'h8cea, 8'hc2};
            16'd3307: lut_data_o <= {16'h8ceb, 8'h36};
            16'd3308: lut_data_o <= {16'h8cec, 8'h12};
            16'd3309: lut_data_o <= {16'h8ced, 8'h00};
            16'd3310: lut_data_o <= {16'h8cee, 8'h0e};
            16'd3311: lut_data_o <= {16'h8cef, 8'hc2};
            16'd3312: lut_data_o <= {16'h8cf0, 8'h09};
            16'd3313: lut_data_o <= {16'h8cf1, 8'hd2};
            16'd3314: lut_data_o <= {16'h8cf2, 8'h36};
            16'd3315: lut_data_o <= {16'h8cf3, 8'h30};
            16'd3316: lut_data_o <= {16'h8cf4, 8'h0e};
            16'd3317: lut_data_o <= {16'h8cf5, 8'h03};
            16'd3318: lut_data_o <= {16'h8cf6, 8'h12};
            16'd3319: lut_data_o <= {16'h8cf7, 8'h06};
            16'd3320: lut_data_o <= {16'h8cf8, 8'hd7};
            16'd3321: lut_data_o <= {16'h8cf9, 8'h30};
            16'd3322: lut_data_o <= {16'h8cfa, 8'h35};
            16'd3323: lut_data_o <= {16'h8cfb, 8'hd3};
            16'd3324: lut_data_o <= {16'h8cfc, 8'h90};
            16'd3325: lut_data_o <= {16'h8cfd, 8'h30};
            16'd3326: lut_data_o <= {16'h8cfe, 8'h29};
            16'd3327: lut_data_o <= {16'h8cff, 8'he5};
            16'd3328: lut_data_o <= {16'h8d00, 8'h1e};
            16'd3329: lut_data_o <= {16'h8d01, 8'hf0};
            16'd3330: lut_data_o <= {16'h8d02, 8'hb4};
            16'd3331: lut_data_o <= {16'h8d03, 8'h10};
            16'd3332: lut_data_o <= {16'h8d04, 8'h05};
            16'd3333: lut_data_o <= {16'h8d05, 8'h90};
            16'd3334: lut_data_o <= {16'h8d06, 8'h30};
            16'd3335: lut_data_o <= {16'h8d07, 8'h23};
            16'd3336: lut_data_o <= {16'h8d08, 8'he4};
            16'd3337: lut_data_o <= {16'h8d09, 8'hf0};
            16'd3338: lut_data_o <= {16'h8d0a, 8'hc2};
            16'd3339: lut_data_o <= {16'h8d0b, 8'h35};
            16'd3340: lut_data_o <= {16'h8d0c, 8'h80};
            16'd3341: lut_data_o <= {16'h8d0d, 8'hc1};
            16'd3342: lut_data_o <= {16'h8d0e, 8'he4};
            16'd3343: lut_data_o <= {16'h8d0f, 8'hf5};
            16'd3344: lut_data_o <= {16'h8d10, 8'h4b};
            16'd3345: lut_data_o <= {16'h8d11, 8'h90};
            16'd3346: lut_data_o <= {16'h8d12, 8'h0e};
            16'd3347: lut_data_o <= {16'h8d13, 8'h7a};
            16'd3348: lut_data_o <= {16'h8d14, 8'h93};
            16'd3349: lut_data_o <= {16'h8d15, 8'hff};
            16'd3350: lut_data_o <= {16'h8d16, 8'he4};
            16'd3351: lut_data_o <= {16'h8d17, 8'h8f};
            16'd3352: lut_data_o <= {16'h8d18, 8'h37};
            16'd3353: lut_data_o <= {16'h8d19, 8'hf5};
            16'd3354: lut_data_o <= {16'h8d1a, 8'h36};
            16'd3355: lut_data_o <= {16'h8d1b, 8'hf5};
            16'd3356: lut_data_o <= {16'h8d1c, 8'h35};
            16'd3357: lut_data_o <= {16'h8d1d, 8'hf5};
            16'd3358: lut_data_o <= {16'h8d1e, 8'h34};
            16'd3359: lut_data_o <= {16'h8d1f, 8'haf};
            16'd3360: lut_data_o <= {16'h8d20, 8'h37};
            16'd3361: lut_data_o <= {16'h8d21, 8'hae};
            16'd3362: lut_data_o <= {16'h8d22, 8'h36};
            16'd3363: lut_data_o <= {16'h8d23, 8'had};
            16'd3364: lut_data_o <= {16'h8d24, 8'h35};
            16'd3365: lut_data_o <= {16'h8d25, 8'hac};
            16'd3366: lut_data_o <= {16'h8d26, 8'h34};
            16'd3367: lut_data_o <= {16'h8d27, 8'h90};
            16'd3368: lut_data_o <= {16'h8d28, 8'h0e};
            16'd3369: lut_data_o <= {16'h8d29, 8'h6a};
            16'd3370: lut_data_o <= {16'h8d2a, 8'h12};
            16'd3371: lut_data_o <= {16'h8d2b, 8'h0d};
            16'd3372: lut_data_o <= {16'h8d2c, 8'hf6};
            16'd3373: lut_data_o <= {16'h8d2d, 8'h8f};
            16'd3374: lut_data_o <= {16'h8d2e, 8'h37};
            16'd3375: lut_data_o <= {16'h8d2f, 8'h8e};
            16'd3376: lut_data_o <= {16'h8d30, 8'h36};
            16'd3377: lut_data_o <= {16'h8d31, 8'h8d};
            16'd3378: lut_data_o <= {16'h8d32, 8'h35};
            16'd3379: lut_data_o <= {16'h8d33, 8'h8c};
            16'd3380: lut_data_o <= {16'h8d34, 8'h34};
            16'd3381: lut_data_o <= {16'h8d35, 8'h90};
            16'd3382: lut_data_o <= {16'h8d36, 8'h0e};
            16'd3383: lut_data_o <= {16'h8d37, 8'h72};
            16'd3384: lut_data_o <= {16'h8d38, 8'h12};
            16'd3385: lut_data_o <= {16'h8d39, 8'h06};
            16'd3386: lut_data_o <= {16'h8d3a, 8'h7c};
            16'd3387: lut_data_o <= {16'h8d3b, 8'hef};
            16'd3388: lut_data_o <= {16'h8d3c, 8'h45};
            16'd3389: lut_data_o <= {16'h8d3d, 8'h37};
            16'd3390: lut_data_o <= {16'h8d3e, 8'hf5};
            16'd3391: lut_data_o <= {16'h8d3f, 8'h37};
            16'd3392: lut_data_o <= {16'h8d40, 8'hee};
            16'd3393: lut_data_o <= {16'h8d41, 8'h45};
            16'd3394: lut_data_o <= {16'h8d42, 8'h36};
            16'd3395: lut_data_o <= {16'h8d43, 8'hf5};
            16'd3396: lut_data_o <= {16'h8d44, 8'h36};
            16'd3397: lut_data_o <= {16'h8d45, 8'hed};
            16'd3398: lut_data_o <= {16'h8d46, 8'h45};
            16'd3399: lut_data_o <= {16'h8d47, 8'h35};
            16'd3400: lut_data_o <= {16'h8d48, 8'hf5};
            16'd3401: lut_data_o <= {16'h8d49, 8'h35};
            16'd3402: lut_data_o <= {16'h8d4a, 8'hec};
            16'd3403: lut_data_o <= {16'h8d4b, 8'h45};
            16'd3404: lut_data_o <= {16'h8d4c, 8'h34};
            16'd3405: lut_data_o <= {16'h8d4d, 8'hf5};
            16'd3406: lut_data_o <= {16'h8d4e, 8'h34};
            16'd3407: lut_data_o <= {16'h8d4f, 8'he4};
            16'd3408: lut_data_o <= {16'h8d50, 8'hf5};
            16'd3409: lut_data_o <= {16'h8d51, 8'h22};
            16'd3410: lut_data_o <= {16'h8d52, 8'hf5};
            16'd3411: lut_data_o <= {16'h8d53, 8'h23};
            16'd3412: lut_data_o <= {16'h8d54, 8'h85};
            16'd3413: lut_data_o <= {16'h8d55, 8'h37};
            16'd3414: lut_data_o <= {16'h8d56, 8'h31};
            16'd3415: lut_data_o <= {16'h8d57, 8'h85};
            16'd3416: lut_data_o <= {16'h8d58, 8'h36};
            16'd3417: lut_data_o <= {16'h8d59, 8'h30};
            16'd3418: lut_data_o <= {16'h8d5a, 8'h85};
            16'd3419: lut_data_o <= {16'h8d5b, 8'h35};
            16'd3420: lut_data_o <= {16'h8d5c, 8'h2f};
            16'd3421: lut_data_o <= {16'h8d5d, 8'h85};
            16'd3422: lut_data_o <= {16'h8d5e, 8'h34};
            16'd3423: lut_data_o <= {16'h8d5f, 8'h2e};
            16'd3424: lut_data_o <= {16'h8d60, 8'h12};
            16'd3425: lut_data_o <= {16'h8d61, 8'h0f};
            16'd3426: lut_data_o <= {16'h8d62, 8'h46};
            16'd3427: lut_data_o <= {16'h8d63, 8'he4};
            16'd3428: lut_data_o <= {16'h8d64, 8'hf5};
            16'd3429: lut_data_o <= {16'h8d65, 8'h22};
            16'd3430: lut_data_o <= {16'h8d66, 8'hf5};
            16'd3431: lut_data_o <= {16'h8d67, 8'h23};
            16'd3432: lut_data_o <= {16'h8d68, 8'h90};
            16'd3433: lut_data_o <= {16'h8d69, 8'h0e};
            16'd3434: lut_data_o <= {16'h8d6a, 8'h72};
            16'd3435: lut_data_o <= {16'h8d6b, 8'h12};
            16'd3436: lut_data_o <= {16'h8d6c, 8'h0d};
            16'd3437: lut_data_o <= {16'h8d6d, 8'hea};
            16'd3438: lut_data_o <= {16'h8d6e, 8'h12};
            16'd3439: lut_data_o <= {16'h8d6f, 8'h0f};
            16'd3440: lut_data_o <= {16'h8d70, 8'h46};
            16'd3441: lut_data_o <= {16'h8d71, 8'he4};
            16'd3442: lut_data_o <= {16'h8d72, 8'hf5};
            16'd3443: lut_data_o <= {16'h8d73, 8'h22};
            16'd3444: lut_data_o <= {16'h8d74, 8'hf5};
            16'd3445: lut_data_o <= {16'h8d75, 8'h23};
            16'd3446: lut_data_o <= {16'h8d76, 8'h90};
            16'd3447: lut_data_o <= {16'h8d77, 8'h0e};
            16'd3448: lut_data_o <= {16'h8d78, 8'h6e};
            16'd3449: lut_data_o <= {16'h8d79, 8'h12};
            16'd3450: lut_data_o <= {16'h8d7a, 8'h0d};
            16'd3451: lut_data_o <= {16'h8d7b, 8'hea};
            16'd3452: lut_data_o <= {16'h8d7c, 8'h02};
            16'd3453: lut_data_o <= {16'h8d7d, 8'h0f};
            16'd3454: lut_data_o <= {16'h8d7e, 8'h46};
            16'd3455: lut_data_o <= {16'h8d7f, 8'he5};
            16'd3456: lut_data_o <= {16'h8d80, 8'h40};
            16'd3457: lut_data_o <= {16'h8d81, 8'h24};
            16'd3458: lut_data_o <= {16'h8d82, 8'hf2};
            16'd3459: lut_data_o <= {16'h8d83, 8'hf5};
            16'd3460: lut_data_o <= {16'h8d84, 8'h37};
            16'd3461: lut_data_o <= {16'h8d85, 8'he5};
            16'd3462: lut_data_o <= {16'h8d86, 8'h3f};
            16'd3463: lut_data_o <= {16'h8d87, 8'h34};
            16'd3464: lut_data_o <= {16'h8d88, 8'h43};
            16'd3465: lut_data_o <= {16'h8d89, 8'hf5};
            16'd3466: lut_data_o <= {16'h8d8a, 8'h36};
            16'd3467: lut_data_o <= {16'h8d8b, 8'he5};
            16'd3468: lut_data_o <= {16'h8d8c, 8'h3e};
            16'd3469: lut_data_o <= {16'h8d8d, 8'h34};
            16'd3470: lut_data_o <= {16'h8d8e, 8'ha2};
            16'd3471: lut_data_o <= {16'h8d8f, 8'hf5};
            16'd3472: lut_data_o <= {16'h8d90, 8'h35};
            16'd3473: lut_data_o <= {16'h8d91, 8'he5};
            16'd3474: lut_data_o <= {16'h8d92, 8'h3d};
            16'd3475: lut_data_o <= {16'h8d93, 8'h34};
            16'd3476: lut_data_o <= {16'h8d94, 8'h28};
            16'd3477: lut_data_o <= {16'h8d95, 8'hf5};
            16'd3478: lut_data_o <= {16'h8d96, 8'h34};
            16'd3479: lut_data_o <= {16'h8d97, 8'he5};
            16'd3480: lut_data_o <= {16'h8d98, 8'h37};
            16'd3481: lut_data_o <= {16'h8d99, 8'hff};
            16'd3482: lut_data_o <= {16'h8d9a, 8'he4};
            16'd3483: lut_data_o <= {16'h8d9b, 8'hfe};
            16'd3484: lut_data_o <= {16'h8d9c, 8'hfd};
            16'd3485: lut_data_o <= {16'h8d9d, 8'hfc};
            16'd3486: lut_data_o <= {16'h8d9e, 8'h78};
            16'd3487: lut_data_o <= {16'h8d9f, 8'h18};
            16'd3488: lut_data_o <= {16'h8da0, 8'h12};
            16'd3489: lut_data_o <= {16'h8da1, 8'h06};
            16'd3490: lut_data_o <= {16'h8da2, 8'h69};
            16'd3491: lut_data_o <= {16'h8da3, 8'h8f};
            16'd3492: lut_data_o <= {16'h8da4, 8'h40};
            16'd3493: lut_data_o <= {16'h8da5, 8'h8e};
            16'd3494: lut_data_o <= {16'h8da6, 8'h3f};
            16'd3495: lut_data_o <= {16'h8da7, 8'h8d};
            16'd3496: lut_data_o <= {16'h8da8, 8'h3e};
            16'd3497: lut_data_o <= {16'h8da9, 8'h8c};
            16'd3498: lut_data_o <= {16'h8daa, 8'h3d};
            16'd3499: lut_data_o <= {16'h8dab, 8'he5};
            16'd3500: lut_data_o <= {16'h8dac, 8'h37};
            16'd3501: lut_data_o <= {16'h8dad, 8'h54};
            16'd3502: lut_data_o <= {16'h8dae, 8'ha0};
            16'd3503: lut_data_o <= {16'h8daf, 8'hff};
            16'd3504: lut_data_o <= {16'h8db0, 8'he5};
            16'd3505: lut_data_o <= {16'h8db1, 8'h36};
            16'd3506: lut_data_o <= {16'h8db2, 8'hfe};
            16'd3507: lut_data_o <= {16'h8db3, 8'he4};
            16'd3508: lut_data_o <= {16'h8db4, 8'hfd};
            16'd3509: lut_data_o <= {16'h8db5, 8'hfc};
            16'd3510: lut_data_o <= {16'h8db6, 8'h78};
            16'd3511: lut_data_o <= {16'h8db7, 8'h07};
            16'd3512: lut_data_o <= {16'h8db8, 8'h12};
            16'd3513: lut_data_o <= {16'h8db9, 8'h06};
            16'd3514: lut_data_o <= {16'h8dba, 8'h56};
            16'd3515: lut_data_o <= {16'h8dbb, 8'h78};
            16'd3516: lut_data_o <= {16'h8dbc, 8'h10};
            16'd3517: lut_data_o <= {16'h8dbd, 8'h12};
            16'd3518: lut_data_o <= {16'h8dbe, 8'h0f};
            16'd3519: lut_data_o <= {16'h8dbf, 8'h9a};
            16'd3520: lut_data_o <= {16'h8dc0, 8'he4};
            16'd3521: lut_data_o <= {16'h8dc1, 8'hff};
            16'd3522: lut_data_o <= {16'h8dc2, 8'hfe};
            16'd3523: lut_data_o <= {16'h8dc3, 8'he5};
            16'd3524: lut_data_o <= {16'h8dc4, 8'h35};
            16'd3525: lut_data_o <= {16'h8dc5, 8'hfd};
            16'd3526: lut_data_o <= {16'h8dc6, 8'he4};
            16'd3527: lut_data_o <= {16'h8dc7, 8'hfc};
            16'd3528: lut_data_o <= {16'h8dc8, 8'h78};
            16'd3529: lut_data_o <= {16'h8dc9, 8'h0e};
            16'd3530: lut_data_o <= {16'h8dca, 8'h12};
            16'd3531: lut_data_o <= {16'h8dcb, 8'h06};
            16'd3532: lut_data_o <= {16'h8dcc, 8'h56};
            16'd3533: lut_data_o <= {16'h8dcd, 8'h12};
            16'd3534: lut_data_o <= {16'h8dce, 8'h0f};
            16'd3535: lut_data_o <= {16'h8dcf, 8'h9d};
            16'd3536: lut_data_o <= {16'h8dd0, 8'he4};
            16'd3537: lut_data_o <= {16'h8dd1, 8'hff};
            16'd3538: lut_data_o <= {16'h8dd2, 8'hfe};
            16'd3539: lut_data_o <= {16'h8dd3, 8'hfd};
            16'd3540: lut_data_o <= {16'h8dd4, 8'he5};
            16'd3541: lut_data_o <= {16'h8dd5, 8'h34};
            16'd3542: lut_data_o <= {16'h8dd6, 8'hfc};
            16'd3543: lut_data_o <= {16'h8dd7, 8'h78};
            16'd3544: lut_data_o <= {16'h8dd8, 8'h18};
            16'd3545: lut_data_o <= {16'h8dd9, 8'h12};
            16'd3546: lut_data_o <= {16'h8dda, 8'h06};
            16'd3547: lut_data_o <= {16'h8ddb, 8'h56};
            16'd3548: lut_data_o <= {16'h8ddc, 8'h78};
            16'd3549: lut_data_o <= {16'h8ddd, 8'h08};
            16'd3550: lut_data_o <= {16'h8dde, 8'h12};
            16'd3551: lut_data_o <= {16'h8ddf, 8'h0f};
            16'd3552: lut_data_o <= {16'h8de0, 8'h9a};
            16'd3553: lut_data_o <= {16'h8de1, 8'h22};
            16'd3554: lut_data_o <= {16'h8de2, 8'h8f};
            16'd3555: lut_data_o <= {16'h8de3, 8'h3b};
            16'd3556: lut_data_o <= {16'h8de4, 8'h8e};
            16'd3557: lut_data_o <= {16'h8de5, 8'h3a};
            16'd3558: lut_data_o <= {16'h8de6, 8'h8d};
            16'd3559: lut_data_o <= {16'h8de7, 8'h39};
            16'd3560: lut_data_o <= {16'h8de8, 8'h8c};
            16'd3561: lut_data_o <= {16'h8de9, 8'h38};
            16'd3562: lut_data_o <= {16'h8dea, 8'h22};
            16'd3563: lut_data_o <= {16'h8deb, 8'h12};
            16'd3564: lut_data_o <= {16'h8dec, 8'h06};
            16'd3565: lut_data_o <= {16'h8ded, 8'h7c};
            16'd3566: lut_data_o <= {16'h8dee, 8'h8f};
            16'd3567: lut_data_o <= {16'h8def, 8'h31};
            16'd3568: lut_data_o <= {16'h8df0, 8'h8e};
            16'd3569: lut_data_o <= {16'h8df1, 8'h30};
            16'd3570: lut_data_o <= {16'h8df2, 8'h8d};
            16'd3571: lut_data_o <= {16'h8df3, 8'h2f};
            16'd3572: lut_data_o <= {16'h8df4, 8'h8c};
            16'd3573: lut_data_o <= {16'h8df5, 8'h2e};
            16'd3574: lut_data_o <= {16'h8df6, 8'h22};
            16'd3575: lut_data_o <= {16'h8df7, 8'h93};
            16'd3576: lut_data_o <= {16'h8df8, 8'hf9};
            16'd3577: lut_data_o <= {16'h8df9, 8'hf8};
            16'd3578: lut_data_o <= {16'h8dfa, 8'h02};
            16'd3579: lut_data_o <= {16'h8dfb, 8'h06};
            16'd3580: lut_data_o <= {16'h8dfc, 8'h69};
            16'd3581: lut_data_o <= {16'h8dfd, 8'h00};
            16'd3582: lut_data_o <= {16'h8dfe, 8'h00};
            16'd3583: lut_data_o <= {16'h8dff, 8'h00};
            16'd3584: lut_data_o <= {16'h8e00, 8'h00};
            16'd3585: lut_data_o <= {16'h8e01, 8'h12};
            16'd3586: lut_data_o <= {16'h8e02, 8'h01};
            16'd3587: lut_data_o <= {16'h8e03, 8'h17};
            16'd3588: lut_data_o <= {16'h8e04, 8'h08};
            16'd3589: lut_data_o <= {16'h8e05, 8'h31};
            16'd3590: lut_data_o <= {16'h8e06, 8'h15};
            16'd3591: lut_data_o <= {16'h8e07, 8'h53};
            16'd3592: lut_data_o <= {16'h8e08, 8'h54};
            16'd3593: lut_data_o <= {16'h8e09, 8'h44};
            16'd3594: lut_data_o <= {16'h8e0a, 8'h20};
            16'd3595: lut_data_o <= {16'h8e0b, 8'h20};
            16'd3596: lut_data_o <= {16'h8e0c, 8'h20};
            16'd3597: lut_data_o <= {16'h8e0d, 8'h20};
            16'd3598: lut_data_o <= {16'h8e0e, 8'h20};
            16'd3599: lut_data_o <= {16'h8e0f, 8'h13};
            16'd3600: lut_data_o <= {16'h8e10, 8'h01};
            16'd3601: lut_data_o <= {16'h8e11, 8'h10};
            16'd3602: lut_data_o <= {16'h8e12, 8'h01};
            16'd3603: lut_data_o <= {16'h8e13, 8'h56};
            16'd3604: lut_data_o <= {16'h8e14, 8'h40};
            16'd3605: lut_data_o <= {16'h8e15, 8'h1a};
            16'd3606: lut_data_o <= {16'h8e16, 8'h30};
            16'd3607: lut_data_o <= {16'h8e17, 8'h29};
            16'd3608: lut_data_o <= {16'h8e18, 8'h7e};
            16'd3609: lut_data_o <= {16'h8e19, 8'h00};
            16'd3610: lut_data_o <= {16'h8e1a, 8'h30};
            16'd3611: lut_data_o <= {16'h8e1b, 8'h04};
            16'd3612: lut_data_o <= {16'h8e1c, 8'h20};
            16'd3613: lut_data_o <= {16'h8e1d, 8'hdf};
            16'd3614: lut_data_o <= {16'h8e1e, 8'h30};
            16'd3615: lut_data_o <= {16'h8e1f, 8'h05};
            16'd3616: lut_data_o <= {16'h8e20, 8'h40};
            16'd3617: lut_data_o <= {16'h8e21, 8'hbf};
            16'd3618: lut_data_o <= {16'h8e22, 8'h50};
            16'd3619: lut_data_o <= {16'h8e23, 8'h03};
            16'd3620: lut_data_o <= {16'h8e24, 8'h00};
            16'd3621: lut_data_o <= {16'h8e25, 8'hfd};
            16'd3622: lut_data_o <= {16'h8e26, 8'h50};
            16'd3623: lut_data_o <= {16'h8e27, 8'h27};
            16'd3624: lut_data_o <= {16'h8e28, 8'h01};
            16'd3625: lut_data_o <= {16'h8e29, 8'hfe};
            16'd3626: lut_data_o <= {16'h8e2a, 8'h60};
            16'd3627: lut_data_o <= {16'h8e2b, 8'h00};
            16'd3628: lut_data_o <= {16'h8e2c, 8'h11};
            16'd3629: lut_data_o <= {16'h8e2d, 8'h00};
            16'd3630: lut_data_o <= {16'h8e2e, 8'h3f};
            16'd3631: lut_data_o <= {16'h8e2f, 8'h05};
            16'd3632: lut_data_o <= {16'h8e30, 8'h30};
            16'd3633: lut_data_o <= {16'h8e31, 8'h00};
            16'd3634: lut_data_o <= {16'h8e32, 8'h3f};
            16'd3635: lut_data_o <= {16'h8e33, 8'h06};
            16'd3636: lut_data_o <= {16'h8e34, 8'h22};
            16'd3637: lut_data_o <= {16'h8e35, 8'h00};
            16'd3638: lut_data_o <= {16'h8e36, 8'h3f};
            16'd3639: lut_data_o <= {16'h8e37, 8'h01};
            16'd3640: lut_data_o <= {16'h8e38, 8'h2a};
            16'd3641: lut_data_o <= {16'h8e39, 8'h00};
            16'd3642: lut_data_o <= {16'h8e3a, 8'h3f};
            16'd3643: lut_data_o <= {16'h8e3b, 8'h02};
            16'd3644: lut_data_o <= {16'h8e3c, 8'h00};
            16'd3645: lut_data_o <= {16'h8e3d, 8'h00};
            16'd3646: lut_data_o <= {16'h8e3e, 8'h36};
            16'd3647: lut_data_o <= {16'h8e3f, 8'h06};
            16'd3648: lut_data_o <= {16'h8e40, 8'h07};
            16'd3649: lut_data_o <= {16'h8e41, 8'h00};
            16'd3650: lut_data_o <= {16'h8e42, 8'h3f};
            16'd3651: lut_data_o <= {16'h8e43, 8'h0b};
            16'd3652: lut_data_o <= {16'h8e44, 8'h0f};
            16'd3653: lut_data_o <= {16'h8e45, 8'hf0};
            16'd3654: lut_data_o <= {16'h8e46, 8'h00};
            16'd3655: lut_data_o <= {16'h8e47, 8'h00};
            16'd3656: lut_data_o <= {16'h8e48, 8'h00};
            16'd3657: lut_data_o <= {16'h8e49, 8'h00};
            16'd3658: lut_data_o <= {16'h8e4a, 8'h30};
            16'd3659: lut_data_o <= {16'h8e4b, 8'h01};
            16'd3660: lut_data_o <= {16'h8e4c, 8'h40};
            16'd3661: lut_data_o <= {16'h8e4d, 8'hbf};
            16'd3662: lut_data_o <= {16'h8e4e, 8'h30};
            16'd3663: lut_data_o <= {16'h8e4f, 8'h01};
            16'd3664: lut_data_o <= {16'h8e50, 8'h00};
            16'd3665: lut_data_o <= {16'h8e51, 8'hbf};
            16'd3666: lut_data_o <= {16'h8e52, 8'h30};
            16'd3667: lut_data_o <= {16'h8e53, 8'h29};
            16'd3668: lut_data_o <= {16'h8e54, 8'h70};
            16'd3669: lut_data_o <= {16'h8e55, 8'h00};
            16'd3670: lut_data_o <= {16'h8e56, 8'h3a};
            16'd3671: lut_data_o <= {16'h8e57, 8'h00};
            16'd3672: lut_data_o <= {16'h8e58, 8'h00};
            16'd3673: lut_data_o <= {16'h8e59, 8'hff};
            16'd3674: lut_data_o <= {16'h8e5a, 8'h3a};
            16'd3675: lut_data_o <= {16'h8e5b, 8'h00};
            16'd3676: lut_data_o <= {16'h8e5c, 8'h00};
            16'd3677: lut_data_o <= {16'h8e5d, 8'hff};
            16'd3678: lut_data_o <= {16'h8e5e, 8'h36};
            16'd3679: lut_data_o <= {16'h8e5f, 8'h03};
            16'd3680: lut_data_o <= {16'h8e60, 8'h36};
            16'd3681: lut_data_o <= {16'h8e61, 8'h02};
            16'd3682: lut_data_o <= {16'h8e62, 8'h41};
            16'd3683: lut_data_o <= {16'h8e63, 8'h44};
            16'd3684: lut_data_o <= {16'h8e64, 8'h58};
            16'd3685: lut_data_o <= {16'h8e65, 8'h20};
            16'd3686: lut_data_o <= {16'h8e66, 8'h18};
            16'd3687: lut_data_o <= {16'h8e67, 8'h10};
            16'd3688: lut_data_o <= {16'h8e68, 8'h0a};
            16'd3689: lut_data_o <= {16'h8e69, 8'h04};
            16'd3690: lut_data_o <= {16'h8e6a, 8'h04};
            16'd3691: lut_data_o <= {16'h8e6b, 8'h00};
            16'd3692: lut_data_o <= {16'h8e6c, 8'h03};
            16'd3693: lut_data_o <= {16'h8e6d, 8'hff};
            16'd3694: lut_data_o <= {16'h8e6e, 8'h64};
            16'd3695: lut_data_o <= {16'h8e6f, 8'h00};
            16'd3696: lut_data_o <= {16'h8e70, 8'h00};
            16'd3697: lut_data_o <= {16'h8e71, 8'h80};
            16'd3698: lut_data_o <= {16'h8e72, 8'h00};
            16'd3699: lut_data_o <= {16'h8e73, 8'h00};
            16'd3700: lut_data_o <= {16'h8e74, 8'h00};
            16'd3701: lut_data_o <= {16'h8e75, 8'h00};
            16'd3702: lut_data_o <= {16'h8e76, 8'h00};
            16'd3703: lut_data_o <= {16'h8e77, 8'h00};
            16'd3704: lut_data_o <= {16'h8e78, 8'h02};
            16'd3705: lut_data_o <= {16'h8e79, 8'h04};
            16'd3706: lut_data_o <= {16'h8e7a, 8'h06};
            16'd3707: lut_data_o <= {16'h8e7b, 8'h06};
            16'd3708: lut_data_o <= {16'h8e7c, 8'h00};
            16'd3709: lut_data_o <= {16'h8e7d, 8'h03};
            16'd3710: lut_data_o <= {16'h8e7e, 8'h51};
            16'd3711: lut_data_o <= {16'h8e7f, 8'h00};
            16'd3712: lut_data_o <= {16'h8e80, 8'h7a};
            16'd3713: lut_data_o <= {16'h8e81, 8'h50};
            16'd3714: lut_data_o <= {16'h8e82, 8'h3c};
            16'd3715: lut_data_o <= {16'h8e83, 8'h28};
            16'd3716: lut_data_o <= {16'h8e84, 8'h1e};
            16'd3717: lut_data_o <= {16'h8e85, 8'h10};
            16'd3718: lut_data_o <= {16'h8e86, 8'h10};
            16'd3719: lut_data_o <= {16'h8e87, 8'h50};
            16'd3720: lut_data_o <= {16'h8e88, 8'h2d};
            16'd3721: lut_data_o <= {16'h8e89, 8'h28};
            16'd3722: lut_data_o <= {16'h8e8a, 8'h16};
            16'd3723: lut_data_o <= {16'h8e8b, 8'h10};
            16'd3724: lut_data_o <= {16'h8e8c, 8'h10};
            16'd3725: lut_data_o <= {16'h8e8d, 8'h02};
            16'd3726: lut_data_o <= {16'h8e8e, 8'h00};
            16'd3727: lut_data_o <= {16'h8e8f, 8'h10};
            16'd3728: lut_data_o <= {16'h8e90, 8'h0c};
            16'd3729: lut_data_o <= {16'h8e91, 8'h10};
            16'd3730: lut_data_o <= {16'h8e92, 8'h04};
            16'd3731: lut_data_o <= {16'h8e93, 8'h0c};
            16'd3732: lut_data_o <= {16'h8e94, 8'h6e};
            16'd3733: lut_data_o <= {16'h8e95, 8'h06};
            16'd3734: lut_data_o <= {16'h8e96, 8'h05};
            16'd3735: lut_data_o <= {16'h8e97, 8'h00};
            16'd3736: lut_data_o <= {16'h8e98, 8'ha5};
            16'd3737: lut_data_o <= {16'h8e99, 8'h5a};
            16'd3738: lut_data_o <= {16'h8e9a, 8'h00};
            16'd3739: lut_data_o <= {16'h8e9b, 8'hae};
            16'd3740: lut_data_o <= {16'h8e9c, 8'h35};
            16'd3741: lut_data_o <= {16'h8e9d, 8'haf};
            16'd3742: lut_data_o <= {16'h8e9e, 8'h36};
            16'd3743: lut_data_o <= {16'h8e9f, 8'he4};
            16'd3744: lut_data_o <= {16'h8ea0, 8'hfd};
            16'd3745: lut_data_o <= {16'h8ea1, 8'hed};
            16'd3746: lut_data_o <= {16'h8ea2, 8'hc3};
            16'd3747: lut_data_o <= {16'h8ea3, 8'h95};
            16'd3748: lut_data_o <= {16'h8ea4, 8'h37};
            16'd3749: lut_data_o <= {16'h8ea5, 8'h50};
            16'd3750: lut_data_o <= {16'h8ea6, 8'h33};
            16'd3751: lut_data_o <= {16'h8ea7, 8'h12};
            16'd3752: lut_data_o <= {16'h8ea8, 8'h0f};
            16'd3753: lut_data_o <= {16'h8ea9, 8'he2};
            16'd3754: lut_data_o <= {16'h8eaa, 8'he4};
            16'd3755: lut_data_o <= {16'h8eab, 8'h93};
            16'd3756: lut_data_o <= {16'h8eac, 8'hf5};
            16'd3757: lut_data_o <= {16'h8ead, 8'h38};
            16'd3758: lut_data_o <= {16'h8eae, 8'h74};
            16'd3759: lut_data_o <= {16'h8eaf, 8'h01};
            16'd3760: lut_data_o <= {16'h8eb0, 8'h93};
            16'd3761: lut_data_o <= {16'h8eb1, 8'hf5};
            16'd3762: lut_data_o <= {16'h8eb2, 8'h39};
            16'd3763: lut_data_o <= {16'h8eb3, 8'h45};
            16'd3764: lut_data_o <= {16'h8eb4, 8'h38};
            16'd3765: lut_data_o <= {16'h8eb5, 8'h60};
            16'd3766: lut_data_o <= {16'h8eb6, 8'h23};
            16'd3767: lut_data_o <= {16'h8eb7, 8'h85};
            16'd3768: lut_data_o <= {16'h8eb8, 8'h39};
            16'd3769: lut_data_o <= {16'h8eb9, 8'h82};
            16'd3770: lut_data_o <= {16'h8eba, 8'h85};
            16'd3771: lut_data_o <= {16'h8ebb, 8'h38};
            16'd3772: lut_data_o <= {16'h8ebc, 8'h83};
            16'd3773: lut_data_o <= {16'h8ebd, 8'he0};
            16'd3774: lut_data_o <= {16'h8ebe, 8'hfc};
            16'd3775: lut_data_o <= {16'h8ebf, 8'h12};
            16'd3776: lut_data_o <= {16'h8ec0, 8'h0f};
            16'd3777: lut_data_o <= {16'h8ec1, 8'he2};
            16'd3778: lut_data_o <= {16'h8ec2, 8'h74};
            16'd3779: lut_data_o <= {16'h8ec3, 8'h03};
            16'd3780: lut_data_o <= {16'h8ec4, 8'h93};
            16'd3781: lut_data_o <= {16'h8ec5, 8'h52};
            16'd3782: lut_data_o <= {16'h8ec6, 8'h04};
            16'd3783: lut_data_o <= {16'h8ec7, 8'h12};
            16'd3784: lut_data_o <= {16'h8ec8, 8'h0f};
            16'd3785: lut_data_o <= {16'h8ec9, 8'he2};
            16'd3786: lut_data_o <= {16'h8eca, 8'h74};
            16'd3787: lut_data_o <= {16'h8ecb, 8'h02};
            16'd3788: lut_data_o <= {16'h8ecc, 8'h93};
            16'd3789: lut_data_o <= {16'h8ecd, 8'h42};
            16'd3790: lut_data_o <= {16'h8ece, 8'h04};
            16'd3791: lut_data_o <= {16'h8ecf, 8'h85};
            16'd3792: lut_data_o <= {16'h8ed0, 8'h39};
            16'd3793: lut_data_o <= {16'h8ed1, 8'h82};
            16'd3794: lut_data_o <= {16'h8ed2, 8'h85};
            16'd3795: lut_data_o <= {16'h8ed3, 8'h38};
            16'd3796: lut_data_o <= {16'h8ed4, 8'h83};
            16'd3797: lut_data_o <= {16'h8ed5, 8'hec};
            16'd3798: lut_data_o <= {16'h8ed6, 8'hf0};
            16'd3799: lut_data_o <= {16'h8ed7, 8'h0d};
            16'd3800: lut_data_o <= {16'h8ed8, 8'h80};
            16'd3801: lut_data_o <= {16'h8ed9, 8'hc7};
            16'd3802: lut_data_o <= {16'h8eda, 8'h22};
            16'd3803: lut_data_o <= {16'h8edb, 8'h78};
            16'd3804: lut_data_o <= {16'h8edc, 8'hbe};
            16'd3805: lut_data_o <= {16'h8edd, 8'he6};
            16'd3806: lut_data_o <= {16'h8ede, 8'hd3};
            16'd3807: lut_data_o <= {16'h8edf, 8'h08};
            16'd3808: lut_data_o <= {16'h8ee0, 8'hff};
            16'd3809: lut_data_o <= {16'h8ee1, 8'he6};
            16'd3810: lut_data_o <= {16'h8ee2, 8'h64};
            16'd3811: lut_data_o <= {16'h8ee3, 8'h80};
            16'd3812: lut_data_o <= {16'h8ee4, 8'hf8};
            16'd3813: lut_data_o <= {16'h8ee5, 8'hef};
            16'd3814: lut_data_o <= {16'h8ee6, 8'h64};
            16'd3815: lut_data_o <= {16'h8ee7, 8'h80};
            16'd3816: lut_data_o <= {16'h8ee8, 8'h98};
            16'd3817: lut_data_o <= {16'h8ee9, 8'h22};
            16'd3818: lut_data_o <= {16'h8eea, 8'h93};
            16'd3819: lut_data_o <= {16'h8eeb, 8'hff};
            16'd3820: lut_data_o <= {16'h8eec, 8'h7e};
            16'd3821: lut_data_o <= {16'h8eed, 8'h00};
            16'd3822: lut_data_o <= {16'h8eee, 8'he6};
            16'd3823: lut_data_o <= {16'h8eef, 8'hfc};
            16'd3824: lut_data_o <= {16'h8ef0, 8'h08};
            16'd3825: lut_data_o <= {16'h8ef1, 8'he6};
            16'd3826: lut_data_o <= {16'h8ef2, 8'hfd};
            16'd3827: lut_data_o <= {16'h8ef3, 8'h12};
            16'd3828: lut_data_o <= {16'h8ef4, 8'h04};
            16'd3829: lut_data_o <= {16'h8ef5, 8'hc1};
            16'd3830: lut_data_o <= {16'h8ef6, 8'h78};
            16'd3831: lut_data_o <= {16'h8ef7, 8'hc1};
            16'd3832: lut_data_o <= {16'h8ef8, 8'he6};
            16'd3833: lut_data_o <= {16'h8ef9, 8'hfc};
            16'd3834: lut_data_o <= {16'h8efa, 8'h08};
            16'd3835: lut_data_o <= {16'h8efb, 8'he6};
            16'd3836: lut_data_o <= {16'h8efc, 8'hfd};
            16'd3837: lut_data_o <= {16'h8efd, 8'hd3};
            16'd3838: lut_data_o <= {16'h8efe, 8'hef};
            16'd3839: lut_data_o <= {16'h8eff, 8'h9d};
            16'd3840: lut_data_o <= {16'h8f00, 8'hee};
            16'd3841: lut_data_o <= {16'h8f01, 8'h9c};
            16'd3842: lut_data_o <= {16'h8f02, 8'h22};
            16'd3843: lut_data_o <= {16'h8f03, 8'h78};
            16'd3844: lut_data_o <= {16'h8f04, 8'hbd};
            16'd3845: lut_data_o <= {16'h8f05, 8'hd3};
            16'd3846: lut_data_o <= {16'h8f06, 8'he6};
            16'd3847: lut_data_o <= {16'h8f07, 8'h64};
            16'd3848: lut_data_o <= {16'h8f08, 8'h80};
            16'd3849: lut_data_o <= {16'h8f09, 8'h94};
            16'd3850: lut_data_o <= {16'h8f0a, 8'h80};
            16'd3851: lut_data_o <= {16'h8f0b, 8'h22};
            16'd3852: lut_data_o <= {16'h8f0c, 8'h25};
            16'd3853: lut_data_o <= {16'h8f0d, 8'he0};
            16'd3854: lut_data_o <= {16'h8f0e, 8'h24};
            16'd3855: lut_data_o <= {16'h8f0f, 8'h0a};
            16'd3856: lut_data_o <= {16'h8f10, 8'hf8};
            16'd3857: lut_data_o <= {16'h8f11, 8'he6};
            16'd3858: lut_data_o <= {16'h8f12, 8'hfe};
            16'd3859: lut_data_o <= {16'h8f13, 8'h08};
            16'd3860: lut_data_o <= {16'h8f14, 8'he6};
            16'd3861: lut_data_o <= {16'h8f15, 8'hff};
            16'd3862: lut_data_o <= {16'h8f16, 8'h22};
            16'd3863: lut_data_o <= {16'h8f17, 8'he5};
            16'd3864: lut_data_o <= {16'h8f18, 8'h3c};
            16'd3865: lut_data_o <= {16'h8f19, 8'hd3};
            16'd3866: lut_data_o <= {16'h8f1a, 8'h94};
            16'd3867: lut_data_o <= {16'h8f1b, 8'h00};
            16'd3868: lut_data_o <= {16'h8f1c, 8'h40};
            16'd3869: lut_data_o <= {16'h8f1d, 8'h0b};
            16'd3870: lut_data_o <= {16'h8f1e, 8'h90};
            16'd3871: lut_data_o <= {16'h8f1f, 8'h0e};
            16'd3872: lut_data_o <= {16'h8f20, 8'h88};
            16'd3873: lut_data_o <= {16'h8f21, 8'h12};
            16'd3874: lut_data_o <= {16'h8f22, 8'h0b};
            16'd3875: lut_data_o <= {16'h8f23, 8'hf1};
            16'd3876: lut_data_o <= {16'h8f24, 8'h90};
            16'd3877: lut_data_o <= {16'h8f25, 8'h0e};
            16'd3878: lut_data_o <= {16'h8f26, 8'h86};
            16'd3879: lut_data_o <= {16'h8f27, 8'h80};
            16'd3880: lut_data_o <= {16'h8f28, 8'h09};
            16'd3881: lut_data_o <= {16'h8f29, 8'h90};
            16'd3882: lut_data_o <= {16'h8f2a, 8'h0e};
            16'd3883: lut_data_o <= {16'h8f2b, 8'h82};
            16'd3884: lut_data_o <= {16'h8f2c, 8'h12};
            16'd3885: lut_data_o <= {16'h8f2d, 8'h0b};
            16'd3886: lut_data_o <= {16'h8f2e, 8'hf1};
            16'd3887: lut_data_o <= {16'h8f2f, 8'h90};
            16'd3888: lut_data_o <= {16'h8f30, 8'h0e};
            16'd3889: lut_data_o <= {16'h8f31, 8'h80};
            16'd3890: lut_data_o <= {16'h8f32, 8'he4};
            16'd3891: lut_data_o <= {16'h8f33, 8'h93};
            16'd3892: lut_data_o <= {16'h8f34, 8'hf5};
            16'd3893: lut_data_o <= {16'h8f35, 8'h44};
            16'd3894: lut_data_o <= {16'h8f36, 8'ha3};
            16'd3895: lut_data_o <= {16'h8f37, 8'he4};
            16'd3896: lut_data_o <= {16'h8f38, 8'h93};
            16'd3897: lut_data_o <= {16'h8f39, 8'hf5};
            16'd3898: lut_data_o <= {16'h8f3a, 8'h43};
            16'd3899: lut_data_o <= {16'h8f3b, 8'hd2};
            16'd3900: lut_data_o <= {16'h8f3c, 8'h06};
            16'd3901: lut_data_o <= {16'h8f3d, 8'h30};
            16'd3902: lut_data_o <= {16'h8f3e, 8'h06};
            16'd3903: lut_data_o <= {16'h8f3f, 8'h03};
            16'd3904: lut_data_o <= {16'h8f40, 8'hd3};
            16'd3905: lut_data_o <= {16'h8f41, 8'h80};
            16'd3906: lut_data_o <= {16'h8f42, 8'h01};
            16'd3907: lut_data_o <= {16'h8f43, 8'hc3};
            16'd3908: lut_data_o <= {16'h8f44, 8'h92};
            16'd3909: lut_data_o <= {16'h8f45, 8'h0e};
            16'd3910: lut_data_o <= {16'h8f46, 8'h22};
            16'd3911: lut_data_o <= {16'h8f47, 8'ha2};
            16'd3912: lut_data_o <= {16'h8f48, 8'haf};
            16'd3913: lut_data_o <= {16'h8f49, 8'h92};
            16'd3914: lut_data_o <= {16'h8f4a, 8'h32};
            16'd3915: lut_data_o <= {16'h8f4b, 8'hc2};
            16'd3916: lut_data_o <= {16'h8f4c, 8'haf};
            16'd3917: lut_data_o <= {16'h8f4d, 8'he5};
            16'd3918: lut_data_o <= {16'h8f4e, 8'h23};
            16'd3919: lut_data_o <= {16'h8f4f, 8'h45};
            16'd3920: lut_data_o <= {16'h8f50, 8'h22};
            16'd3921: lut_data_o <= {16'h8f51, 8'h90};
            16'd3922: lut_data_o <= {16'h8f52, 8'h0e};
            16'd3923: lut_data_o <= {16'h8f53, 8'h5d};
            16'd3924: lut_data_o <= {16'h8f54, 8'h60};
            16'd3925: lut_data_o <= {16'h8f55, 8'h0e};
            16'd3926: lut_data_o <= {16'h8f56, 8'h12};
            16'd3927: lut_data_o <= {16'h8f57, 8'h0f};
            16'd3928: lut_data_o <= {16'h8f58, 8'hcb};
            16'd3929: lut_data_o <= {16'h8f59, 8'he0};
            16'd3930: lut_data_o <= {16'h8f5a, 8'hf5};
            16'd3931: lut_data_o <= {16'h8f5b, 8'h2c};
            16'd3932: lut_data_o <= {16'h8f5c, 8'h12};
            16'd3933: lut_data_o <= {16'h8f5d, 8'h0f};
            16'd3934: lut_data_o <= {16'h8f5e, 8'hc8};
            16'd3935: lut_data_o <= {16'h8f5f, 8'he0};
            16'd3936: lut_data_o <= {16'h8f60, 8'hf5};
            16'd3937: lut_data_o <= {16'h8f61, 8'h2d};
            16'd3938: lut_data_o <= {16'h8f62, 8'h80};
            16'd3939: lut_data_o <= {16'h8f63, 8'h0c};
            16'd3940: lut_data_o <= {16'h8f64, 8'h12};
            16'd3941: lut_data_o <= {16'h8f65, 8'h0f};
            16'd3942: lut_data_o <= {16'h8f66, 8'hcb};
            16'd3943: lut_data_o <= {16'h8f67, 8'he5};
            16'd3944: lut_data_o <= {16'h8f68, 8'h30};
            16'd3945: lut_data_o <= {16'h8f69, 8'hf0};
            16'd3946: lut_data_o <= {16'h8f6a, 8'h12};
            16'd3947: lut_data_o <= {16'h8f6b, 8'h0f};
            16'd3948: lut_data_o <= {16'h8f6c, 8'hc8};
            16'd3949: lut_data_o <= {16'h8f6d, 8'he5};
            16'd3950: lut_data_o <= {16'h8f6e, 8'h31};
            16'd3951: lut_data_o <= {16'h8f6f, 8'hf0};
            16'd3952: lut_data_o <= {16'h8f70, 8'ha2};
            16'd3953: lut_data_o <= {16'h8f71, 8'h32};
            16'd3954: lut_data_o <= {16'h8f72, 8'h92};
            16'd3955: lut_data_o <= {16'h8f73, 8'haf};
            16'd3956: lut_data_o <= {16'h8f74, 8'h22};
            16'd3957: lut_data_o <= {16'h8f75, 8'hd2};
            16'd3958: lut_data_o <= {16'h8f76, 8'h01};
            16'd3959: lut_data_o <= {16'h8f77, 8'hc2};
            16'd3960: lut_data_o <= {16'h8f78, 8'h02};
            16'd3961: lut_data_o <= {16'h8f79, 8'he4};
            16'd3962: lut_data_o <= {16'h8f7a, 8'hf5};
            16'd3963: lut_data_o <= {16'h8f7b, 8'h1f};
            16'd3964: lut_data_o <= {16'h8f7c, 8'hf5};
            16'd3965: lut_data_o <= {16'h8f7d, 8'h1e};
            16'd3966: lut_data_o <= {16'h8f7e, 8'hd2};
            16'd3967: lut_data_o <= {16'h8f7f, 8'h35};
            16'd3968: lut_data_o <= {16'h8f80, 8'hd2};
            16'd3969: lut_data_o <= {16'h8f81, 8'h33};
            16'd3970: lut_data_o <= {16'h8f82, 8'hd2};
            16'd3971: lut_data_o <= {16'h8f83, 8'h36};
            16'd3972: lut_data_o <= {16'h8f84, 8'hd2};
            16'd3973: lut_data_o <= {16'h8f85, 8'h01};
            16'd3974: lut_data_o <= {16'h8f86, 8'hc2};
            16'd3975: lut_data_o <= {16'h8f87, 8'h02};
            16'd3976: lut_data_o <= {16'h8f88, 8'hf5};
            16'd3977: lut_data_o <= {16'h8f89, 8'h1f};
            16'd3978: lut_data_o <= {16'h8f8a, 8'hf5};
            16'd3979: lut_data_o <= {16'h8f8b, 8'h1e};
            16'd3980: lut_data_o <= {16'h8f8c, 8'hd2};
            16'd3981: lut_data_o <= {16'h8f8d, 8'h35};
            16'd3982: lut_data_o <= {16'h8f8e, 8'hd2};
            16'd3983: lut_data_o <= {16'h8f8f, 8'h33};
            16'd3984: lut_data_o <= {16'h8f90, 8'h22};
            16'd3985: lut_data_o <= {16'h8f91, 8'hfb};
            16'd3986: lut_data_o <= {16'h8f92, 8'hd3};
            16'd3987: lut_data_o <= {16'h8f93, 8'hed};
            16'd3988: lut_data_o <= {16'h8f94, 8'h9b};
            16'd3989: lut_data_o <= {16'h8f95, 8'h74};
            16'd3990: lut_data_o <= {16'h8f96, 8'h80};
            16'd3991: lut_data_o <= {16'h8f97, 8'hf8};
            16'd3992: lut_data_o <= {16'h8f98, 8'h6c};
            16'd3993: lut_data_o <= {16'h8f99, 8'h98};
            16'd3994: lut_data_o <= {16'h8f9a, 8'h22};
            16'd3995: lut_data_o <= {16'h8f9b, 8'h12};
            16'd3996: lut_data_o <= {16'h8f9c, 8'h06};
            16'd3997: lut_data_o <= {16'h8f9d, 8'h69};
            16'd3998: lut_data_o <= {16'h8f9e, 8'he5};
            16'd3999: lut_data_o <= {16'h8f9f, 8'h40};
            16'd4000: lut_data_o <= {16'h8fa0, 8'h2f};
            16'd4001: lut_data_o <= {16'h8fa1, 8'hf5};
            16'd4002: lut_data_o <= {16'h8fa2, 8'h40};
            16'd4003: lut_data_o <= {16'h8fa3, 8'he5};
            16'd4004: lut_data_o <= {16'h8fa4, 8'h3f};
            16'd4005: lut_data_o <= {16'h8fa5, 8'h3e};
            16'd4006: lut_data_o <= {16'h8fa6, 8'hf5};
            16'd4007: lut_data_o <= {16'h8fa7, 8'h3f};
            16'd4008: lut_data_o <= {16'h8fa8, 8'he5};
            16'd4009: lut_data_o <= {16'h8fa9, 8'h3e};
            16'd4010: lut_data_o <= {16'h8faa, 8'h3d};
            16'd4011: lut_data_o <= {16'h8fab, 8'hf5};
            16'd4012: lut_data_o <= {16'h8fac, 8'h3e};
            16'd4013: lut_data_o <= {16'h8fad, 8'he5};
            16'd4014: lut_data_o <= {16'h8fae, 8'h3d};
            16'd4015: lut_data_o <= {16'h8faf, 8'h3c};
            16'd4016: lut_data_o <= {16'h8fb0, 8'hf5};
            16'd4017: lut_data_o <= {16'h8fb1, 8'h3d};
            16'd4018: lut_data_o <= {16'h8fb2, 8'h22};
            16'd4019: lut_data_o <= {16'h8fb3, 8'hc0};
            16'd4020: lut_data_o <= {16'h8fb4, 8'he0};
            16'd4021: lut_data_o <= {16'h8fb5, 8'hc0};
            16'd4022: lut_data_o <= {16'h8fb6, 8'h83};
            16'd4023: lut_data_o <= {16'h8fb7, 8'hc0};
            16'd4024: lut_data_o <= {16'h8fb8, 8'h82};
            16'd4025: lut_data_o <= {16'h8fb9, 8'h90};
            16'd4026: lut_data_o <= {16'h8fba, 8'h3f};
            16'd4027: lut_data_o <= {16'h8fbb, 8'h0d};
            16'd4028: lut_data_o <= {16'h8fbc, 8'he0};
            16'd4029: lut_data_o <= {16'h8fbd, 8'hf5};
            16'd4030: lut_data_o <= {16'h8fbe, 8'h33};
            16'd4031: lut_data_o <= {16'h8fbf, 8'he5};
            16'd4032: lut_data_o <= {16'h8fc0, 8'h33};
            16'd4033: lut_data_o <= {16'h8fc1, 8'hf0};
            16'd4034: lut_data_o <= {16'h8fc2, 8'hd0};
            16'd4035: lut_data_o <= {16'h8fc3, 8'h82};
            16'd4036: lut_data_o <= {16'h8fc4, 8'hd0};
            16'd4037: lut_data_o <= {16'h8fc5, 8'h83};
            16'd4038: lut_data_o <= {16'h8fc6, 8'hd0};
            16'd4039: lut_data_o <= {16'h8fc7, 8'he0};
            16'd4040: lut_data_o <= {16'h8fc8, 8'h32};
            16'd4041: lut_data_o <= {16'h8fc9, 8'h90};
            16'd4042: lut_data_o <= {16'h8fca, 8'h0e};
            16'd4043: lut_data_o <= {16'h8fcb, 8'h5f};
            16'd4044: lut_data_o <= {16'h8fcc, 8'he4};
            16'd4045: lut_data_o <= {16'h8fcd, 8'h93};
            16'd4046: lut_data_o <= {16'h8fce, 8'hfe};
            16'd4047: lut_data_o <= {16'h8fcf, 8'h74};
            16'd4048: lut_data_o <= {16'h8fd0, 8'h01};
            16'd4049: lut_data_o <= {16'h8fd1, 8'h93};
            16'd4050: lut_data_o <= {16'h8fd2, 8'hf5};
            16'd4051: lut_data_o <= {16'h8fd3, 8'h82};
            16'd4052: lut_data_o <= {16'h8fd4, 8'h8e};
            16'd4053: lut_data_o <= {16'h8fd5, 8'h83};
            16'd4054: lut_data_o <= {16'h8fd6, 8'h22};
            16'd4055: lut_data_o <= {16'h8fd7, 8'h78};
            16'd4056: lut_data_o <= {16'h8fd8, 8'h7f};
            16'd4057: lut_data_o <= {16'h8fd9, 8'he4};
            16'd4058: lut_data_o <= {16'h8fda, 8'hf6};
            16'd4059: lut_data_o <= {16'h8fdb, 8'hd8};
            16'd4060: lut_data_o <= {16'h8fdc, 8'hfd};
            16'd4061: lut_data_o <= {16'h8fdd, 8'h75};
            16'd4062: lut_data_o <= {16'h8fde, 8'h81};
            16'd4063: lut_data_o <= {16'h8fdf, 8'hcd};
            16'd4064: lut_data_o <= {16'h8fe0, 8'h02};
            16'd4065: lut_data_o <= {16'h8fe1, 8'h0c};
            16'd4066: lut_data_o <= {16'h8fe2, 8'h98};
            16'd4067: lut_data_o <= {16'h8fe3, 8'h8f};
            16'd4068: lut_data_o <= {16'h8fe4, 8'h82};
            16'd4069: lut_data_o <= {16'h8fe5, 8'h8e};
            16'd4070: lut_data_o <= {16'h8fe6, 8'h83};
            16'd4071: lut_data_o <= {16'h8fe7, 8'h75};
            16'd4072: lut_data_o <= {16'h8fe8, 8'hf0};
            16'd4073: lut_data_o <= {16'h8fe9, 8'h04};
            16'd4074: lut_data_o <= {16'h8fea, 8'hed};
            16'd4075: lut_data_o <= {16'h8feb, 8'h02};
            16'd4076: lut_data_o <= {16'h8fec, 8'h06};
            16'd4077: lut_data_o <= {16'h8fed, 8'ha5};
            16'd4078: lut_data_o <= {16'h3022, 8'h00};
            16'd4079: lut_data_o <= {16'h3023, 8'h00};
            16'd4080: lut_data_o <= {16'h3024, 8'h00};
            16'd4081: lut_data_o <= {16'h3025, 8'h00};
            16'd4082: lut_data_o <= {16'h3026, 8'h00};
            16'd4083: lut_data_o <= {16'h3027, 8'h00};
            16'd4084: lut_data_o <= {16'h3028, 8'h00};
            16'd4085: lut_data_o <= {16'h3029, 8'h7f};
            16'd4086: lut_data_o <= {16'h3000, 8'h00};
            default: lut_data_o <= {16'h3000, 8'h00};
        endcase
    end

endmodule
