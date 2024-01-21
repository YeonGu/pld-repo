
module defog_top (
    input         i_bicubic_clk,
    input         i_rstn,
    input  [15:0] i_bicubic_data,
    input  [15:0] i_bicubic_addr,
    input         i_bicubic_en,
    output [15:0] o_res_wrdata,
    output [15:0] o_res_wraddr,
    output        o_res_wren
);
    wire [7:0] post1_img_Y, post1_img_Cb, post1_img_Cr;
    wire [7:0] post2_img_Y, post2_img_Cb, post2_img_Cr;
    wire [7:0] post_img_red, post_img_green, post_img_blue;
    reg        bicubic_en_delayed  [5:0];
    reg [15:0] wraddr_delayed      [5:0];

    reg [ 7:0] post1_img_Cb_delayed[1:0];
    reg [ 7:0] post1_img_Cr_delayed[1:0];

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
    always @(posedge i_bicubic_clk) begin
        post1_img_Cb_delayed[1] <= post1_img_Cb_delayed[0];
        post1_img_Cb_delayed[0] <= post1_img_Cb;
        post1_img_Cr_delayed[1] <= post1_img_Cr_delayed[0];
        post1_img_Cr_delayed[0] <= post1_img_Cr;
    end
    assign post2_img_Cb = post1_img_Cb_delayed[1];
    assign post2_img_Cr = post1_img_Cr_delayed[1];

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

    contrast_func_tab contrast_func_tab (
        .clka (i_bicubic_clk),          // input wire clka
        .ena  (bicubic_en_delayed[2]),  // input wire ena
        .addra(post1_img_Y),            // input wire [7 : 0] addra
        .douta(post2_img_Y)             // output wire [7 : 0] douta
    );

    YCbCr2RGB_core YCbCr2RGB_core_inst  //1clk
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
