`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/14 17:47:17
// Design Name: 
// Module Name: fifo-test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_test(

    );
    
    // Input
    reg rst;

    reg [15:0]din;
    reg wr_en;
    reg rd_en;
    
    reg clk = 0;
    always #1 clk = ~clk;
    wire wr_clk = clk;
    wire rd_clk = clk;
    
    initial begin
        rst = 1;
        #20 rst = 0;
    end
    
    initial begin
		#20;
		wr_en = 1;
		rd_en =0;
		din = 24;
		#200;
		wr_en = 0;
		rd_en = 1;
	end
    
    
    wire dout;
    wire full;
    wire empty;
    wire wr_rst_busy;
    wire rd_rst_busy;

    
    camera_wr_fifo your_instance_name (
  .rst(rst),                  // input wire rst
  .wr_clk(wr_clk),            // input wire wr_clk
  .rd_clk(rd_clk),            // input wire rd_clk
  .din(din),                  // input wire [15 : 0] din
  .wr_en(wr_en),              // input wire wr_en
  .rd_en(rd_en),              // input wire rd_en
  .dout(dout),                // output wire [127 : 0] dout
  .full(full),                // output wire full
  .empty(empty),              // output wire empty
  .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
);
endmodule
