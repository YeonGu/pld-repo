`timescale 1ns / 1ps

module Histogramequalization_core (
    input         clk,              // cmos video pixel clock
    input         rst_n,            // global reset
    input         per_frame_vsync,  // Prepared Image data vsync valid signal
    input  [ 7:0] i_raw_red,        // Prepared Image red data to be processed
    input  [ 7:0] i_raw_green,      // Prepared Image green data to be processed
    input  [ 7:0] i_raw_blue,       // Prepared Image blue data to be processed
    output [23:0] o_hist_res_pix
);

    integer i, j, k;

    reg [16:0] cur_r[255:0];
    reg [16:0] cur_g[255:0];
    reg [16:0] cur_b[255:0];
    reg [16:0] pre_r[255:0];
    reg [16:0] pre_g[255:0];
    reg [16:0] pre_b[255:0];

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin

            for (i = 0; i < 256; i = i + 1) begin
                cur_r[i] <= 24'b0;
                cur_g[i] <= 24'b0;
                cur_b[i] <= 24'b0;
                pre_r[i] <= 24'b0;
                pre_g[i] <= 24'b0;
                pre_b[i] <= 24'b0;
            end
        end else begin

            if (per_frame_vsync == 1'b1) begin
                for (j = 0; j < 256; j = j + 1) begin
                    pre_r[j] <= cur_r[j];
                    pre_g[j] <= cur_g[j];
                    pre_b[j] <= cur_b[j];
                    cur_r[j] <= 24'b0;
                    cur_g[j] <= 24'b0;
                    cur_b[j] <= 24'b0;
                end
            end else begin

                for (k = 0; k < 256; k = k + 1) begin
                    cur_r[k] <= cur_r[k] + ((k >= (i_raw_red)) ? 1 : 0);
                    cur_g[k] <= cur_g[k] + ((k >= (i_raw_green)) ? 1 : 0);
                    cur_b[k] <= cur_b[k] + ((k >= (i_raw_blue)) ? 1 : 0);
                    pre_r[k] <= pre_r[k];
                    pre_g[k] <= pre_g[k];
                    pre_b[k] <= pre_b[k];
                end

            end
        end
    end



    reg [7:0] per_img_pixel_red;
    reg [7:0] per_img_pixel_green;
    reg [7:0] per_img_pixel_blue;

    always @(posedge clk) begin
        per_img_pixel_red   <= (pre_r[16] ? 255 : pre_r[i_raw_red][15:8]);
        per_img_pixel_green <= (pre_g[16] ? 255 : pre_g[i_raw_green][15:8]);
        per_img_pixel_blue  <= (pre_b[16] ? 255 : pre_b[i_raw_blue][15:8]);
    end

    assign o_hist_res_pix = {per_img_pixel_red, per_img_pixel_green, per_img_pixel_blue};

endmodule
