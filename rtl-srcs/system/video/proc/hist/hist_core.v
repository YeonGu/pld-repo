//`timescale 1ns / 1ps

/*module Histogramequalization_core(
  input clk,               // cmos video pixel clock
  input rst_n,             // global reset
  input per_frame_vsync,   // Prepared Image data vsync valid signal
  input i_bicubic_en,
  input [7:0] i_raw_red, // Prepared Image red data to be processed
  input [7:0] i_raw_green, // Prepared Image green data to be processed
  input [7:0] i_raw_blue,  // Prepared Image blue data to be processed
  output [23:0] o_hist_res_pix
);

  integer i, j, k;
 integer a,b,c;
  reg [16:0] cur_r [31:0];
  reg [16:0] cur_g [63:0];
  reg [16:0] cur_b [31:0];
  reg [16:0] pre_r [31:0];
  reg [16:0] pre_g [63:0];
  reg [16:0] pre_b [31:0];
//  always @(posedge per_frame_vsync) begin
//   for (j = 0; j < 256; j = j + 1) begin
//          pre_r[j] <= cur_r[j];
//          pre_g[j] <= cur_g[j];
//          pre_b[j] <= cur_b[j];
//          cur_r[j] <= cur_r[j];
//          cur_g[j] <= cur_g[j];
//          cur_b[j] <= cur_b[j];
//        end
//  end
//  always@(negedge per_frame_vsync)begin
//  for (j = 0; j < 256; j = j + 1) begin
//          pre_r[j] <= pre_r[j];
//          pre_g[j] <= pre_g[j];
//          pre_b[j] <= pre_b[j];
//          cur_r[j] <= 17'd0;
//          cur_g[j] <= 17'd0;
//          cur_b[j] <= 17'd0;
//        end
//  end
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      
      for (i = 0; i < 32; i = i + 1) begin
        cur_r[i] <= 17'd0;
//        cur_g[i] <= 17'd0;
        cur_b[i] <= 17'd0;
        pre_r[i] <= 17'd0;
//        pre_g[i] <= 17'd0;
        pre_b[i] <= 17'd0;
      end
      for (j = 0; j < 64; j = j + 1) begin 
        cur_g[j] <= 17'd0;
        pre_g[j] <= 17'd0;
      end
    end else begin
      
      if (per_frame_vsync == 1'b1) begin
//        for (j = 0; j < 256; j = j + 1) begin
//          pre_r[j] <= cur_r[j];
//          pre_g[j] <= cur_g[j];
//          pre_b[j] <= cur_b[j];
//          cur_r[j] <= 17'd0;
//          cur_g[j] <= 17'd0;
//          cur_b[j] <= 17'd0;
//        end
        for (i = 0; i < 32; i = i + 1) begin
         pre_r[i] <= cur_r[i];
          pre_b[i] <= cur_b[i];
          cur_r[i] <= 17'd0;
           cur_b[i] <= 17'd0;
      end
      for (j = 0; j < 64; j = j + 1) begin 
         pre_g[j] <= cur_g[j];
         cur_g[j] <= 17'd0;
      end
      end else begin
       if (i_bicubic_en==1)begin
//        for (k = 0; k < 256; k = k + 1) begin
//          // cur_r[k] <= cur_r[k] + ((k >= (i_raw_red ))   ? 1 : 0);
//		      // cur_g[k] <= cur_g[k] + ((k >= (i_raw_green )) ? 1 : 0);
//          // cur_b[k] <= cur_b[k] + ((k >= (i_raw_blue ))  ? 1 : 0);
//          pre_r[k] <= pre_r[k];
//          pre_g[k] <= pre_g[k];
//          pre_b[k] <= pre_b[k];
//        end
        for (i = 0; i < 32; i = i + 1) begin
        pre_r[i] <= pre_r[i];
         pre_b[i] <= pre_b[i];
        end
        for (j = 0; j < 64; j = j + 1)begin
        pre_g[j] <= pre_g[j];
        end
        // pre_r <= pre_r;
        // pre_g <= pre_g;
        // pre_b <= pre_b;
        for (a = 0; a < i_raw_red[7:3]+1; a = a + 1) begin
            cur_r[a] <= cur_r[a] +1;
        end  
        for (b = 0; b < i_raw_green[7:2]+1; b = b + 1) begin
          cur_g[b] <= cur_g[b] +1;
        end
        for (c = 0; c < i_raw_blue[7:3]+1; c = c + 1) begin
          cur_b[c] <= cur_b[c] +1;
        end
        end
      else 
//        for (k = 0; k < 256; k = k + 1) begin
//          cur_r[k] <= cur_r[k]; 
//          cur_g[k] <= cur_g[k]; 
//          cur_b[k] <= cur_b[k]; 
//          pre_r[k] <= pre_r[k];
//          pre_g[k] <= pre_g[k];
//          pre_b[k] <= pre_b[k];
//        end
        for (i = 0; i < 32; i = i + 1) begin
         pre_r[i] <= pre_r[i];
          pre_b[i] <= pre_b[i];
          cur_r[i] <=cur_r[i];
           cur_b[i] <= cur_b[i];
      end
      for (j = 0; j < 64; j = j + 1) begin 
         pre_g[j] <= pre_g[j];
         cur_g[j] <=cur_g[j];
      end
      end
      end
  end
  


  reg [4:0] per_img_pixel_red;
  reg [5:0] per_img_pixel_green;
  reg [4:0] per_img_pixel_blue;

  always @(posedge clk) begin
    per_img_pixel_red 	<=  (pre_r[31-i_raw_red[7:3]   ]!=0)?(pre_r[31-i_raw_red[7:3]   ][16]?31:pre_r[31-i_raw_red[7:3]   ][15:11]):i_raw_red[7:3] ;
    per_img_pixel_green <=  (pre_g[63-i_raw_green[7:2] ]!=0)?(pre_g[63-i_raw_green[7:2] ][16]?63:pre_g[63-i_raw_green[7:2] ][15:10]):i_raw_green[7:2];
    per_img_pixel_blue  <=  (pre_b[31-i_raw_blue[7:3]  ]!=0)?(pre_b[31-i_raw_blue[7:3]  ][16]?31:pre_b[31-i_raw_blue[7:3]  ][15:11]):i_raw_blue[7:3] ;
  end

  assign o_hist_res_pix = {per_img_pixel_red,3'd0, per_img_pixel_green,2'd0, per_img_pixel_blue,3'd0};

endmodule*/
`timescale 1ns / 1ps

module Histogramequalization_core (
    input         clk,              // cmos video pixel clock
    input         rst_n,            // global reset
    input         per_frame_vsync,  // Prepared Image data vsync valid signal
    input         i_bicubic_en,
    input  [ 7:0] i_raw_Y,          // Prepared Image red data to be processed
    input  [ 7:0] i_raw_Cb,         // Prepared Image green data to be processed
    input  [ 7:0] i_raw_Cr,         // Prepared Image blue data to be processed
    output [23:0] o_hist_res_pix
);

    integer i, j, k;
    integer a, b, c;
    reg [16:0] cur_y[255:0];
    //  reg [16:0] cur_g [255:0];
    //  reg [16:0] cur_b [255:0];
    reg [16:0] pre_y[255:0];
    //  reg [16:0] pre_g [255:0];
    //  reg [16:0] pre_b [255:0];
    //  always @(posedge per_frame_vsync) begin
    //   for (j = 0; j < 256; j = j + 1) begin
    //          pre_r[j] <= cur_r[j];
    //          pre_g[j] <= cur_g[j];
    //          pre_b[j] <= cur_b[j];
    //          cur_r[j] <= cur_r[j];
    //          cur_g[j] <= cur_g[j];
    //          cur_b[j] <= cur_b[j];
    //        end
    //  end
    //  always@(negedge per_frame_vsync)begin
    //  for (j = 0; j < 256; j = j + 1) begin
    //          pre_r[j] <= pre_r[j];
    //          pre_g[j] <= pre_g[j];
    //          pre_b[j] <= pre_b[j];
    //          cur_r[j] <= 17'd0;
    //          cur_g[j] <= 17'd0;
    //          cur_b[j] <= 17'd0;
    //        end
    //  end
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin

            for (i = 0; i < 256; i = i + 1) begin
                cur_y[i] <= 17'd0;
                //    cur_g[i] <= 17'd0;
                //    cur_b[i] <= 17'd0;
                pre_y[i] <= 17'd0;
                //    pre_g[i] <= 17'd0;
                //    pre_b[i] <= 17'd0;
            end

        end else begin

            if (per_frame_vsync == 1'b1) begin
                for (j = 0; j < 256; j = j + 1) begin
                    pre_y[j] <= cur_y[j];
                    //     pre_g[j] <= cur_g[j];
                    //     pre_b[j] <= cur_b[j];
                    cur_y[j] <= 17'd0;
                    //     cur_g[j] <= 17'd0;
                    //     cur_b[j] <= 17'd0;
                end

            end else begin
                if (i_bicubic_en == 1) begin
                    for (k = 0; k < 256; k = k + 1) begin
                        // cur_r[k] <= cur_r[k] + ((k >= (i_raw_red ))   ? 1 : 0);
                        // cur_g[k] <= cur_g[k] + ((k >= (i_raw_green )) ? 1 : 0);
                        // cur_b[k] <= cur_b[k] + ((k >= (i_raw_blue ))  ? 1 : 0);
                        pre_y[k] <= pre_y[k];
                        //       pre_g[k] <= pre_g[k];
                        //       pre_b[k] <= pre_b[k];
                    end

                    for (a = 0; a < i_raw_Y + 1; a = a + 1) begin
                        cur_y[a] <= cur_y[a] + 1;
                    end
                    /* for (b = 0; b < i_raw_green+1; b = b + 1) begin
          cur_g[b] <= cur_g[b] +1;
        end
        for (c = 0; c < i_raw_blue+1; c = c + 1) begin
          cur_b[c] <= cur_b[c] +1;
        end*/
                end else
                    for (k = 0; k < 256; k = k + 1) begin
                        cur_y[k] <= cur_y[k];
                        //     cur_g[k] <= cur_g[k]; 
                        //     cur_b[k] <= cur_b[k]; 
                        pre_y[k] <= pre_y[k];
                        //     pre_g[k] <= pre_g[k];
                        //     pre_b[k] <= pre_b[k];
                    end

            end
        end
    end



    reg [7:0] per_img_pixel_Y;
    reg [7:0] per_img_pixel_Cb;
    reg [7:0] per_img_pixel_Cr;

    always @(posedge clk) begin
        per_img_pixel_Y  <= (pre_y[255-i_raw_Y] != 0) ? (pre_y[255-i_raw_Y][16] ? 255 : pre_y[255-i_raw_Y][15:8]) : i_raw_Y;
        // per_img_pixel_Y  <= (pre_y[i_raw_Y] != 0) ? (pre_y[i_raw_Y][16] ? 255 : pre_y[i_raw_Y][15:8]) : i_raw_Y;
        per_img_pixel_Cb <= i_raw_Cb;
        per_img_pixel_Cr <= i_raw_Cr;
    end

    assign o_hist_res_pix = {per_img_pixel_Y, per_img_pixel_Cb, per_img_pixel_Cr};

endmodule

