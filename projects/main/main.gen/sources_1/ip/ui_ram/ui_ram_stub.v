// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:22 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/ui_ram/ui_ram_stub.v
// Design      : ui_ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *)
module ui_ram(clka, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[11:0],dina[7:0],clkb,enb,addrb[11:0],doutb[7:0]" */;
  input clka;
  input [0:0]wea;
  input [11:0]addra;
  input [7:0]dina;
  input clkb;
  input enb;
  input [11:0]addrb;
  output [7:0]doutb;
endmodule
