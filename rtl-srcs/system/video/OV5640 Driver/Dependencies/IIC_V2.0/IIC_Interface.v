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
// ��Ȩ����:		���ϴ�ѧ��ʾ����301ʵ����
// ������Ա:		Erie
// 
// ��������: 		2019��10��07��
// �������: 		IIC Driver
// ģ������: 		IIC_Interface
// �������: 		None
// 
// ��������: 		None
//
// ����ģ��:
// 	  ģ������						 �汾
// Clock_Interface					 V2.3
//
// ��ǰ�汾:		V2.0
// �޶�����:		2021��10��16��
// �޶���ʷ:
//		ʱ��			�汾		�޶���				�޶�����	
// 2019��10��07��		V1.0		 Erie		�����ļ�,��дIIC����ģ��(Driver_IIC)
// 2019��10��08��		V1.1		 Erie		��дIIC����,֧�ֵ���ַ��д
// 2019��10��16��		V1.2		 Erie		�޸���д�����źų�ͻ����
// 2020��04��24��		V1.3		 Erie		�Ż�ʱ��,����˫��ַ��дģʽ
// 2020��07��18��		V1.4		 Erie		����ΪDriver_Master_IIC,����IICƵ�ʵ��ڲ���
// 2020��08��02��		V1.5		 Erie		���Ӷ�Ӧ���źſ�ѡ,1Ϊ��Ӧ��NACK,0ΪӦ��ACK
// 2021��10��16��		V2.0		 Erie		����ΪIIC_Interface,���Ӷ�дӦ��У��/����д/�������Ĺ���֧��

