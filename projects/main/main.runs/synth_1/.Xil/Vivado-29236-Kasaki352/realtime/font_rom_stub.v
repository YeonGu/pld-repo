// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *)
module font_rom(clka, ena, addra, douta);
  input clka;
  input ena;
  input [10:0]addra;
  output [7:0]douta;
endmodule
