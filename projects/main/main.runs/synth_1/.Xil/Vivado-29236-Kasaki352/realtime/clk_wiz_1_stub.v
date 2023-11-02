// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_1(hdmi_pix, hdmi_pix_5x, cam_xclk, reset, locked, 
  clk_in1);
  output hdmi_pix;
  output hdmi_pix_5x;
  output cam_xclk;
  input reset;
  output locked;
  input clk_in1;
endmodule
