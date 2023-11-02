

module ui_renderer (
                          input         i_hdmi_pclk,
                          input         i_rstn,
    /* Message from HDMI TIMING */
                          input         i_vsync,
    (*mark_debug="true"*) input         i_vde,
                          input  [11:0] i_setx,
                          input  [11:0] i_sety,
    /* Write to UI-RAM (FROM CONFIG IO REGISTERS) */
                          input         i_ui_ram_wrclk,
                          input         i_ui_ram_wren,
                          input  [11:0] i_ui_ram_wraddr,
                          input  [ 7:0] i_ui_ram_wrdata,
    /* Final result out */
    (*mark_debug="true"*) output [23:0] o_ui_pixel
);

    (*mark_debug="true"*)wire [11:0] uiram_rdaddr;
    (*mark_debug="true"*)wire [ 7:0] font_index;
    assign uiram_rdaddr = ((i_setx - 1) >> 3) + ((i_sety - 1) >> 4) * 80;

    reg [ 3:0] vde_delayed;
    reg [11:0] sety_delayed[1:0];
    wire font_rden, font_rdvalid;
    always @(posedge i_hdmi_pclk or negedge i_rstn) begin
        if (~i_rstn) begin
            vde_delayed     <= 4'b0;
            sety_delayed[0] <= 0;
            sety_delayed[1] <= 0;
        end else begin
            vde_delayed     <= {vde_delayed[2:0], i_vde};
            sety_delayed[1] <= sety_delayed[0];
            sety_delayed[0] <= i_sety;
        end
    end
    (*mark_debug="true"*)assign font_rden    = vde_delayed[1];
    (*mark_debug="true"*)assign font_rdvalid = vde_delayed[3];


    (*mark_debug="true"*) wire [10:0] font_rdaddr;
    assign font_rdaddr = font_index * 16 + ((i_sety - 1) & 11'hF);

    (*mark_debug="true"*)reg  [2:0] font_rd_cnt;
    (*mark_debug="true"*)wire [7:0] font_rddata;
    (*mark_debug="true"*)reg  [7:0] font_shifter;
    always @(posedge i_hdmi_pclk or negedge i_rstn) begin
        if (~i_rstn) font_rd_cnt <= 0;
        else font_rd_cnt <= font_rdvalid ? font_rd_cnt + 1 : 0;
    end
    always @(posedge i_hdmi_pclk or negedge i_rstn) begin
        if (~i_rstn) font_shifter <= 0;
        else begin
            font_shifter <= (font_rd_cnt == 0) ? font_rddata : {font_shifter[6:0], 1'b0};
        end
    end
    assign o_ui_pixel = font_shifter[7] ? 24'hFFFFFF : 0;

    ui_ram u_ui_ram (
        /* Port A */
        .clka (i_ui_ram_wrclk),   // input wire clka
        // .ena  (1'b1),
        .wea  (i_ui_ram_wren),    // input wire [0 : 0] wea
        .addra(i_ui_ram_wraddr),  // input wire [11: 0] addra
        .dina (i_ui_ram_wrdata),  // input wire [7 : 0] dina
        /* Port B read */
        .clkb (i_hdmi_pclk),      // input wire clkb
        .enb  (i_vde),            // input wire enb
        .addrb(uiram_rdaddr),     // input wire [11 : 0] addrb
        .doutb(font_index)        // output wire [7 : 0] doutb
    );

    font_rom u_font_rom (
        .clka (i_hdmi_pclk),  // input wire clka
        .ena  (font_rden),    // input wire ena
        .addra(font_rdaddr),  // input wire [10 : 0] addra
        .douta(font_rddata)   // output wire [7 : 0] douta
    );

endmodule
