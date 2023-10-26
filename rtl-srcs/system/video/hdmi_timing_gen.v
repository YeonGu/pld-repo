`timescale 1ns / 1ps

////////////////////////////////////English///////////////////////////////////////
// Company:			Disp301 Experiment in SouthEast University
// Engineer:		Erie
//
// Create Date: 	2019/08/25 10:24:35
// Design Name: 	Generate Video Signal
// Module Name: 	Video_Generator_Interface
// Description: 	None
//
// Dependencies: 	None
//
// Version:			V1.5
// Revision Date:	2021/07/12 20:15:48
// History:
// 2019/08/25		V1.0		Create File and Driver_Video module.
// 2019/09/10		V1.1		Add video color bar function, support video 1080p@60Hz output.
// 2019/09/15		V1.2		Increase video pixel coordinate output.
// 2020/03/14		V1.3		Delete the color bar output, move the RGB data output to other modules, this version no longer supports.
// 2020/07/23		V1.4		Increase video multi-format output and selection, support 480*272p to 1920*1080p and many other progressive scan video format output.
// 2021/07/12		V1.5		Renamed to Video_Generator_Interface.
///////////////////////////////////Chinese////////////////////////////////////////
// 版权归属:		东南大学显示中心301实验�?
// �?发人�?:		Erie
//
// 创建日期: 		2019�?08�?25�?
// 设计名称: 		Generate Video Signal
// 模块名称: 		Video_Generator_Interface
// 相关名称: 		None
//
// 依赖资料: 		None
//
// 当前版本:		V1.5
// 修订日期:		2021�?07�?12�?
// 修订历史:
// 2019�?08�?25�?	V1.0		创建文件,编写视频驱动模块(Driver_Video)
// 2019�?09�?10�?	V1.1		增加视频彩条功能,支持视频1080p@60Hz输出
// 2019�?09�?15�?	V1.2		增加视频像素坐标输出
// 2020�?03�?14�?	V1.3		删减彩条输出,将RGB数据输出移至其他模块,此版本不再支�?
// 2020�?07�?23�?	V1.4		增加视频多格式输出及选择,支持480*272p�?1920*1080p等诸多�?�行扫描视频格式输出
// 2021�?07�?12�?	V1.5		更名为Video_Generator_Interface

/*
	Video Format  i_video_mode   i_freq_mode   		i_freq_mode
								   (1'b0)		 	  (1'b1)
	 1920*1080p		3'b000		  60Hz/30Hz          50Hz/25Hz
	 1280*720p      3'b001          60Hz               50Hz
	 1024*768p      3'b010          60Hz               60Hz
	 800*600p       3'b011          60Hz               60Hz
	 800*480p       3'b100          60Hz               60Hz
	 720*480p       3'b101     240Hz/120Hz/60Hz   240Hz/120Hz/60Hz
	 640*480p       3'b110          60Hz               60Hz
	 480*272p       3'b111          60Hz               60Hz
*/

/** HDMI Video Timing Generator **/
module hdmi_timing_gen (
    input       i_clk,         //Clock
    input       i_rstn,        //Reset signal, low reset
    input [2:0] i_video_mode,  //Video format
    input       i_freq_mode,   //Frequency format

    //-------------原始视频信号输出---------------//
    output o_rgb_vde,    //Data valid signal
    output o_rgb_hsync,  //Line signal
    output o_rgb_vsync,  //Field signal

    //实时坐标
    output [11:0] o_set_x,  //Image coordinate X
    output [11:0] o_set_y   //Image coordinate Y
);

    //1920*1080p@60Hz/148.5MHz,30Hz/74.25MHz
    localparam H_ACTIVE_00 = 16'd1920;
    localparam H_FP_00 = 16'd88;
    localparam H_SYNC_00 = 16'd44;
    localparam H_BP_00 = 16'd148;
    localparam V_ACTIVE_00 = 16'd1080;
    localparam V_FP_00 = 16'd4;
    localparam V_SYNC_00 = 16'd5;
    localparam V_BP_00 = 16'd36;
    localparam H_TOTAL_00 = H_ACTIVE_00 + H_FP_00 + H_SYNC_00 + H_BP_00;
    localparam V_TOTAL_00 = V_ACTIVE_00 + V_FP_00 + V_SYNC_00 + V_BP_00;
    localparam HS_POL_00 = 1'b1;
    localparam VS_POL_00 = 1'b1;

    //1920*1080p@50Hz/148.5MHz,25Hz/74.25MHz
    localparam H_FP_01 = 16'd528;
    localparam H_TOTAL_01 = H_ACTIVE_00 + H_FP_01 + H_SYNC_00 + H_BP_00;

    //1280*720p@60Hz/74.25MHz
    localparam H_ACTIVE_10 = 16'd1280;
    localparam H_FP_10 = 16'd110;
    localparam H_SYNC_10 = 16'd40;
    localparam H_BP_10 = 16'd220;
    localparam V_ACTIVE_10 = 16'd720;
    localparam V_FP_10 = 16'd5;
    localparam V_SYNC_10 = 16'd5;
    localparam V_BP_10 = 16'd20;
    localparam H_TOTAL_10 = H_ACTIVE_10 + H_FP_10 + H_SYNC_10 + H_BP_10;
    localparam V_TOTAL_10 = V_ACTIVE_10 + V_FP_10 + V_SYNC_10 + V_BP_10;
    localparam HS_POL_10 = 1'b1;
    localparam VS_POL_10 = 1'b1;

    //1280*720p@50Hz/74.25MHz
    localparam H_FP_11 = 16'd440;
    localparam H_TOTAL_11 = H_ACTIVE_10 + H_FP_11 + H_SYNC_10 + H_BP_10;

    //1024*768p@60Hz/65MHz
    localparam H_ACTIVE_20 = 16'd1024;
    localparam H_FP_20 = 16'd24;
    localparam H_SYNC_20 = 16'd136;
    localparam H_BP_20 = 16'd160;
    localparam V_ACTIVE_20 = 16'd768;
    localparam V_FP_20 = 16'd3;
    localparam V_SYNC_20 = 16'd6;
    localparam V_BP_20 = 16'd29;
    localparam H_TOTAL_20 = H_ACTIVE_20 + H_FP_20 + H_SYNC_20 + H_BP_20;
    localparam V_TOTAL_20 = V_ACTIVE_20 + V_FP_20 + V_SYNC_20 + V_BP_20;
    localparam HS_POL_20 = 1'b0;
    localparam VS_POL_20 = 1'b0;

    //800*600p@60Hz/40MHz
    localparam H_ACTIVE_30 = 16'd800;
    localparam H_FP_30 = 16'd40;
    localparam H_SYNC_30 = 16'd128;
    localparam H_BP_30 = 16'd88;
    localparam V_ACTIVE_30 = 16'd600;
    localparam V_FP_30 = 16'd1;
    localparam V_SYNC_30 = 16'd4;
    localparam V_BP_30 = 16'd23;
    localparam H_TOTAL_30 = H_ACTIVE_30 + H_FP_30 + H_SYNC_30 + H_BP_30;
    localparam V_TOTAL_30 = V_ACTIVE_30 + V_FP_30 + V_SYNC_30 + V_BP_30;
    localparam HS_POL_30 = 1'b1;
    localparam VS_POL_30 = 1'b1;

    //800*480p@60Hz/32MHz
    localparam H_ACTIVE_40 = 16'd800;
    localparam H_FP_40 = 16'd40;
    localparam H_SYNC_40 = 16'd128;
    localparam H_BP_40 = 16'd88;
    localparam V_ACTIVE_40 = 16'd480;
    localparam V_FP_40 = 16'd1;
    localparam V_SYNC_40 = 16'd3;
    localparam V_BP_40 = 16'd21;
    localparam H_TOTAL_40 = H_ACTIVE_40 + H_FP_40 + H_SYNC_40 + H_BP_40;
    localparam V_TOTAL_40 = V_ACTIVE_40 + V_FP_40 + V_SYNC_40 + V_BP_40;
    localparam HS_POL_40 = 1'b0;
    localparam VS_POL_40 = 1'b0;

    //720*480p@240Hz/108MHz,120Hz/54MHz,60Hz/27MHz
    localparam H_ACTIVE_50 = 16'd720;
    localparam H_FP_50 = 16'd16;
    localparam H_SYNC_50 = 16'd62;
    localparam H_BP_50 = 16'd60;
    localparam V_ACTIVE_50 = 16'd480;
    localparam V_FP_50 = 16'd9;
    localparam V_SYNC_50 = 16'd6;
    localparam V_BP_50 = 16'd30;
    localparam H_TOTAL_50 = H_ACTIVE_50 + H_FP_50 + H_SYNC_50 + H_BP_50;
    localparam V_TOTAL_50 = V_ACTIVE_50 + V_FP_50 + V_SYNC_50 + V_BP_50;
    localparam HS_POL_50 = 1'b0;
    localparam VS_POL_50 = 1'b0;

    //640*480p@60Hz/25.175MHz
    localparam H_ACTIVE_60 = 16'd640;
    localparam H_FP_60 = 16'd16;
    localparam H_SYNC_60 = 16'd96;
    localparam H_BP_60 = 16'd48;
    localparam V_ACTIVE_60 = 16'd480;
    localparam V_FP_60 = 16'd10;
    localparam V_SYNC_60 = 16'd2;
    localparam V_BP_60 = 16'd33;
    localparam H_TOTAL_60 = H_ACTIVE_60 + H_FP_60 + H_SYNC_60 + H_BP_60;
    localparam V_TOTAL_60 = V_ACTIVE_60 + V_FP_60 + V_SYNC_60 + V_BP_60;
    localparam HS_POL_60 = 1'b0;
    localparam VS_POL_60 = 1'b0;

    //480*272p@60Hz/9MHz
    localparam H_ACTIVE_70 = 16'd480;
    localparam H_FP_70 = 16'd2;
    localparam H_SYNC_70 = 16'd41;
    localparam H_BP_70 = 16'd2;
    localparam V_ACTIVE_70 = 16'd272;
    localparam V_FP_70 = 16'd2;
    localparam V_SYNC_70 = 16'd10;
    localparam V_BP_70 = 16'd2;
    localparam H_TOTAL_70 = H_ACTIVE_70 + H_FP_70 + H_SYNC_70 + H_BP_70;
    localparam V_TOTAL_70 = V_ACTIVE_70 + V_FP_70 + V_SYNC_70 + V_BP_70;
    localparam HS_POL_70 = 1'b0;
    localparam VS_POL_70 = 1'b0;

    //视频信号参数
    reg [11:0] H_ACTIVE = 0;  //Line effective length (number of pixel clock cycles)
    reg [11:0] H_FP = 0;  //Line sync front shoulder length
    reg [11:0] H_SYNC = 0;  //Line sync length
    reg [11:0] H_BP = 0;  //Line sync shoulder length
    reg [11:0] V_ACTIVE = 0;  //Field effective length (number of rows)
    reg [11:0] V_FP = 0;  //Field sync front shoulder length
    reg [11:0] V_SYNC = 0;  //Field sync length
    reg [11:0] V_BP = 0;  //Field sync back shoulder length
    reg [11:0] H_TOTAL = 0;  //Total length of line
    reg [11:0] V_TOTAL = 0;  //Total length of field
    reg        HS_POL = 0;  //Line effective voltage
    reg        VS_POL = 0;  //Field effective voltage

    //行场信号计数
    reg [11:0] hsync_cnt = 0;
    reg [11:0] vsync_cnt = 0;

    //行�?�场有效信号
    reg        h_de = 0;
    reg        v_de = 0;

    //输出信号
    reg        rgb_hsync_o = 0;
    reg        rgb_vsync_o = 0;
    reg        rgb_vde_o = 0;
    reg [11:0] set_x_o = 0;
    reg [11:0] set_y_o = 0;

    //输出信号连线
    assign o_rgb_hsync = rgb_hsync_o;
    assign o_rgb_vsync = rgb_vsync_o;
    assign o_rgb_vde   = rgb_vde_o;
    assign o_set_x     = set_x_o;
    assign o_set_y     = set_y_o;

    //图像X坐标产生
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) begin
            set_x_o <= 12'd0;
        end else if (hsync_cnt >= H_FP + H_SYNC + H_BP - 1) begin
            set_x_o <= hsync_cnt - (H_FP + H_SYNC + H_BP - 1);  //当行信号有效�?,�?始获取X坐标�?
        end else begin
            set_x_o <= set_x_o;
        end
    end

    //图像Y坐标产生
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) begin
            set_y_o <= 12'd0;
        end else if (vsync_cnt >= V_FP + V_SYNC + V_BP - 1) begin
            set_y_o <= vsync_cnt - (V_FP + V_SYNC + V_BP - 1);  //当场信号有效�?,�?始获取当前Y坐标
        end else begin
            set_y_o <= set_y_o;
        end
    end

    //数据有效信号输出
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) rgb_vde_o <= 1'b0;
        else rgb_vde_o <= h_de & v_de;
    end

    //行信号输�?
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) rgb_hsync_o <= 1'b0;
        else if (hsync_cnt == H_FP - 1) rgb_hsync_o <= HS_POL;
        else if (hsync_cnt == H_FP + H_SYNC - 1) rgb_hsync_o <= ~HS_POL;
        else rgb_hsync_o <= rgb_hsync_o;
    end

    //场信号输�?
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) rgb_vsync_o <= 0;
        else if (hsync_cnt == H_FP - 1 && vsync_cnt == V_FP - 1) rgb_vsync_o <= VS_POL;
        else if (hsync_cnt == H_FP - 1 && vsync_cnt == V_FP + V_SYNC - 1) rgb_vsync_o <= ~VS_POL;
        else rgb_vsync_o <= rgb_vsync_o;
    end

    //视频格式获取
    always @(posedge i_clk) begin
        case ({
            i_video_mode, i_freq_mode
        })
            4'b0000: begin
                H_ACTIVE <= H_ACTIVE_00;
                H_FP     <= H_FP_00;
                H_SYNC   <= H_SYNC_00;
                H_BP     <= H_BP_00;
                H_TOTAL  <= H_TOTAL_00;
                HS_POL   <= HS_POL_00;
                V_ACTIVE <= V_ACTIVE_00;
                V_FP     <= V_FP_00;
                V_SYNC   <= V_SYNC_00;
                V_BP     <= V_BP_00;
                V_TOTAL  <= V_TOTAL_00;
                VS_POL   <= VS_POL_00;
            end
            4'b0001: begin
                H_ACTIVE <= H_ACTIVE_00;
                H_FP     <= H_FP_01;
                H_SYNC   <= H_SYNC_00;
                H_BP     <= H_BP_00;
                H_TOTAL  <= H_TOTAL_01;
                HS_POL   <= HS_POL_00;
                V_ACTIVE <= V_ACTIVE_00;
                V_FP     <= V_FP_00;
                V_SYNC   <= V_SYNC_00;
                V_BP     <= V_BP_00;
                V_TOTAL  <= V_TOTAL_00;
                VS_POL   <= VS_POL_00;
            end
            4'b0010: begin
                H_ACTIVE <= H_ACTIVE_10;
                H_FP     <= H_FP_10;
                H_SYNC   <= H_SYNC_10;
                H_BP     <= H_BP_10;
                H_TOTAL  <= H_TOTAL_10;
                HS_POL   <= HS_POL_10;
                V_ACTIVE <= V_ACTIVE_10;
                V_FP     <= V_FP_10;
                V_SYNC   <= V_SYNC_10;
                V_BP     <= V_BP_10;
                V_TOTAL  <= V_TOTAL_10;
                VS_POL   <= VS_POL_10;
            end
            4'b0011: begin
                H_ACTIVE <= H_ACTIVE_10;
                H_FP     <= H_FP_11;
                H_SYNC   <= H_SYNC_10;
                H_BP     <= H_BP_10;
                H_TOTAL  <= H_TOTAL_11;
                HS_POL   <= HS_POL_10;
                V_ACTIVE <= V_ACTIVE_10;
                V_FP     <= V_FP_10;
                V_SYNC   <= V_SYNC_10;
                V_BP     <= V_BP_10;
                V_TOTAL  <= V_TOTAL_10;
                VS_POL   <= VS_POL_10;
            end
            4'b0100, 4'b0101: begin
                H_ACTIVE <= H_ACTIVE_20;
                H_FP     <= H_FP_20;
                H_SYNC   <= H_SYNC_20;
                H_BP     <= H_BP_20;
                H_TOTAL  <= H_TOTAL_20;
                HS_POL   <= HS_POL_20;
                V_ACTIVE <= V_ACTIVE_20;
                V_FP     <= V_FP_20;
                V_SYNC   <= V_SYNC_20;
                V_BP     <= V_BP_20;
                V_TOTAL  <= V_TOTAL_20;
                VS_POL   <= VS_POL_20;
            end
            4'b0110, 4'b0111: begin
                H_ACTIVE <= H_ACTIVE_30;
                H_FP     <= H_FP_30;
                H_SYNC   <= H_SYNC_30;
                H_BP     <= H_BP_30;
                H_TOTAL  <= H_TOTAL_30;
                HS_POL   <= HS_POL_30;
                V_ACTIVE <= V_ACTIVE_30;
                V_FP     <= V_FP_30;
                V_SYNC   <= V_SYNC_30;
                V_BP     <= V_BP_30;
                V_TOTAL  <= V_TOTAL_30;
                VS_POL   <= VS_POL_30;
            end
            4'b1000, 4'b1001: begin
                H_ACTIVE <= H_ACTIVE_40;
                H_FP     <= H_FP_40;
                H_SYNC   <= H_SYNC_40;
                H_BP     <= H_BP_40;
                H_TOTAL  <= H_TOTAL_40;
                HS_POL   <= HS_POL_40;
                V_ACTIVE <= V_ACTIVE_40;
                V_FP     <= V_FP_40;
                V_SYNC   <= V_SYNC_40;
                V_BP     <= V_BP_40;
                V_TOTAL  <= V_TOTAL_40;
                VS_POL   <= VS_POL_40;
            end
            4'b1010, 4'b1011: begin
                H_ACTIVE <= H_ACTIVE_50;
                H_FP     <= H_FP_50;
                H_SYNC   <= H_SYNC_50;
                H_BP     <= H_BP_50;
                H_TOTAL  <= H_TOTAL_50;
                HS_POL   <= HS_POL_50;
                V_ACTIVE <= V_ACTIVE_50;
                V_FP     <= V_FP_50;
                V_SYNC   <= V_SYNC_50;
                V_BP     <= V_BP_50;
                V_TOTAL  <= V_TOTAL_50;
                VS_POL   <= VS_POL_50;
            end
            4'b1100, 4'b1101: begin
                H_ACTIVE <= H_ACTIVE_60;
                H_FP     <= H_FP_60;
                H_SYNC   <= H_SYNC_60;
                H_BP     <= H_BP_60;
                H_TOTAL  <= H_TOTAL_60;
                HS_POL   <= HS_POL_60;
                V_ACTIVE <= V_ACTIVE_60;
                V_FP     <= V_FP_60;
                V_SYNC   <= V_SYNC_60;
                V_BP     <= V_BP_60;
                V_TOTAL  <= V_TOTAL_60;
                VS_POL   <= VS_POL_60;
            end
            4'b1110, 4'b1111: begin
                H_ACTIVE <= H_ACTIVE_70;
                H_FP     <= H_FP_70;
                H_SYNC   <= H_SYNC_70;
                H_BP     <= H_BP_70;
                H_TOTAL  <= H_TOTAL_70;
                HS_POL   <= HS_POL_70;
                V_ACTIVE <= V_ACTIVE_70;
                V_FP     <= V_FP_70;
                V_SYNC   <= V_SYNC_70;
                V_BP     <= V_BP_70;
                V_TOTAL  <= V_TOTAL_70;
                VS_POL   <= VS_POL_70;
            end
            default: begin
                H_ACTIVE <= H_ACTIVE_00;
                H_FP     <= H_FP_00;
                H_SYNC   <= H_SYNC_00;
                H_BP     <= H_BP_00;
                H_TOTAL  <= H_TOTAL_00;
                HS_POL   <= HS_POL_00;
                V_ACTIVE <= V_ACTIVE_00;
                V_FP     <= V_FP_00;
                V_SYNC   <= V_SYNC_00;
                V_BP     <= V_BP_00;
                V_TOTAL  <= V_TOTAL_00;
                VS_POL   <= VS_POL_00;
            end
        endcase
    end

    //行信号有效输�?
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) h_de <= 1'b0;
        else if (hsync_cnt == H_FP + H_SYNC + H_BP - 1) h_de <= 1'b1;
        else if (hsync_cnt == H_TOTAL - 1) h_de <= 1'b0;
        else h_de <= h_de;
    end

    //场信号有效输�?
    always @(posedge i_clk or negedge i_rstn) begin
        if (i_rstn == 1'b0) v_de <= 1'b0;
        else if (hsync_cnt == H_FP - 1 && vsync_cnt == V_FP + V_SYNC + V_BP - 1) v_de <= 1'b1;
        else if (hsync_cnt == H_FP - 1 && vsync_cnt == V_TOTAL - 1) v_de <= 1'b0;
        else v_de <= v_de;
    end

    wire debug_reset, debug_near_end, debug_end;
    assign debug_reset    = (hsync_cnt == H_TOTAL - 3) && (vsync_cnt == 0);
    assign debug_near_end = (hsync_cnt == H_TOTAL - 2) && (vsync_cnt == 0);
    assign debug_end      = (hsync_cnt == H_TOTAL - 1) && (vsync_cnt == 0);
    reg  [24:0] test_delay = 0;
    wire        delay;
    assign delay = test_delay[0];

    /** DEBUG only **/
    always @(posedge i_clk) begin
        if (debug_near_end) begin
            test_delay <= 1;
        end else begin
            test_delay <= {test_delay[24:1], 1'b0};
        end
    end

    always @(posedge i_clk or negedge i_rstn) begin
        if ((i_rstn == 1'b0)) hsync_cnt <= 12'd0;
        else if (~delay && debug_end) hsync_cnt <= hsync_cnt;
        else if (hsync_cnt == H_TOTAL - 1) hsync_cnt <= 12'd0;
        else hsync_cnt <= hsync_cnt + 12'd1;
    end

    always @(posedge i_clk or negedge i_rstn) begin
        if ((i_rstn == 1'b0)) vsync_cnt <= 12'd0;
        else if (~delay && debug_end) vsync_cnt <= vsync_cnt;
        else if (hsync_cnt == H_FP - 1 && vsync_cnt == V_TOTAL - 1) vsync_cnt <= 12'd0;
        else if (hsync_cnt == H_FP - 1) vsync_cnt <= vsync_cnt + 12'd1;
        else vsync_cnt <= vsync_cnt;
    end

endmodule
