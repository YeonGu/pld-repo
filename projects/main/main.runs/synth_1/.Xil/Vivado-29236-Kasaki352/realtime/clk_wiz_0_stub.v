// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_ddr_sys, clk_ddr_ref, reset, locked, clk_in1);
  output clk_ddr_sys;
  output clk_ddr_ref;
  input reset;
  output locked;
  input clk_in1;
endmodule