//IIC�ӿ�
module IIC_Interface
#(
	parameter CLOCK_FREQ_MHZ 	= 13'd100,                                                                                                                       
	parameter IIC_Clock_KHz 	= 13'd100
)
(
	input i_clk,
	input i_rstn,
	
	//-------------�ⲿ�����ź�-------------//
	//����ģʽ�ź�
	input i_mbus_rwslave_addr_mode,			//����IIC�ӻ���ַģʽ,1'b0����ԭʼ��ַ,��Ҫ����7λ,��λ����;1'b1������λ֮���ַ,����Ҫ����λ
	input i_mbus_rwaddr_mode,				//����IIC��д��ַģʽ,1'b1����˫��ַλ;1'b0������ַλ,��ʱ��λ��ַ��Ч
	input i_mbus_rack,			            //����IIC��Ӧ���ź�,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	input i_mbus_wack_enable,				//����IICдӦ����У��ʹ��
	input i_mbus_wack,			        	//����IICдӦ���ź�У��ֵ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	input i_mbus_rwmode,					//����IIC��д����ģʽ,1'b1�����ֽڶ�д;1'b0����������д
	
	//���������ź�
	input [7:0]i_mbus_rwslave_addr,			//����IIC��д�ӻ���ַ
	input [7:0]i_mbus_rwaddr_h,				//����IIC��д�Ĵ�����ַ,��8λ
	input [7:0]i_mbus_rwaddr_l,				//����IIC��д�Ĵ�����ַ,��8λ
	
	//дͨ��
	input i_mbus_wrq,						//д����,�ߵ�ƽ��Ч
	input [7:0]i_mbus_wdata,				//д����
	input i_mbus_wvalid,					//д������Ч�ź�
	input i_mbus_wlast,						//д���һ��
	output o_mbus_wready,					//д׼�����ź�
	
	//��ͨ��
	input i_mbus_rrq,						//������,�ߵ�ƽ��Ч
	input i_mbus_rready,					//��׼����
	input i_mbus_rlast,						//�����һ��
	output [7:0]o_mbus_rdata,				//������
	output o_mbus_rvalid,					//��������Ч�ź�
	
	//æͨ��
	output o_mbus_rwbusy,					//��дæ�ź�,�ߵ�ƽ����æµ,�͵�ƽ�������
	output o_mbus_rwack_err,				//Ӧ�����
	
	//--------------IIC�ܽ��ź�-------------//
	input i_iic_sda,						//IIC����SDA�����ź�
	output o_iic_scl,						//IIC���SCLʱ���ź�
	output o_iic_sda,						//IIC���SDA�����ź�
	output o_iic_sda_dir					//IIC���SDA�źŷ���
);

	//----------------IICʱ�Ӳ���---------------//
	localparam CLOCK_FACTOR = (CLOCK_FREQ_MHZ * 500) / (IIC_Clock_KHz);			//ʱ�ӷ�Ƶϵ��,��Ƶһ��
	localparam FACTOR_BIT = 5'd16;
	localparam CLOCK_MODE = 1'b1;												//ʱ�ӷ�Ƶģʽ,0Ϊ����ʱ��;1Ϊ����ʱ��
	localparam NEGEDGE_ENABLE = 1'b0;											//��ʱ���½��ط�ת���ʹ��,0Ϊ���������(������Ƶ����ʱ�ӻ����һ����ʱ��ƫ��);1Ϊ�������(50%ռ�ձȷ���ʱ��)
	localparam DIVIDER_MODE = {1'b0,~CLOCK_FACTOR[0],CLOCK_FACTOR[0],1'b0};		//��Ƶģʽ,4'bxxx1����������Ƶ;4'bxx10����������Ƶ;4'bx100����ż����Ƶ;4'b1000����С����Ƶ
	
	//------------------״̬����----------------//
	localparam ST_IDLE = 0;
	localparam ST_WR_WAIT = 1;
	localparam ST_RD_ADDR = 2;
	localparam ST_RD_START = 3;
	localparam ST_RD_DATA = 4;
	localparam ST_RD_WAIT = 5;
	localparam ST_END = 6;
	
	//------------ʵ����ģ��ӿ��ź�------------//
	//���Ϳ���ģ��
	reg [1:0]wr_mbus_wslave_addr_mode = 0;
	reg [3:0]wr_mbus_wmode = 0;
	reg wr_mbus_wrq = 0;
	wire wr_mbus_werr;
	wire wr_mbus_wbusy;
		
	//��������ģ��--����ͨ��
	reg rd_dbus_rstop = 0;
	
	//��������ģ��--��ͨ��
	reg rd_dbus_rrq = 0;
	reg rd_dbus_rlast = 0;
	wire [7:0]rd_dbus_rdata;
	wire rd_dbus_rvalid;
	wire rd_dbus_rbusy;
	
	//��������ģ��--�ܽ��ź�
	wire rd_dbus_iic_sda;
	wire rd_dbus_iic_sda_dir;

	//��������ģ��--����ͨ��
	wire wr_dbus_wstart;
	wire wr_dbus_wstop_is;
	wire wr_dbus_wchange;
	
	//��������ģ��--дӦ��
	wire wr_dbus_wack_sel;
	wire wr_dbus_wack;
	
	//��������ģ��--дͨ��
	wire wr_dbus_wrq;
	wire [7:0]wr_dbus_wdata;
	wire wr_dbus_wvalid;
	wire wr_dbus_wlast;
	wire wr_dbus_wready;
	wire wr_dbus_wstop;
	wire wr_dbus_wbusy;
	
	//��������ģ��--�ܽ��ź�
	wire wr_dbus_iic_sda;
	wire wr_dbus_iic_sda_dir;
	
	//------------------ʱ���ź�----------------//
	//IICʱ���ź�
	wire clk_IIC;
	reg [1:0]clk_IIC_buffer = 0;
	
	//------------------��־�ź�----------------//
	wire flag_scl_hs;							//SCL����ʼ��־,δ�õ�
	wire flag_scl_hc;							//SCL�����ı�־
	wire flag_scl_ls;							//SCL����ʼ��־,δ�õ�
	wire flag_scl_lc;							//SCL�����ı�־
	
	//״̬��
	reg [2:0]state_current = 0;
	reg [2:0]state_next = 0;
	
	//----------------���������ź�--------------//
	reg [1:0]wr_mbus_wbusy_buff = 0;
	reg [1:0]rd_dbus_rbusy_buff = 0;
	
	//----------------���뻺���ź�--------------//
	//����ģ���ź�
	reg mbus_rwmode_i = 0;
	
	//�ⲿ�����ź�--��ͨ��
	reg mbus_rready_i = 0;
	reg mbus_rlast_i = 0;
	
	//------------------����ź�----------------//
	//�ⲿ�����ź�--æͨ��
	reg mbus_rwbusy_o = 0;
	
	//�ܽ��ź�
	reg iic_scl_o = 1'b1;
	reg iic_sda_o = 1'b1;
	reg iic_sda_dir_o = 0;
	
	//----------------��־�ź�����--------------//
	assign flag_scl_hs = (clk_IIC_buffer == 2'b01) && (iic_scl_o == 1'b0);		//SCL����ʼ��־,δ�õ�
	assign flag_scl_hc = (clk_IIC_buffer == 2'b10) && (iic_scl_o == 1'b1);		//SCL�����ı�־
	assign flag_scl_ls = (clk_IIC_buffer == 2'b01) && (iic_scl_o == 1'b1);		//SCL����ʼ��־,δ�õ�
	assign flag_scl_lc = (clk_IIC_buffer == 2'b10) && (iic_scl_o == 1'b0);		//SCL�����ı�־
	
	//----------------����ź�����--------------//
	//�ⲿ�����ź�--��ͨ��
	assign o_mbus_rdata = rd_dbus_rdata;
	assign o_mbus_rvalid = rd_dbus_rvalid;

	//�ⲿ�����ź�--æͨ��
	assign o_mbus_rwbusy = mbus_rwbusy_o;
	assign o_mbus_rwack_err = wr_mbus_werr;
	
	//�ܽ��ź�
	assign o_iic_scl = iic_scl_o;
	assign o_iic_sda = iic_sda_o;
	assign o_iic_sda_dir = iic_sda_dir_o;
	
	//----------------�ź��������--------------//
	//�ⲿ�����ź�--æͨ��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rwbusy_o <= 1'b0;
		else if(state_current == ST_IDLE)mbus_rwbusy_o <= i_mbus_wrq | i_mbus_rrq;
		else if(state_current == ST_END)mbus_rwbusy_o <= 1'b0;
		else mbus_rwbusy_o <= mbus_rwbusy_o;
	end
	
	//IICʱ�����
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_scl_o <= 1'b1;
		else if(clk_IIC_buffer == 2'b01)iic_scl_o <= ~iic_scl_o;
		else iic_scl_o <= iic_scl_o;
	end
	
	//IIC���������
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			iic_sda_o <= 1'b1;
			iic_sda_dir_o <= 1'b1;
		end else begin
			iic_sda_o <= wr_dbus_iic_sda & rd_dbus_iic_sda;
			iic_sda_dir_o <= wr_dbus_iic_sda_dir & rd_dbus_iic_sda_dir;
		end
	end
	
	//-------------------״̬��----------------//
	//��״̬��
	always@(*)begin
		case(state_current)
			ST_IDLE:begin
				if(i_mbus_wrq == 1'b1)state_next <= ST_WR_WAIT;
				else if(i_mbus_rrq == 1'b1 && mbus_rwmode_i == 1'b1)state_next <= ST_RD_ADDR;	//���ֽڶ�ȡ,Random Read
				else if(i_mbus_rrq == 1'b1)state_next <= ST_RD_START;							//������ȡ,Ҳ�ɶ�ȡ��ǰ��ַ1�ֽ�
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
				if(rd_dbus_rbusy_buff == 2'b10)state_next <= ST_END;			//�����ݽ���
				else state_next <= ST_RD_WAIT;
			end
			ST_END:state_next <= ST_IDLE;
			default:state_next <= ST_IDLE;
		endcase
	end
	
	//״̬ת��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------״̬������-------------//
	//IICд����--���ôӻ���ַģʽ
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)wr_mbus_wslave_addr_mode <= 2'd0;
		else if(state_current == ST_RD_START)wr_mbus_wslave_addr_mode <= {1'b1,i_mbus_rwslave_addr_mode};
		else wr_mbus_wslave_addr_mode <= {1'b0,i_mbus_rwslave_addr_mode};
	end
	
	//IICд����--����д����ģʽ
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)wr_mbus_wmode <= 4'd0;
		else if(state_current == ST_RD_ADDR)wr_mbus_wmode <= 4'b1000;
		else if(state_current == ST_RD_START)wr_mbus_wmode <= 4'b0100;
		else wr_mbus_wmode <= {2'd0,~mbus_rwmode_i,mbus_rwmode_i};
	end
	
	//IICд����--д�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)wr_mbus_wrq <= 1'b0;
		else if(wr_mbus_wbusy_buff[0] == 1'b1 || wr_mbus_wbusy_buff[1] == 1'b1)wr_mbus_wrq <= 1'b0;
		else if(state_current == ST_WR_WAIT)wr_mbus_wrq <= 1'b1;
		else if(state_current == ST_RD_ADDR)wr_mbus_wrq <= 1'b1;
		else if(state_current == ST_RD_START)wr_mbus_wrq <= 1'b1;
		else wr_mbus_wrq <= 1'b0;
	end
	
	//������--ֹͣ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)rd_dbus_rstop <= 1'b0;
		else if(state_current == ST_RD_WAIT)rd_dbus_rstop <= 1'b1;
		else rd_dbus_rstop <= 1'b0;
	end
	
	//������--�������ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)rd_dbus_rrq <= 1'b0;
		else if(state_current == ST_RD_DATA)rd_dbus_rrq <= 1'b1;
		else rd_dbus_rrq <= 1'b0;
	end
	
	//������--�����һ�������ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)rd_dbus_rlast <= 1'b0;
		else if(state_current == ST_RD_WAIT)rd_dbus_rlast <= 1'b1;
		else rd_dbus_rlast <= 1'b0;
	end
		
	//IICд������ʵ����
	IIC_Write_Ctrl IIC_Write_Ctrl_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),

		//------------�ⲿ�����ź�----------//
		//����ģʽ�ź�
		.i_mbus_wslave_addr_mode(wr_mbus_wslave_addr_mode),	//����IIC�ӻ���ַģʽ,2'bx0����ԭʼ��ַ,��Ҫ����7λ,��λ����;2'bx1������λ֮���ַ,����Ҫ����λ;2'b1x�����ַ���λ��Ҫ��1
		.i_mbus_waddr_mode(i_mbus_rwaddr_mode),				//����IICд��ַģʽ,1'b1����˫��ַλ;1'b0������ַλ,��ʱ��λ��ַ��Ч
		.i_mbus_wack_enable(i_mbus_wack_enable),			//����IICдӦ����У��ʹ��
		.i_mbus_wack(i_mbus_wack),			        		//����IICдӦ���ź�У��ֵ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
		.i_mbus_wmode(wr_mbus_wmode),						//����IICд����ģʽ,4'bxxx1�����ֽ�д;4'bxx10��������д;4'bx100����ֻд������ַ;4'b1000����д��������ַ�ͼĴ�����ַ

		//���������ź�
		.i_mbus_wslave_addr(i_mbus_rwslave_addr),			//����IICд�ӻ���ַ
		.i_mbus_waddr_h(i_mbus_rwaddr_h),					//����IICд�Ĵ�����ַ,��8λ
		.i_mbus_waddr_l(i_mbus_rwaddr_l),					//����IICд�Ĵ�����ַ,��8λ
		
		//дͨ��
		.i_mbus_wrq(wr_mbus_wrq),							//д�����ź�,�ߵ�ƽ��Ч
		.i_mbus_wdata(i_mbus_wdata),						//д�����ź�
		.i_mbus_wvalid(i_mbus_wvalid),						//д������Ч�ź�
		.i_mbus_wlast(i_mbus_wlast),						//д�������һ��
		.o_mbus_wready(o_mbus_wready),						//д׼����
		.o_mbus_werr(wr_mbus_werr),							//д����,û����Ӧֹͣ�ź�,������Ч,����һ������ʱ�Զ���λ�͵�ƽ
		.o_mbus_wbusy(wr_mbus_wbusy),						//дæµ
		
		//------------��������ź�----------//
		//����ͨ��
		.o_dbus_wstart(wr_dbus_wstart),						//������ʼ�ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.o_dbus_wstop(wr_dbus_wstop_is),					//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.o_dbus_wchange(wr_dbus_wchange),					//�л�
		
		//дӦ��
		.o_dbus_wack_sel(wr_dbus_wack_sel),					//����Ӧ���ź��ж�,�ߵ�ƽ������;�͵�ƽ������
		.o_dbus_wack(wr_dbus_wack),							//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
		
		//дͨ��
		.o_dbus_wrq(wr_dbus_wrq),							//д�����ź�,�ߵ�ƽ��Ч
		.o_dbus_wdata(wr_dbus_wdata),						//д����
		.o_dbus_wvalid(wr_dbus_wvalid),						//д������Ч
		.o_dbus_wlast(wr_dbus_wlast),						//д�������һ��
		.i_dbus_wready(wr_dbus_wready),						//д׼����
		.i_dbus_wstop(wr_dbus_wstop),						//û����Ӧֹͣ�ź�,������Ч,����һ������ʱ�Զ���λ�͵�ƽ
		.i_dbus_wbusy(wr_dbus_wbusy)						//дæµ
	);

	//IICд����ʵ����
	IIC_Write_Data IIC_Write_Data_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------�����ź�------------//
		//����ͨ��
		.i_mbus_wstart(wr_dbus_wstart),						//������ʼ�ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.i_mbus_wstop(wr_dbus_wstop_is),					//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.i_mbus_wchange(wr_dbus_wchange),					//�л�
		.i_mbus_whc(flag_scl_hc),							//дʱ�Ӹߵ�ƽ����
		.i_mbus_wlc(flag_scl_lc),							//дʱ�ӵ͵�ƽ����
		
		//дӦ��
		.i_mbus_wack_sel(wr_dbus_wack_sel),					//����Ӧ���ź��ж�,�ߵ�ƽ������;�͵�ƽ������
		.i_mbus_wack(wr_dbus_wack),							//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
		
		//дͨ��
		.i_mbus_wrq(wr_dbus_wrq),							//д�����ź�,�ߵ�ƽ��Ч
		.i_mbus_wdata(wr_dbus_wdata),						//д����
		.i_mbus_wvalid(wr_dbus_wvalid),						//д������Ч
		.i_mbus_wlast(wr_dbus_wlast),						//д�������һ��
		.o_mbus_wready(wr_dbus_wready),						//д׼����
		.o_mbus_wstop(wr_dbus_wstop),						//û����Ӧֹͣ�ź�,������Ч,����һ������ʱ�Զ���λ�͵�ƽ
		.o_mbus_wbusy(wr_dbus_wbusy),						//дæµ
		
		//--------------�ܽ��ź�------------//
		.i_iic_sda(i_iic_sda),								//IIC����SDA�����ź�
		.o_iic_sda(wr_dbus_iic_sda),						//IIC���SDA�����ź�
		.o_iic_sda_dir(wr_dbus_iic_sda_dir)					//IIC���SDA�źŷ���
	);

	//IIC������ģ��ʵ����
	IIC_Read_Data IIC_Read_Data_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------�����ź�------------//
		//����ͨ��
		.i_mbus_rstop(rd_dbus_rstop),						//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.i_mbus_rhc(flag_scl_hc),							//��ʱ�Ӹߵ�ƽ����
		.i_mbus_rlc(flag_scl_lc),							//��ʱ�ӵ͵�ƽ����
		
		//��Ӧ��
		.i_mbus_rack(i_mbus_rack),							//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
		
		//��ͨ��
		.i_mbus_rrq(rd_dbus_rrq),							//�������ź�,�ߵ�ƽ��Ч
		.i_mbus_rlast(rd_dbus_rlast),						//���������һ��
		.i_mbus_rready(i_mbus_rready),						//��׼����
		.o_mbus_rdata(rd_dbus_rdata),						//������
		.o_mbus_rvalid(rd_dbus_rvalid),						//��������Ч
		.o_mbus_rbusy(rd_dbus_rbusy),						//��æµ
		
		//--------------�ܽ��ź�------------//
		.i_iic_sda(i_iic_sda),								//IIC����SDA�����ź�
		.o_iic_sda(rd_dbus_iic_sda),						//IIC���SDA�����ź�
		.o_iic_sda_dir(rd_dbus_iic_sda_dir)					//IIC���SDA�źŷ���
	);

	//IICʱ�Ӳ���
	Clock_Interface	#(	.FACTOR_BIT(FACTOR_BIT),.CLOCK_MODE(CLOCK_MODE),
						.NEGEDGE_ENABLE(NEGEDGE_ENABLE),.DIVIDER_MODE(DIVIDER_MODE))Clock_Interface_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//------------ʱ�����ͨ��----------//
		.o_clk_out(clk_IIC),
		.o_clk_ls(),						//����ʱ�ӵĵ͵�ƽ��ʼλ��,һ����׼clock����
		.o_clk_lc(),						//����ʱ�ӵĵ͵�ƽ����λ��,һ����׼clock����
		.o_clk_hs(),						//����ʱ�ӵĸߵ�ƽ��ʼλ��,һ����׼clock����
		.o_clk_hc(),						//����ʱ�ӵĸߵ�ƽ����λ��,һ����׼clock����
	
		//------------��Ƶ����ͨ��----------//
		.i_clk_dividend(CLOCK_FACTOR),		//����/����/ż����Ƶģʽ����Ϊ��Ƶϵ��;С����Ƶģʽ����Ϊ������
		.i_clk_divisor(0),					//����/����/ż����Ƶģʽ�²�ʹ��;С����Ƶģʽ����Ϊ����
		.i_clk_quotient(0),					//����/����/ż����Ƶģʽ�²�ʹ��;С����Ƶģʽ����Ϊ��
		.i_clk_remainder(0)					//����/����/ż����Ƶģʽ�²�ʹ��;С����Ƶģʽ����Ϊ����
	);
	
	//----------------�����źŻ���-------------//
	//IICʱ���ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			clk_IIC_buffer <= 2'd0;
		end else begin
			clk_IIC_buffer <= {clk_IIC_buffer[0],clk_IIC};
		end
	end
	
	//æ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			wr_mbus_wbusy_buff <= 2'd0;
			rd_dbus_rbusy_buff <= 2'd0;
		end else begin
			wr_mbus_wbusy_buff <= {wr_mbus_wbusy_buff[0],wr_mbus_wbusy};
			rd_dbus_rbusy_buff <= {rd_dbus_rbusy_buff[0],rd_dbus_rbusy};
		end
	end

	//----------------�����źŻ���-------------//
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

