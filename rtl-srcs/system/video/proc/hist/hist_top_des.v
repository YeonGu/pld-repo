

module hist_top (
    input         i_bicubic_clk,
    input         i_rstn,
    input  [15:0] i_bicubic_data,
    input  [15:0] i_bicubic_addr,
    input         i_bicubic_en,
    output [15:0] o_res_wrdata,
    output [15:0] o_res_wraddr,
    output        o_res_wren,
    input         i_vsync
);


    //wire [15:0] sharpen_res_pix;

    wire [23:0] o_hist_res_pix;

    assign o_res_wrdata = {o_hist_res_pix[23:19], o_hist_res_pix[15:10], o_hist_res_pix[7:3]};
    assign o_res_wren   = i_bicubic_en;
    assign o_res_wraddr = i_bicubic_addr;





    Histogramequalization_core Histogramequalization_core (
        .clk            (i_bicubic_clk),                                     //input i_bicubic_clk,
        .rst_n          (i_rstn),                                            //input rst_n,
        // input matrix 3*3
        .i_raw_red      (i_bicubic_en ? {i_bicubic_data[15:11], 3'b0} : 0),  //input [23:0] i_raw_pix11,
        .i_raw_green    (i_bicubic_en ? {i_bicubic_data[10:5], 2'b0} : 0),   //input [23:0] i_raw_pix12,
        .i_raw_blue     (i_bicubic_en ? {i_bicubic_data[4:0], 3'b0} : 0),    //input [23:0] i_raw_pix13,
        .per_frame_vsync(i_vsync),
        .o_hist_res_pix (o_hist_res_pix)                                     //output [23:0] o_res_pix22
    );

endmodule
