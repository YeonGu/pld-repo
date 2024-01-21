module video_proc_unit (
                          input          i_proc_unit_clk,       // 视频处理模块总时钟
                          input          i_proc_unit_rstn,
                          input          i_video_vsyncn,
    /** Bypass read **/
                          input          i_bypass_data_clk,
                          input          i_bypass_data_en,
                          input  [127:0] i_bypass_data,
                          input          i_bypass_rlast,
    // Video Processor RAM read (HDMI OUTPUT) 
                          input          vpu_ram_rden,
                          input  [ 15:0] vpu_ram_rdaddr,
                          output [ 15:0] vpu_ram_rddata,
    // Video Processor Unit
                          output         o_proc_unit_clk,       // 视频处理模块请求事件时钟
    (*mark_debug="true"*) output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
    (*mark_debug="true"*) output         o_proc_unit_req_en,    // 视频处理模块 数据请求使能
    // Video Processor Configs
                          input  [  8:0] i_config_setx,
                          input  [  8:0] i_config_sety,
                          input  [  7:0] i_config_settings,
                          input  [  7:0] i_configs_1,           // 3 CONF reg; Advanced Proc. Select
                          input  [  7:0] i_configs_2
);

    assign o_proc_unit_clk = i_proc_unit_clk;


    // Options
    wire       opt_bcb_mul;
    wire [3:0] conf_proc_sel;
    assign opt_bcb_mul   = i_config_settings[2];
    assign conf_proc_sel = i_configs_1[3:0];

    reg [1:0] bcb_ctrl_vsync;
    reg [1:0] vs_r;
    always @(posedge i_proc_unit_clk) begin
        vs_r <= {vs_r[0], i_video_vsyncn};
    end
    wire vsync_start, vsync_end;
    assign vsync_start = vs_r == 2'b10;
    assign vsync_end   = vs_r == 2'b01;
    reg enabled_bcb;
    /* B2X Vsync Ctrl */
    always @(posedge i_proc_unit_clk) begin
        if (vsync_start) begin
            bcb_ctrl_vsync[0] <= 1;
        end else if (vsync_end) begin
            bcb_ctrl_vsync[0] <= (opt_bcb_mul == 0) ? 0 : 1;
        end else bcb_ctrl_vsync[0] <= bcb_ctrl_vsync[0];
    end
    always @(posedge i_proc_unit_clk) begin
        if (vsync_start) begin
            bcb_ctrl_vsync[1] <= 1;
        end else if (vsync_end) begin
            bcb_ctrl_vsync[1] <= (opt_bcb_mul == 1) ? 0 : 1;
        end else bcb_ctrl_vsync[1] <= bcb_ctrl_vsync[1];
    end
    always @(posedge i_proc_unit_clk) begin
        if (vsync_start) begin
            enabled_bcb <= opt_bcb_mul;
        end else enabled_bcb <= enabled_bcb;
    end

    /************************************************/
    // Internal Signals
    /************************************************/
    /** Bicubic **/
    localparam B2X_IDX = 1'b0, B4X_IDX = 1'b1;
    // Bicubic Req
    wire [31:0] bcb_req_addr            [1:0];
    wire        bcb_req_en              [1:0];
    // Bicubic Original Video
    wire [15:0] bcb_res_data            [1:0];
    wire [15:0] bcb_res_wraddr          [1:0];
    wire        bcb_res_wren            [1:0];


    (*mark_debug="true"*)reg         vrr_wren;
    (*mark_debug="true"*)reg  [15:0] vrr_wraddr;
    (*mark_debug="true"*)reg  [15:0] vrr_wrdata;


    /* Original data from Selected Bicubic core */
    wire [15:0] selected_ori_res_data;
    wire [15:0] selected_ori_res_wraddr;
    wire        selected_ori_res_wren;

    /** Data from Enhanced video **/
    wire [15:0] hist_res_data;
    wire [15:0] hist_res_wraddr;
    wire        hist_res_wren;
    wire [15:0] defog_res_data;
    wire [15:0] defog_res_wraddr;
    wire        defog_res_wren;
    wire [15:0] sharpen2x_res_data;
    wire [15:0] sharpen2x_res_wraddr;
    wire        sharpen2x_res_wren;
    wire [15:0] sharpen4x_res_data;
    wire [15:0] sharpen4x_res_wraddr;
    wire        sharpen4x_res_wren;

    /*********************************************************/
    // Signal MUX
    /*********************************************************/
    /** Req MUX **/
    // assign o_proc_unit_req_addr    = (bcb_ctrl_vsync[0] == 0) ? bcb_req_addr[0] : ((bcb_ctrl_vsync[1] == 0) ? bcb_req_addr[1] : 0);
    // assign o_proc_unit_req_en      = (bcb_ctrl_vsync[0] == 0) ? bcb_req_en[0] : (bcb_ctrl_vsync[1] == 0) ? bcb_req_en[1] : 0;
    // assign o_proc_unit_req_addr    = bcb_req_addr[enabled_bcb];
    // assign o_proc_unit_req_en      = bcb_req_en[enabled_bcb];
    // assign o_proc_unit_req_addr    = bcb_req_addr[opt_bcb_mul];
    // assign o_proc_unit_req_en      = bcb_req_en[opt_bcb_mul];
    assign o_proc_unit_req_addr    = bcb_req_addr[0];
    assign o_proc_unit_req_en      = bcb_req_en[0];
    /** Original Video Sel MUX **/
    assign selected_ori_res_data   = bcb_res_data[opt_bcb_mul];
    assign selected_ori_res_wraddr = bcb_res_wraddr[opt_bcb_mul];
    assign selected_ori_res_wren   = bcb_res_wren[opt_bcb_mul];

    /** Configs; Result Video MUX **/
    localparam BICUBIC_ONLY = 4'h0, SHARPEN = 4'h1, DEFOG = 4'h2, HIST = 4'h3;
    always @(*) begin
        case (conf_proc_sel)
            BICUBIC_ONLY: begin
                vrr_wren   = selected_ori_res_wren;
                vrr_wraddr = selected_ori_res_wraddr;
                vrr_wrdata = selected_ori_res_data;
            end
            SHARPEN: begin
                if (opt_bcb_mul == B2X_IDX) begin
                    vrr_wren   = sharpen2x_res_wren;
                    vrr_wraddr = sharpen2x_res_wraddr;
                    vrr_wrdata = sharpen2x_res_data;
                end else begin
                    vrr_wren   = sharpen4x_res_wren;
                    vrr_wraddr = sharpen4x_res_wraddr;
                    vrr_wrdata = sharpen4x_res_data;
                end
            end
            DEFOG: begin
                vrr_wren   = defog_res_wren;
                vrr_wraddr = defog_res_wraddr;
                vrr_wrdata = defog_res_data;
            end
            HIST: begin
                vrr_wren   = hist_res_wren;
                vrr_wraddr = hist_res_wraddr;
                vrr_wrdata = hist_res_data;
            end
            default: begin
                vrr_wren   = selected_ori_res_wren;
                vrr_wraddr = selected_ori_res_wraddr;
                vrr_wrdata = selected_ori_res_data;
            end
        endcase
    end

    wire [23:0] defog_res_pixel;
    defog_top u_defog (
        //global clock
        .i_rstn        (i_proc_unit_rstn),         // input         rst_n,             //global reset
        .i_bicubic_clk (i_proc_unit_clk),          // input         clk,               //cmos video pixel clock
        .i_bicubic_data(selected_ori_res_data),    // .per_frame_vsync(~i_video_vsyncn),                       // input         per_frame_vsync,   //Prepared Image data vsync valid signal
        .i_bicubic_addr(selected_ori_res_wraddr),  // .per_frame_clken(selected_ori_res_wren),                 // input         per_frame_clken,
        .i_bicubic_en  (selected_ori_res_wren),    // .per_img_red    ({selected_ori_res_data[15:11], 3'd0}),  // input  [ 7:0] per_img_red,       //Prepared Image red data to be processed
        .o_res_wrdata  (defog_res_data),           // .per_img_green  ({selected_ori_res_data[10:5], 2'd0}),   // input  [ 7:0] per_img_green,     //Prepared Image green data to be processed
        .o_res_wraddr  (defog_res_wraddr),         // .per_img_blue   ({selected_ori_res_data[4:0], 3'd0}),    // input  [ 7:0] per_img_blue,      //Prepared Image blue data to be processed
        .o_res_wren    (defog_res_wren)            // .o_res_wren     (defog_res_wren),                        // output        o_res_wren,
        // // .post_frame_vsync(~i_video_vsyncn),                       // output        post_frame_vsync,  //Processed Image data vsync valid signal
        // .per_img_pixel  (defog_res_pixel),                       // output [23:0] per_img_pixel
        // .o_res_wraddr   (defog_res_wraddr)
    );
    // assign defog_res_data = {defog_res_pixel[23:19], defog_res_pixel[15:10], defog_res_pixel[7:3]};

    hist_top u_hist (
        .i_bicubic_clk (i_proc_unit_clk),          // input         i_bicubic_clk,
        .i_rstn        (i_proc_unit_rstn),         // input         i_rstn,
        .i_bicubic_data(selected_ori_res_data),    // input  [15:0] i_bicubic_data,
        .i_bicubic_addr(selected_ori_res_wraddr),  // input  [15:0] i_bicubic_addr,
        .i_bicubic_en  (selected_ori_res_wren),    // input         i_bicubic_en,
        .o_res_wrdata  (hist_res_data),            // output [15:0] o_res_wrdata,
        .o_res_wraddr  (hist_res_wraddr),          // output [15:0] o_res_wraddr,
        .o_res_wren    (hist_res_wren),            // output        o_res_wren,
        .i_vsync       (~i_video_vsyncn)           // input         i_vsync
    );

    sharpen_top u_sharpen_2x (
        .i_bicubic_clk (i_proc_unit_clk),        // input         i_bicubic_clk,
        .i_rstn        (i_proc_unit_rstn),       // input         i_rstn,
        .i_bicubic_data(bcb_res_data[B2X_IDX]),  // input  [15:0] i_bicubic_data,
        .i_bicubic_en  (bcb_res_wren[B2X_IDX]),  // input         i_bicubic_en,
        .o_res_wrdata  (sharpen2x_res_data),     // output [15:0] o_res_wrdata,
        .o_res_wraddr  (sharpen2x_res_wraddr),   // output [15:0] o_res_wraddr,
        .o_res_wren    (sharpen2x_res_wren),     // output        o_res_wren,
        .i_vsync       (~i_video_vsyncn)         // input         i_vsync
    );




    wire bicubic_2x_rstn;
    assign bicubic_2x_rstn = i_proc_unit_rstn;
    bicubic_top_2x bicubic_2x (
        .i_bicubic_clk       (i_proc_unit_clk),          // input          i_bicubic_clk,
        .i_rstn              (bicubic_2x_rstn),          // input          i_rstn,
        .i_vsync             (~i_video_vsyncn),          // input          i_vsync,
        .i_config_x          (i_config_setx),            // input  [  8:0] i_config_x,
        .i_config_y          (i_config_sety),            // input  [  8:0] i_config_y,
        .o_proc_unit_req_addr(bcb_req_addr[B2X_IDX]),    // output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
        .o_proc_unit_req_en  (bcb_req_en[B2X_IDX]),      // output         o_proc_unit_req_en,    // 视频处理模块 数据请求使能
        // 请求的数据输入 (AXI CLOCK)
        .i_bypass_data_clk   (i_bypass_data_clk),        // input          i_bypass_data_clk,
        .i_bypass_data_en    (i_bypass_data_en),         // input          i_bypass_data_en,
        .i_bypass_data       (i_bypass_data),            // input  [127:0] i_bypass_data,
        .i_bypass_rlast      (i_bypass_rlast),           // input          i_bypass_rlast,
        .o_res_wraddr        (bcb_res_wraddr[B2X_IDX]),  // output [ 15:0] o_res_wraddr,
        .o_res_wrdata        (bcb_res_data[B2X_IDX]),    // output [ 15:0] o_res_wrdata,
        .o_res_wren          (bcb_res_wren[B2X_IDX])     // output         o_res_wren
    );
    // bicubic_top_4x bicubic_4x (
    //     .i_bicubic_clk       (i_proc_unit_clk),          // input          i_bicubic_clk,
    //     .i_rstn              (bicubic_2x_rstn),          // input          i_rstn,
    //     .i_vsync             (bcb_ctrl_vsync[B4X_IDX]),  // input          i_vsync,
    //     .i_config_x          (i_config_setx),            // input  [  8:0] i_config_x,
    //     .i_config_y          (i_config_sety),            // input  [  8:0] i_config_y,
    //     .o_proc_unit_req_addr(bcb_req_addr[B4X_IDX]),    // output [ 31:0] o_proc_unit_req_addr,  // 视频处理模块 数据请求地址
    //     .o_proc_unit_req_en  (bcb_req_en[B4X_IDX]),      // output         o_proc_unit_req_en,    // 视频处理模块 数据请求使能
    //     // 请求的数据输入 (AXI CLOCK)
    //     .i_bypass_data_clk   (i_bypass_data_clk),        // input          i_bypass_data_clk,
    //     .i_bypass_data_en    (i_bypass_data_en),         // input          i_bypass_data_en,
    //     .i_bypass_data       (i_bypass_data),            // input  [127:0] i_bypass_data,
    //     .i_bypass_rlast      (i_bypass_rlast),           // input          i_bypass_rlast,
    //     .o_res_wraddr        (bcb_res_wraddr[B4X_IDX]),  // output [ 15:0] o_res_wraddr,
    //     .o_res_wrdata        (bcb_res_data[B4X_IDX]),    // output [ 15:0] o_res_wrdata,
    //     .o_res_wren          (bcb_res_wren[B4X_IDX])     // output         o_res_wren
    // );

    vpu_result_ram vpu_ram (
        /** Port A write **/
        .clka (i_proc_unit_clk),  // input wire clka
        .ena  (1'b1),             // input wire ena
        .wea  (vrr_wren),         // input wire [0 : 0] wea
        .addra(vrr_wraddr),       // input wire [15 : 0] addra
        .dina (vrr_wrdata),       // input wire [15 : 0] dina
        /** Port B read **/
        .clkb (i_proc_unit_clk),  // input wire clkb
        .enb  (vpu_ram_rden),     // input wire enb
        .addrb(vpu_ram_rdaddr),   // input wire [15 : 0] addrb
        .doutb(vpu_ram_rddata)    // output wire [15 : 0] doutb
    );

endmodule
