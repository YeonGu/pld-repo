

module vpu_ioregs #(
    parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
) (
    /* APB */
                          input                       HCLK,
                          input                       HRESETn,
    /** APB Commands **/
    (*mark_debug="true"*) input  [APB_ADDR_WIDTH-1:0] PADDR,
    (*mark_debug="true"*) input  [              31:0] PWDATA,
    (*mark_debug="true"*) input                       PWRITE,
    (*mark_debug="true"*) input                       PSEL,
    (*mark_debug="true"*) input                       PENABLE,
    (*mark_debug="true"*) output [              31:0] PRDATA,
    /* Configs */
    (*mark_debug="true"*) output [               7:0] o_config_setx,
    (*mark_debug="true"*) output [               7:0] o_config_sety,
    (*mark_debug="true"*) output [               7:0] o_config_settings,
    (*mark_debug="true"*) output [               7:0] o_configs_1,
    (*mark_debug="true"*) output [               7:0] o_configs_2,
    /* UI-RAM WRITE */
    //   output                      o_ui_ram_wrclk,
    (*mark_debug="true"*) output                      o_ui_ram_wren,
    (*mark_debug="true"*) output [              11:0] o_ui_ram_wraddr,
                          output [               7:0] o_ui_ram_wrdata
);

    reg [31:0] rdata;
    (*mark_debug="true"*)reg [ 7:0] vpu_ioregs[15:0];  // 16 IO REGISTERS IS IN THIS AREA.

    /*****************************************************/
    // Config output
    /*****************************************************/
    assign o_config_setx     = vpu_ioregs[0];
    assign o_config_sety     = vpu_ioregs[1];
    assign o_config_settings = vpu_ioregs[2];
    assign o_configs_1       = vpu_ioregs[3];
    assign o_configs_2       = vpu_ioregs[4];

    wire [11:0] uiram_p;
    assign uiram_p = vpu_ioregs[5] + (vpu_ioregs[6] * 80);

    reg [11:0] ui_ram_wraddr;

    /** Read **/
    always @(posedge HCLK) begin
        if (~HRESETn) rdata <= 0;
        else if (~PWRITE && PSEL && ~PENABLE) begin
            rdata <= vpu_ioregs[PADDR];
        end else rdata <= rdata;
    end
    assign PRDATA = rdata;

    /** Write **/
    always @(posedge HCLK) begin
        if (PWRITE & PSEL & ~PENABLE) begin
            vpu_ioregs[PADDR] <= PWDATA;
        end
    end

    /* VRAM WRITE */
    // localparam REG_WRDATA = 5'h18;
    assign apb_ram_wraddr  = PWRITE & PSEL & ~PENABLE && ((PADDR == 4'h5) || (PADDR == 4'h6));
    assign o_ui_ram_wren   = PWRITE & PSEL & ~PENABLE && (PADDR == 4'h7);
    assign o_ui_ram_wrdata = PWDATA;
    assign o_ui_ram_wraddr = ui_ram_wraddr;
    always @(posedge HCLK) begin
        if (apb_ram_wraddr) begin
            ui_ram_wraddr <= uiram_p;
        end else if (o_ui_ram_wren) begin
            ui_ram_wraddr <= ui_ram_wraddr + 1;
        end else ui_ram_wraddr <= ui_ram_wraddr;
    end

endmodule
