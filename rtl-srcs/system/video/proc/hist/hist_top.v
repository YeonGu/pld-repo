

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
    reg  [1:0] vs;
    wire       vs_pulse;
    always @(posedge i_bicubic_clk) begin
        vs <= {vs[0], i_vsync};
    end
    assign vs_pulse = (vs == 2'b01);

    //wire [23:0] o_hist_res_pix;
    wire [7:0] post1_img_Y, post2_img_Y;
    wire [7:0] post1_img_Cb, post2_img_Cb;
    wire [7:0] post1_img_Cr, post2_img_Cr;
    wire [7:0] post_img_red, post_img_green, post_img_blue;
    reg        bicubic_en_delayed[5:0];
    reg [15:0] wraddr_delayed    [5:0];
    assign o_res_wrdata = {post_img_red[7:3], post_img_green[7:2], post_img_blue[7:3]};
    assign o_res_wren   = bicubic_en_delayed[4];
    assign o_res_wraddr = wraddr_delayed[4];

    always @(posedge i_bicubic_clk) begin
        bicubic_en_delayed[5] <= bicubic_en_delayed[4];
        bicubic_en_delayed[4] <= bicubic_en_delayed[3];
        bicubic_en_delayed[3] <= bicubic_en_delayed[2];
        bicubic_en_delayed[2] <= bicubic_en_delayed[1];
        bicubic_en_delayed[1] <= bicubic_en_delayed[0];
        bicubic_en_delayed[0] <= i_bicubic_en;
    end
    always @(posedge i_bicubic_clk) begin
        wraddr_delayed[5] <= wraddr_delayed[4];
        wraddr_delayed[4] <= wraddr_delayed[3];
        wraddr_delayed[3] <= wraddr_delayed[2];
        wraddr_delayed[2] <= wraddr_delayed[1];
        wraddr_delayed[1] <= wraddr_delayed[0];
        wraddr_delayed[0] <= i_bicubic_addr;
    end
    RGB2YCbCr_core RGB2YCbCr_core_inst  //2clk
    (
        //global clock
        .clk          (i_bicubic_clk),                  // input					clk,  				//cmos video pixel clock
        .rst_n        (i_rstn),                         // input					rst_n,				//global reset	
        .per_img_red  ({i_bicubic_data[15:11], 3'd0}),  // input		[7:0]		per_img_red,		//Prepared Image red data to be processed
        .per_img_green({i_bicubic_data[10:5], 2'd0}),   // input		[7:0]		per_img_green,		//Prepared Image green data to be processed
        .per_img_blue ({i_bicubic_data[4:0], 3'd0}),    // input		[7:0]		per_img_blue,		//Prepared Image blue data to be processed
        .post_img_Y   (post1_img_Y),                    // output		[7:0]		post_img_Y,			//Processed Image brightness output
        .post_img_Cb  (post1_img_Cb),                   // output		[7:0]		post_img_Cb,		//Processed Image blue shading output
        .post_img_Cr  (post1_img_Cr)                    // output		[7:0]		post_img_Cr			//Processed Image red shading output
    );
    Histogramequalization_core Histogramequalization_core (  //1clk
        .clk            (i_bicubic_clk),          //input i_bicubic_clk,
        .rst_n          (i_rstn),                 //input rst_n,
        // input matrix 3*3
        .i_bicubic_en   (bicubic_en_delayed[2]),
        // .i_raw_red  (i_bicubic_en?{i_bicubic_data[15:11],3'd0}:0),          //input [23:0] i_raw_pix11,
        // .i_raw_green  (i_bicubic_en?{i_bicubic_data[10:5],2'd0}:0),          //input [23:0] i_raw_pix12,
        // .i_raw_blue  (i_bicubic_en?{i_bicubic_data[4:0],3'd0}:0),          //input [23:0] i_raw_pix13,
        .i_raw_Y        (post1_img_Y),
        .i_raw_Cb       (post1_img_Cb),
        .i_raw_Cr       (post1_img_Cr),
        .per_frame_vsync(vs_pulse),


        .o_hist_res_pix({post2_img_Y, post2_img_Cb, post2_img_Cr})  //output [23:0] o_res_pix22
    );
    YCbCr2RGB_core YCbCr2RGB_core_inst  //2clk
    (
        // //global clock
        .clk  (i_bicubic_clk),  // input					clk,  				//cmos video pixel clock
        .rst_n(i_rstn),         // input					rst_n,				//global reset

        .per_img_Y     (post2_img_Y),     // output		[7:0]	per_img_Y,			//Processed Image brightness output
        .per_img_Cb    (post2_img_Cb),    // output		[7:0]	per_img_Cb,		//Processed Image blue shading output
        .per_img_Cr    (post2_img_Cr),    // output		[7:0]	per_img_Cr	,
        .post_img_red  (post_img_red),    // input		[7:0]		post_img_red,		//Prepared Image red data to be processed
        .post_img_green(post_img_green),  // input		[7:0]		post_img_green,		//Prepared Image green data to be processed
        .post_img_blue (post_img_blue)    // input		[7:0]		post_img_blue			//Processed Image red shading output
    );

endmodule
