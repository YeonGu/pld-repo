
module sharpen2x_ram_controller (
    input         i_clk,
    input         i_rstn,
    input  [15:0] i_wr_data,
    input         i_wr_en,
    input         i_switch_row,  // 换行
    input  [ 7:0] i_rd_x,        // 读取开始的位置. 0-255
    output [15:0] o_rd_data_11,
    output [15:0] o_rd_data_12,
    output [15:0] o_rd_data_13,
    output [15:0] o_rd_data_21,
    output [15:0] o_rd_data_22,
    output [15:0] o_rd_data_23,
    output [15:0] o_rd_data_31,
    output [15:0] o_rd_data_32,
    output [15:0] o_rd_data_33
);

    reg [1:0] wr_ptr = 0;

    reg [7:0] wr_addr;
    always @(posedge i_clk or negedge i_rstn) begin
        if (~i_rstn) wr_addr <= 0;
        else if (i_switch_row) wr_addr <= 0;
        else wr_addr <= (i_wr_en) ? wr_addr + 1 : wr_addr;
    end
    always @(posedge i_clk or negedge i_rstn) begin
        if (~i_rstn) wr_ptr <= 0;
        else if (i_switch_row) wr_ptr <= wr_ptr + 1;
        else wr_ptr <= wr_ptr;
    end

    wire [3:0] ram_wren;
    assign ram_wren[0] = (wr_ptr == 0) && i_wr_en;
    assign ram_wren[1] = (wr_ptr == 1) && i_wr_en;
    assign ram_wren[2] = (wr_ptr == 2) && i_wr_en;
    assign ram_wren[3] = (wr_ptr == 3) && i_wr_en;

    wire [ 7:0] ram_read_addra[3:0];
    wire [ 6:0] ram_read_addrb[3:0];


    wire [15:0] ram_a_rddata  [3:0];
    wire [31:0] ram_b_rddata  [3:0];

    wire [1:0] r1, r2, r3;
    assign r1                = wr_ptr - 3;
    assign r2                = wr_ptr - 2;
    assign r3                = wr_ptr - 1;


    assign ram_read_addra[0] = (i_rd_x & 1'b1) ? i_rd_x : i_rd_x + 2;
    assign ram_read_addra[1] = (i_rd_x & 1'b1) ? i_rd_x : i_rd_x + 2;
    assign ram_read_addra[2] = (i_rd_x & 1'b1) ? i_rd_x : i_rd_x + 2;
    assign ram_read_addra[3] = (i_rd_x & 1'b1) ? i_rd_x : i_rd_x + 2;
    assign ram_read_addrb[0] = (i_rd_x & 1'b1) ? i_rd_x / 2 + 1 : i_rd_x / 2;
    assign ram_read_addrb[1] = (i_rd_x & 1'b1) ? i_rd_x / 2 + 1 : i_rd_x / 2;
    assign ram_read_addrb[2] = (i_rd_x & 1'b1) ? i_rd_x / 2 + 1 : i_rd_x / 2;
    assign ram_read_addrb[3] = (i_rd_x & 1'b1) ? i_rd_x / 2 + 1 : i_rd_x / 2;

    reg [7:0] rd_x_d;
    always @(posedge i_clk) begin
        rd_x_d <= i_rd_x;
    end
    reg [47:0] rdata1, rdata2, rdata3;
    always @(*) begin
        if (rd_x_d & 1'b1) begin
            rdata1 = {ram_a_rddata[r1], ram_b_rddata[r1][15:0], ram_b_rddata[r1][31:16]};
            rdata2 = {ram_a_rddata[r2], ram_b_rddata[r2][15:0], ram_b_rddata[r2][31:16]};
            rdata3 = {ram_a_rddata[r3], ram_b_rddata[r3][15:0], ram_b_rddata[r3][31:16]};
        end else begin
            rdata1 = {ram_b_rddata[r1][15:0], ram_b_rddata[r1][31:16], ram_a_rddata[r1]};
            rdata2 = {ram_b_rddata[r2][15:0], ram_b_rddata[r2][31:16], ram_a_rddata[r2]};
            rdata3 = {ram_b_rddata[r3][15:0], ram_b_rddata[r3][31:16], ram_a_rddata[r3]};
        end
    end
    assign o_rd_data_11 = rdata1[47:32];
    assign o_rd_data_21 = rdata2[47:32];
    assign o_rd_data_31 = rdata3[47:32];
    assign o_rd_data_12 = rdata1[31:16];
    assign o_rd_data_22 = rdata2[31:16];
    assign o_rd_data_32 = rdata3[31:16];
    assign o_rd_data_13 = rdata1[15:0];
    assign o_rd_data_23 = rdata2[15:0];
    assign o_rd_data_33 = rdata3[15:0];


    sharpen2x_ram ram0 (
        .clka (i_clk),                                        // input wire clka
        .wea  (ram_wren[0]),                                  // input wire [0 : 0] wea
        .addra((wr_ptr == 0) ? wr_addr : ram_read_addra[0]),  // input wire [7 : 0] addra
        .dina (i_wr_data),                                    // input wire [15 : 0] dina
        .douta(ram_a_rddata[0]),                              // output wire [15 : 0] douta
        .clkb (i_clk),                                        // input wire clkb
        .web  (0),                                            // input wire [0 : 0] web
        .addrb(ram_read_addrb[0]),                            // input wire [6 : 0] addrb
        .dinb (0),                                            // input wire [31 : 0] dinb
        .doutb(ram_b_rddata[0])                               // output wire [31 : 0] doutb
    );
    sharpen2x_ram ram1 (
        .clka (i_clk),                                        // input wire clka
        .wea  (ram_wren[1]),                                  // input wire [0 : 0] wea
        .addra((wr_ptr == 1) ? wr_addr : ram_read_addra[1]),  // input wire [7 : 0] addra
        .dina (i_wr_data),                                    // input wire [15 : 0] dina
        .douta(ram_a_rddata[1]),                              // output wire [15 : 0] douta
        .clkb (i_clk),                                        // input wire clkb
        .web  (1'b0),                                         // input wire [0 : 0] web
        .addrb(ram_read_addrb[1]),                            // input wire [6 : 0] addrb
        .dinb (0),                                            // input wire [31 : 0] dinb
        .doutb(ram_b_rddata[1])                               // output wire [31 : 0] doutb
    );
    sharpen2x_ram ram2 (
        .clka (i_clk),                                        // input wire clka
        .wea  (ram_wren[2]),                                  // input wire [0 : 0] wea
        .addra((wr_ptr == 2) ? wr_addr : ram_read_addra[2]),  // input wire [7 : 0] addra
        .dina (i_wr_data),                                    // input wire [15 : 0] dina
        .douta(ram_a_rddata[2]),                              // output wire [15 : 0] douta
        .clkb (i_clk),                                        // input wire clkb
        .web  (0),                                            // input wire [0 : 0] web
        .addrb(ram_read_addrb[2]),                            // input wire [6 : 0] addrb
        .dinb (0),                                            // input wire [31 : 0] dinb
        .doutb(ram_b_rddata[2])                               // output wire [31 : 0] doutb
    );
    sharpen2x_ram ram3 (
        .clka (i_clk),                                        // input wire clka
        .wea  (ram_wren[3]),                                  // input wire [0 : 0] wea
        .addra((wr_ptr == 3) ? wr_addr : ram_read_addra[3]),  // input wire [7 : 0] addra
        .dina (i_wr_data),                                    // input wire [15 : 0] dina
        .douta(ram_a_rddata[3]),                              // output wire [15 : 0] douta
        .clkb (i_clk),                                        // input wire clkb
        .web  (0),                                            // input wire [0 : 0] web
        .addrb(ram_read_addrb[3]),                            // input wire [6 : 0] addrb
        .dinb (0),                                            // input wire [31 : 0] dinb
        .doutb(ram_b_rddata[3])                               // output wire [31 : 0] doutb
    );

endmodule
