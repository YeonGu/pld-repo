
module shram_tb ();

    reg clk = 0;
    reg rstn = 0;
    always #1 clk = ~clk;
    initial begin
        #10;
        rstn = 1;
    end


    wire [15:0] o_rd_data_11;
    wire [15:0] o_rd_data_12;
    wire [15:0] o_rd_data_13;
    wire [15:0] o_rd_data_21;
    wire [15:0] o_rd_data_22;
    wire [15:0] o_rd_data_23;
    wire [15:0] o_rd_data_31;
    wire [15:0] o_rd_data_32;
    wire [15:0] o_rd_data_33;

    reg  [15:0] wrdata = 0;
    reg  [ 7:0] rdx = 0;
    reg         swr = 0;
    reg         wren = 0;

    integer i, j;
    initial begin
        #11;
        for (j = 0; j < 10; j = j + 1) begin
            wren = 1;
            for (i = 0; i < 256; i = i + 1) begin
                #2;
                wrdata = wrdata + 1;
            end
            wren = 0;
            swr  = 1;
            #2;
            swr = 0;
            for (i = 0; i < 256; i = i + 1) begin
                #2;
                rdx = rdx + 1;
            end
        end
    end

    sharpen2x_ram_controller sharpen2x_ram_controller (
        .i_clk       (clk),
        .i_rstn      (rstn),
        .i_wr_data   (wrdata),              // input  [15:0] i_wr_data,
        .i_wr_en     (wren),              // input         i_wr_en,
        .i_switch_row(swr),              // input         i_switch_row,  // 换行
        .i_rd_x      (rdx),              // input  [ 7:0] i_rd_x,        // 读取�?始的位置. 0-255
        .o_rd_data_11(o_rd_data_11),  // output [15:0] o_rd_data_11,
        .o_rd_data_12(o_rd_data_12),  // output [15:0] o_rd_data_12,
        .o_rd_data_13(o_rd_data_13),  // output [15:0] o_rd_data_13,
        .o_rd_data_21(o_rd_data_21),  // output [15:0] o_rd_data_21,
        .o_rd_data_22(o_rd_data_22),  // output [15:0] o_rd_data_22,
        .o_rd_data_23(o_rd_data_23),  // output [15:0] o_rd_data_23,
        .o_rd_data_31(o_rd_data_31),  // output [15:0] o_rd_data_31,
        .o_rd_data_32(o_rd_data_32),  // output [15:0] o_rd_data_32,
        .o_rd_data_33(o_rd_data_33)   // output [15:0] o_rd_data_33
    );

endmodule