//IICд����
module IIC_Write_Ctrl
(
	input i_clk,
	input i_rstn,
	
	//------------�ⲿ�����ź�----------//
	//����ģʽ�ź�
	input [1:0]i_mbus_wslave_addr_mode,	//����IIC�ӻ���ַģʽ,2'bx0����ԭʼ��ַ,��Ҫ����7λ,��λ����;2'bx1������λ֮���ַ,����Ҫ����λ;2'b1x�����ַ���λ��Ҫ��1
	input i_mbus_waddr_mode,			//����IICд��ַģʽ,1'b1����˫��ַλ;1'b0������ַλ,��ʱ��λ��ַ��Ч
	input i_mbus_wack_enable,			//����IICдӦ����У��ʹ��
	input i_mbus_wack,			        //����IICдӦ���ź�У��ֵ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	input [3:0]i_mbus_wmode,			//����IICд����ģʽ,4'bxxx1�����ֽ�д;4'bxx10��������д;4'bx100����ֻд������ַ;4'b1000����д��������ַ�ͼĴ�����ַ;
	
	//���������ź�
	input [7:0]i_mbus_wslave_addr,		//����IICд�ӻ���ַ
	input [7:0]i_mbus_waddr_h,			//����IICд�Ĵ�����ַ,��8λ
	input [7:0]i_mbus_waddr_l,			//����IICд�Ĵ�����ַ,��8λ
	
	//дͨ��
	input i_mbus_wrq,					//д�����ź�,�ߵ�ƽ��Ч
	input [7:0]i_mbus_wdata,			//д�����ź�
	input i_mbus_wvalid,				//д������Ч�ź�
	input i_mbus_wlast,					//д�������һ��
	output o_mbus_wready,				//д׼����
	output o_mbus_werr,					//д����,û����Ӧֹͣ�ź�,������Ч,����һ������ʱ�Զ���λ�͵�ƽ
	output o_mbus_wbusy,				//дæµ
	
	//------------��������ź�----------//
	//����ͨ��
	output o_dbus_wstart,				//������ʼ�ź�,�ߵ�ƽ������;�͵�ƽ����û��
	output o_dbus_wstop,				//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
	output o_dbus_wchange,				//�л�
	
	//дӦ��
	output o_dbus_wack_sel,				//����Ӧ���ź��ж�,�ߵ�ƽ������;�͵�ƽ������
	output o_dbus_wack,					//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	
	//дͨ��
	output o_dbus_wrq,					//д�����ź�,�ߵ�ƽ��Ч
	output [7:0]o_dbus_wdata,			//д����
	output o_dbus_wvalid,				//д������Ч
	output o_dbus_wlast,				//д�������һ��
	input i_dbus_wready,				//д׼����
	input i_dbus_wstop,					//û����Ӧֹͣ�ź�,������Ч,����һ������ʱ�Զ���λ�͵�ƽ
	input i_dbus_wbusy					//дæµ
);
	//------------------״̬����----------------//
	localparam ST_WR_IDLE = 7'b0000001;
	localparam ST_WR_SADDR = 7'b0000010;
	localparam ST_WR_ADDR_H = 7'b0000100;
	localparam ST_WR_ADDR_L = 7'b0001000;
	localparam ST_WR_DATA = 7'b0010000;
	localparam ST_WR_WAIT = 7'b0100000;
	localparam ST_WR_END = 7'b1000000;
	
	//״̬��
	reg [6:0]state_current = ST_WR_IDLE;
	reg [6:0]state_next = ST_WR_IDLE;
	
	//----------------���뻺���ź�--------------//
	//�ⲿ�����ź�--����ģʽ�ź�
	reg mbus_waddr_mode_i = 0;
	reg [3:0]mbus_wmode_i = 0;
	
	//�ⲿ�����ź�--���������ź�
	reg [7:0]mbus_wslave_addr_i = 0;
	reg [7:0]mbus_waddr_h_i = 0;
	reg [7:0]mbus_waddr_l_i = 0;
	
	//�ⲿ�����ź�--дͨ��
	reg [7:0]mbus_wdata_i = 0;
	reg mbus_wvalid_i = 0;
	reg mbus_wlast_i = 0;
	
	//��������ź�--дͨ��
	reg [1:0]dbus_wready_i = 0;
	reg dbus_wstop_i = 0;
	reg [1:0]dbus_wbusy_i = 0;
	
	//------------------����ź�---------------//
	//�ⲿ�����ź�--дͨ��
	reg mbus_wready_o = 0;
	reg mbus_werr_o = 0;
	reg mbus_wbusy_o = 0;
	
	//��������ź�--����ͨ��
	reg dbus_wstart_o = 0;
	reg dbus_wstop_o = 0;
	reg dbus_wchange_o = 0;
	
	//��������ź�--дͨ��
	reg dbus_wrq_o = 0;
	reg [7:0]dbus_wdata_o = 0;
	reg dbus_wvalid_o = 0;
	reg dbus_wlast_o = 0;
	
	//----------------����ź�����-------------//
	//�ⲿ�����ź�--дͨ��
	assign o_mbus_wready = mbus_wready_o;
	assign o_mbus_werr = mbus_werr_o;
	assign o_mbus_wbusy = mbus_wbusy_o;
	
	//��������ź�--����ͨ��
	assign o_dbus_wstart = dbus_wstart_o;
	assign o_dbus_wstop = dbus_wstop_o;
	assign o_dbus_wchange = dbus_wchange_o;
	
	//��������ź�--дӦ��
	assign o_dbus_wack_sel = i_mbus_wack_enable;
	assign o_dbus_wack = i_mbus_wack;
	
	//��������ź�--дͨ��
	assign o_dbus_wrq = dbus_wrq_o;
	assign o_dbus_wdata = dbus_wdata_o;
	assign o_dbus_wvalid = dbus_wvalid_o;
	assign o_dbus_wlast = dbus_wlast_o;
	
	//------------------�ź����---------------//
	//д׼�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wready_o <= 1'b0;
		else if(state_current == ST_WR_DATA)mbus_wready_o <=  dbus_wready_i[0] | dbus_wready_i[1];
		else mbus_wready_o <= 1'b0;
	end
	
	//д����Ӧֹͣ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_werr_o <= 1'b0;
		else if(dbus_wbusy_i == 2'b10 && dbus_wstop_i == 1'b1)mbus_werr_o <= 1'b1;
		else if(state_current == ST_WR_SADDR)mbus_werr_o <= 1'b0;
		else mbus_werr_o <= mbus_werr_o;
	end
	
	//дæ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_END)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_SADDR)mbus_wbusy_o <= 1'b1;
		else mbus_wbusy_o <= mbus_wbusy_o;
	end
	
	//-------------------״̬��----------------//
	//��״̬��
	always@(*)begin
		case(state_current)
			ST_WR_IDLE:begin
				if(i_mbus_wrq == 1'b1)state_next <= ST_WR_SADDR;
				else state_next <= ST_WR_IDLE;
			end
			ST_WR_SADDR:begin
				if(mbus_wmode_i[2] == 1'b1 && dbus_wready_i == 2'b10)state_next <= ST_WR_WAIT;			//ֻд��������ַ
				else if(mbus_waddr_mode_i == 1'b1 && dbus_wready_i == 2'b10)state_next <= ST_WR_ADDR_H;	//˫��ַλ
				else if(dbus_wready_i == 2'b10)state_next <= ST_WR_ADDR_L;								//����ַλ
				else state_next <= ST_WR_SADDR;
			end
			ST_WR_ADDR_H:begin
				if(dbus_wready_i == 2'b10)state_next <= ST_WR_ADDR_L;
				else state_next <= ST_WR_ADDR_H;
			end
			ST_WR_ADDR_L:begin
				if(mbus_wmode_i[3] == 1'b1 && dbus_wready_i == 2'b10)state_next <= ST_WR_WAIT;		//ֻд��������ַ�ͼĴ�����ַ
				else if(dbus_wready_i == 2'b10)state_next <= ST_WR_DATA;
				else state_next <= ST_WR_ADDR_L;
			end
			ST_WR_DATA:begin
				if(dbus_wready_i == 2'b01 && mbus_wlast_i == 1'b1)state_next <= ST_WR_WAIT;		//���һ������
				else state_next <= ST_WR_DATA;
			end
			ST_WR_WAIT:begin
				if(dbus_wbusy_i == 2'b10)state_next <= ST_WR_END;		//�ȴ�����
				else state_next <= ST_WR_WAIT;
			end
			ST_WR_END:state_next <= ST_WR_IDLE;
			default:state_next <= ST_WR_IDLE;
		endcase
	end
	
	//״̬ת��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_WR_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------״̬������-------------//
	//�����ź����--��ʼ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wstart_o <= 1'b0;
		else if(state_current == ST_WR_SADDR)dbus_wstart_o <= 1'b1;
		else if(dbus_wready_i == 2'b01)dbus_wstart_o <= 1'b0;
		else dbus_wstart_o <= dbus_wstart_o;
	end
	
	//�����ź����--�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wstop_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wstop_o <= mbus_wmode_i[0] | mbus_wmode_i[1];
		else dbus_wstop_o <= 1'b0;
	end
	
	//�����ź����--�л��ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wchange_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wchange_o <= mbus_wmode_i[0] | mbus_wmode_i[1] | mbus_wmode_i[2] | mbus_wmode_i[3];
		else dbus_wchange_o <= 1'b0;
	end
	
	//�����ź����--д�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wrq_o <= 1'b0;
		else if(state_current == ST_WR_SADDR)dbus_wrq_o <= 1'b1;
		else dbus_wrq_o <= 1'b0;
	end

	//�����ź����--д�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wdata_o <= 8'd0;
		else if(state_current == ST_WR_SADDR)dbus_wdata_o <= mbus_wslave_addr_i;
		else if(state_current == ST_WR_ADDR_H)dbus_wdata_o <= mbus_waddr_h_i;
		else if(state_current == ST_WR_ADDR_L)dbus_wdata_o <= mbus_waddr_l_i;
		else if(state_current == ST_WR_DATA)dbus_wdata_o <= mbus_wdata_i;
		else dbus_wdata_o <= dbus_wdata_o;
	end
	
	//�����ź����--д������Ч�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wvalid_o <= 1'b0;
		else if(dbus_wready_i == 2'b00)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_IDLE)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_END)dbus_wvalid_o <= 1'b0;
		else if(state_current == ST_WR_DATA)dbus_wvalid_o <= mbus_wvalid_i;
		else dbus_wvalid_o <= 1'b1;
	end
	
	//�����ź����--д���ݽ����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wlast_o <= 1'b0;
		else if(state_current == ST_WR_WAIT)dbus_wlast_o <= 1'b1;
		else dbus_wlast_o <= 1'b0;
	end
	
	//----------------�����źŻ���-------------//
	//�ⲿ�����ź�--���ôӻ���ַ
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			mbus_wslave_addr_i <= 8'd0;
		end else if(i_mbus_wslave_addr_mode[0] == 1'b0)begin
			mbus_wslave_addr_i <= {i_mbus_wslave_addr[6:0],i_mbus_wslave_addr_mode[1]};
		end else begin
			mbus_wslave_addr_i <= i_mbus_wslave_addr | {7'd0,i_mbus_wslave_addr_mode[1]};
		end
	end
	
	//�ⲿ�����ź�
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
	
	//��������ź�
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


//IICд����
module IIC_Write_Data
(
	input i_clk,
	input i_rstn,
	
	//--------------�����ź�------------//
	//����ͨ��
	input i_mbus_wstart,				//������ʼ�ź�,�ߵ�ƽ������;�͵�ƽ����û��
	input i_mbus_wstop,					//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
	input i_mbus_wchange,				//�л�
	input i_mbus_whc,					//дʱ�Ӹߵ�ƽ����
	input i_mbus_wlc,					//дʱ�ӵ͵�ƽ����
	
	//дӦ��
	input i_mbus_wack_sel,				//����Ӧ���ź��ж�,�ߵ�ƽ������;�͵�ƽ������
	input i_mbus_wack,					//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	
	//дͨ��
	input i_mbus_wrq,					//д�����ź�,�ߵ�ƽ��Ч
	input [7:0]i_mbus_wdata,			//д����
	input i_mbus_wvalid,				//д������Ч
	input i_mbus_wlast,					//д�������һ��
	output o_mbus_wready,				//д׼����
	output o_mbus_wstop,				//û����Ӧֹͣ�ź�,������Ч,����һ������ʱ�Զ���λ�͵�ƽ
	output o_mbus_wbusy,				//дæµ
	
	//--------------�ܽ��ź�------------//
	input i_iic_sda,					//IIC����SDA�����ź�
	output o_iic_sda,					//IIC���SDA�����ź�
	output o_iic_sda_dir				//IIC���SDA�źŷ���
);
	//------------------״̬����----------------//
	localparam ST_WR_IDLE = 2'd0;
	localparam ST_WR_DATA = 2'd1;
	localparam ST_WR_WAIT = 2'd2;
	localparam ST_WR_END = 2'd3;
	
	//---------------ģ��ʵ�����ź�-------------//
	//д����
	reg dbus_wrq = 0;
	reg [7:0]dbus_wdata = 0;
	wire dbus_wbusy;
	wire dbus_wnack;
	
	//����
	reg [1:0]dbus_wbusy_buff = 0;
	reg dbus_wnack_buff = 0;
	
	//״̬��
	reg [1:0]state_current = ST_WR_IDLE;
	reg [1:0]state_next = ST_WR_IDLE;
	
	//----------------���뻺���ź�--------------//
	//дͨ��
	reg [7:0]mbus_wdata_i = 0;
	reg mbus_wvalid_i = 0;
	reg mbus_wlast_i = 0;
	
	//------------------����ź�---------------//
	//дͨ��
	reg mbus_wready_o = 0;
	reg mbus_wstop_o = 0;
	reg mbus_wbusy_o = 0;
	
	//----------------����ź�����-------------//
	//дͨ��
	assign o_mbus_wready = mbus_wready_o;
	assign o_mbus_wstop = mbus_wstop_o;
	assign o_mbus_wbusy = mbus_wbusy_o;
	
	//------------------�ź����---------------//
	//д׼�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wready_o <= 1'b0;
		else if(state_current == ST_WR_DATA && dbus_wbusy_buff == 2'b00)mbus_wready_o <= 1'b1;
		else mbus_wready_o <= 1'b0;
	end
	
	//д����Ӧֹͣ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wstop_o <= 1'b0;
		else if(dbus_wbusy_buff == 2'b10 && dbus_wnack_buff == 1'b1)mbus_wstop_o <= 1'b1;
		else if(state_current == ST_WR_IDLE)mbus_wstop_o <= 1'b0;
		else mbus_wstop_o <= mbus_wstop_o;
	end
	
	//дæ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_END)mbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_DATA)mbus_wbusy_o <= 1'b1;
		else mbus_wbusy_o <= mbus_wbusy_o;
	end
	
	//-------------------״̬��----------------//
	//��״̬��
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
	
	//״̬ת��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_WR_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------״̬������-------------//
	//ʵ����ģ��--д�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wrq <= 1'b0;
		else if(dbus_wbusy_buff == 2'b11)dbus_wrq <= 1'b0;
		else if(state_current == ST_WR_DATA && mbus_wvalid_i == 1'b1)dbus_wrq <= 1'b1;
		else dbus_wrq <= dbus_wrq;
	end
	
	//ʵ����ģ��--д�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wdata <= 8'd0;
		else if(state_current == ST_WR_DATA && mbus_wvalid_i == 1'b1)dbus_wdata <= mbus_wdata_i;
		else dbus_wdata <= dbus_wdata;
	end
	
	//IIC����1�ֽ�,8��������ģ��ʵ����
	IIC_Send_Byte IIC_Send_Byte_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------�����ź�------------//
		//д����
		.i_dbus_wstart(i_mbus_wstart),		//������ʼ�ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.i_dbus_wstop(i_mbus_wstop),		//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.i_dbus_wchange(i_mbus_wchange),	//�л�
		.i_dbus_whc(i_mbus_whc),			//дʱ�Ӹߵ�ƽ����
		.i_dbus_wlc(i_mbus_wlc),			//дʱ�ӵ͵�ƽ����
		
		//дӦ��
		.i_dbus_wack_sel(i_mbus_wack_sel),	//����Ӧ���ź��ж�,�ߵ�ƽ������;�͵�ƽ������
		.i_dbus_wack(i_mbus_wack),			//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
		
		//д����
		.i_dbus_wrq(dbus_wrq),				//д�����ź�,�ߵ�ƽ��Ч
		.i_dbus_wdata(dbus_wdata),			//��Ҫ���͵�����,��8λ
		.o_dbus_wbusy(dbus_wbusy),			//����æ�ź�,�ߵ�ƽ����æµ;�͵�ƽ�������
		.o_dbus_nack(dbus_wnack),			//û����Ӧ,��һ��д����ʱ�Զ���λ

		//--------------�ܽ��ź�------------//
		.i_iic_sda(i_iic_sda),				//IIC����SDA�����ź�
		.o_iic_sda(o_iic_sda),				//IIC���SDA�����ź�
		.o_iic_sda_dir(o_iic_sda_dir)		//IIC���SDA�źŷ���
	);
	
	//----------------�����źŻ���-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			dbus_wbusy_buff <= 2'd0;
			dbus_wnack_buff <= 1'b0;
		end else begin
			dbus_wbusy_buff <= {dbus_wbusy_buff[0],dbus_wbusy};
			dbus_wnack_buff <= dbus_wnack;
		end
	end
	
	//----------------�����źŻ���-------------//
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

//IIC������
module IIC_Read_Data
(
	input i_clk,
	input i_rstn,
	
	//--------------�����ź�------------//
	//����ͨ��
	input i_mbus_rstop,					//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
	input i_mbus_rhc,					//��ʱ�Ӹߵ�ƽ����
	input i_mbus_rlc,					//��ʱ�ӵ͵�ƽ����
	
	//��Ӧ��
	input i_mbus_rack,					//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	
	//��ͨ��
	input i_mbus_rrq,					//�������ź�,�ߵ�ƽ��Ч
	input i_mbus_rlast,					//���������һ��
	input i_mbus_rready,				//��׼����
	output [7:0]o_mbus_rdata,			//������
	output o_mbus_rvalid,				//��������Ч
	output o_mbus_rbusy,				//��æµ
	
	//--------------�ܽ��ź�------------//
	input i_iic_sda,					//IIC����SDA�����ź�
	output o_iic_sda,					//IIC���SDA�����ź�
	output o_iic_sda_dir				//IIC���SDA�źŷ���
);
	//------------------״̬����----------------//
	localparam ST_RD_IDLE = 2'd0;
	localparam ST_RD_DATA = 2'd1;
	localparam ST_RD_WAIT = 2'd2;
	localparam ST_RD_END = 2'd3;
	
	//---------------ģ��ʵ�����ź�-------------//
	//������
	reg dbus_rrq = 0;
	wire [7:0]dbus_rdata;
	wire dbus_rbusy;
	
	//����
	reg [1:0]dbus_rbusy_buff = 0;
	
	//״̬��
	reg [1:0]state_current = ST_RD_IDLE;
	reg [1:0]state_next = ST_RD_IDLE;
	
	//----------------���뻺���ź�--------------//
	//��ͨ��
	reg mbus_rready_i = 0;
	reg mbus_rlast_i = 0;
	
	//------------------����ź�---------------//
	//��ͨ��
	reg [7:0]mbus_rdata_o = 0;
	reg mbus_rvalid_o = 0;
	reg mbus_rbusy_o = 0;
	
	//----------------����ź�����-------------//
	//дͨ��
	assign o_mbus_rdata = mbus_rdata_o;
	assign o_mbus_rvalid = mbus_rvalid_o;
	assign o_mbus_rbusy = mbus_rbusy_o;
	
	//------------------�ź����---------------//
	//�������ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rdata_o <= 8'd0;
		else if(dbus_rbusy_buff == 2'b10)mbus_rdata_o <= dbus_rdata;
		else mbus_rdata_o <= mbus_rdata_o;
	end
	
	//��������Ч�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rvalid_o <= 1'b0;
		else if(dbus_rbusy_buff == 2'b10)mbus_rvalid_o <= 1'b1;
		else mbus_rvalid_o <= 1'b0;
	end
	
	//��æ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)mbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_END)mbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_DATA)mbus_rbusy_o <= 1'b1;
		else mbus_rbusy_o <= mbus_rbusy_o;
	end
	
	//-------------------״̬��----------------//
	//��״̬��
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
	
	//״̬ת��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_RD_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------״̬������-------------//
	//ʵ����ģ��--�������ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_rrq <= 1'b0;
		else if(dbus_rbusy_buff == 2'b11)dbus_rrq <= 1'b0;
		else if(state_current == ST_RD_DATA && mbus_rready_i == 1'b1)dbus_rrq <= 1'b1;
		else dbus_rrq <= dbus_rrq;
	end

	//IIC����1�ֽ�,8��������ģ��ʵ����
	IIC_Recv_Byte IIC_Recv_Byte_Inst(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		//--------------�����ź�------------//
		//������
		.i_dbus_rstop(i_mbus_rstop),		//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
		.i_dbus_rhc(i_mbus_rhc),			//��ʱ�Ӹߵ�ƽ����
		.i_dbus_rlc(i_mbus_rlc),			//��ʱ�ӵ͵�ƽ����
		
		//��Ӧ��
		.i_dbus_rack(i_mbus_rack),			//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
		
		//������
		.i_dbus_rrq(dbus_rrq),				//�������ź�,�ߵ�ƽ��Ч
		.o_dbus_rdata(dbus_rdata),			//������,��8λ
		.o_dbus_rbusy(dbus_rbusy),			//��æ�ź�,�ߵ�ƽ����æµ;�͵�ƽ�������
		
		//--------------�ܽ��ź�------------//
		.i_iic_sda(i_iic_sda),				//IIC����SDA�����ź�
		.o_iic_sda(o_iic_sda),				//IIC���SDA�����ź�
		.o_iic_sda_dir(o_iic_sda_dir)		//IIC���SDA�źŷ���
	);
	
	//----------------�����źŻ���-------------//
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			dbus_rbusy_buff <= 2'd0;
		end else begin
			dbus_rbusy_buff <= {dbus_rbusy_buff[0],dbus_rbusy};
		end
	end
	
	//----------------�����źŻ���-------------//
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

//��������8λ
module IIC_Send_Byte(
	input i_clk,
	input i_rstn,
	
	//--------------�����ź�------------//
	//д����
	input i_dbus_wstart,				//������ʼ�ź�,�ߵ�ƽ������;�͵�ƽ����û��
	input i_dbus_wstop,					//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
	input i_dbus_wchange,				//�л�
	input i_dbus_whc,					//дʱ�Ӹߵ�ƽ����
	input i_dbus_wlc,					//дʱ�ӵ͵�ƽ����
	
	//дӦ��
	input i_dbus_wack_sel,				//����Ӧ���ź��ж�,�ߵ�ƽ������;�͵�ƽ������
	input i_dbus_wack,					//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	
	//д����
	input i_dbus_wrq,					//д�����ź�,�ߵ�ƽ��Ч
	input [7:0]i_dbus_wdata,			//��Ҫ���͵�����,��8λ
	output o_dbus_wbusy,				//����æ�ź�,�ߵ�ƽ����æµ;�͵�ƽ�������
	output o_dbus_nack,					//û����Ӧ,��һ��д����ʱ�Զ���λ
	
	//--------------�ܽ��ź�------------//
	input i_iic_sda,					//IIC����SDA�����ź�
	output o_iic_sda,					//IIC���SDA�����ź�
	output o_iic_sda_dir				//IIC���SDA�źŷ���
);
	
	//------------------״̬����----------------//
	localparam ST_WR_IDLE = 6'b000001;
	localparam ST_WR_START = 6'b000010;
	localparam ST_WR_DATA = 6'b000100;
	localparam ST_WR_ACK = 6'b001000;
	localparam ST_WR_STOP = 6'b010000;
	localparam ST_WR_END = 6'b100000;
	
	//����
	reg [3:0]send_cnt = 0;
	
	//״̬��
	reg [5:0]state_current = ST_WR_IDLE;
	reg [5:0]state_next = ST_WR_IDLE;
	
	//----------------���뻺���ź�--------------//
	//д����
	reg dbus_wstart_i = 0;
	reg dbus_wstop_i = 0;
	reg dbus_wchange_i = 0;
	reg dbus_whc_i = 0;
	reg dbus_wlc_i = 0;
	
	//дӦ��
	reg dbus_wack_sel_i = 0;
	reg dbus_wack_i = 0;
	
	//д����
	reg [7:0]dbus_wdata_i = 0;
	
	//�ܽ��ź�
	reg iic_sda_i = 0;
	
	//------------------����ź�---------------//
	//д����
	reg dbus_wbusy_o = 1'b0;
	reg dbus_nack_o = 1'b0;
	
	//�ܽ��ź�
	reg iic_sda_o = 1'b1;
	reg iic_sda_dir_o = 0;
	
	//----------------����ź�����-------------//
	//д����
	assign o_dbus_wbusy = dbus_wbusy_o;
	assign o_dbus_nack = dbus_nack_o;
	
	//�ܽ��ź�
	assign o_iic_sda = iic_sda_o;
	assign o_iic_sda_dir = iic_sda_dir_o;
	
	//------------------�ź����---------------//
	//дæµ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_wbusy_o <= 1'b0;
		else if(state_current == ST_WR_START)dbus_wbusy_o <= 1'b1;
		else if(state_current == ST_WR_DATA)dbus_wbusy_o <= 1'b1;
		else if(state_current == ST_WR_END)dbus_wbusy_o <= 1'b0;
		else dbus_wbusy_o <= dbus_wbusy_o;
	end
	
	//û����Ӧ�ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_nack_o <= 1'b0;
		else if(state_current == ST_WR_DATA)dbus_nack_o <= 1'b0;
		else if(state_current == ST_WR_ACK && dbus_wlc_i == 1'b1 && dbus_wack_sel_i == 1'b1)dbus_nack_o <= (dbus_wack_i ^ iic_sda_i);
		else dbus_nack_o <= dbus_nack_o;
	end
	
	//IIC�ܽ��ź�---������
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
	
	//IIC�ܽ��ź�---�����������
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_sda_dir_o <= 1'b1;
		else if(state_next == ST_WR_DATA && send_cnt == 4'd0)iic_sda_dir_o <= dbus_wstart_i;
		else if(state_next == ST_WR_ACK)iic_sda_dir_o <= 1'b0;
		else iic_sda_dir_o <= 1'b1;
	end
	
	//-------------------״̬��----------------//
	//��״̬��
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
	
	//״̬ת��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_WR_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------״̬������-------------//
	//���ͼ���
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)send_cnt <= 4'd0;
		else if(state_next == ST_WR_DATA && dbus_wlc_i == 1'b1)send_cnt <= send_cnt + 4'd1;
		else if(state_next == ST_WR_DATA)send_cnt <= send_cnt;
		else send_cnt <= 4'd0;
	end
	
	//----------------�����źŻ���-------------//
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

//��������8λ
module IIC_Recv_Byte(
	input i_clk,
	input i_rstn,
	
	//--------------�����ź�------------//
	//������
	input i_dbus_rstop,					//���޽����ź�,�ߵ�ƽ������;�͵�ƽ����û��
	input i_dbus_rhc,					//��ʱ�Ӹߵ�ƽ����
	input i_dbus_rlc,					//��ʱ�ӵ͵�ƽ����
	
	//��Ӧ��
	input i_dbus_rack,					//Ӧ���ź�ģʽ,1Ϊ��Ӧ��NACK;0ΪӦ��ACK
	
	//������
	input i_dbus_rrq,					//�������ź�,�ߵ�ƽ��Ч
	output [7:0]o_dbus_rdata,			//������,��8λ
	output o_dbus_rbusy,				//��æ�ź�,�ߵ�ƽ����æµ;�͵�ƽ�������
	
	//--------------�ܽ��ź�------------//
	input i_iic_sda,					//IIC����SDA�����ź�
	output o_iic_sda,					//IIC���SDA�����ź�
	output o_iic_sda_dir				//IIC���SDA�źŷ���
);
	
	//------------------״̬����----------------//
	localparam ST_RD_IDLE = 5'b00001;
	localparam ST_RD_DATA = 5'b00010;
	localparam ST_RD_ACK = 5'b00100;
	localparam ST_RD_STOP = 5'b01000;
	localparam ST_RD_END = 5'b10000;
	
	//����
	reg [7:0]read_data = 0;
	
	//����
	reg [3:0]recv_cnt = 0;
	
	//״̬��
	reg [4:0]state_current = ST_RD_IDLE;
	reg [4:0]state_next = ST_RD_IDLE;
	
	//----------------���뻺���ź�--------------//
	//������
	reg dbus_rstop_i = 0;
	reg dbus_rhc_i = 0;
	reg dbus_rlc_i = 0;
	
	//��Ӧ��
	reg dbus_rack_i = 0;
	
	//�ܽ��ź�
	reg iic_sda_i = 0;
	
	//------------------����ź�---------------//
	//������
	reg [7:0]dbus_rdata_o = 0;
	reg dbus_rbusy_o = 0;
	
	//�ܽ��ź�
	reg iic_sda_o = 1'b1;
	reg iic_sda_dir_o = 0;
	
	//----------------����ź�����-------------//
	//������
	assign o_dbus_rdata = dbus_rdata_o;
	assign o_dbus_rbusy = dbus_rbusy_o;
	
	//�ܽ��ź�
	assign o_iic_sda = iic_sda_o;
	assign o_iic_sda_dir = iic_sda_dir_o;
	
	//------------------�ź����---------------//
	//�������ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_rdata_o <= 8'd0;
		else if(state_current == ST_RD_END)dbus_rdata_o <= read_data;
		else dbus_rdata_o <= dbus_rdata_o;
	end
	
	//������׼�����ź�
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)dbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_END)dbus_rbusy_o <= 1'b0;
		else if(state_current == ST_RD_DATA)dbus_rbusy_o <= 1'b1;
		else dbus_rbusy_o <= dbus_rbusy_o;
	end
	
	//IIC�ܽ��ź�---������
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_sda_o <= 1'b1;
		else if(state_next == ST_RD_DATA)iic_sda_o <= 1'b1;
		else if(state_next == ST_RD_ACK)iic_sda_o <= dbus_rack_i;
		else if(state_next == ST_RD_STOP && dbus_rlc_i == 1'b1)iic_sda_o <= 1'b0;
		else if(state_next == ST_RD_STOP && dbus_rhc_i == 1'b1)iic_sda_o <= 1'b1;
		else iic_sda_o <= iic_sda_o;
	end
	
	//IIC�ܽ��ź�---�����������
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)iic_sda_dir_o <= 1'b1;
		else if(state_next == ST_RD_DATA)iic_sda_dir_o <= 1'b0;
		else iic_sda_dir_o <= 1'b1;
	end
	
	//-------------------״̬��----------------//
	//��״̬��
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
	
	//״̬ת��
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)begin
			state_current <= ST_RD_IDLE;
		end else begin
			state_current <= state_next;
		end
	end
	
	//----------------״̬������-------------//
	//���ռ���
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)recv_cnt <= 4'd0;
		else if(state_next == ST_RD_DATA && dbus_rhc_i == 1'b1)recv_cnt <= recv_cnt + 4'd1;
		else if(state_next == ST_RD_DATA)recv_cnt <= recv_cnt;
		else recv_cnt <= 4'd0;
	end
	
	//������
	always@(posedge i_clk or negedge i_rstn)begin
		if(i_rstn == 1'b0)read_data <= 8'd0;
		else if(state_next == ST_RD_DATA && dbus_rhc_i == 1'b1)read_data <= {read_data[6:0],iic_sda_i};
		else read_data <= read_data;
	end
	
	//----------------�����źŻ���-------------//
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