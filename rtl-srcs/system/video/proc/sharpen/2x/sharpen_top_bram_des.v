
//IP核sharpen_ram 双端口 输入输出16位宽，深度256
module sharpen_top_bram (
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
    /*(*mark_debug="true"*)*/reg       vsync_pulse;
    reg [1:0] vsync;
    always @(posedge i_bicubic_clk) begin
        vsync       <= {vsync[0], i_vsync};
        vsync_pulse <= (vsync == 2'b01);
    end

    wire        sharpen_ram_wren   [2:0];
    wire [15:0] sharpen_ram_wrdata [2:0];
    wire [ 7:0] sharpen_ram_wraddr [2:0];
    wire        sharpen_ram_rden   [2:0];
    wire [15:0] sharpen_ram_rddata [2:0];
    wire [ 7:0] sharpen_ram_rdaddr [2:0];
    reg  [ 1:0] ram_wrsel_flag = 0;
    reg  [ 1:0] ram_rdsel_flag = 0;



    reg  [ 7:0] pixel_load_cnt;
    reg  [15:0] loaded_pixel       [2:0] [2:0];
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
    localparam [8:0] RAW_PIXEL_COUNT = 256;  // 原始图像的大小（边长�?

    /******************************************************************/
    // STATUS MACHINE
    /******************************************************************/
    localparam S_IDLE = 0;
    // localparam S_INIT = 1;  // 加载这一帧的配置数据
    localparam S_REQ = 1;  // 请求数据，同时数据上移一�?
    localparam S_LOAD1 = 2;  // 将输入的FIFO的数据读入reg
    localparam S_SWICH1 = 3;
    localparam S_LOAD2_CALC1 = 4;
    localparam S_SWICH2 = 5;  // 结果计算
    localparam S_CALC2 = 6;
    // localparam S_WRITE1 = 6;  // 结果写回第一�?
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
            S_LOAD1: begin
                if (pixel_load_cnt < RAW_PIXEL_COUNT - 1) state_next = S_LOAD1;
                else begin
                    state_next = S_SWICH1;
                    case (ram_wrsel_flag)
                        0: ram_wrsel_flag = ram_wrsel_flag + 1;
                        1: ram_wrsel_flag = ram_wrsel_flag + 1;
                        2: ram_wrsel_flag = ram_wrsel_flag + 2;
                        default: ram_wrsel_flag = 0;
                    endcase
                end
            end
            S_SWICH1: state_next = S_LOAD2_CALC1;
            S_LOAD2_CALC1: begin
                if (pixel_load_cnt < RAW_PIXEL_COUNT - 1) state_next = S_LOAD2_CALC1;
                else begin
                    state_next = S_SWICH2;
                    case (ram_wrsel_flag)
                        0: ram_wrsel_flag = ram_wrsel_flag + 1;
                        1: ram_wrsel_flag = ram_wrsel_flag + 1;
                        2: ram_wrsel_flag = ram_wrsel_flag + 2;
                        default: ram_wrsel_flag = 0;
                    endcase
                    case (ram_rdsel_flag)
                        0: ram_rdsel_flag = ram_rdsel_flag + 1;
                        1: ram_rdsel_flag = ram_rdsel_flag + 1;
                        2: ram_rdsel_flag = ram_rdsel_flag + 2;
                        default: ram_rdsel_flag = 0;
                    endcase
                end
            end
            //state_next = (pixel_load_cnt >= RAW_PIXEL_COUNT - 1) ? S_SWICH2 : S_LOAD2_CALC1;

            //S_CALC1: state_next = (calc_cnt == RAW_PIXEL_COUNT - 1) ? S_SWICH2 : S_CALC1;

            S_SWICH2: state_next = S_CALC2;
            // S_CALC2: state_next = (calc_cnt == RAW_PIXEL_COUNT - 1) ? S_WRITE1 : S_CALC2;

            S_CALC2: begin
                if (calc_cnt != 255) begin
                    state_next = S_CALC2;
                end else begin
                    if (v_cnt == RAW_PIXEL_COUNT - 1) begin
                        state_next     = S_FINAL;
                        ram_rdsel_flag = 0;
                    end else begin
                        state_next = S_NEXT;
                        case (ram_rdsel_flag)
                            0: ram_rdsel_flag = ram_rdsel_flag + 1;
                            1: ram_rdsel_flag = ram_rdsel_flag + 1;
                            2: ram_rdsel_flag = ram_rdsel_flag + 2;
                            default: ram_rdsel_flag = 0;
                        endcase
                    end
                    //state_next = (v_cnt == RAW_PIXEL_COUNT - 1) ? S_FINAL : S_NEXT;
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

    /** LOAD 加载读取到的�?行数�? **/


    // always @(posedge i_bicubic_clk) begin
    //     if (state_current == S_LOAD) begin
    //         // loaded_pixel[0][pixel_load_cnt] <= raw_fifo_rddata;
    //         loaded_pixel[0][pixel_load_cnt] <= i_bicubic_data;
    //     end else loaded_pixel[0][pixel_load_cnt] <= loaded_pixel[0][pixel_load_cnt];
    // end
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (!i_rstn) pixel_load_cnt <= 0;
        else pixel_load_cnt <= ((state_current == S_LOAD1) || (state_current == S_LOAD2_CALC1) || ((state_current == S_CALC2) && (i_bicubic_en)) || ((S_NEXT) && i_bicubic_en)) ? pixel_load_cnt + 1 : 0;
    end

    /** CALC **/
    always @(posedge i_bicubic_clk) begin
        calc_cnt <= ((state_current == S_LOAD2_CALC1) || (state_current == S_SWICH1) || (state_current == S_CALC2) || (state_current == S_SWICH2)) ? calc_cnt + 1 : 0;
    end

    reg [3:0] state_delayed[2:0];
    always @(posedge i_bicubic_clk) begin
        state_delayed[2] <= state_delayed[1];
        state_delayed[1] <= state_delayed[0];
        state_delayed[0] <= state_current;
    end
    reg [7:0] calc_cnt_delayed[2:0];
    always @(posedge i_bicubic_clk) begin
        calc_cnt_delayed[2] <= calc_cnt_delayed[1];
        calc_cnt_delayed[1] <= calc_cnt_delayed[0];
        calc_cnt_delayed[0] <= calc_cnt;
    end
    assign sharpen_ram_wren[0]   = (((state_current == S_LOAD1) || (state_current == S_LOAD2_CALC1)) && (ram_wrsel_flag == 0));
    assign sharpen_ram_wren[1]   = (((state_current == S_LOAD1) || (state_current == S_LOAD2_CALC1)) && (ram_wrsel_flag == 1));
    assign sharpen_ram_wren[2]   = (((state_current == S_LOAD1) || (state_current == S_LOAD2_CALC1)) && (ram_wrsel_flag == 2));
    assign sharpen_ram_wraddr[0] = pixel_load_cnt;
    assign sharpen_ram_wraddr[1] = pixel_load_cnt;
    assign sharpen_ram_wraddr[2] = pixel_load_cnt;
    assign sharpen_ram_rden[0]   = ((state_current == S_LOAD2_CALC1) || (state_current == S_SWICH1) || (state_current == S_CALC2) || (state_current == S_SWICH2));
    assign sharpen_ram_rden[1]   = ((state_current == S_LOAD2_CALC1) || (state_current == S_SWICH1) || (state_current == S_CALC2) || (state_current == S_SWICH2));
    assign sharpen_ram_rden[2]   = ((state_current == S_LOAD2_CALC1) || (state_current == S_SWICH1) || (state_current == S_CALC2) || (state_current == S_SWICH2));
    assign sharpen_ram_rdaddr[0] = calc_cnt;
    assign sharpen_ram_rdaddr[1] = calc_cnt;
    assign sharpen_ram_rdaddr[2] = calc_cnt;
    sharpen_ram sharpen_ram0 (
        .clka (i_bicubic_clk),          // input wire clka
        .ena  (1'b1),                   // input wire ena
        .wea  (sharpen_ram_wren[0]),    // input wire [0 : 0] wea
        .addra(sharpen_ram_wraddr[0]),  // input wire [7 : 0] addra
        .dina (sharpen_ram_wrdata[0]),  // input wire [15 : 0] dina
        .clkb (i_bicubic_clk),          // input wire clkb
        .enb  (1'b1),                   // input wire enb
        .addrb(sharpen_ram_wraddr[0]),  // input wire [7 : 0] addrb
        .doutb(sharpen_ram_wrdata[0])   // output wire [15 : 0] doutb
    );
    sharpen_ram sharpen_ram1 (
        .clka (i_bicubic_clk),          // input wire clka
        .ena  (1'b1),                   // input wire ena
        .wea  (sharpen_ram_wren[1]),    // input wire [0 : 0] wea
        .addra(sharpen_ram_wraddr[1]),  // input wire [7 : 0] addra
        .dina (sharpen_ram_wrdata[1]),  // input wire [15 : 0] dina
        .clkb (i_bicubic_clk),          // input wire clkb
        .enb  (1'b1),                   // input wire enb
        .addrb(sharpen_ram_wraddr[1]),  // input wire [7 : 0] addrb
        .doutb(sharpen_ram_wrdata[1])   // output wire [15 : 0] doutb
    );
    sharpen_ram sharpen_ram2 (
        .clka (i_bicubic_clk),          // input wire clka
        .ena  (1'b1),                   // input wire ena
        .wea  (sharpen_ram_wren[2]),    // input wire [0 : 0] wea
        .addra(sharpen_ram_wraddr[2]),  // input wire [7 : 0] addra
        .dina (sharpen_ram_wrdata[2]),  // input wire [15 : 0] dina
        .clkb (i_bicubic_clk),          // input wire clkb
        .enb  (1'b1),                   // input wire enb
        .addrb(sharpen_ram_wraddr[2]),  // input wire [7 : 0] addrb
        .doutb(sharpen_ram_wrdata[2])   // output wire [15 : 0] doutb
    );
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

    assign i_raw_pix31 = {loaded_pixel[2][0][15:11], 3'd0, loaded_pixel[2][0][10:5], 2'd0, loaded_pixel[2][0][4:0], 3'd0};
    assign i_raw_pix32 = {loaded_pixel[2][1][15:11], 3'd0, loaded_pixel[2][1][10:5], 2'd0, loaded_pixel[2][1][4:0], 3'd0};
    assign i_raw_pix33 = {loaded_pixel[2][2][15:11], 3'd0, loaded_pixel[2][2][10:5], 2'd0, loaded_pixel[2][2][4:0], 3'd0};
    assign i_raw_pix21 = {loaded_pixel[1][0][15:11], 3'd0, loaded_pixel[1][0][10:5], 2'd0, loaded_pixel[1][0][4:0], 3'd0};
    assign i_raw_pix22 = {loaded_pixel[1][1][15:11], 3'd0, loaded_pixel[1][1][10:5], 2'd0, loaded_pixel[1][1][4:0], 3'd0};
    assign i_raw_pix23 = {loaded_pixel[1][2][15:11], 3'd0, loaded_pixel[1][2][10:5], 2'd0, loaded_pixel[1][2][4:0], 3'd0};
    assign i_raw_pix11 = {loaded_pixel[0][0][15:11], 3'd0, loaded_pixel[0][0][10:5], 2'd0, loaded_pixel[0][0][4:0], 3'd0};
    assign i_raw_pix12 = {loaded_pixel[0][1][15:11], 3'd0, loaded_pixel[0][1][10:5], 2'd0, loaded_pixel[0][1][4:0], 3'd0};
    assign i_raw_pix13 = {loaded_pixel[0][2][15:11], 3'd0, loaded_pixel[0][2][10:5], 2'd0, loaded_pixel[0][2][4:0], 3'd0};

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
    assign o_res_wren   = ((state_delayed[2] == S_LOAD2_CALC1) || (state_delayed[2] == S_CALC2));
    //assign o_res_wraddr            = wraddr_buf[1];
    assign o_res_wraddr = res_wraddr;

    /** NEXT **/
    // 更新读指针�?�缓存上�?
    integer i;
    always @(posedge i_bicubic_clk or negedge i_rstn) begin
        if (~i_rstn) begin
            v_cnt <= 0;
            for (i = 0; i < 3; i = i + 1) begin
                loaded_pixel[2][i] <= 16'b0;
                loaded_pixel[1][i] <= 16'b0;
                loaded_pixel[0][i] <= 16'b0;
            end
        end else if (state_current == S_IDLE) begin
            v_cnt <= 0;
            for (i = 0; i < 3; i = i + 1) begin
                loaded_pixel[2][i] <= 16'b0;
                loaded_pixel[1][i] <= 16'b0;
                loaded_pixel[0][i] <= 16'b0;
            end
        end else if ((state_current == S_NEXT) && (~i_bicubic_en)) begin
            v_cnt <= v_cnt + 1;
            // for (i = 0; i < 256; i = i + 1) begin
            //     loaded_pixel[2][i] <= loaded_pixel[1][i];
            //     loaded_pixel[1][i] <= loaded_pixel[0][i];
            // end
            // end else if ((state_current == S_LOAD1)&&(pixel_load_cnt>4)) begin
            //     for (i = 0; i < 3; i = i + 1) begin
            //         loaded_pixel[0][i] <= sharpen_ram_wrdata[ram_rdsel_flag];
            //     end
        end else if ((state_delayed[1] == S_LOAD2_CALC1) || (state_delayed[1] == S_CALC2)) begin  //延时两个时钟输出
            // for (i = 0; i < 3; i = i + 1) begin
            //     loaded_pixel[0][i] <= sharpen_ram_wrdata[ram_rdsel_flag];
            // end            
            loaded_pixel[2][calc_cnt_delayed[2]%3] <= sharpen_ram_wrdata[(ram_rdsel_flag+2)%3];
            loaded_pixel[1][calc_cnt_delayed[2]%3] <= sharpen_ram_wrdata[(ram_rdsel_flag+1)%3];
            loaded_pixel[0][calc_cnt_delayed[2]%3] <= sharpen_ram_wrdata[ram_rdsel_flag];
            // end else if ((state_current==S_CALC2)&&(i_bicubic_en)) begin
            //     loaded_pixel[2][pixel_load_cnt] <= loaded_pixel[1][pixel_load_cnt];
            //     loaded_pixel[1][pixel_load_cnt] <= loaded_pixel[0][pixel_load_cnt];
            //     loaded_pixel[0][pixel_load_cnt] <= i_bicubic_data;
        end else begin
            v_cnt <= v_cnt;
            for (i = 0; i < 2; i = i + 1) begin
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
