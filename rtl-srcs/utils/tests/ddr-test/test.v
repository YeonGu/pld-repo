module test (
    input sys_clk,
    input sys_rstn

);
    wire ddr_clk_320m;
    wire ddr_ref_200m;
    clk_wiz_0 sys_pll (
        // Clock out ports
        .clk_out1(ddr_clk_320m),  // output clk_out1
        .clk_out2(ddr_ref_200m),
        // Status and control signals
        .reset   (~sys_rstn),     // input reset
        .locked  (pll_locked),    // output locked
        // Clock in ports
        .clk_in1 (sys_clk)        // input clk_in1
    );

    (* mark_debug = "true" *) reg [10:0] t;
    always @(posedge ddr_ref_200m) begin
        t <= t + 1;
    end

endmodule  //test
