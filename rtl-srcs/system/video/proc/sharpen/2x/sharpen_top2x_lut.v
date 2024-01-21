

module sharpen_top (
    input         i_bicubic_clk,
    input         i_rstn,
    input  [15:0] i_bicubic_data,
    //   input    [15:0]      i_bicubic_addr,
    input         i_bicubic_en,
    output [15:0] o_res_wrdata,
    output [15:0] o_res_wraddr,
    output        o_res_wren,
    input         i_vsync
);

    /******************************************************************/
    // INTERNAL SIGNALS
    /******************************************************************/
    /*(*mark_debug="true"*)*/
    reg       vsync_pulse;
    reg [1:0] vsync;
    always @(posedge i_bicubic_clk) begin
        vsync       <= {vsync[0], i_vsync};
        vsync_pulse <= (vsync == 2'b01);
    end



    reg  [ 7:0] pixel_load_cnt;
    reg  [15:0] loaded_pixel      [2:0][255:0];
    //reg  [15:0] loaded_pixel_buf      [255:0];

    /*(*mark_debug="true"*)*/reg  [ 7:0] v_cnt = 0;
    /*(*mark_debug="true"*)*/reg  [ 7:0] calc_cnt;
    /*(*mark_debug="true"*)*/reg  [ 7:0] write_cnt;

    //wire [15:0] sharpen_res_pix;

    wire [23:0] o_sharpen_res_pix;

    assign o_res_wrdata = {o_sharpen_res_pix[23:19], o_sharpen_res_pix[15:10], o_sharpen_res_pix[7:3]};

    /******************************************************************/
    // CONFIGS
    /******************************************************************/
    localparam [8:0] RAW_PIXEL_COUNT = 256;  // ԭʼͼ��Ĵ�С���߳�??

    /******************************************************************/
    // STATUS MACHINE
    /******************************************************************/
    localparam S_IDLE = 0;
    // localparam S_INIT = 1;  // ������һ֡����������
    localparam S_REQ = 1;  // �������ݣ�ͬʱ��������һ??
    localparam S_LOAD1 = 2;  // �������FIFO�����ݶ���reg
    localparam S_SWICH1 = 3;
    localparam S_LOAD2_CALC1 = 4;
    localparam S_SWICH2 = 5;  // �������
    localparam S_CALC2 = 6;
    // localparam S_WRITE1 = 6;  // ���д�ص�һ??
    // localparam S_SWICH3 = 7;
    // localparam S_WRITE2 = 8;
    localparam S_NEXT = 7;
    localparam S_FINAL = 8;

    /*(*mark_debug="true"*)*/ reg [3:0] state_current, state_next;
    always @(*) begin
        //state_next = state_current;
        case (state_current)
            S_IDLE: state_next = S_REQ;
            S_REQ: state_next = i_bicubic_en ? S_LOAD1 : S_REQ;
            S_LOAD1: state_next = (pixel_load_cnt >= RAW_PIXEL_COUNT - 1) ? S_SWICH1 : S_LOAD1;
            S_SWICH1: state_next = S_LOAD2_CALC1;
            S_LOAD2_CALC1: state_next = (pixel_load_cnt >= RAW_PIXEL_COUNT - 1) ? S_SWICH2 : S_LOAD2_CALC1;

            //S_CALC1: state_next = (calc_cnt == RAW_PIXEL_COUNT - 1) ? S_SWICH2 : S_CALC1;

            S_SWICH2: state_next = S_CALC2;
            // S_CALC2: state_next = (calc_cnt == RAW_PIXEL_COUNT - 1) ? S_WRITE1 : S_CALC2;

            S_CALC2: begin
                if (calc_cnt != 255) begin
                    state_next = S_CALC2;
                end else begin
                    state_next = (v_cnt == RAW_PIXEL_COUNT - 1) ? S_FINAL : S_NEXT;
                end
            end
            // S_SWICH3: state_next = S_WRITE2; 
            // S_WRITE2: begin
            //     if (write_cnt != 255) begin
            //         state_next = S_WRITE2;
            //     end else begin
            //         state_next = (v_cnt == RAW_PIXEL_COUNT - 1) ? S_FINAL : S_NEXT;
            //     end
            // end
            S_NEXT:  state_next = S_REQ;
            S_FINAL: state_next = S_FINAL;
            default: state_next = S_IDLE;
        endcase
    end
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) state_current <= S_IDLE;
        else if (vsync_pulse) begin
            state_current <= S_IDLE;
        end else state_current <= state_next;
    end

    /******************************************************************/
    // STATE BEHAVIOR
    /******************************************************************/



    /** WAIT UNTIL RLAST COMES **/

    /** LOAD ���ض�ȡ����??����?? **/
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (!i_rstn) pixel_load_cnt <= 0;
        else pixel_load_cnt <= ((state_current == S_LOAD1) || (state_current == S_LOAD2_CALC1) || ((state_current == S_CALC2) && (i_bicubic_en)) || ((S_NEXT) && i_bicubic_en)) ? pixel_load_cnt + 1 : 0;
    end

    /** CALC **/
    always @(posedge i_bicubic_clk) begin
        calc_cnt <= ((state_current == S_LOAD2_CALC1) || (state_current == S_SWICH1) || (state_current == S_CALC2) || (state_current == S_SWICH2)) ? calc_cnt + 1 : 0;
    end

    // reg [3:0] state_delayed[1:0];
    // always @(posedge i_bicubic_clk) begin
    //     state_delayed[1] <= state_delayed[0];
    //     state_delayed[0] <= state_current;
    // end

    wire [23:0] i_raw_pix11;
    wire [23:0] i_raw_pix12;
    wire [23:0] i_raw_pix13;
    wire [23:0] i_raw_pix21;
    wire [23:0] i_raw_pix22;
    wire [23:0] i_raw_pix23;
    wire [23:0] i_raw_pix31;
    wire [23:0] i_raw_pix32;
    wire [23:0] i_raw_pix33;
    //reg [15:0] wraddr_buf[1:0];

    assign i_raw_pix11 = {loaded_pixel[2][calc_cnt+0][15:11], 3'd0, loaded_pixel[2][calc_cnt+0][10:5], 2'd0, loaded_pixel[2][calc_cnt+0][4:0], 3'd0};
    assign i_raw_pix12 = {loaded_pixel[2][calc_cnt+1][15:11], 3'd0, loaded_pixel[2][calc_cnt+1][10:5], 2'd0, loaded_pixel[2][calc_cnt+1][4:0], 3'd0};
    assign i_raw_pix13 = {loaded_pixel[2][calc_cnt+2][15:11], 3'd0, loaded_pixel[2][calc_cnt+2][10:5], 2'd0, loaded_pixel[2][calc_cnt+2][4:0], 3'd0};
    assign i_raw_pix21 = {loaded_pixel[1][calc_cnt+0][15:11], 3'd0, loaded_pixel[1][calc_cnt+0][10:5], 2'd0, loaded_pixel[1][calc_cnt+0][4:0], 3'd0};
    assign i_raw_pix22 = {loaded_pixel[1][calc_cnt+1][15:11], 3'd0, loaded_pixel[1][calc_cnt+1][10:5], 2'd0, loaded_pixel[1][calc_cnt+1][4:0], 3'd0};
    assign i_raw_pix23 = {loaded_pixel[1][calc_cnt+2][15:11], 3'd0, loaded_pixel[1][calc_cnt+2][10:5], 2'd0, loaded_pixel[1][calc_cnt+2][4:0], 3'd0};
    assign i_raw_pix31 = {loaded_pixel[0][calc_cnt+0][15:11], 3'd0, loaded_pixel[0][calc_cnt+0][10:5], 2'd0, loaded_pixel[0][calc_cnt+0][4:0], 3'd0};
    assign i_raw_pix32 = {loaded_pixel[0][calc_cnt+1][15:11], 3'd0, loaded_pixel[0][calc_cnt+1][10:5], 2'd0, loaded_pixel[0][calc_cnt+1][4:0], 3'd0};
    assign i_raw_pix33 = {loaded_pixel[0][calc_cnt+2][15:11], 3'd0, loaded_pixel[0][calc_cnt+2][10:5], 2'd0, loaded_pixel[0][calc_cnt+2][4:0], 3'd0};

    /** WRITE **/
    reg [15:0] res_wraddr;
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) res_wraddr <= 0;
        else if (state_current == S_IDLE) res_wraddr <= 0;
        else res_wraddr <= (o_res_wren) ? res_wraddr + 1 : res_wraddr;
    end
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) write_cnt <= 0;
        else write_cnt <= (o_res_wren) ? write_cnt + 1 : 0;
    end
    // always @(posedge i_bicubic_clk or negedge i_rstn ) begin
    //     if(~i_rstn) begin
    //         wraddr_buf[0]<=0;
    //         wraddr_buf[1]<=0;
    //     end
    //     else begin
    //     wraddr_buf[0]<=o_res_wraddr;
    //     wraddr_buf[1]<=wraddr_buf[0];
    //     end
    // end
    assign o_res_wren   = ((state_current == S_LOAD2_CALC1) || (state_current == S_CALC2) || (state_current == S_SWICH2) || (state_current == S_NEXT));
    //assign o_res_wraddr            = wraddr_buf[1];
    assign o_res_wraddr = res_wraddr;

    /** NEXT **/
    // ���¶�ָ��???������??
    integer i;
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) begin
            v_cnt <= 0;
            for (i = 0; i < 256; i = i + 1) begin
                loaded_pixel[2][i] <= 16'b0;
                loaded_pixel[1][i] <= 16'b0;
                loaded_pixel[0][i] <= 16'b0;
            end
        end else if (state_current == S_IDLE) begin
            v_cnt <= 0;
            for (i = 0; i < 256; i = i + 1) begin
                loaded_pixel[2][i] <= 16'b0;
                loaded_pixel[1][i] <= 16'b0;
                loaded_pixel[0][i] <= 16'b0;
            end
        end else if ((state_current == S_NEXT) && (~i_bicubic_en)) begin
            v_cnt <= v_cnt + 1;
            for (i = 0; i < 256; i = i + 1) begin
                loaded_pixel[2][i] <= loaded_pixel[1][i];
                loaded_pixel[1][i] <= loaded_pixel[0][i];
            end
        end else if (state_current == S_LOAD1) begin
            loaded_pixel[0][pixel_load_cnt] <= i_bicubic_data;
        end else if (state_current == S_LOAD2_CALC1) begin
            loaded_pixel[2][pixel_load_cnt] <= loaded_pixel[1][pixel_load_cnt];
            loaded_pixel[1][pixel_load_cnt] <= loaded_pixel[0][pixel_load_cnt];
            loaded_pixel[0][pixel_load_cnt] <= i_bicubic_data;
        end else if ((state_current == S_CALC2) && (i_bicubic_en)) begin
            loaded_pixel[2][pixel_load_cnt] <= loaded_pixel[1][pixel_load_cnt];
            loaded_pixel[1][pixel_load_cnt] <= loaded_pixel[0][pixel_load_cnt];
            loaded_pixel[0][pixel_load_cnt] <= i_bicubic_data;
        end else begin
            v_cnt <= v_cnt;
            for (i = 0; i < 256; i = i + 1) begin
                loaded_pixel[2][i] <= loaded_pixel[2][i];
                loaded_pixel[1][i] <= loaded_pixel[1][i];
                loaded_pixel[0][i] <= loaded_pixel[0][i];
            end
        end
    end




    sharpen_core sharpen_core (
        .i_sharpen_clk(i_bicubic_clk),  //input i_bicubic_clk,
        .rst_n        (i_rstn),         //input rst_n,
        // input matrix 3*3
        .i_raw_pix11  (i_raw_pix11),    //input [23:0] i_raw_pix11,
        .i_raw_pix12  (i_raw_pix12),    //input [23:0] i_raw_pix12,
        .i_raw_pix13  (i_raw_pix13),    //input [23:0] i_raw_pix13,

        .i_raw_pix21(i_raw_pix21),  //input [23:0] i_raw_pix21,
        .i_raw_pix22(i_raw_pix22),  //input [23:0] i_raw_pix22,
        .i_raw_pix23(i_raw_pix23),  //input [23:0] i_raw_pix23,

        .i_raw_pix31(i_raw_pix31),  //input [23:0] i_raw_pix31,
        .i_raw_pix32(i_raw_pix32),  //input [23:0] i_raw_pix32,
        .i_raw_pix33(i_raw_pix33),  //input [23:0] i_raw_pix33,

        .o_res_pix(o_sharpen_res_pix)  //output [23:0] o_res_pix22
    );

endmodule
