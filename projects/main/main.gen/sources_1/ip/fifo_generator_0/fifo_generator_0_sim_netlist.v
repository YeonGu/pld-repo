// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:25 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fifo_generator_0
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [3:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "4" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "14" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_generator_0_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[3:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_generator_0_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_generator_0_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_generator_0_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_generator_0_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_generator_0_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_generator_0_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 108896)
`pragma protect data_block
hlWB7TV5/Q1pR3XkMY7xEsskRuCEsfsXbb0REtKR15YBwi3ibH1z935GaeiRjj8LbW4fH8F8CtgH
4sNc1T65loRMjtwDFWk5ftYJjwIGayvUMCEwAnzrZAeovlIkKbjntcbPPqTXxVJiRLktXT8Z9L5K
NuedEieMZXtQsJ0crc9WytV6zxHD6mMNbrdN+OQt0J9bkDcBYs99xAg18pngGCYXMBrP506knt+e
j2QhR3Pz3Mm7SXefzMzAeDq9nYi5JedUysg1fD3QQTyefnIDuYsjHeWkHo/qq+/J+50Lls0n4/xO
lhWB78tqDMRFH9YWxnigtItOhsL7zSGolMcFOno/wTxlSQFAmtLkUfmiTDGlNIeRjuFpSAdN08M0
vwkYadsIPmJH62jiimxW3B3G4EJ5WSm6OEEqaqCcgFyHOzWSNxNVlB+Au9xRIGkW7J3tyloigyaw
kumLAX9BF0euqq0CAj5eV0kllS9c6Y126gIqFkuCJd8OWn0krZ51Jc7JA+UMd1Szt8BJslDkV7ug
PtVhArQojUqjb0HFA9EGcX3wOdUCSJczrLfU3L7oEHfW9KBVB8PrDR/nP7l6HVU4M4w4BcnVWGxp
FD4p+/8kD/RA8PMxKSfS0SKRVT7fqiavozt1Q70/COqxtxfbrzf/V99aLH8AICfKWD+AvqUq+U/H
l0ZMm/pyorS6S944bd3R/iAqxeOB3NiDbnPq6jFCvM8pd9EKly2emEaCMn/EgWA4M7fYwzs1NgPW
Tah0JYORNvHkoi+VlFQZBZHsykqFD6fXzF+XWhK0TfA4FScO0mCFLIDjsfxU9nIJPDEP/67QY8fV
Sp+pYBoxPqzD54kXJ2GtNs1TKKXRHOJh9KCJdXbffa4O33hsfEM8OrXdL7+urFXSidt/rX5thi+G
RSCbJmB4SHgB7csBvXB6vTH6H9kdepQYwfPb4SljYkBTetlt4wjZMTXVRxwcspqF7Wuf+eQ8cXhc
adTgh1Y919fcTuOIPfNl5cFIZQxxeu7kFik022gR5tTbWXZBN75mAS3E/za7TMskVAIslHGgoTdU
2wyDvpuiUY/Zdw+z1xZnCADKjFuuMNyHmx7wrPZbDYaAZpEk/9jNPtCAcAyklYwQ9nGtw09DzMRI
oNIiPmhCGeXZG7DSrMCpxeGE2jKJgRBWjlSw1wQMEwRV++I/a3IRcogQvN25fAdm6L+7v2b5FTao
En1Km03N35zlSfr/NWg7EFrWILGfuh5wsQs2qZMmi7I9RHxX4ZeaXfq56+PCp8fExfv/CXKrWsJI
JtmqShA02bP+wWFIIwGNzSc90zUMNYQS2tZokQIC/yXR3ssRP4REqMSVp7GyIrWvnbXk407hHbne
tN3L7LFn9zMqBP8IWd6lDBghqwCEmn2ow6xMxd+2DmEdH7PUjP2y/cKbFW//2DFrLphIiMg+m1au
iLWJ334OOPGOxTus3Yv7coNT5v8n+d0oc6L9i1w6OcMuKgJdvA2nhzpnRZDWnfTgOLU3RToBiR6b
jTgsQHujKxHQloFFJEVnbt9CYj+F+rLGZaNpxZuM1TjaBykysmyOxN6LKB3gQFQe40Wnr1ZKzAdV
Sr2MpGjSvhu5F2oTRuUNoGkSEPOX948hR7//5HMWUVux9qXh3VZbVotW3K8M6J6t+8bRyiMrhQfX
DFdvkeIeC1nF28MoHWzR7ULgty2GruTKVVTWaI6naY43f4p30BkW4tJ3Du400GfUqftXwJb8gCjf
F5YsXTQgXsJqVOtkQxUSX1fbrl7ak+WEsvtVv8LEW/LJnKg0ALneH3DG01MiQa3Pg66iKGwMccM7
bjz9YaiE8mHxITKPL0ONyslDYIk7d6/1Wkwb6lUZ0eVZ/E0wNCQy8Kl5FDCBSwCqkcis9yNRQqim
TSDRQGHu7ubMmAEVcOhdR9paK/ZlQd0IMRSEJr/IEYbckihvKHnszjDVqYlhCuCFaRpE3ZcCp+Ul
CA1ZMWhRDKbjiGaMXb0Z5DAq19aNzV5wI5GkooOhTbdEUp0WtaU3nHXsTM9Itr2GUgQrdkXeuixo
SQ3JWy5UdFLRv6GhFgPBiXcr2OkVbYLliG0lDVuF+pFKr0m452Udgj8CPQF5vbhMbBPCoKt//Rkm
beMbLK1cHnhfJBn3KMIvnwgTO5JRcjabgGIZXq5sf3aXRkJxxPSXNZP06VG+7AL9gmJEalEoGZIa
D2oJue/nvZKh5Qa7GtHAkIMpW5hZ35IDJWgTJAvpgNu+cNOuIFIWCk16QnRrdW0LnDqFi5U1F0LM
DzkeCmtlgN+NsAuvfIy2yGffd1WUNq+AsYdhqPbYWAHDmceaGwu8ntIeOpdYz98vTmNzkBSl/wog
b1GQHm90PzsXDA5A4eERe7yeFWF5RMn/Vxw3caSV2SN/4vSiZqUZEXNRCWm5ANaMEyC6dLyGUlQq
g+vvGH3mHlWzzGRWzmf+02iVDxD/Bqvk2RL00JcD//+2gxqYvGxRhHkeq7KF/t81PCFjdDSL4x+4
YQt3VXHd/UiYTewjbU3zGBPdM3uSTDnltw+9OE9MABXpdyJ720frXxnJT/pcRGU6JcEoG5nLXKE+
mbwW0rYhWYsuLc4VdlT5WzaNYNUnKlEWqwSiYEKzlGIAlHzbAWI1AAbxSqmoNctG1va0F7j2c91d
L66QsuuZBe/k87hm9yePgiS8ttY+AU9wTG9MC0AajSae/3Oj9Ni8hE6a4oXXr0mmcOkvWTWnccaE
7uG/c8v7939bAN7w6/+tZ732pZwRQZDIeeuz3ZhalxWMu9lhqsNdEwV1xUPdr932BHsgWPHauhJ9
f8jraDpPikW+O2G97fwIWi/ZIGFi0XBZ/DRy2pPw4PMhu2Pt9+0ToHmITRgNLBiy3e7LhGozGceI
AWeuCtPDxC8IrnZczpp1oK8gdyrEr0lhH4MKJJcYNrn6KJ/5jXIBhiFpUJrQVrTg9BUUtRGxFy13
8zGcsbDcQNexPaBp7O39ytNpJw+1ee0i5xV5qbvgtdtoWfvkkKhJdudVe5ifzVP1LikqbiSx9baI
VkCvwm5TZjYE1rB44aunnCaIbklYwdvbImE/Gu+r0mi7CyersA7A/0BQ4X71CDqdI+Pq18ZCad4n
4gACT2nfQlIxN6HR+tkX8ymnQpHou2cESJKFojjDoJk3yS3SvWXpKaMygJcbi99TxzBE46SVaeOg
gWBTAAT6NHtNWZng0nJd2BZp3dlkWm5f3a0YcgRHXoXUc9weNGRjVcJ2NHxkm/C7UsRNaaEr1GeG
2WJk5DFWtUzsqEGOr2cIKrNSVxg8ZVfw+ZLZ0dEXyT1kIL64aJ6npZzV8dSi2HFVojynLDAdIinp
iWDm9xpPyH1kCi1PJRC7tNpyku/9yBp5MDGr73aFKmHa/0ogH4PvoDmPaYR3RVvaABrTB37B2HUJ
nDRASRR1aSDDuHwVd6YvO1y4hHElUeMgNSCHHogMT3qx0DQY2Oxa9OPCLJ+rEn1P8OtaGuIwbaxp
lgLs8YvHTWpS8CahffmuH3TWL+li8dlrsMssDKc5Y8yqgxvAnyjpyoFM2qtIpzrMyOD4hc8lceyJ
tNESokc40bIKKCby9VuFmL+IdNwCq6biFPhyixxeQ0yaTzNT1bNID6u4bqb0nW8pfCToTdK6Oty6
R+r+KgbJTbfM2wRRnD4FxYCJuR4Usg8FI3brlHuK0ZXKlEu7UHgaGefbxJtV3C/DQElFB2fZWMc0
iD/lzFif9Dnsre0K4S0VTGPd6hhYzAPmw6Mc+yJzCO0EV3au+7xBV0AnO7bJ8NNtzjGZYYvF57XN
/+NY4yjWuUHsNc4C0wzqeMxvZEQXfK9ZZftEqrNvsYQiLFasQubaPgNbdhfqe2PKZ6Uwn3+Usda2
mWlxP5hPJH4AJEFCvhb/3MU49dik74P+roGG3QkDedKGSudKt/B0RF/9R2S+F+AonLLVjloxyaLf
3tmgVyKOj7DWJ7czEYKhMyco+bM3Ydt8cTd3BtCkikgK+imoy/wOWYNVxjY/9M1UBWunpsn6Bu4W
KVaW1PrNgYezhKUn7iD19glheFpK5b/5O3g2BmwpTprixEaVYLva5Hdjcp5ZeN/ZehPYcmhwwHQB
nc0cPM9pzl3aJRmd/ndLvcbzPw/u7i2DZAvP+miR35lYj8quvyWQHZrDo/7KNgnBGkoP/74Tu8oG
sXNf2gyOl/DscvN4Zi5GQQruwoZ2yJzPSMhBhn8VBQicPPYNfClAZpjCXlDJhIGU6bF2ASTZ5Ylh
Sm8wBVQ5XusPAdNNWSnVhhto1FSRTifsvv3qkQ7iUHfyTHhMo8nyRQJ0tpL7IrZIkvoHTNVbLUnp
VPy3EQYbLwRiuwXQdCJKAeBOWG214mpIx8mfvNS80Ri531FAynqbVzCCytAzt+b/c/kMnnkTe//5
2pTaWtm2qcdSRPGuFBaYkjFooprzX21i4AYGjs2dNscvq6N8O0sW+/nA0fqCvLvWfV+U8tAuXW/R
e/43t1AjlLKI406wNkaFAaXYbiQidhwytvpj1a4HZAcx2aZvdgiF4ZSwRa6EmpPUR4UBe7uz16es
05Gj4isxeDO7LNrZpw6x6P6ht9z3desrfw6G6oavWlGMObR0Da/KYn4MjM6F0Nu2Bp7fdcZguptS
S54BGqaSvoIUyyVdoaNiT6nC31/8GcHG2wonbPsdXxIItLePorKHcVTv5FCTp+AsKAP0JJYXqhMs
UmCFOZDgzjP25M3y4sNEwxhYiHe92Go/bXERTEDXM8JdYNnq0hgPJcht6at9zMhXXDFizMZ53IBU
ZZd4lCpR6iQWjquRHqt9tO2JR0qU1ohHeyt38Tp+Zt3xFwBfueOzd4jQUAJj7Tt3Xu7CGBpAUnfI
3d2TWpp7ssqsmSe0X1ibGWCIBge/zo3oIjRzVJWjj2Y8cVC/Tlpeoe8OqsWHG+ySfEzNdAAFLNzs
F44pfePj00Kelc112C6bUQcWnCNlOctnPRq8TvJI6k51nN9wm5XTkM88+BxPEk98nAxKN41ug/jv
yeF+yPE9nw8tPejjD0J6Jdw0cEmqP+58Y6oNstRXTy60ASkMWeH8YIFO2ZLXycVXJJWOSlDj5I0Q
KfCy5QeClI0NSAJoU0145Kb4e9QF6agUXIfLqHwzEl9GBtCal/ucKYrtz9q3F8BMZXTxOhurJK0/
3d3FsSpenZenkdNlsS/MwrTWpZT1UZA2wAtI6UmqplKLhbRa+APsBpXVxqKqDkj7bC4tAQKV8tgi
bIzNqD2ZVDwrHH+uFxY36NA/eDxd1DOuw3q+9tYZmKmLx2ZazzyRoP4pHzp0Cn0TIfeY96sCRAHE
dDolyDGlrCaVlNTJW2mBYpMDCplSKO0wK3jut7QCTRMV3+W1Oi1qimn4ZtUgME3ztG9W02FKTCwq
ipKqAA8BsluW0jOSfWhipzilf06cCtDxfmPAkER7VmCopyziAu8R4PX6Zx3FLxe2zeVcYkLQERUb
biH8JCfcKaqGSjXKyw9j2tJMkRcGOs2zbT6CRu/0D6DObw6LEKghp+MPztTLW30s2tN+pnUj9qxj
dsvQ1adECNYmQDsPOwjTJnrpYIZyfpfkdxDzdbCmMQPgg0nOkwRrRLg34Z+mTdtB5dAkRdQ4xn22
RCSUsT2wuLXeMX/WjivOOZELheG+Zik5MAgubtsFi7UL0aCqwcUHDTh1OWTEHAvU5f1KuOfSD43x
qeiI/YMXYpjDmWMeCzYxHbgarkPtuFRU/47ttgoFFknfJkT/TKHCWoXs2d1C6Q6BuOK7Fp1oO9Qf
miNTVTQMen3SbdJKNB2+8Ry6XgrwkB+WM0kA81k1xj4TZGH9hv188HnBCqmlKWz82XN87SYOwfpR
l7Abx/MjB1pLeQ6aiOc1lsw3AX7AY9quSEF4+rOPYvvvQe9af3xTL89eOi9pvofL0eWMmoPeIelM
mrXMY8glUjhz62s0edbRmc0M/TIAUqndM0viei2CNGpGD5eFWMpjbjZRVMalb3B7ZxpuW0WCsqA7
Fm3akgmjNiUgSu+DvSCPjQ3rGhy9bR7DbjczzBv5SnSgtsBw1AtsN6Ip7GoEvAYjCUh9SfED4Go3
Pc8juFtH4uh8LR5fu3d7d7JfP+AzF5Yz+0+4DlfLmnfeJWd6k2tLbr5BQieKmN55JPHkrhe/FlO2
t3rYP+cpWeCLUfFISivDdWd/FSV90qZDop9VsERHxuOxUlkGHuS0tBsNJsz4J/Ay8pPhdwFgapio
1efgIuzp7WPSU6CEr9QTr6FsWr2e2dxg4OfaT463RYbXavVo5UTC/Tp5YxyaYe8myzHJCfag93q6
r9BcM7/fokO7ypei50dlMvfqBwt8E0DVAdIQ1wNhXuPubG1O9JtjaMHn0EZvzrDXKVVkaFu/BlGl
ukvGa5lhCCAjyLD2MEbjqHb0v9zNgBxaJdpYfdn/kxsugOjuPcSo85mzR4kxIlWE6JfgN/ywAR27
G4IWvFWfkBgnr/BQl0dBxvkI4/922HGByJgQrPiK8xMGgUYJmiXPQ9dPhnivhilCQFSdUw1fnz61
/SIvv86e8JwTMG/cU8n/aN3ksjciPdVbSg9ADBJwxucuvQrzYD1luIn+kE9QeHBQ81fi2EVXuuJ5
EG1b21RXir4fAmrvemwruDG1oL4427M0gu+FdjBerXrJxO3PRykWlVRqQjD6AxKOy8EW21fvVB4V
thqpWnlleShEkg0x3W8mOV4yII3QgOZD9AtZtJh3mPf72AK4iEyAqErl5LrQ4CyqboNipKkJMLg1
nlsL4YlLafIE+SRxsz46YTI4QXZ1FeS4hPmVbMLoCuDFKFLeemnqaSQZ37BqjPoSf+AWShxeQwXS
gDbaIpBmzVuxtluM+Z89jTBkrsIjs6bjmyo8AB3veGLhkDXOcqqmQkHbxlFUu2YDy4sD8/pbyaIf
5eS6YT2Uj1UVL7Y0B06UhnYQpEKNZD4aSdwE5SYTl5G9ZH+zwTG01+ihqQKIvuyRWsussWQgFxDu
mGtfqHoSVrzZdX+GSMVH1wTyC3RdNRn0uaXNrrvMmvGSEJhtOSPOkTEw6D8oNb/l5yy+YVqCb4dr
HspETDx1ZuiQB/xX7UfIVZ8bJh7T47V2nyce22NUT8FQRk57WJEzm7eXIcPXEO9C8eCBHl6PIe51
dHo2NmWXEEAAAXu7UrfTVGWVCDisKOK7KafyFea/0FnCVD9ltK0+B0QhUfgS5DyR+zS/fslOU9qF
aIDGPGJeNK1wuClkrKy3fWiR8dEMka0Skm8vVJ0t+Nb7yk/oSHokSCr8+OZQlTsjbhVMrqLu0AJk
0ICVpgO4QrMjdCbgR9Gcxl+yw4bOUNrg0gaUHay/sar55V/o72IIOQ9bMEEwFKLvuUTfEB+6N+RA
67k+5FTke5iZD+DVBWxxm2lMZhOsyqTg/0PznxqAQvUij0MEfc5BJJa95fzyntm6nqhl2NdVp0JN
HPtPaKU2/2h6Zc6FTSVIwSv/RGX2tZr5wU7uWcEnXBCI1oXVmvJsqHhaqe7svwZG/gjy0XmUqeZl
pUgbpSURESZR8SAmZSGkduXUQ0XDND1fzDUiFKIe6PjN7k0YhfGfgTaBHh3KphdvZyONr5ySXp7q
Oaaf+5WJFqNTkh6wmXULqrN20RMFYriIUJ/0JxqwAQr1hnB1qGBc0Xknaajr5WkdGTwkc8pfP9jv
esb+B3uasJmTbG4Qy9W5FLCQ/2vQyL1EeiHdpbVHRfF/uZEU5Zjzl3hkBqLldmCifEQC/tXCVK7v
L2SCxQqhwrFJbVIV1BZNhO70cF8McGDfYJDrp6N43Pl2tGJ0TnuLwrhc7lN745tbnrMI6D/Lw5pw
+nQ3RrsVC3xxpGBGVsb9iRx16EVm/ntkp0EqF262ex6wwnApR2Ksglo0/ZwCTI3FvkXvIQx95QBi
/UmR5vBotjT9VEkiB57NprZoRUsct30QnhbGxx7dklfffJlOUDKwyLTqAu1EpyDCDgZqRD6HMSHI
ntv5RB69XltSORtM7rYXQDutJ3DC2jmwQ4ADq3p19uf/mm12HMf0wagVI6hGF1L8Ff6XO3plbdFU
Ir2rom3G84BUSJn4vplqX6FDOErWe5AbcsaYbRPyDG6Tc1IralOBq/6UZJVMM5es67VBn8bGa3sz
0zBn8nE27UdBunbAmMSxlRhcQIwPAT9jgXnecZwUAWG1ukkjWE8TxXb6yLAvjqMgGesn/j2F4mRe
NJnjn0+Hwhse3JnImU1aEwldFqw9hQLIKtgmgwy+ObAiEbn1zV5WiVcILpUKugmjltoNzJOZ76Me
u3hJKBbhe67RpBFRUE9SZvoqy4DEFpksuj1a11YxL5aUAf0UqVHambmyzUKW+GMSI0TxI2NsVpWx
6B9IXAioYnA1QRX3uVc0hHMQy+e4/EpfP+2Kpf9nFl4A9t4XoLdgartxMTvPokKLcWN83IEoPymA
ITcK/Lp5LhgdX/yZkbieP2TsylqRpJiQOhlFu9WUoqHiDbeBlrxOax+S6AXMnNvd2zg87H8B8JvH
YgFHQymu82xB7wtCpKCsst5VOOiEu4BkCLtRy8wKIkLkseoBK072Td2/ua7lZ/5qudFl0NqQdQzV
PX6ZKMz0h3codOMASpD4g/0qzpqagT//AbAes+P2UhKYb3+um+p/PPbjtGkvOSnoflc0Na4ESkDJ
KJhYH8ZQ3YbWouoXL4lfD+0KZwollRPzp27QSC8ybQhmMvoO37arl3aR/Ju0hIbSwZNjOJFVVCuH
9tidVgdjmPkOa8XvBZKPFnb+1xdAoyhISbZdeHpJ2PU+gUsHX6zMoE1X5wMSoZfgWmQo3/yGItXP
VfP+I1BYJ5w/YPUVP5lJFqkPRUtUSA6X/BRyH5yjBmSTAid5k9fl1O4YiJIC4phQdz+6k1muFqSl
wt51VYE/Gw/xDJDnjMuLB7PceUToS9z3kbkTB+ktSeSODBY+4QMKW6BY11kG86qQ3E6kCyI6hi5L
Q6smZQxHnvE7FNi5SerjETvvBfMUAbnSova5wFvLiakcsWkP0ENxf0UlOPeZDqZe2xqUKdZwEdRD
0DUtxEF7Qkl3bY9p4dgrQT+1cAtZnM/tXawPZsRmDeq3oFx4YRH7FGI0ge3hvtMOiyWlmZIYNWWu
ckXoSMmJi176gahFIU9MfA0u1ZEBR0fn3cmzq9C/H0minKodW36UQPd5vbF9UvIV1I8MGMROzQAN
Ib+rV7SG2sfNCrqyvRo+sehp/i3a8swU0BSMyFV3b/RaE86SL8sO4tjE+F8ehLpeaVTG1V19rrYM
wYaxbW18ZJ/nSOosgd+qlSpyHTIkQJR8UWbm6Qs8BevzAnZiQSz+pdDCyVelkbyQIGLU4JCpm19h
9102jn5SVo56qtljjetepP7KB5xqb2fPJvx8egPmBeGbq7xKRg7Zyh/l7LlBvUPuuFuP3YNQFjCV
2ri8RKluFjqzUqQYVb3+9kkaUXg2/Gp3tCJd2ISYQ5/9hN8KfHIrZEjVJJqNYEsT11BIpk3MnfN5
mtT3YjiHGfYjApZPpUeaa4BrArD54+J5CUDVN0el6X5rcZ2nD7WR9Dc+8Bo+IkAHf7z/S6QCrIph
Xr6KYfLSxqmA7yqQ91En+toeUIigQlwKi3z6MusT313azMX3wZ58zoSZ/+fr6VzQmkJoAlTbRjkh
+j1LyiGg1Wd7ymX8Fdgg8rKa0CmA6ciGFm/SpIVVel4+zHEDhz80hOpBaxWmp1iNS+Pbmt49jR2f
Tjf+WEUcaFCoGthW4D+rQYzA2SLiUlx/b5kgLsxy65+mg6iIKUaEE2tP8U/FIJpnKJzZfzeqZWZK
MGllsuwa5+eJL6RFMj29mu7iWUap8WQp13g1mdJHrupwWFeOu5HAA4jfBtCWNX4wWQ9qhN6leGvV
bWtcsS0wGeQVSFezJ7XYvZSTi07gEDd0J4JDqaHs7hqsB+wWUenaMem9YVwLkG0Z8w+OKbjdXakM
EGuwzK3YCEXqs40M7ZirRcBfIkOyU9SuIDa6BiMUf8k1y++9Q9QiWTCjwLD1hbRmCOoeQgA+Az3c
tvcn071AEojUWj5lFzKyuus4jpWkG9MeqgOVPGgllDH5GtwMJkPUZvKpo07p69w+lwLo450mDHs0
uxoEZvqNhonebei0B740l0jMrTSrFkY4204UgXSN8ghbZJph8+6nynWXcGJLdcZHB6COGmbf3cvm
hTj4cyZCkFXQ/9aKYXla6VlUjY/kpuv683Baptt+Eb1hmm7xTpnuBEDBoz++ZeS+ep4QlRCqYUHS
qjCh4H7FqQie6+rEYdWwCThZSNmWgGv1onF0s1WPXuIlyz7ItCCTI/o1qh+ZTdfIRh80rNtd7K1U
YpVaba56GmX8U+alFTmeGW77WG5RGWqtoTxPZACopL241pjv0yPkSGtPHGzbzOEIOkAz6pSilaBD
LwnkeEjjfN12k6ftKDNvU6PTB3Jf4g4yJJ+nSD9utbtHiyfk/B/XVWetyw0NjcBbnsY8HK+OgP4D
lS3aAxMQwQ5asIEQRWsF2siTM9Y2kXi2LpejlazjoWd1vZ+mUdl+Y3uNLBWI5GZz+egB2jjLpIQk
hBHoeyVK/+eRhAUEbme7teiLWM4ByfjB0ru9SKCY89Bm9XAEoHVtxbugS5uTFV/pfM6anJNQyEs7
nuNqp5LmVwJtI3kxgtbzeTa7SqTh7syY9d7gECP1w/NhP9LFFFpQUf0ez4hwD0k/3xGCvOCx5osU
QcZ7MB4HCkm/TRmz/nuEIVGgArhYHCEHAogWe48ezvQwz0ICbf7atLlKXc1ETBRlVmia7/s10z/z
4KNgfxGVM0USN3jqPQAKE5v7CMNIiCZQoN3DqJD4VHavIoS7BE0ODgr/pi4gX63V0/SUeNa/yTyf
r4i2IPQrFpboX9s7MZUAuA4D2HmOWdl+p6YXYiEk2LcnYqL8AvdTbbFtYQe2kVwiaAWzICJST0Jp
6PhCV67+qBcHFOBpwLRuoxXQNXXmYZBwiHpPRx43jqOOFEiMxtTckzAcVp5m6zd43maB+Gi4cLKz
tehnTC3vIrv16dTIud+/xYB8L2zade0GQzQpoccKSbhRfNo+MqbtibwUXxUD3LLmCflhCvzcjnvk
diJkW9+WkPu6EUeWBqznEUivN1Q44rzM/AFXMWqIWB6dJEbpUnGHXnpQYlBPiVzoOMdw2L/Atvvf
xf8B4BkiGKYXl42/FHuco5Pza7Qoa27ACYM4z+CUMpUGvGxMGWM5JV9/m6joH8XkKDdnJ5nFStQb
+ClnmpA+CBpSrXPXtbiI9uhajVQriPygK2jkqHw8e0t6QMU6W5v3NDoOCRoy/Kp5UxPJzvsPb0T+
gOqSw1RunK+C3jg6orMJTcF94ozDiW3kh0IspzqEbIo1135Y6B4bpQThCFvJvOaGgfybEMtANCgu
+qF73zoerNke9+usX6hTDhxI+qoA0HqLF5o5wCEJxya+Ib6+tPKoic6rUJvE3gYRGjYV3QRTmIXg
LVQWZr5QtNDZ+I1UlXtoAUbNgR2zeTrEQiWp1ARLqqQ3JZtGmm+W8J8QvmIWGu31KXCpvkFQnPiO
aIC4XVkpmlPcEzT7G/V4/Kte1n/E/Bkjn3+1JmpXccMY5T5LrqTFAGFGiS4fLw4qugnIYCD8TqW3
As79z2WBjUaMLExJIbFA42OXCnZ5j1imIKO6LHBDXCJbymEjZc0SGMsCcsy7+6VrVUibRz4n/ZvS
8YfxWkfZZ3hkB7WNeAmws2V/p/VJEsNj7CuvVfoEylDQK0tyYryWmFEbg2MD9k9J++2PagmzXa8v
FEQ3O/wC3SitghOYTqlKbXoPBpTu6wpDCeaNm/BDv3CNC+DfYRQXDCZxIIU7PoCsFIjdwOGEoYPo
V5nBE/K8ICwctYUuB/BgLw1f0XuRd+9Bw2ghiQCZwtiMos1ViaUrjZxHAEP6xpzcMKpPwUg4VUtg
4Vk7jEt+BrrBMLj6uUGpQnGgVp/l3GYgaykRqEYTvnfkMT+0rEYgWYNmz1kIn7bE0e/T8Tu/uRkY
69hrSNhDW2v9R+FKLsKavtXgDV44rsSvI/j2UUImUo6sSy4uu+KDVHni6hTLrDoH9msLcR9a5NYJ
uNyeuP2IzIQTcqOMttp4bsonk1XjdzgkovWWFryNOyhpBGHTtP0s0OQkvMKZbOOFmq2b9ZN9BqBj
gppYdzrYM4eflvwlVS803YUrecnXcKCCUUpyi8GdCwx9kr8bqFVwokhKCR9Zbn76UWc6XJMHC9mj
/GlAX9C/jFMB7yKJrx7PnKuuPbzBq3aH++q+5c3FBWsPYZVyKFZvhRwwnxaMAnSEtKEfA3kgz/9U
LrimYjtOm8wyOEfFedxl26dE8n0hBirjZpEdz6qohaXVHEyXNwgHg3GOd3KedZlTSEgH28hNyTO+
3jTVOo1p+JXVAMJC1pUwT/fQ65tAUYlysYW/9bDvNThSGMrmxUuKZZmLgKKq1k/cle8+/fryaiOs
nH91VV3vyfNkWMhtmUJ3rwh/FkgX3Pi6FCifeBceqzy/s0VAXF4rVz3q3Uh2yjSMtf2dvX62ix2O
r7Yp/qPqb6PCvJD97c0WSTQ93EdvgEiJaNl7T8cHX/S3s32TCpexjfVjnWbeIqLaO+lUNCnZmgmt
L3ejJP4I1JZOQLsdc2E38b43I9X/XJaqEOksJ7QTCgi+oNkbYz/trXq2AFdTH8/Fd6SOvPF6OBTB
uU/AipWNqlaZIlCLmjJeLHh/s16xF0mh7CFkvyRq2OQJK68Kj5dB3cfqzDUg4KJQy9L9XK6jpa3H
vn7AHwR6BJNaLwsOBv2KM7EJVKWcIobu3TymkqrzJaeIqC9UxcaY74wWqdh0TGE//bIKbzQ3GYJe
pM1FFapf0EBQx5KEVE3fW4G2latXE0GTlZh8XIy1Qsy+uw2z/4dqtLBgklU5DfRCvIoS94FjoU9Y
L4/9cXbG3I2AXw/swW2hJMDJnMic4cjPRr6iChWQ25f9yx4YVwvozxk1xSIPRfKJh9zN9FSDZ3JI
SBKrpShNIjyhfcCkclGxYd3DKzhhA9aSj/8f0/RzDkXhZep0X34Px1R0nrTJdz9pNADlIHP0Bi3P
0C9Y1kQ8DGSmhhO4DNHW2TByTE1GV7gpziHcrwOHQiY/Ul+v/4t9R0eVWa/6A0KFWJnf1saPRHjw
AyrEne42GUh3nF8EARson5btIviRgY26H9iiR9zRshht8mn4wnQ96Pl1V0boqJwt5vyYxsbzcM93
hh5Ar/pOJFizFVhOkWlYJ3e4sTt/vEbXCoQWuKTxXcI0ahDsFFqreqowSnxDhXez8y0NuvGRypZ8
+zmEs3OyMuMDWxvHn4bH48QfQ3N+z6oUaCR1zdFUYe1Z0EgTQX1zSg06jJZD5bd6vCTDHFNF6Lov
S+gWK/acUiYrMDQoNx2PYdcjmFQSCdBNeU+ITtodroMtvvvKyaqTZEnkJ1nwxaG/m5fXEAZoKE56
7SySUft3MlOqtqyY+RbQxYIK8ufYxB7jUjawBEVl0OPSjLpTSuJe/pXD3zehgMpOuCOqXVK+0EL1
PfJ3DysvAs2fP5OC7QYR9FmZ/EUiIbovoSN3wUg7+BtOTFGz4avz+SCf+AzOO0oeAJhaE9b3uvIP
9W/NQRDJIlRzF9wDfKafU6TBijRx+bLKrd9gRUWEsG9ZlmB7sPMd5xoviMU8Ib7muQ68DsKZNPyV
AWaqCzm2v6rrwpruqETx6K6LbjDVhuGTQyB6WsA5UCA3UZO4K+YFIRmDNDTtLzeLS5ntXdeUG9kh
4IvWr+zxkhp4guPaCd3TaQ8CY9mg4aC3Nh2vP3Ab24iWE92PlGkF6lBfarM4Q4zFtsMr7LgZEkiw
QnuQ1ZP0YuQMHDUrxGDOoTTC59nRPXjmxEanbwMizNrmJv9uhAPEOweVfSnmOiL7Ytm+8/p3kNTP
MB9j/T9IcBLDyiVm18Hlz/MzqgYuYuRPCzs2y+CSl0kMYaBydad4Ze7h4AwcrNFGppoxsG+H+Ip4
h2Zv5KAO5Ur1nWxyaOAFiEOzczs3kIWsNp4LK+nH7lX6AbsNN2k1ClZXN9N4t2TIJFzlUfzSzTKK
ClxfpHHyEVzHayYEyO0QONzcYES/dDjW9a8mtZGORbE2QvBn+Xt2ncy0qR1Nktqp/tvbbik1Tt/f
IY/CCo1J3PlwjZim1FqD91hu/W9R+ho+63lD+Aumt/yk1BVg7CshtRfJKqGTtRlbUWiWt77cpnvZ
paszgcT36cCsdSQiaPZ4q7gDbCB3otoHFtdk4NUPCePwW96M7r33/NbPV3d8paZG25sUkZV0gevR
2TPjfwCO6sF2j7p3bREmg8Oa2Pvz5tQ52qxHMe3vWAUaIKMPDeXv8naX8WV8c3elOUPLMe/mi/it
E1t6lLQHI+jKt3cthkisZx7DLpv8JoYbnvSuSIJw5ruOsgUobgSRAyzOJRycOFlNjVEqrQlQGI9o
Ivhw7pxGwGZ4KiLfaq5lwDz5rwmPTIEQbJkCs/dG+WwWyY62WxkOHA89tZP52IZH3jp50wgiC0Xw
9YloWaaXG9PvPytFwSp55k0crauZixIRq+naJHgiTBKsNaNMgGQboknbAsxjMydz6qSESjj0IpSq
fnq395Z0UAnn/gWsOIGnkSVOiScHVjCwovbsDcrTOep+iH3LGRV+6X7UIyrIAWN6NDEzVGG5BEhG
0nsnF2mbQoaTHour63V3QzXDML3UUYkCxYiVonOqx2y+eBcC62D/PXmt12DmhCsAzJ/c9IXPPHW7
g2Kuix7P7/Rh8HisM7fYMXhh4nwS6QaEzcZFEgI+dCmF0VIFmvqARPV1Ct8RFNZhJkxXD5iR/PAr
4YY8nSX4B1fxv+a3lNEUlC6lUccwq9UEAhOa+9VDDseRdh0PNW8ZOAlDBrKgY7JIUmZLO6PmYZsz
mjrr+9MDN1eR0SX1y43k1mCIFmJTpTEQoUe3etV+/NJ6/GR5Rr9rztBcrphMQMP02+Om2Dr+Iysn
NFQ/jPZQ+hj1UKdmN+NDzKiK4yckzCQgZ2S8L20vfl7ySVHJoW87fO9pjWvB1v5wzpPPwZI56Il9
2AWYIVt09fMY7CrffkZLh/4C4SKKyr/aoQulIfLI3vAGtQ22Ag+f4vm05voYrF25u4uU/z3ILmwo
6/ivf+mBakh2j9Ck2395uAQcx5xsgUWBTSns0I+BEE/ZDKBpU3//Oo+8mtFYpxff1d9SpIkmcb8J
DeqwU/ON396zVPuv5C7i/FwjUTwkZxyaeTEEMyWGPOwRnO5erh3F2sNDiIr4lnj+m5mPF2lysQ5z
Rx92r9XZo7EVBQZJGuHSjXEenEt7SRn0zPz9swJ+7hmTlyldi+2nxbB6OuVjcwSF6/KuWf+tOB7g
+XOFjvxUAWA/ufvIHaiRVGANcOpF4XZF8y4k2+0WRFHEKmViicI+hitrVZM5FeJjJx3tHOBBzyeK
vz9mwnRx9xlRg69zlAmrP5xmxsPkgGux3qHeG725qOHgblffm4g/qCcCWNAV6TgjHdmdQK9ssrQR
nZA+RBVU/hg7qgRaIqx9vK1xHxsIym94zdQ1q8D8ogxYmsXShMwnIFCqZgdx2xOwVnYJlYo6CqBA
qCf6d5WqNSB2Gkb16j460m1ol06NVVlmI1sOzcIXCiFxB5RHP4qzbZUpJGmVHJGPg0aXmhc3KOod
VP9P4XEsnWMQEn89gRNCtMoXwv7h+sqoWfns3TgQ8kb9Ddog6/gUGGxdjZgtoi3kX+R0sHwVZrtE
iq96O/VqOdTF8nUkju9IrfOfDh68KSJJRf9CRraWOyzEuh1tWTJqVvWt3S3mqGZzz+jfs0ZWVv6Z
MWKtUrvUy9GRPgB7CxgxZpY/+huY+30yCb/W2yzWWlDAjLSDjwXrxDKxGp96xQpwwLYWl2ntEUiv
XfPtCtggnDNgaJZzVJb3MGLg4qEyRTml3TkQOHAX0yyAF+OD1AhMQ3HfTeRS1v9rIawWDRwKutU0
2qGpWfxfZQDgql0oKqpLrZHsnwJGeh4y/VTxc4mM7XSfK/1GPuOmhzZdfPfjDPm8rK0rv85Tk4N6
pRUKAqA2d1RUBdEMf+43q1eSaZEVY5W/45glWe9ZMjSdPnhkohY6kVJ5gC3ul7kDkOLOekwXUcL6
i9Gz+eIEJHjG5Hguqhvon5N19IZk1wDw6axfoF0cMT0HVzuwY4FxI0WgnR3yBtqwCw1nu/mllojX
05ECwJbzMkYx0+6ZihPpwhrc/JW+g694apSlHikMvkddbfhstjY2kin/yS49q1pJ4j5yukadaGC1
GEQho6cQDRP4VWw5N/wDFUNnltIReswG0gXYeBP7C8VP8v65SLYpPS3ZUgxnT/qgVcDReVHUsXz0
qJCYx/zkNOtGhQCCS6bMi8IMRpUp2i4mGK/txtLnKJVlXLfhJIYFCHpoULDDBA1cyU3YE2Ww6gWh
3rfcxylpeVwh4IFzVlcTvHS0YZR84anCs02ISL/REJrZ/juhP9CAtQcYgp0OL8lc2nWO6so+4qKs
VtUz8BYUymnmE84KQJMnF8ikB3TyGY+Vw/4DG9XMvD8JIh0PNtUmQtOdXSrzB50nOGUAL5djQrTN
PfkB/k6rAaOJLRDUC0cm2mLRrL1pcmsA1xH8cLBTm6AVFju0QwhsskwOvNoNI52hrh/2iG0wzlzM
Krb0R+SoFRHluDDPZWvfBs9OdcFIB8Rq68mO3J+dtV3gu/sKv5FCdswPO81nzhsFF4kSiQTY2o7M
IEcYB+obaQauZJSzr59FlMwxIe4RGSfqddFUp3KPKPF6GUupHxLrDrja9SncHqS0KKX/55dtcORC
r2eE8yo8n8qneW+GFK7+kZMvrnBgjZ0uDsmeks62wBsxDi7OPPY8F3eeVIEiHIHZNyVjkgLHpLR4
3R1Y/xduiWHLTksjtC0EsINWZuDRrb9y84HZudRDX1un7BxAn39LH0xV0tOA+e6pS1TXk6P5NDXB
gwUygSl9yPQChSVFzuGxiY0dioXFr8DkkCAPBBfu6jugabHfDzU6DiiRS3/0mXWiN0tcLE2WzRKL
WF5SZxr8umyEeFf88kT6OLsJQDQ7tqNgMFUERu32lj5Gi94el7bc0dkoLZHAE4LzdH3NSMGwiIdw
WTP5NZ5U84+nY62r6aKCBuQxdldqQofeAvHwIkymC44sFMfUf4D2qv32Jua0/oD248PdbQPqpbPS
FpVuvT49rx3W0YGkjKFXuwzDqU72jzseQNxhN/XkFd0OJTfpOjRxy2fpBfwrPQMNzhFcL8RzW0h4
RqONuRAgSN4LcYM5UqKh8yQoSSZvGwSl5q8smQ1pkZ1QH57tZe5nAqf5mCrgscke9J6pfCy7kU9H
7vBfrN5gRVwYpsPthM5gsQ4CkrGxFdFkNB3TzwvjQPEnYgTe5nAVTCvb6E6T1mBRTN89rkJttJNg
JOVPwgdMoIWbhy+7S06+aYMzzUVXEcq4pMCccHQyG2jJTLaMP02dLe0rcYzAeUlWPtS+cjMx/QXA
cuRRB3vk8QAtIzbNmZn3ZPNdMiWp0qZn5ta+7+6zzRCkwpZBpVDqpnFavEEpcDrZBgDVIQZpLwZk
VJVtDYVaQEEyGX0InqEAZ0jCShiSqAH86iX0AFUcVQpjfCl2vqxZfxZVdR3VjRzQcoQs2eewaHVT
OjCpH+gMlfA15GbWVnLE5IGhUKzwjfouUk37ABnr9DRSxAH3HLdCUWWBc5sgIRt2HYML7Y55GoNq
82aGlYk/cnkwNsiWu4JgITwxbxEWbm8I9rGxaCQy9+/rIWYhpmbjQS3B5W5WdIjv9XG3JXllR73E
I7XbqsA+F74rp8Pl1ENemZwgAcryIYM4E1FcSwOdiO22KcQJPIWh+MurxDIevPS5nZjFVa256qcf
V3uyWJ4bFoyU914jU7HYklB3PZ6OwWAEg3DvLST/3LBtjQcFoJZ54Fn2+ZxsbUanjrf+gPOxoiFU
PyoNyMNStaC3Ne0E/TYKBnAmlzvIW2PqpYnWgygHkHRd5+CeMwSTP/pBfUMc8vQjmbxeRF3bL5nJ
hRhvdPbbIQnl6h0i712iorxyeG5oq+UVmfonb3XfNHlZa/6pRf77t36oYzO34ltQhKvU6VzUzSl2
mTHWC1LiqyMyupY0sSgw70HYUTzJJC5SzPkTRSL2HqJ1Ekdz4JA1wjfaja+RQpYbDvKNHNid1PCZ
b6zhvFB+6Q3k5GlJKpoOm6dSkHqwOWlU14Z8rgZfxygCmokAlvJiMLzeYHmH+0y4xzO+v43ph6Dy
zfe9MytJazIoWNHh8hk2fRrQdarQehbPS+fsg9FX1d6GYGPtn+Q5pePGb1V2R5p0/Q8IgY4iA5/f
pf+4K4fkMx+DfxgDh7dHN6gLI9q0Kg+rjMGg2fSAfJQ8JA/Ug5pNBnbnOcjw0nwOJW1PhE3PZt+o
Xg3y1L/38IXyMtJW94FpPVbcJJUfnBrzxKL8Mw9mrPofWGkbBAwJ8f0kToHETbKEdusEgcbeuc0F
EdQnm8mG4FAtAycVwT+iSgSNe7Ocz+9RdSNwbr/0xnUixNm3L+3/yjY2hvwl4z9/MM47BuXx5fOs
pzhyBF0BPXTdj69gdcj7/HjoZ3uCMMCJRAef2jft7R75limzXXamKOu79+7VpzYMbDtgnadlmLmP
sFMLKU3E3iRqPwOP24Rb1q08qvknRpGajThYLdC5iBTFOXwEdN84eo54aFqTGf8qI/KQeQu0Sdt0
mCvgWjJUgJ6F6a+6GOhM2akW/fNfdpvQVYLA57DwF00uerYPprleHN0NntlFo4uy5W5TS4Bg7tsh
f9qNgLpee8wKX2wqqqyS3WK+ja0rc6DeIYJNsAhxFcDKIR1iSt0LOJqN23c5w4muA9KFuNBZzMur
kf4ljdoggY8IMbyonRpZAj95KL8YjGNOOCQpVQta7GTEnlombsbTCURjOQSmGbU7DHdwBgdRa+Dt
92XRF6HwDd7b6yzzUCFJb9eDaI5yazsps9vNUkc1DpkAjY8F18oYYZh2MARdfHI6FOYoGPI8mUYS
flgLF8HjGfqiTwpxARuiu6qTeD3aITaEr3TNoEx8armsggmRpka4y2bKmWOD/6iJXbvoLgg+MJ9R
YrkoP8l2afeoQQC9DYFLz6Sdj8x749sDWWeP6NMI6Uzf9XGnxZVOVPdnT8OVpbPIqPTtAwV6zKl4
iw481m4zDXqus917aD9FvnTqjh9JdS69L92bxSmXjNCJDvk9agRkxXNk4xwJYqwttpFZlMxjdgZD
aK/rAw4Xfnr76T+NowxCmE6lIAethkBR5hvxR7hwAn5QXeWCoR4tliVUQR+vlhaYWGk7Z58gkgqE
aEcyYn5Zk3XOyrxjcS3NsKCaJXDvulmSJ5L1cVfsCg3VPEv6CE2Q5jXjnottS56dGLJMzyB33511
KKT+l0P65DF/Va4/N03Sl7o3A27lzYkm1D777qpNEAZTdNMDyDjIEgb+ZZFPcI3zLt4iE/3VVb9P
v60gDwmwi3/HSvqv6EHGTNeuHSxs68ZKxYJ54UNkF5xoXLSidf7Lmj7CvmsH62cCgvAVB7ljDQ+a
cklJBGadymUxqEWj1zDRThbFr3nVpT7wEKICPmIhcNVQNIZf9F6ETF0JWSD236xCr6uw27eJVnap
mH45DyT61VW+C90eKlZxkHXO8eDMV7ug2vIjWz6xAa+1WNrZEhr954APfnq78T4geaWR34QeDdY5
00unT2IGcPRM9i8DFCyFNc2Xi6H2tZeowXgY94q+POzGO8hnuFHzX/YHHv1sb8mlSkhV+dZvGSnp
tE3tSYr4pcrbk6kTETWHXCC9MQ84l4al/jyooCqVGFZvJm+hMbev+HG+kVrNo94v2rvi4jHaPKM2
pUwXxIDCi0Dd4k3x/UtBJwS3POBXEwySMDnjI8eXowExhg/Rv4yTYjgG0vcEDZ47nfk5icFaKgG1
qU60XKBmlIaUM04Uak4LnNrsWilumqxgHQgffJRtXZjnWqKUQQvHCJIwf+aIwWI5P4p+vq5uAqKn
AxzDnmXZvHF6gqvM4LT6UzyWzZgj73JgTisgQMH85GyiR6ZZdDiL3m3j2d3Owkfd/HmkUonBs2xq
/ylFPjG7i+YvPamlJ6Qpv6ueBLt6Adq6mNjcJYzd2w8Fmfs/Oku5x/qhYAJDe9NMWYcD2aRKJEer
01pSmpT24jEkZBXaWhPvhNhIbKqfgBOwYe730svRpupmadufkxzViK5st47YlWvsDs4Nwys+d0L+
qGCI1YgoQFWPhbEUO3r5PKb+iUJgLI2USWF79YIClB+7gp5iqT34+1FB/iqw/3iTBZciqolvSLUS
R2Z2zsh/LiCr6cWY61+lythFJaizLVCU1K4sft2CJRzUrKIHb1I0bXPOe7GUIGwNqhg8AltQdSTO
AdMs9YPkpPN9I/QaSlmAaXawraiMox9qmD4bTfFceEgswzL6i7nK0VILL5CpXpiZqZWERDWr9Jpo
pEM0YM/8L3js0978UlTnU+UzkQLnrqKjn6YPIQVcA1/vxrgozRpvJEPeKTQb9o5w6j6EzDQ1UFUC
lyF7wmbjyA+jMF6/Mfmq8d4cb8ZSiycb4lPR70uH8mKiNY/DSUb1uTtUgx8UuR10ywLs65HSvqSp
yS8DWUTeZBrlurOQftskB1gAI/FUrZeFBMhefwzoKDUv8VznOoyhE1fLUNkr1JnEJPGwRbbZAOEv
kAPg0FgeN26WSZSl5EQp5XadnIc2vR4ky28R+Ylk0T3bqsOgDaiTXyXbAp3bp5RfgCSpze1CdkWC
Kn079bSoITsa23Uu0dacsUS/9UGRuKmKuw8b1nuxoqBvKBn9qyuX8eqEx0UTMf9TktGg1w+BIWxn
Pt/oHn+QCUjlw8yTwFnFtV7AjuW1+6eh1sbDBWli4Rx2JF0W4midC35LIiU20Lgzw0dVZNEdHDkO
2wRI51CZmakFjrPjEd1ko0FvK9CmJEaATcLJ78U0lUK/lgxiW0QngDJm9BZ/azoXRMB6oL4nSULg
0LUkObEVweUnpuztpm2wigT70wEf/VP0wybLret68MopDUXVO8MqH1Nrwwi1mYkw/MzZ39f036Nb
Ub6/KzEMC3wRF+yZ3aeSjEmTiKtGi9SlzLM87ob5eCsE4Q3O5beN36CDqlyL93U2kbfkyOB4g5rg
BNyHShzGb6bcAitkTDW24VWCYCFpC+PQvPtkxbFpBkSRfmW1STo7Rc0fYqtxXY0RmDReles9jj0x
8ldi/wnp0X+XROfoFw/vMaeUllnnEwiE6CBcwnHHj3cIw5/9rIrzb02lW/+V1+vRJTb1Hmhae0is
oijz4AcpFv3L01wpCjV05AE2o9FjPiT/YWLpCCJt+/kzScHNPIjfAWpX+Fv690Unf+FyEmj7Yts1
WF3ZYWrQexuiuEXFEEvXWRwu2z5UE45mU4M/Cb/HqRqk1M9Rqu5TGJlMJSnrTigZ1pzcJ4CAvnkv
pybLs9vKK++ILNQ3eBBmmAqzB3uSQygEk8oqYSnWY+SsAX7tXB7JDPkF20WmWbhT/TUtNeagj4/7
HOxdqIrttFfqiWujWnBtN+oIk1rjB9f5KhLT1sM/acDppFK6PGOv1nScPC7t3UTkeaC9jrGrL7oK
xCSaRr1TRdLVoqvp0FXzlvCJ+ZM0QFgVLxbPsDtjC3WACsUOk6WBXtXSUFVA8QGB+R/dU7pnfTX3
opXs+zKdjZGA5J5vUDvYqsvFeEAUsxgUybEUgZ5/6+/dUPVILQG+StiA2NWyraH/vBrvsT5rRqmg
c5HN/NzvxTo7f2xW4NytXKvpl54SzedrfDfy2ysTS+OzNok3v+dOJQ2AS2JQd7l2vBvtgnKgaBJn
dlpHFSjfDLTU3PUpoVQ/gQ9phs+YLv/tE5RfjT7BR51EUj/Je9K/2Itj1W/L7IP5Z1RagwkzCyoz
kHvtUAig7ohxNPfl/Enu90rU87r+I9ZdLtzY+T6+Dino9j6Rj/MeDJkeqO++ax/7fwjFI/+faFII
ayoxb99LwWT8siLJCYQywDOMzO4bKe1WN6OwTkQI6d817HEs1zzNlIZN6u3Q4Lrk/5RLXlv1F+Yr
4LF5PIyW8oiovYwvgiF2BAeYV8nTOUMVEHu97TnCVTy9mLGWOUeNrxOEc3JrMeByVsA3Sm9NIIQY
JDjM9EIM4TxPIj3Uc+TuonoWkiHmVmd7TDyc8l3CKGlD7V5iqaU8wZX7kum94hnoRoYjRgaamGJG
WmOD2ZuUBpQm6bRCdutBVziDe55atAvlaP9eEsmZ1W3QT2n999h0TNUs72zb4s8648Wtm2R8Wq/g
QZ5zZumX5bWMZaw1hhCxiJv92/UHAb4UTFGFLFVHacythFPjoN9JdYFjTLoNkRzaswEy2wmaS4o4
JfQ+FpF3ZAY4+MJTVjt7HLkCYvBzRZZ/A4/fwwZGBj3TFPjK4grN3bbDxdoio/zNTNHEywPqPyKf
MUiaDZgSzuyjgy5wwybP0I/seRrY9qCqbI4/ozQ0FqZkmRFxF0oCpc4+LQNMHSiVwnaD0w7UODOT
UGIjek73G8Mtz8mk+dUfgvG1IHCY6cMsvBHxD+1Ls4ymPKLA2/QKYTSjK0ZVgJpl0JAkQ7ZdFmOb
/zkvtBu8FiYlZIByOcXLYozqrYLRQV2CXry/yF3kT6JVukqvJZitVPp28vIK7w4wh/n8g8+5o2pi
uXr8gdumAv6UubzVeNU2eZup29VsdPH4jNviYukoZlYfKohbgsUX2YW26sNOUtIq8/En+dIYWZ2d
fTJdwsIEmgmgoo9RHsLTsvHFjpFQj1vleMrkLDve6qZomZWCczuFmgGbLFGohUGPckrD1bYu7FeE
x8TUf8K+Lzsu+nHuBgOMrpmVIwG6eIPSd+B+SNbvBjskDfprc/JcjY+dOQs8xb1fSvbUGr58boIQ
UjdIx1QUGpgecKyWSRPWP+q0MuqvqVhb7+APWnXFg8Ht71rKTmrXJWlSisf3CiAXqZOsOfju2BQv
KvshxyOl8rOw2EoI8gMXQMU8pR6c4XkzJUv8xWe2AV09klbgTDHcpiLDUzQdCbEZrjOu2zqJn2Yu
YIeU51c8PCTKjBIBHkqfWS0rdSxTg2Ow/zW6LpxuEK0fQ6JCqKH7C1qAWQ2LdwzA89EfyXQ0VrRB
nBzo5lpcNfJ8XFbzOD5Cd7X1EvSF4CLTYnhA8gTzNk13WGaAhLpYUokqmaG8YAw4yzzjaMYz+DYk
XrxP08RlUTj56EUlKgbAU0BlyK4QpMVI6auk2jaH1fukfbvBWEKjx7Fd5VOtsDx3xnUGsfxmH4Eh
kiOkIdw1ESWeLVeWQmoLVznWB9+yaEg34FflPxr5ZwDHHbFzwO2oNNWvOZhB797+/io7ItQfoH3h
dKX0MrCdt9/qd7GQ3N6v1sQlzeX0rmu33Ex2tBu+Ry6cXYVX2tRCfFOWhemGsYL0YK2pn34oIiIl
NieXjmJ8MbGiZ83+ncsiD2Su3br/8TT/nAv6P4ENXluD3kXx/hQxii67IR9hml6YOuGQpGH4fcte
/AVXpHenupeVdU1z74wUWGHeEd5RgdXo/erY6kp51Vo8mN9u2Gmmg82cu5nky7hRADK7M+NRkfGp
WXPO7ow2WXo4urygM0Mla9MZ2+rljaKEjr6WIAgKWla5mNJMWowvHSOtyDhUgFej+9q+613KEzrr
VV2m3b4cdghr2Kah3RMTjjXZyajc8chTTHNwaRfjWgrrzncv2q/G7B/CRTX+DbdbyXm+atacr/m8
ZTJjUY8KMpU/EA37dYUDWyMXsoDNFCuZgjQATf41Lh+p1fOFOLymDw8QviYI+1TaJLqQgJQpL/QE
gwreYirIqGoKnS9uP/JJ0HzxlHpvyqafeMUN1mUKS4JC50ay00WWNPhRKES3RGa5VnNaYyYvHxOk
qula86Gy3AAeYWO18JVn8rUnSvT2sef0ZhURfDpJoZ6Ti4Dze6d0KnTHjjXHhdEUMWOFaMZ4l82c
BA2BSFFa1axwBqAVST4b/SM+Gjzy47TEcl4M37A+XeIvesveSnTX5yEsmy57u37guFULtgO1VYZ/
RNLa8B/lwdHsVUzJD0jVP+D+B8Gg51VCWh4cRrjANMiNo7vL7NjUga9shir1kFfmRgt77Ffxlkzv
uQSdEArvcPpaFJt8jP/6CcBRWRztk5qAKKySH2VDG+DznHcYbabBhH5jH5YE+qh56+mYrc7qaF4A
h0E2Tu/q2mqvJ/+bNzaug/MWDzi2amGeVJo+8kftCfo++StXnribIDjSasRGDW5G9UcVkyvmmgoP
w3ddqsFFn6wSWZXOFx5imZ8cvw1cHTdoVjjXx1dhvEYynT4420ayB4ZrpvrF7Y2KHlfyHDDXp3XF
FFYoaksWmznCjVlxz4YpW9VU4nEcDC42wQdKkDyIVaKsFWGqpwYiXSYwCVQcqoDh165E5E3veQlZ
w/K5X/JTjqXDMZgsQhh1wzb5bEh3YxgoxboFPkw07kSBF1Usve07eKWbqKuqVQXI3eOTDoe6SLA7
75nZ5U+wL5B460xAmVu4IlvPBkgT29nTzyigT6Ks54osBer5jpYd86q0kZcP3rA9b+nuV83FWCiV
YlKI5XcoAwxQ7OcBO1NLvVjQn/oDjtNY3Ngnp0DYZ17KOOrlvBT6WkOInS4hpvJ2j7iyO/oO89qE
paAgThspCxtoHSAt016SCsUMNtJIT9rivbVrG32xvCkpfoyOr3gdoA/RD8cWyqhSg4b5ZlrNcDdZ
oqCok6RGUkdNeDuDoCFjk1zJHfEvWIxS/9NnafnxTq6zsEZMKP/tcehHIeYisyC90+GdfrW99hiw
jQcYcvRGkubUroHwfY/gK3CqPtel0lfmctYlcHhJtL4H3qLVxDZGy5NvaJIceVUEmiEcRQaGzlsC
GSeeDwCm3Oz1a1xDmuK7MQAqFbcswJYuN8UzH6bOpVkRHLrYMDvXNxypd6A7bhY3gOeB81LQ7l8T
fKWZdGWFqrcddrm1GtiJvUnsLFYhVXJhMK/nHzSRb6W3zUswEjMqrr0Mp2Q9M/kMaZl6bp6n9jv3
tFmuIoVbmm+U221HVCvIAEtWNVrTBvGD3ORx6Ot6OXuLvKg+wFIKUxVERx86HH3NE+Wjb6/3klIj
uZtndVMBp/K/CQHXYJempHECrpQE9Jhn0Ua4RSw+GgNnt57f0aJ7SdWWsw2LNp3f2GrwiD8kyAhD
yhS3rMLm8KcLqmi6kNnW4W3yf2Lw6tfj1P/w45UtuB65hhD6/l0EZ9V3AFOG+T89TVMss1eQF/7U
KoebzSrXUyFD+mH9cwCIH5ciouEn8VdwsiFttqWqmELEnICw3ekE4K3kTa3dQgxfXPOXWZDz5s8z
ac2zWE/nc7H3g9wSrIR6tLAv2iru7A97nOsg4j/Tf1+D4Zc8e/dNj1cG1mmTUPGSn/4ca/gnVzjO
/Moq5yIYJjX4cO8QuouOydyX18unuolvJKT27dg5rZ7CWu9jGK//yFnTrBzAySOKuOVPQEbYnuwB
uHedwjgwN9jLGfrSpgevaxtY1S8YkwaH3AjWnw5DHwHe4xR2dPG/pe3XzkJV9Be7hO2JSdEHcmGl
rq5O1Mge4p3QPcRMSfaetUX6uiPXomZR8SyzrHGkX8JMYgzqkM/wnxixeOvljezAMDsxJLAue8Af
siLxMoM4LcmXFiTgLAh2/L5g8qSK2ExDRkbhszInKyNGlhKZlJuUm7H0sRb89A1gBkW7lr7zgG5X
D8RftgXWVmfa3pBWU2xMZeiTz81vaQn29Qh3wdRMz/w58iUK/eSVXTpvRqYEAC/zQA8+o1lS0vzc
9DGekCyenbCTrq1jZZ7FPPEPUjMZwi2R3bHK34IHJkI4I4G9NqHB8B6FIDzx5MhOyoKYN3UblIsq
cAyDP4uCmW9ytKR5ALWvmPvEHha9d1Ol6qQfLtegBQZ1X4Fhi3Q0Qi84EMx+gAdMdjpWXyqvBtNz
LieI86KMCW+jEOA3xBlU1w7ybp1hOt5FdKDwanbnmAsf+amBUvtz1WFoVqO+h7L/6nNEx7a7SNbe
4isJOxn9GgY0R/u5B4VMAylH5U7ZEeKOckDUdcMLCLDqcVj75of3tWp82pwNur5eq1uC8cmnF4Vy
YdUGbU7pJTzYYsGZm2v4N+1Y/VEiSjudCNmuhzf9oHOidEqwwFGLpXriL5Wr8pX0tsSWYH+2M8ZZ
Fd+C0FQtnJx4UIr8LzQ3n0xG7lIoO8CQJPrAkUTsqyuMuc4hiZOYCv/8tgGP+afb2/lspe23gVOS
QNyXC1c/Tt4lrnIPmzsI3+a91rDpwKpQcGgTCuOtXVyYPk72grxjcb+HF1WCdyalQASMBLJoPL0g
4moRCkkNJWRcQeC0+uqt8E1Guez6zRl+lxWLCjq22kpawXuFioRmSMcqCiePdRD3r0SkrdCsORA8
2UpGzQ0fu6yoK7DxNnuZNxyuDCeWCI/2zfKxKiAbdVGdrNiDvOUoVTLR/tswQi49JUOCFy1f0Prw
uiMiZojl+66GKUMwYSdOLjcyOKjsXLmLrDY3TESigQh+9DBEXJEK5s4xErLUZQO3q0jWHoJ0edmh
jq1fvsXZ3EO2J3UQnYnBgmJ7wIB5XrwOfwfXregkqqot6JowMRNyF9ecD7bUifAt7xIu5yEv6k4N
fwbizgPnoVyvNhKkwVPmkec/nYhM0hu5xou6uY+Nkic8qVB0WVx13rNynNjhlKDfkofocQ7BnGbq
T019DxB2iBJMd8V6HSGBh2bqfX11+0l3jRCWP5Qd7/RhlUziv8G0UQmsDgGx6a6KWCWaiZj+1qcw
SXjf5VK4AoIXPXMEnJKiUQSb1Ul7BABGBdMAIgVPShJgg0fc0yIcbD4iUH1W2OeyIV1F6jkRDFdV
hdvAxCJMsDDSEVsfXeoy0nVIzZKJwSKGtwQv6lmeafFuBQ85IS8iUZmE9dQiysHLPu2KILiNdbJ4
yh9O5bpm97dwsx142IHE7dhBpRoyGPPtHrQruL+2wrThrOCErHJ35xxtp8UL34xZd9/Sew6pUkC6
Jz7FBi6h60Iz6/lPe5sg3qd114mE0xpBPv0R7mMaWRIQ4wUyTD3IFhyVBcFaAAGWBjXdpE5gP9qz
ZZhZyF1DUAnKnwEVnw+CWpj62Y7pHM8j2QYaAw4xbVIhKzhYzHPF//eQt52zlidijwWKmFioIT5c
t8/nLTLmHPLwMeMVTEJX4Va7/uzZlVsogLNOFcaruIS1EUY4E/5dhKh/qTeawpkQliXwjlkyCWkI
HUU1b+MmvKzWyKUpVya1Oy3dPq43ItVAbc2TJaAdvLs3K4NI8VGP/dxsl7OZ5PPgGM6/QqvuZw2m
3Z7IPBKTO4Nn3MdV+w0bxBAyMHVFxp/fSL2RJI4LbXQ5j40lcCXUPNzz71GMTMq+7bgySincmJxx
9gw1hqa8MKZilLhfYtDR9dfJgKoJ7YUZmGbcN3Ey5nE+IBfguDb4dPAznsBUBbxpmZTH4oRm+ikK
nHpfzBd6/cFKv2/GUJf070ABmhalyeyWEFO1jiJZ4d/a7m1XqwukV4ev0quVn3Pd9fcBquwO2AIB
9uEyrkXX4KaDMxX2Oa6XU8eKqLzNiKU3b3ttF/+yuRmQFmLDiotQvcmUe4x0aXH8c4avJHS+6L4W
H8RrY6h7XKBE3kgO0Np9dytWslL7mkzJbRCyQ3uP+AMlOuGkgF+/1kds4p+F2YQQ2nNH156IBMoe
frzLfbvpvb3Is2Hp82yqTWxxcr4fBcXMew61NIJ1KYgQWUcPP2rKgwYcpm+nGhEliMSl7r0cIkn0
w4ldn3WaI1QxfduX92jXlDA+rJ5XxtGQFP0vlIyGInHVmeG5e+K/PwwiOuWdCrn9E85PgxNHNDCG
pPQyo9rXsV0RIoYijno5bRs4KUKg9nMThfnp4ebKte8F1HxjIkxLXWVC66Pu29CwjTCy/GCSm5wl
MuH+2VRy/bwTSvksM7CaE5iDz18sSjMuLgWvOu9uvZmpT9iOsYfnJeWeZkjkurXO4V5/OM5SlSwc
3VvFPJMG6OhYJS5Kc3rGKhPDim9wlbZoxu2biSliPQeS83/mZcBNwrnmnew8j2JLYa1d1H7Miqkq
e5q9aetXCfvAs2u2kwIwSeHU0KY+NgTMp2NEILphmyxScGb4cUwVIUc04BvC3uZV10vzUqgmrp58
DiAJEfyJHQlF/wur2udBQuaJzYUppw5I02j2FH0uqFG9Q1NIF88RJVMxnePCDfqtuZjP8065YXE3
G69OjVKDpAhbq1myzmNlaBDXYpBCGWiGuJ/U2KLa0JAV60IHn82RoSGoqqu94pFSFOsXphECzIZt
4Wnh6Z2+BHVE5eNWEBLokMiiyoxtSvh75tTmF4BaxFfL3YbVzpD6U1xWN82wRn4WQrnT48aadz+j
GA5SR2pRLDkYyODOU4ymMdOLuEajHi0IrUhb12aDvmS4/zHvfrC6r/9d29w90FsKYUAu3OtPQ5s0
HRq8Sg8c6JoG0A5GFr85RwTC493oglaMAYzH61sqyabLAsk6lI/9l1lSblgGuYf9fW5RuT8nb3SQ
YQGhUdsTgO46Ro9FJQCu1IguUho8D6FH4FCxk5bTY96jFssZpxKIbtHg7yHbr1dHl80rok6hApFn
h4aAVfdbUsvNrs8pUH084aVAzw0HopW92m1gVB6XcW1dGPgQjn2nPGuvWfVieq3Ol8BB0RuHICS3
y1d7WfXi9q/kyo4UE4/hPElEStIudDo0eEddVMIpDZ3ZtUJfUZP8Bp/YJdfVmXPgIiNgwLOka7Om
R3emsPM+tnQtHRMPcGEFE1qn2n+V3Z9CUt0S6ONbWIk0OTrUrWlD031d0y05s69AXSltjP8rWqqP
hfvsahJVCVznQeVM9SYa5aNfuFilERbjz1rEkMuu4u0kcT9bDkxq8hqu20Ejj3mzmaUKu2JiaXu2
05AU/fNlbq62/wQOH8Mc4jcLv6LnZugS4inuu1yCBOTucc/f683hH4iWYU2pO9k/OH/SRHH1Eicp
5C6/cuEm+j9IjKU4moilaTbvuQ1kio+uQ6OHeZdQed5Y/G6881xmhJ4hZkQ/WWRSr3F2i9THdGjJ
gzFAJK8Ho6LKKBxdny4EwXM13saNZyMeU0XXRdaGAcTDFoQ4sN7gp1Gatx0j/Qu2OKRKi+7ihbJt
t9QnXlwX8o4cr1ysk5A+887DRGWZC8SKpzpkLk/CZCxk+7mmcMJAIyj5OUsceSwmeNIhyeZHu2IT
ua91zlOeYMmTCP+295bYsojV5UCHFBR4GD72i/jMHqSzJDfZfcA+Ydh74g46VMOjXvt+J19Os8D0
v1vNd+Dls1Yy8ao8wntpra3e10zGKVP9bvAQbLtaU2FOM3FKC1AIxY7P17z+9s3a6Bfad3bseMQK
a/3m3nEmReyWZIp2KRz05+yGwkD0HrsquLsoiUNO/OADKKN/mSvQRPSk+R/vGlLa6Ynp4TnD8ZpX
/dFycwnLIAwQvEhoYBF24j3sWrNtO1aQVIQ4+ao29dmkpl4IAFT8Els/U5YP8jmn6aIbXrADLz/M
Wf+tQ4gFXSKNzJNpX97aHY+3i+I7ahpDIiJ4vyDYrWB+tlveNrxRWX1fI8saiXtr6LRZx1T4SKOz
QgC62ZcFdvidQAM59mGBloXbz1/LINsrKyv/BOOm38Cs6PqfpFh7FHw5dWOxneL2PIFWgeTmJiXz
+1HXzocNUVfqLHxJtSE9WZ49cmrtfJg7tDVTXLSFk4UpdH6zCO2xKvrtqS/t6KBq+ItGJDwj8/6s
pGB654Qtn6HZMLt7Crd3VyAUpeqm53y54zKSycSaqQ4P43vdMxfe+thjySQuuBuQqMxwN/nm8AQd
Zr1RYq5grujW5KLD45ccVeuv6304w2uD8Oc+BLDaB6S8V7viELie+eZQyk24RbRDqBwjsEaLHdke
D85q22+i1GqRlM9WetTQ39IGjNuUD6s7CdL9EdeV+xrS8KtuiNQKOCIdNPxabZWmExA8mXkO5Rbk
okbv9WY1PucwDe+hIizKoviLGkiG1EK71arzn9tqvRwUAof2/6QcNhylf/aB2cGC6L7WlgQg9e1z
4P4FYtM4EBRKOMvhgAUBhsaUl64XAFCXfDKZ3qU+W7ebqmiJ7OmQEovsN29WpDfQnLw6Jm6hYvk+
8OurDAs9P70LS9AQsuJf4D+VuAkFewAhCq4SayvTdxux4leNpQ0kjnNn7WPXkgoS/pXP7KRhq3Pd
24YQ/EmrfXXErhgu61CVQFCy9XPY1QUGzYC36NOOMQtD8mk4CWF6HBTJGFJ2lcQnSeuSZ2lR4W9e
y60yq8syiYzqh0xxbTdbg24T0DhpPs46+uUxOAtEBtJanUdicgc5+76OFy7MzkCnaFGIt1sWfwTB
220BWbdVtw8ocgKfgAYf5LDVnZUKd2CMRD+ZI+zgLLH3kKADJfC+sS14XEyNxYLMimFWERl5hH3r
PLmdOYfRSowCfNGXNk9SMf/QGeBVFeSqpVjUhrQmh7ViTTYVGLK63PtGu4G4Q77ioF7jWt4NckzD
/TSrYnY/cym9sI3TIkkQgcscL6qioI7cdFB8X+eGb3wbdxWhpowdaj96Dyjx1nOXTsUH1kMisZ2r
vtvzRIgfngJfoZi0b+sb2FlgZHHBMI5+BRks3lul8Zd33WBaKMjVg0XWrjGwLnHHCvv4rHqRt4xp
bBy2wkl564zoC9MBFu7691iuGNv4DircT2FncBG6RVXxIDaH14w55iUPlWAwRsgfiy7PEOQkw0mL
xMkPjv0xoiFCR8jeYGizWPJ7raPFt/wBO7XKVGHFuRVlyvc8zbVIId4EDD4pKkz/O2jkBQ/Vo72u
29V1GeF3W+UWTHtzbt9uBTUXSmeU5CO4CuCW1yy1bqOx7Zz9QM4b3kHpE3towCHHhAv63xeApfRZ
2v5tb30kHK+9lqkYWyIV985WooB9TDnbr8Z0wS8pvz1Kqqa5YI0ZL2UOA7a7OMIfxob84EcAE/rT
qaSwvVCawWe2OkPOGgPU8rkAbLbKXp9VCvENtFPRCi1An5W6TlRjrQyRzOlOKbyx+48pZQUSIu5g
4I7V/4SbC4NoLlbuJa9pMXz5PT1w5xVoMMZAYj6diaAWzQlJIGz8u68ZlI5RaffHcELvCFtHNAFR
+kwA7wEOP9BFKgaJR5QzPpUaei3y5365R1jSB/WAGEcFFs2MQIAamU0x7E/ORVfiw4d7BWhZKTm5
mX3CyeuiwGU/F23aBERy+7t6hsGFDCJgBTMkQAsp22YgZ/3hoS7/r7zIIVFW2TuvFH6kkCzUZM16
qbnZwAi8oKEYJwI46DpXduuARgz6wQLB7n0WOFFSk7kGifxaFInDz7khu3MU3MHOAb6a3wHlJWyV
iL4OiXqed1r+OO3PrjB3N3Zywo2du3FZsEAQ7IkKDWJMXEO8vvqtU+CbDliNbxoyv5E0PeGCDsKU
kYDYH7B/Ce2/WYqN64+Fmt0wo3MIJv7wPku2tMnnMwaSKZkntj30xok9QSA2sUqrCvQLaRgi9mnk
UQ5UEV12vSQi6aWEQenvJa0xqyLeC/qC/oYmQ4f2/S5B86PPjIVQ2oT/fld6RP8fFyS940ajbQKr
zcIDh7FeMspOsvZeT1qGBZ9h7CKeUpFUXVdO2J7q2LpVYA4gswQmDnwIfs5sxwMjE1pdyCmTlAiy
yUS46GJ9O0YOftezDKeei7F/RC5PfGVFKad1aCOYCeJijbOXLXb6ZVCDxD+IpTJsKWNckLB1jLo7
J4/WHCoR0edfDy83cxilG7DzSfYru835LXlXP+EU9y3lPPz1jgvIGAtpjK4wEfNAzdfeBDgDRDI6
yRtTKl9dYiUn8DgbmJqSLfFloQBgmTR2YdBPsMpRUM/rrZKTCsF7wfT9KQxvUGKmUZZCJKqlN1/z
vfWojvIP5DFt+gpfhQ/c8x6UQhOSuTPADa/C0hdfxarD0coLP+DxpWJu/ggaILmnJ/YgJ/EmwC/V
Z2KUJnUYAoePELnOuPwtNsEOFQcNpfRh/LAMRWSxuu9aKTILwmSfarpBtLQ/IT8n97J5lf8UnQdr
FEo5zWFOEwjlUNro/I4b6KfJcFo606d69N5UR4XJAw9G69tp1++flGie56cNnrGUP61CCsOtPFKT
dwDuWliSvZzXG7PFLdOHO5TJUqy8OzMD8NJIoIqQjDOseXgazr4oe/E7nXw2xaKyrZyweg/wFVNw
cA6Veu8wsRNaRSYEFNgu63i4rSK+cWBZ9UD+sy7YWwySgWXxpkVdD/dJZJdwsRoHy6QwUKEM6PkM
tqfNlPOTfUk1abfdwMv4R8h03AYgWuysMed/DwgO7E3zWhhoxOoWvQNKNarEuxpQkZ0u3+7A2yZF
OLpv/b0Y1Kiz/V88c3SFcuAOjVy1uuN5evbl3AaCNaEx4sdO4mZQ2V3qbZBXdUfQ4t7TSQ0MklkE
gMxv8oXPEgsgL7Oav6GoDHdZ004CwzS7OPmT5VnGk2qoh4neZdTrGRuVNpcp2li7P1L1iqepIN1z
woNw3xCO8nsL8chMy09JH7bgLTSKpX+XpRunZJKylrAURCZKhNB19bugN7kQMAfLePfisP+paOvk
5VctGc1tWo6png4tiCHuzCloh8GntjL2/lJ8+P0MJnBEwBff42xuDp+8ZJ3YNWwRVv3il29f3RmS
XzVVziAT8qPhT0EpimW64ZHqDYuZyugCqWqeD6L3aYKsFWhOHJ3FDrOsIJKqOpmA0b4urM2hyAs0
CUiEFBUdVH7lyyIi3TZN56J9Ch1mtRxtE1aL5JuGjKkVrxLmxB+DBZBNrwVOmXbym09FKGX4r73y
XSoyCClKvunhWlmrmAhG+iL/Cjs8W395Ip735BA1koIpcASwOUL6GUYeD3jLTtf2Eg84imHVNtNE
3ko5WabUqZxDH3AA37js3btqA3NE8aSRZvjolgewtg+MtQxBPZwVjxchrfUN2q8TwgqgzubIKCpg
o7W4eHfmU0fkqCUiADNCyCg9WhfZ2ljiexCYrT8CmdzAe83UEHA0+uBZQo/UgRwneKk+Y8B4FXKe
OZWY34OEQDQDNrsq0oiXl8DU6UT68IRKosF2wPJPIorZXLAyfJC2/NDIB1tSwDbTj/GdV02gMd/H
QKYrHKnfzv6kv2KtIwi9IOZfwOMrIq9w3eGNEQOtFjcBP+VaCaXob5xdJwb62i1Fo6gca5F8Tti0
e1F9azoNOSrxiaXd+tir86eN4IeFxD+bWfUVGeRDdSeyWN+F5++4nPjqumaZF3TRjLnMEX+b2kC9
wX8nbCA49L5miM2tNbQCLkv9LeeET5/hByxfl433GxfW0ye1GhXmHDvGaRyxT90vl8VTRJ30PEFh
SmdpssAYvxPi8H0Rw8N1EEpJQYH0SsddYr3jFYyPESEh66sOcL8hn61h6/Lv5s2/gQPLoanYw6E1
3AUebK0cT804DrBBY41J3E/2BldUaZ4H/nmGiBnBBKuhjNJ5UwGtTuuxzdgRH1pfjKsnGvaUWpnl
JfZpJD7XmMsOqFlZbe9Ig4Ecn7fUhCKpKBYTDTTEoojKu3iALOcZeyVKMpChvgg28wUB+un7gsi7
ap/+cFs5GXfKoawG5Ydo2KfHCbVtZgyHfsEfOmxl0EhF20OKXIggbtFHz9DqolBmu+SjLRKnNqYV
E6U7UZzBO4iyL1Ncd5yPWaPxvZ9hlOTzkf3DvvASZOm9/qQceEnuakwDTA3wqneD+HPNrbth5pU7
EKHhBKjyAv/TM3VL0QMMPVML0n1fEMG2CsIZR8ArCU/MwQH2TwEYBJ/XSgNpdjZXwFf5GUCRz7Z+
ys/tM07MSW9AKyzqrnL1ZpbyaNsCPCSVOt6s+/fpKaFk/zrGYkAhOy1NM9Z9hpRmmi4mKwy0dcgr
s4RtR79vV4CQtbi7LMCGYlMeIS+JiSuDgwb/iwYE2kY+5Vz7w9Udm2ZYber2d+pPz1aDDqflddKl
7nH3h6WhmJDC/c9nRmTR20f4qSWp6+EUN/CdT56irJHBfwTP193pNffVC5/I9NxUDXOuHbweJ/sf
nNBTx8q1NVV1/d6wycCSLhV1AtQ++P2Pu6KbntBflkzzX+jgZv75G6SrL9wzWm89lcYUheo38FDN
/6tJe2O+UmU6zU+/RbgOPmoXfu0yDjDfkDJL6eJl18cnYETd2VKOosCcv9xt+wkwi9Xu7jA7g9QO
F0pR1bbUKyY7sZTjwsGqHBEwDBznfia9JPBKsR+ecorhU11bOWM6/cVkhBtA+PnWGiRU1M6amDxd
A5/E1qQIYL2p6hRP8auR3lJR0oNxRYghn8dGDYfyUFXdAatFwiW5fKQoEsbc9iJyi8UNCbTysQN/
4Pz5K5bibkrq/Td0+h14Kj0fGdhdW5Ujxzx6A/A29fzmORqrD2HnyCUEBE2wsOu/PuQ/DuIMWON3
OrPjpdL3U3gRmdwlTTu+XbqGbPeCcm6iigOOzcEksc+/vGkyJSpoMEdowFDTqD9H1OkcWWUe5RtQ
DAL34LsH2X2elGNzpLLOPa4gLAh7v73Onq7fFgTuOPwl5jl8R80oR8Tm35nZVCEh5E4d1y//EU0f
PCqSWlNqULatsqCkOowl90/FiDFwQoyG3I21tv7w29vCUdVbAjjjWkL+aJICmz4jkXMDazDOtJ6V
U5OLfcMEYcpXdlOEg6pAuswFWrNWjDLPF5XnkaYSdQaM17wH5WI+bKm8ZGewkKKnReYjQIcFWEUj
v9NRyrXkCsBOwV0EGtlEz2XNvg3xkMKfqeeYJri0HEvOQao0AGV4DQ6s859qJSq+v6o7Qf9tGjCa
FTWgjUxoPGX/Tzo/ex1OPOA+lARX6vneeydIOuGnTG9T+4d/x4TTBPpt1XUbxe1vUwDkrq73QqKC
BxJ/99/Kvk8mO1XCY7+PbX5//LPTtNLTwOYY3hep5BGfd/9E+avVzm4iLMUudRLqFxPq2cxL7AXT
34l8nlB8h5X5kbIvLMNdQP0Wb/QnIRW4azsmn34k2ZCmFPT8S6zZR7uiYDa8GWlGkOqcKNQL/+Wv
yDqY8Kjh037iJe9sE8j8Em/gPyb54GqX8z1mo++KvONWKE3cgbBLXLdhN2rxgy8Xr5paEDAsrto5
9cb26UUjtJrrqSvJlzh5SmhTm/1Ga3I2VhyI7k6Hxe3h/wFNjD0VGGGIrtR3fowoMSb11v6ZnB1G
o8E8/hlFfnG8QQ+At3OsVQFb68I9Iopb9Pz74H1DJpFxYLjmXZeg3HChoQfKH0YgkEzbBNvhCCBj
Dc8mSLK1xE2kG2SrQiU0Ta7iA8M4glnxK/IsFOmQNUqkT5Ev07/3b6gUnZXYRIzMIANtxTZHYO3k
DZmp62Fc92qzqV107EV8jS4KIo+zPIRszGCYjUjt3hQtNuVna/NuuJTUlUTkPDkd3rMkEjD5NPKl
lLo8z5g9yPt2X+jkDRJbLCil1iKwio112qD37/XntSRGtyL93k5gK2gR4bA6KFv67IrWu5cWnGxR
ZO2CDSypRbBNHrEqjx055cIeK216dQDvqlVBM9+bRh/9SGIAJG6D3j43se9Mi0qloxR7sRlzgu7L
7NbTwrf9kx4dtUcp+4cHvWUPKBGLWlDS1CFANox2PP59NZZc6y9emsHqVggPrbKBzy3yVU1lF48p
unPhSMbpfErZ33lPk9ok+dhpo3JopvPkapQp9fwChcm2ISKD+OIk8GB24qWXeigD7zyNLO/HGFXM
LUPMKLDAcs9nIiH4GN3Gz5/UNXtjrDzfWjVrUaL/LcD1SLtFebBBM+80YdJy/7rpsg+v2NgtlJq0
D4V5Vdk+TXoAljDUIOLXvmILrLqf+pKpwbRXUYEuapD5mizvjOW/vO8SnokkYfYwFNIvVtrFr/5I
OGNV8vflnfNkTOuOANIKV9ofV0w/DN6OCutE2NiiBtXjeNgcqGuQS3XewLNzKDhCyCIfEpCYt8B4
pxQSKSI0ZYj3y11m/gTv0bdw98SSb/R2+DBzy7OmdVjVT3LqSWp1wWsLbXrQL67C7Aok8lAil0pR
V3RRHzSZbs0gpxEYWTfLgQbIsxQzsZTiYyEFWpabBaruzcjYOx+DicTKhk0rbSsW9FuAb7Ao++vP
6Xvko8+pE4MXG49SXmomXa5LOiYosV7OV9hOnBReUoU6uPjqImm03HehUrLyST+TTjsg4Y8D9UbA
+c+orqVnCwrJ8VnSuP2kJ33ylXOM7DI5XKn3zZ3T6e8lIL4tVjysWi0cFbmhqY8htroAs7XeHjia
6W084ZMW6W7V+EmA178U/MEAYSFRs84g+mCo5HjPEh/CUKyfL4+qapk50Xy70eYHOTN8MMbdhXbR
bFrbKEL6MyIquEstSIoFANM1rmusn33Qc03ndJmwU+0/5kPkvAkyUlZsNRqVpCxjvKNEuEkUc9Ok
DOTH0JheemC1twOyTH0wF3NtWwm/QK16ei0RkBX9qzrSrvm5YvQvBeoNGmQrYkyv4Z5FxgGOvGyW
z1HKv5utM3sKGZGyiChooHYXQ2Nnv9i2WZorwHIQY0o8zZnyIaJKdNM5nJoie0HDOJjIkUVXg8ex
0TwPQt/iN9wwVMjuZl20Pj+GRPFCJEjvNWMC/fBJsGqqKyq6hhnOaUkRc39FiWFKnhriJT7a4Kcm
vUr7BQktVtRPQKesx5oK7bQUP/ivKdsYeLcMBZmSnRgqjRFViGdsDjIXps9ef3SDb5UFYxYnXaEZ
raZJ5mFDEV17B3tIcUvARd93i5eBsaC7X7GnUodFRDcd2REeKE35AObo55dzTEjMiBxoTdubygmn
vMFNfqFPqLgXPKkAcZ8Dbl3vsYLzK23HMzjyNgfcyrbr8IXZc6p7Be9FRbrqo3CF9DULvWzuFd25
MmOK5e76rvYLrKlNhvjb4nTiDoWGvQipUrSHrKzQM14WwRNA6/fCjIVIS2XxEA8ghkoFcSU2gtE/
EzQIoLSPS+6UZJxVXzF06h/kLuIetWYlgnIq9RMR9mvE3vpSx3c7luaGY0lSRsfH9lVJRbEdb5fG
PmZvul7IQ3oBa4/80EmOWvR82dfjHs4crCBwMbErRs4DG2o92QrS8Iawd0RAI0NVYPIfVcbbvRop
fSiRBKBQkqV2x68ZWDh/hFaGBMEd9FiQeoDH7BnELsO/dxWUVKQ8PzHU9MJRuC+6uFhl1w1m7HTy
4N9D/mmXOnfPA/1nDbuD/DzXnLGMshKPWwRriFoiWVX42LQBu8VsEaWFPw/2+mFujGHzI6ZPeIGj
VrmoDuCOV/ScLWA8YJDvRPatKLhMQV/Vu66QZCmvnJel96ufeqsmnOQsEg/2Go6Yq05FEkU8/i+K
r97se/CnfqxBwLY/B7w2EkbLPSFlCF3m7LhBsgA4P+DTGFLgcEMJSIYWZYvoBfwsnIXiHreHzI4+
FX2h6iK4SSTaRH3sjuk0Kyu9jzvO2hjuIVDBM9Jdi8gjgNIglF2OisXgmmyA/f5++zniE9Jzt8bR
S36LpA6hHHqmDxiO+dWsasdS8iywZ1Krr45p9/P1SodELXsLJ1vgYoIqj80hcRGTuCgmvHHcF8wL
exKZkBmbar1orzjcQ3p9AnYnmJ5cTIvw/MZ8zNoY75GnqpQUZXT/B67AA9Qa5wesBk/e9XeMpdKS
FYytC+02beOUVmoKbPCkmJs0T5//6bV2i9/8iNkxdByLUD8Yj5ZWGAKrkdttywMv5RlUqV8XUuyo
AD1+vJNr9C0KULxlAnoIbzskbDBL2BdTyQMtvoRV5T95vcTo3IjjUtaCWYRBcZySUL/i7pKmZPrG
SJ0dRWnqdce6hxjz1wnyLsm98b4JFbjeGkn71BjCOYhFmp6rg3ugDlOX1UvrwsiEueJX9KVohwXO
3pWFW56OmdmSCLksgN8ZSxijvaRhsvcQRQMY1tu36wZ6iSgvOl1iWOi/unMp8Z38XIhCpInDIhZ7
91OcA/zQDEEanRpvqSOIzwzUnDQnEtW8uaZlWVBLnZf070N5M113frui01FCA04P15UC2o8ah2Wj
46UkE9QTE08zsGLUWYRiTNwWB53pzomsAOegXGXVsmwjHtL5GOiYKR1gDlHdOc4TvP0P23tXMp0a
BIMbU8mYkTb2T0/QMSeMxR8pMTlnw6zHAKGMCds9ZJ/+8POCoiPumc4Vig2XqsGOlKVuEvYOy0nF
iKv0HsWDsiQsbGyPQULH2/jAI7hjXl56dzHYaZn5uCaMNraAwoltWuaHeOL7cbPjmge8OEwQ36yV
HpQSIu42SW4HsnH1EizzHDCfmAmiUTR7xb3TtBlK/A4khNbehxRS5vzZEFgYBWMKMKL5JSm5bwMw
IAGZdf/0p8b7lMHn0Wwz+ZJsn9JVrG+JMFugAkEOxhcpMFWbDyE2fSs1jacwXICldOuBvMOoGvCC
6AwDjGdCZzAx1OdEbzYDgWeU4JKevQx/ffDz2g/oo+LFHX74DzgwA0oBtgu97AeEApHcbZYjh70x
wh3fXREx7jrPhIwsCnZNQ910HtYnZU6cojNiYPpdVYpnnavG8Qv7LhTtek9AHM9lR8eKbDMX7lHR
toQ13vaRMeYZYPkLUzesAXtOBfIvWJVpgTBXsLq9e8QOQ+UF9gVq0NixZgelRplacc3YRLbsg9+l
YW0jOB3uXnl7W96PnkiPf5RKF2VuZ0rCXy5rsSAKmiZshkfYVnx8UUZMnXTyaqmitybtjjewMFLZ
QZLwsv9joWN6G9BtY98Ya6B/L+17aF7BXYRgdXh4JfG+rUF/he6qKP4cUErprS4yZ6kPF/bj/VV4
TIuUuC71MY0ZNpQl6RTvhCijZl33hsQ/30A1MKD2HgKyNi4xyrdGzpIp6yAg+otMCb4WteOjcI9n
dZj+3awLYmTij6M7pk+03Bmzly2Q4uxK8JvFXh5UJD9eS6K2S2B5f26ze+NfSxHhMCvO+2sozE2w
HSCHoMVhXdHCIpLpCWhUbeEGoT8WaMTosqsEbekCVZgihJwloAmRe444HOF3QufwTWb098doOWhF
0wB1AluuqUQk7W4RPR50175vaMvBw1kt1sbJtrDST/axqk5E2Lkovd4qyaoeIZIuF8+GNO7rdrAI
2CaodljZ9f9QxwgS9mYuGZNc3MWUmdbtAV8Sjw5tsMtPv2k7ZmXB8nMANWnU2DDlTK7SlO3mQ191
pzkilAlDIjgCDNeyoSS8jtrPz2pdszH3vpio+KqRMFkBX4lwltaaCPl/o/J5n2EwNuVb5FHvv7SX
K1axbzCxi7LAKroVUoYvMEQPKUpmu94WMO0cSopD+htvh8+4aGboGNHT2regaLpikfycmTBFzr6C
nyo/kPdLctv22q3HuZNXUvIWLHJR+8R4t0vdkjVMb/unMc4FwhO3cm2ZjkK7Lu8Ax+9Q5x/PKyWC
4Jv1mnHx8jGMcbeQw6vQ1LVq2V6VFnIDkeDUXnRFiL699MaBelXtQvEvkYi4Ad6A8GJ3vUmh+EIx
DOQBSGqppK9Qal/kFgyPrXUL9klVIKgTFT2i7/YWQwMVDcakb/QRPaU5ukcHplUDrf+ahho8F93W
B61hvscNagzIEcEz6WKbDKG/89N0v/+YL+SM5gAK3hLAiXdfqBC02S+kZkzzbrVFo+VnbPk48XnE
xbi07++mT2UmuWubsRCk0oqOXcUjSFzb8/GHZl+IkL8xEpu/tefqZxvF8JhlygV3ARJSkIl8FT9l
9NPzA7kFUe1zR7IC4KpHl/q+WZoe1A4XNtMl7HEt/74X59Xb45k2MluDEAlFlMuiVEd1guDCpDd4
SIG6t5irotehPhBY9b2hAiIcIdZKsrLlALWHgvN1w7Sn9eaUEaOsF2AC3Mmf33wJGymXTRxnYRC8
ehn5SX0dFJYkIlPcr/KBi3Gp1nawsNwjePDVJ4Li76kC+oGZDZ69S7Mc8BunUXhzgaNsLDG7LrX1
j87Tq0nHtBeSDoJnhd4xRadeYwBbQizceToVyrtmque1LbEhoEBh1eYaHWz/7c3nQknynvVrnzg7
7Xi67IXKaEUzMGfWx6RAPOUcul+sNYb4dSELU9jXHvYPSjCb3Ar9oFTdXpReOg/l+BFFrL8Aq8p5
feEjB1Il/T9xAsqMjv+7TSW6qabdfdPrayZsQGrHqQl//sHHPIwjrt1dLfBG2AOCdgmocWQcO0C0
TnyAhVQ3MEy+SRuqUwbFHem/XwJtToI9KNSmj8EE7mygKbocEXwtsCkFRp0EGGFn8Cb24HOW9JbK
ledMWNJByj/LqufyLlUl61/ykM2hOoYFuoFUF+70DTpAqgH7Lo6Fz6IiTlQ8bV3mgzOT7pTYqEY+
NePgyMJh6vHTGL8LHThUUFa9rRbjQs1qTz7qG+heq7eDOvQfb6lDyRRgfcljaipiOivqt2nIF8t2
1A9sUMABCmjbIUaC0ohAM7iVNvmwewQKY62dZ5hIaiVDCh+mNQnOxvVz53rXYK9ZWWO4dGe/CO2u
g09EmPID7qzT1Qtyz+6c1/aDpzBLFavqX5CqlxnctQxkT0ebAn7tEs8zpKBzJNutKOPNDg+B6DqJ
QmhERHgE8E1DFbu9gJG9WTQ7fZsBYdU/O4x/HqnygpOgYlqIRHiiOYlveiP3nPcPtDt7la98co/Z
1Ie2rbTqv42FNGhxBJV4YFS7nt3bTKh2ck0QUIVO3Ofs27nHcCj2xLc/xtHWhmYKkrdyXZEocwHN
4atkFQ3sTzhCWIw4x7OMt5i1BSjqf5VtnDevC8vUN8ylKCZQQnjHGXnTPsaar1X/QaizMTQFRIos
oHy4fss0gW5lrXbvHOHG23fBxm1ymD9jMbfYk3oQB92YOR0t07EWw1ahsZOhRguzIaa88IQFDuaa
J9uAXOYDmqotBkqRtmrdVKM90xBNkUkuKB2ETxY6AfTVz9mWmccz6SXBI+BUpqTp8aB+QvWEO29I
n1d4uDt1ujfrmv5aj6ufrPvM9kCuKhit3RxedvZr8jIuLEbcr0GgcSW2sjtn+E1NGihVVkRI44M5
M8ZlV1k4F/kPv7QxrzOCLGoLMhPZNWcOt225vqTGiaJ0yqBiNCAbR8yALmBoOPJgvKJqX+N4CgEq
bgAj458kPy02WS+QtIoU2RAswJBbqM8/PMOzU/m08l4c5nsiW0IDrRO9JgHQQ3FR+uITG3dz8wiS
l/JlARXqNfqsq7uWwY6jmeSFEQXpI0yQPIWobA28kGy7YeRdCkcb9YcCdcUg39xpEoq34GVdDl1R
+YIxl8Py21BIk5gta5HaRaS6w1QwALEWcf0v3SHQgmSfQ+HLZpyuZ/4z5bu5m6Q5Cpz+vx+RMAz8
zO5305gR8pSv6RYRURZSvT/0/C+AvrJKCj72pDGrEi1EEgEOsnKgOxzina4WUYNphPCimC+a21ra
gwJYggkJ13umQWoc8DdE48MGXlzqoR+iVzWSTvonDstfYSyX0Bv2dhlQLlqWgmRK/yKriC8JwgRZ
Nl/74yVK3dSRaaly15IciGgQRlpN/lKF/OFNvb6TM0fF2VsXwuzH1QVyoz08fvS/1hFQI8cnsQTk
8qiW0go0lc1LIsm+lWbSMhhbJLv3j2lhKduIHoxOMmOq7nfzt0oqEIE0vPJmxRevyL0ccssFU2MD
+Si+XhnRt/R5Lxoe+JuYVQdyUyc4PIN5ENkEXqQOS7+XQ6eO8XBnzgXR9Z3N+TtEn4AG8I/6JK0j
wGan/QKaagksyg96fIwfsM5qUrf/+dV3VvrNDQxtgvuQbrRYp2fIH3jsHI8mUarJgvqFCNW/Y4Pc
ETC1XEvZWHvQE/eNm8Yz35Acm8IR0AgsYpbw5n/d44ppywTpKJOhhQmRBp9Gqpxqw+C2HUKdad4+
0NAWmelquScLVN/wscGyL+ck6/pveYa37n6mHitQ3yTp1b/IdqSB0vdyGZ6VaQCJKMSnD/mumBw/
Ou0KmhOVP/nn3oyEAHvqHAooQGzJP/0rWIRcmT5iOhakNqwATXVVmi1Z0LwMKwlEEXBhGxEFfy5U
/bTIgsVmQX8y6/RcUBKemhGcKVY9hCkhTOz7cNwJyG9NfgFbHbyptd42WbMkxiT1HvBAQlrMSRuM
xElLnR7fPnPU8DKkoFI3N7cjFEZg6hqpgTW9CXYjbvB8flNzKDH6EzDhWlaIIky8XWtt+CXsBlAt
5u7BGITomCtXncxuLRCbAdQts44PdyZ67db2fSViR4vN9zi68Q9WJ1Vzqlw9sHu7FIVjCgMKYAVQ
EsQMX4C3bFc8t00Hdc1apRofqdyaM52l5v3QMnIENPCno1UOvmAeFawDffqd/k2XTzJwzXCjuedL
nya5PE4v9UffHhJNe7qi/RRMBd5Hke+OUpZIX+hjzE/w8wrWHvXTYL7Pl2Mqz5/eMcxYZyV49NDO
jT0KwXxG0+NCbxPDYliP82wVbN+lfEDF859nz5/0ps5WTk0qFwVj655SPX0zxF1Ga4yG3tITTrT8
HFjd50H+DLvwnpOkvqx0klUlKgJMXJveY3HX8Q3lnW08yz6NmOw2yhmFmiqg/0cxCrQ6W/wbf5Zj
vUJj6+elzfLw98MyIb5PuYipwVEhh3Dn8WwXjD64pFfjqnm1ZJ1FD544GjYtVhFHDR1RL/kvP7jf
nxp7ps+u6grT+hAq5hZg8bMTOKah5dXcF4u9e3ng2Z1Gg9rs+B4EwufRScsGVF+I37iMeS/lLDaw
t7mJCE/SzFYwbCEI+v8ukzPxJxoIJXGOFAphz/VQtep7bnso9hy70g4/5tnE83QI7Mg7e3v9R71Z
c6hCj41BJ+JfZ9legMMS3+kvWcRUOxc3b57BKx+TEr+TdEHSrk5womhHqklXmXkXjZGSbpGkCcHB
HfC4cPkzbEUuXbAVpEftFBQSPjeG2j4DpsEWg7C/83knCBcnjfPvOsEL+BYkDu/C+DRboY3WQe/i
VUhQ4wmxclNJpbGeAJ8zReFhZqzB0lR/uEBl5lSNfzcd2VeuiBe8nxctZ0CR0rctKab7MYNIJzo/
FUrQtn5x4YMY8g9EZ43M2TCGuNCIrZo9XHcA2GJXTBKeXzHdJcTuADozix4iz4p+kydquNJoHxFR
Y6WUZjM/2Ja9iDqgPSv7dE5CZnehcVz0kUodCC8P/+810pWC9pVPi5ckFSgtrBPqpoBT03HIhv11
L3rfyPv/oC4Z5Lou0muJJx5Foq8JZaQVpkHC33fhaXrAfdDEsIzoz8SEsZsx+wslLyIx3LfNTbaA
B0f3Mgp0veNUDtf0wVwoSymj7o4GZOHgSQWteYZ3/ct6owraeDzRjH7YPptqO4v2wN4Wsfxw/ngk
9zwPu2ahACjaj3Ry1ogjCZs+/ZDIC7JZq6u+DjcpM9XPNajyh5GtD7h3LeglEJZElpu7OXP2tlLl
Hg2fSFlS6m+kxqxbiAJ13Y2BPE10IrurdCHM9pKG8iERAOn5rvoSfHCAsOiONypRO0woeK5AMsi5
MYeM+eWjAI5csqw0miuIN5NasgfBOv5q8FlHdYFldEnXfg84Wo2x4o7GGs1b+5C6H97MDtoBxEt5
qnPOICb6AJCrYOFjdOdiIMZwZPktXu2GJeXWlmV8iN8wcrJyPPuLdASsVxHWN9vPLT+BKt61gq4J
9/2Lk2mPKDsEgO1ZNi47dgLRUqI3DEbbwIaZCojoaftLy5j5flWx7uF0hf1aGNDD03eW07aAErLA
OoFYQttCf5gJPatXnjZnJbvbzugrtGL7t6w6ipCqj+Sd7UagtzAC/lDKUw1Za8BEO5VkerBDvcov
mZXmRBFB8jMH94FPZVUJAapRG2d9W4uS3Bh8OhPG3aR/4JNJSEJhrPMv5VlENl5GjhMZ9rBRTFlM
g6ZOXOJoZBfIsqB6AlW4Caap03dUpU4EwLvtpvb1dwl+5DNT4bXke1DAAKWBViYGonk/TotRgIMT
ZuZDCOZULL/Um4q4R8wDt9CfErFhFoOrIdBqzMl1ouLsHFMcQlxs6c/DcIUTvmmtzzYNOG6iLKp1
ExU1uYh70Hk+G0jjOTSmu0ouv7/Z3FpDt3L4yc4+D1k1dM2Uey2XUyEaSzdcgzdsp0JRqJ4sVG1a
yU4q2whReUFWjPk0uAEbk1B5W9nOUAWlEq45VOPNFO+g5DjgfpTGKoReP7Ng6lA6d+9nUF1C5Kbw
pNtNBX+UWDs3mCNNrdBKVG2QdVKrX5sNhoDXb8mKm3TEPa6eU03mBwjNwPihB0Itz36jhJPzMXtr
C664hP+h1Znj8QyJjd1gHfnETMd3eCchpDK4o+zysW28gB1/uRDi12nKy/cY5sAoGdio5Z2pCB4m
BPDrHyFW9fReckcy7L0Tg0ZNtv26AXKa4HcwXSwLLhOGo1TsrxLDcSs4tAmSc0bmhl4ug0S47XJk
IHgj+c1M9HNareAN8PWCvjS9pQRrLSgwItaVH19b5foiQX1rckMgqEZTO5EWHS5QctcWhjEJUSha
vfVNC1bJtJT+zdmElDM3/pIy7js51GqNiIblVbf/nhGVJilQgjG7J5tx7+japPO7pOf6nUG5qcHf
a/J0Zj5Cf/tZHDDg6xo0xaNKGcGW6oKAhop/2WX+5d6TYZUiX39emJzvVda2Cxka4nzjIi/B+035
acJdnju4UjQIwP+hjweppaIx9cw10n6Ag+YxiuWGzUjlYhtgmWL1bLiTSanvMMOo98u3lfZL8l3Q
zPqNcf0QWQWh6OnABN1YggWjrM3fOBNaqgbFZ3RKEMm8T+Z/Nzq0v/WJUDQYT8A0ger1HE3KDvGE
lIjxpJTaIbeDJwLf6i2/7i2UqDrGYDPg+OXzLPcNcB2lT7KnHNRGwcyeojfOxfAnSqLsSIxDvYKy
UEuvgEh2vYC48XL1A3okW7B0Fkux+1EDdOBXguERq3thAn5KgtoCQNmf5PKVOd+PnXvZFxRAvHCO
eF7/Tbb1ruO0hOstpohGdqj2lIthQWACRlHJDQRVSono89CInGIlCbidELyl+aQRPKmVGS431Dn6
0iRqSSdg9jMlJeotqKOBsj0DrCv9+zmRTljvKwOIMB+n9e1Eo2J5qhu3xMcXTPaySn+3bvnyNH9T
q0I3Z0HvQ0QdPxXwxm3X2fLSxqOQu2BhvuNzn9bV4lHaUqrRBiID1OekFmBwqTLadDVMYXi8R3/w
6BtIwUtcvJj15u373HPOaNfHZ6gVkOQVuSZoBMWjfINo281MjFcLhXqe3XVeFosOqxzwv/fyVslW
+fpn8cOmiMljCRy5jbfrL0FBP+Ng9HysYrqfkXpEkCuHc2z89F4FcBihH6DIR31PUux7NWslSAuZ
IzXZTpAp/txgUk3thAXIlcHTojtU9vxAAT60K/XFr51+d2TnZ5hNRvqIdHIH2uet+Aswtd7CwGb2
KOS2ugw4tiRFpwV5dI0uTKrT5a/r2msuqIO9Y2C0HChdnONIchBIgWnFelxw5Wgwy2RC4Zeqb/4z
kiw/+lRxEKph8vLevTRs0Vv34+Lnn9v6Et/eSZU6gUm2oA9ukplJ36ABcjEu7locZ58lYREyCZuP
ZTZF4uctMClQhIrBFrDHrUgzOPRf6XDlNBunZQQF6Lb3sptvt4JeqR8axOxzyW+t2t5JXB0IvMI7
fAbtznu1vFssEyPkdu64yf8rMkI5AR99Mqy36CL/r/4OQIRxFNKm9xL5Z9lJxpOqBHP2YRvgM+OA
DGNOuO3PLvHtYTbNVYKKFSUxi1T9NCI9wVZZT0WSnvv+STU/44KzfcfkaFUDVd1mLn8HK6+uD9in
liJT/t9PpNBHsINUnJiCZpeTU2EV4PBrrnmsgDy9A8W9i1PokruUQvaCsIp/jd9jo2+2Z8GXrPjn
85XxHRbbQwtojPtHr86hsT1MwemWQimX/dqEt/f8LFX4Dv2YdFUCLn3sw35L0SZJrS/NxGSdScjR
uTLt1HTSzaJyaTUfTmsh31xTrbzRxnuHFIKXD7DXoST2sCsRhcFcRK/YWXXfbnCh9x81YsgoYuPi
nFJv3oEeKuBuX4wUu3e4xfpNJxhIsWYXvwbz2orJRTxcz8oMSI5hP6FPxwejMKXTyj6esgibD1Ci
FtdiZ9zvlPMUH8tUqdUFB/sv/RK5LGGT1n7I1c/j3lkVFLUlrX8NAbxDqOC/CEoIecyf8dBJ/Hsw
Yd+wtMGMXHsZoaavFg0B7u4iRQE+B0djmTFoe80ZIc4yQx14UAHd3rbkyGiSSuEn2mpP9RF6kv1s
rTeDrB8KEotlORB7M6t2scuLhrMulSVDmW8aT7OsC5hW2pzjNNNvIBQ+nlhUWuT8vI8pWGGtOoOu
aV+zlbJBgY/sa50zjbNYWG6p+/kqSzXsqo2RcYhMVzqykO21wBiZ1m26pGCTKTNYuO0HrOmWl29U
ojA2LiH9ehyo4esFVApkBYBAAejLfqw5NNpvPZwiQmaUy9LXdK1RRqWv/a41diXxXUEF4ezVqVEl
UPBTRdYDxpFDS3ZHJVwp23NEVWkka05+I+AqiOeB8OisNwz6+JNq1FgDMv0h0JkoNk/wj77yACb7
j4GPew3oex16Y8hgiclY5Ge79umN7MeJjcxjWdjqxMOhsodSsSDimPXOMGEZLqH6sgS+BKJLF/jm
y74gKEcRV6sPw/C/dGZWdNWxLA+C5kSO631lzsRkk7yfKXgwhZXLWfzh0eraG9KquaHlP3QQ9JLz
8kgJ0gARS2ufLTZeFi5hZZJym0YIyCKOWhrSn/Yg7ZioxWZguBwHmS1WpPqpE1bJ9+BTtkRs85qw
MOQS6vgPJcyCoECLHfSettdViM7D9kkEkwvcK7mDzUIRKRpUY48ZW7js/zqrp9cdG9ta4SIIEqsK
bINPMUce78OMQDKhJiujiNwImqI3hSQMTfUmzkJGfZ/7KqtjpPhOyeCrkgpxfQvcCYhjDL3PLWmr
UXUFMfblP/YZQHRBcunquJ9rDw28Wh152Hx9ozP+syEjDMFTZi+xHjDFsAU9JzgDgoUpOJgGuylc
zbplNNx2mypAeZAbc6F1YgKVsDAeuBbCLjNb3v2mJz4+n5PhxsjR90fv/8+6vhI79I16alBDSks/
6DzSQUJm1xuEp/7S5Agiz5IvsLxs0Gc13yAfAL3ffGuv5daV2yIhRTGM3Udmiqd2qdvXTBxOd7tv
fRYXieyi48MOwzB9vHfeuPNNM9+LYzFU6smqGVMxOA74agh3IezZpqi/kq2jEXIqqlyQgDMknZjs
ZBtedqManx4GEEZtgb8LSYlMZ/UbaGwVWB+lKPLALP3T50ITvX18u092uiL3GLnpti0mv+lFMvrP
A4VKOH4H06pvp72xo3ADLVF+DywxmebOXaOy6okjO3IdtT0D2Y7eufxOQuSY1NeB+mYEuywiLjO6
wfjDUElB3ZGCe/rQQuxNyPYUhyhqCek5gqblQ63HIYkclqqgKU8sced1ySYzfONtGn0uFyiw8IlG
0L/gfh/Xx0m9GSUcnpCQ0cy9eNCgWmqu8Exbrh4bK1WP6+VJV1+sGNla8KqWVP+xGBVaYCnybkDm
nU19Gbe9TMeLFJupzucCBQFUl43/He39+Z0UuturZPo/pF3aiiryaaZPIycWns7JDgVb7YeX4U+L
GOI+1Zr7ZdmxBvjD5xaPbnoi6TiWtjMXBApSGXzSREEbHlRjqBBJkvwezZmZwicAL4i5mEnk1+63
6wcaCJuU3muMm16UQ8p2R6bilMgvqqM1+jZBpdFRhN++LlLkbQ8RmJBJJM+e843e1HaNPqNRyUvt
m8NAQIAmTdcUxe84OUO3h6ovvnJgD9rPDfed/5x4X3C6u0RnlrblFwqtzPGML0X6S+E1dY6Tm/H1
ef6Pd+m9FrckZ8aTgs2lWS0q9xpzwg1JW5lXNpuo9WgdyQaoHgjw/qfJV+oEAW7whTCHwApcsDmw
eGXpRmPSlk2EF92H+l00Tl5c7tA+pKhgAydZ3+jWa3YoFNcE/+FB8Hy90h9xu4O6AYJ4/hMbHTAd
Qr0IlCy6B6RrXzM6wJV7KJkhlEMcIV8C8FVLWyrlOCzpT2KL2HoATbKQQFWABgHWIcKnpniv3dFg
s5N+Iphid5v4Kr2VFkq1bBo2SOnXW6GgcLBqR4KIGUxprOJH+SwARYJGYVs2P6xFuCeKvJmpAfp8
bQazmYtY81wGye2oKYf9xIr2mnvDA7GtDbh2rlYK+Pcsyv99wSiB07GrbU5qBcWA4PTnBzBqA5ZE
YQr0m4zGyOH45MKFKh9TZr2kym0JKx8eTKUPKoyzkXE3MB0subt6Aso7quhJ9UOa0fly8bueCnxc
J2xrIRDypV91uBy33GKUVy6rdTJtnshCbIGyOeDdW3a3KRwywLrxmn96JVq4XAcrrcUKBwr1W7my
b5WJQEfKfCQyJKEOORgUxyq0ki4jCnoeUMkxo132IvxEqnr7SFLxcRG7/ILwpF1sSwSPOpXHevsW
+I6R8mWcBYCeMwgSMZMEhLWxD6SpmgyEU64zdVMAAzz9/T/+g8uFY2EOztXSx9HZvjDYcefsI0FE
koyYvYDXLdxwPDj9GLjA8cZytTby9dYJ+9f+oNoDL7dxANJdSyDweCLpm2pFyZSrRgp1Xtq4H16v
R3J7d1JbUgI3MdEkt9I65oLtzH2LSWYI8uABRzMp5T9EOxxAQ1N+Brgo4dN++oO4quzzxa713Dnu
Sv9vR92Lyz5pzoLf0RWmwHkxF0OLD+qo0pjrPe1jwTKOhcTTAPTd4B+rjMa+y67cKzqhRTmqmrPB
BpPj9EqVEom2aKQadDBnabqQqt/+XDB3gfbA2kO/5ld5HsUtmAL5E1y/cKkz5v3fTmeyopiqrzBq
qSEJXJBGLmjnETSP3yc4Vyjzl0NhIzHbzZBoz8SOrmnthVx1Ejx+kOFPdL3MF/biR0qFKTbzUMZf
OQJbf7CekwvJjcVOfHuv/2st8yssoI7mCGe1k0hf/lTIiERLhm4wGlYAc6SPMwqEoAd7mc4GDJZF
BvGOE/YZ1EA4R+PC9WZUOARTvK2mLfCAVxMnY1dO3E5nN+ARm1sr4NFgNFdU4hcqQcgsLdv31xTH
gIOhjjnY3kDes/ByB9njxwRfQkM7kB7u1HVETTf9b6M/me/WeIPdrTwwEhWGuRYxcjvFu4J5cd7K
0dD6eENJfHmJCHa7LSnikXFHMuQYfdf+BE9VtxtfC+GO6HIwwosf5Tmrc/ybBNOUqc2hXL20qI4V
8WQ53wBt+cPixlHzY0y7wW2s2/G+kHPBW6/OfQ63lbMd3bFh5+MahyH44cWbJY3Mtcl8c1j98Lzy
3+divmVwNJqnCovDXOhr9J7jdJ52fsdSFz+lGjEhYSK4X+9rV7dJeZQFRdb8pUuNRxAW7KjR8T+w
CV3Zfu+SYmnRk6vn7cwtDIi10p1soJgnA2aBngcVqsKLjR9iZgfwOFWcDlityyBoAzrTaKQUFiUg
gpV/WObxQi1AU7BY1WYK2JfaBZc7/Fk3eZYLJADoPdMT/dG+JJa8lseL9aGmpFNrF57F+3D5/XmU
2KThyGIGCNmumEm/gfj86DLIYpCqosL8jL3CkGmJQi3dyF0X17u+XHFvsEFIJqmDdqdC14aRRR3N
7d7vwuL/msKELl/nwLoytM7NlO1IMb6YzyeATyXmqRdnVaFQ9FTsY8mmCN3qRbrItNaJyRaRT4ml
rmyroeFoQduacNrCnrlUZfaDEkVaYR5gabQewNmDo839bFuXMzjdZv1o92lHPFQNi4hu9NgOGQE+
E3eGmpNmIYcZUvJwT623Qza65k0IDEfalB5Gjlzk+DJfWPAPHp1/bNe/3CqP1TdvqV4aeGq+6nRm
RLPqRpT4yjMitNwUOR50aFO37cTdNDwXwUvUKdXPRjZ6GCpF6XdmXPwnPvkDWWRf0+NEhdf+/54I
2dKA8+BOwQzgKRykHEfo9Ym0mw/I0noK1calAdH/ntxE0SjMVF3daemmbJGmdXQpfhgl3RfB0Ot0
3UUOzq7he+p9wOl3NeLgrHaKQ1hbhufxPFTX9Sdau6UZu9jUeCslxrp9dHSWwX3tae24Jg1DuVcC
NjzLJD+E8n6agA+BvPJrMP5lh4vl4qCOMRBTxpFkIvF+3qJBSuOLB/rLn0FE9EckHVbbpa4KVJy5
nD3Wau3vPyyo9BDhr6R6ixFl+bQolblzfraca3jjYa4Yes+CYk8Qeu7E5H4iuGmomSy3NXf5JuAk
xsMtYn3lUaQsui5up6jrObnCzg/6dUk4L+LYEw5ZUd3gsbEs/dtbO6vTwfJ70OO+Rv5JY40dC+4i
ycmDH4GBbXGwVYtyolOuftm2802P7MSoCDSyHhb9Aw+Xqa6WR2qrtB81nT7mqliQytAuBczddDYR
3eTSDoLcFrTUjSP/qlSCnqxQPHTAPxNm6M2Wa/exL3CoSsvLpsuRFNYpLb2IstqLSfesgsfvpluI
5pdEcOudWTeSHZMc1CYBVMScm5KTtcg3TdYyCxFtVeEAKb8U8IOfsqXTuYW7lpLat9iO4Tn+ovV9
/zHN/FbhG3vlywFtSMseP5iFOmd3THzoVB0JvALhFOkbWIpXe+mWGPP8upu3mdF58qgKr8GQiliZ
5pZp/B+dbs3SmZ8iPHWAzNODGCUkeUf3wmPRiiFk5TcXQZ1D3PXL9HRsXJ3MC6Ehz6bdCaCSav8A
+QdLnsWYtSAi55cJBd3AfpPS9sqQ9U9PYFyOHFma6gKKNSpI9G5ooX/sLuXF68FlT0dqas+G3ygc
4jRD/Z/xwK0iJazPVb5fiU/jp89yj3QrYV/ni6oJA1NMcA8eeAYR/4O51IQBJWVM68tq3a18S0/J
Hf7Q1FsdqVp5fTx9gFMvYkqFpOi1uHivSXt72lLu3w0oYm++/WoOkJF6JtJsqpv6AtaqdV0qTyUg
kflvCYeua1VbDYbA59i32Ba4F38iiwIbf0aVciG1owSWx50pq21PkoeiRJpykicPlwxj8PEPM3hf
kqjwJafNLUqpNSawCLCcgxUZNBQgGTTxKSi+TwkROkm5uhrqmRdYtDgVSHvWRKQ4ULmv0VkJoP//
22qftYPml6Bk16csa9D4ltdcugGD1huvNcJdUH4WBjp0zrXAcBvMDTjshZFAWhaTzdbipkm8Njom
EzcJZDHFRrqoHyGBUTiEseErqOtnYYwRoSrrX9+M5CY5RF2VL5kuOsVZnsyPeA9+tEjSF4lTJ3Be
N53voIwBg8dT7goKs+gZFqXBc7D04tX8wDuse+d/caAUnVmFP2qU+//+r8zWj0VMHo2JLyU0uK+9
cJ39FMrshWbODTNbtJ8ZzQse/+01ibpBgTQLnX5nbsHGnQbglTpevvSZY5IGpcDTz5k9G1witEzX
dF0FQ0wJafmcwx/fU3dEEdiVFpgTXx6mB/0N4dX/8xO/4eMYd5Mp2/q2vkIg+mNSLcNS0YzuU4zf
Uf4G2YS0s0mic014XDsY0NdtIKe8/jfrC+3bZvIOPYwFbmjTs5zPcZr8h1YVbGEbijAMGStw/BKj
jhtuiE0SbInJWW3fJNJ26u5mZPo4W2UT2qRPuTNRE6TSLP1ihYNQAx4Z+a3xtyb/aOBBcIsJPtTv
I1a0OheZDh9uoG8gHPbbfpdCBiheDcqRto/xilWeHYO53fowwWeAb/qn8uj/vE8NIOAsuK4y1U2x
FaqHytaTIEjC5UqAAHSxap0irV8EP2bTkhmMRUFzEQCxWkY0fBfCzgSsZTseVtXNszlqt4t5FvYl
Z+1BegQ8py1mR2FYMqx0dr37GM/RqMuMS8APv6eX85dEfZNYddM0HrLTj29Wg/qup8VZ1BmzF73k
ydO+5GDBUBsq6Qd4TP1cU08UU/yDa75u4He+8aAIijkj3tuklMV6AtrGkYJkaY/TrUc4zQ4+jbC+
+KPxVsBoPZGOGFq9ZJ1QWNlLCQ9f2lgex5v0nN6dkHtfoYSEX4jIYkvm3mWABKl/k4AXjtgxr8Cl
zWb2EFjSbk5EY/tqvNhdy3B11l3YuS71JnBWUM1ONGZ3ZYeqKRkXN062rKfidnLJc04A7mNvny4I
aTa5M++dcvztIy0X+ojg43PkbpaXScVnkbLJRtxKEGvcftW5OyANT40G+WI7aNTHXxKu6hB+vr+e
3mYJCGJHxRQqjbF5HR9acg1hhxJULdI4Jo7+RwRZc33RB6qNzDsC9C2nwfbbh2hzMUjKaRMbUZzo
F0Fvt+8eE/Kj8k6rEbou8QhxdrJXdKCbnaPu7oeBmNO0cp8/B1PcsgzrT7Sopz3jry6PKLl0Epp7
e2V1FMfJgP/zvc4GxL1wLzyKUR9eplBSa1iknytV+mmbMubH1b6CjILxiz1GISfQjrU7MSGLxP35
mYfSap8QsodKbGbD9sRp2FtqkVODGMsnv9fjHQT+l5TPFLo58ZFW8EOr5oqx8jdcP0CUYxwfTHHv
WNOarOAReFnBwG1ZsNXBjMDxhj60BERYD2dsvYcAWmWxPnBfzSGYjxHH6uUywy+hgIsatw4crxkX
BWQJRpniFeB5GD+VaLhI/tiIb9BlZexZzOdb8y1xHSdZRuhqXcbnBBHrafPuWH5kfgOYPd37i9W8
Hq5zRmQkAse8C2YHd9tAAKngUIehIgL/p0Zy23GSLmnfumMzY/ZhbhZDEPKBEFDU6IcorUnE56Cc
RTEHNpyLZ+zP7mRlQ6w7ZKlEZJuNhT+ipmtaf6IM1KNT4RErsOU6oyyptHdV3RRmCJyhTxRL36i8
ulVDvrfCfv5npeXq840pvpIxZWnzYh5pcQ0JuoZWMOnYrswPf8WqEamZK2G/LH0T7dOZuhxxc1m5
FpMcN17EpH0Y42+TgR83ty08gx/Xa7Nxfn0IP8m2JGwg5RvLtu2/i4tzj4W9SVc5xHsOev8QD7x/
GfAIVK/DzyvSONzKj+S8Epr2CkYvFxSRaFV9H6BLIqu7ewx70polnkooSwm54WC+k0DBmx2xqbDG
FuyxEwp1xYpfWdClGNTrgSXsPV1bywPwlQIWKZK3JGyWfyHREA2M7Jna9dAXLzyUGvAe1tWcEKms
w0yX8/lBi7VpZmjNh/GzRCi/Utb7kEZ9EbpwoIrqrD6zW7l8XyjNHxgrCb3NFN+ySbKiToyHr3LA
z8T6F2nQ9l/Edd3t8mxWwWMpdeOXHu52oqBjh+lo30w9TWZFsX9zy6sGuznVzM64d0op+RxJwuhR
331ygT7pyr2CDLJUQtmQR7A5tuWLjKmADvnwm0un6JXXzgSoj33rYE7ujarzEm3aHRB2dPcQ6WD4
42lNK9fxPOEqY1+NbOAtc8lBn058/easLmOVqFmvQjfqUbQkwEUzQzA0IT3IVrts/JVv42BzM4hd
1WeNSRwRMNHycCJEdA+J5BCywcyYAQ4xuSv0j2OzBjsaVOofhCz12fMINvJqd94WgJz+Qv72ttd5
ur6dCwrJAaU97CIAnDxrjqaITXRAyrTqcQQZpJIkVPU5qjdk78azS5M8HTY1/3i/Ir1CinGc3+d+
rVgj/lXGCCFUhBC0KH2IMixZngdLCYnx4fZjJuHmrA5obHzTWqU0ThTQyyKbBvKxD3x7OpTenfmK
VBPxr0UB3rZVhDpDJ62kjp6F9iJSj+DKLuWx/NENu51PXtv2TnLgiVFBSt26xYc/0Dy39/Jx4ujh
wjCAob+SIOEClClhHHKLUzaI2LL75j3O6Zz6yUSr3h7w8Nu2mXuPa8NFemS380GoBlLK+GIe+Mun
y8FYxACB9tcohYEvUT+ymnTL2irWtQR9DLR3r/MUqguaNjgt4AMO4KULuSVSwLfVJfqe1vohzYhG
/QwrU3rkyxzH+9GXYCKn1pC+MxK0VL9pOIekbGjN8Z84aIj/6XXbVzVbZoQSbCUYL4o1Qj3CkT9m
UJH3NaDjnG4MDuLLvv/Dsd0bK33pwJDvdSUpD9/FMmHZrADEJeIhcLCC+Grub97EyTwV7KbYxegG
77XlLh6gnGff9ijc3QJBXvL/iUETpi4jc24gm+uvIwFO0T009DIiTcD2vV+OimIXLAJJNmhUzMov
m6uN9CBKN/TplaJMhZojnV+tFu7MxlSzvO/o2YDDH9NubBdXf67CDF1IbZPc8m64i7JTwwTzwyLH
RZpSVSj5eC1RHfMHbfjYESi8RLI0QoyihBaCJOtr+ZZT5LIzOrgg5DE/XZLR+cGSybu/a91PGQtx
y073F+A6y6VNH6mPO6DeDvRPZK5XruCtywpO9WeNnRjWcXUoupZcHh0yeQekU069cqeWlhCzi3fK
Ge7pZ48tGaw2ibGAMKzor3klHLOrakJjp/uB/2wBEh7EMUPOZ5hk7xXRGX8x4xGq0AMW0UorfgBG
VQuUaJSomhT9CWzsOYi4Db6I58XiGB9LJoXKCKn71huMihRXw3+zTeP8GEV/NIFd7VET+hqZxClD
YkVEz91zMpeDDcBVKWBlEJk3qmlWsXERYGeAxlZVtfOcHELsOUuTT+pFh0+0poCgNYPJfOvTK1md
Dt+FmCmbSBVkmGNi4weG39oalJ7/iHSTNfEx21c6i75YA6zv2ytwF4YhyKxHlwufT20Yc6QsUFp9
zxktKnAdXyG2wk8NDlQqhsYkD2C3+BuyoegdvZZDUrSZHkTxlhFvlsKd0PfV6m+ZW1bh2GdFemZz
GuJfgQFndQEICDKXs81NxNcnnRC7K+0wNjLgPtY87NNLnCoR8UVbr5Sz4EHPhwUTlL7ugW5ZgY/G
seweqZDZlUkGYtjf1ThcAIrfXSSCRkG73MQDGdFMrSREjYqEX6WH9dg1YWesQi47nSJE88OdqmEJ
3jaRnKKtl5LgY6otvw2fWL0IdZHtm+T86lQi95NxnI2WV+Onm9s4NAxfZ9oydB0vjY5Nr+Oy2+Sm
SeSIdVM4d4tqRa88XQAQhQclk9HJt363CrdSE1pma8WZ9MKRVHyYDHDzKHXEYH44MnbLBxQlBsOs
MkwCvKCQdZveZG/Avi3sjlnraW3sQX7Arr4/8SSjYxxELv7RwT+A6gpA5tUWjS7RCIVl3ZhumQK1
/14bsV89+VRCdMxLgBV/zJSzCBVV9WNLJaGLJsXcMoB7qt/h66z+ra57ypVB09HGNP2Et/UTb2ZD
7dMyR3bGQumycbi7/elVPZgaR02bA09uGKZbhB4bGrHGIalEhO7hXfFuSNW4/3WKKniolXp+jnnI
4KLJgCltrG98HpgI/gKupwhlOSZqMvvsM/xi2/nYmTp24Zq3m0j8YnhlIlgm9uiv5ZBxvHI0Rjaq
1wpvyncMN2WjWLwWgjLyB1I3AvJsnMfcOwTA05e76ynjF+UBVoFGCjam6Nq5bLa+yA7F8j4KSZq9
g8/1QEiUwjefJIw9B3oYMouOxefI2cI/w21dmoOlL9x4nL2kjsFwz3V4f68n7zWIOHjBEYAJF800
F5RliRm0VMiD5nLkuZq5eL0EhKQ7ovcUO2S45haCNzJomDbPYyGI92CZ2Qxxy6e91I151zvZ3Fmj
vdB+405XrpVYGvoUYYoLqrEMHCDDKOYd6mpsmpSLFU2eR1vW/XQSKXi0FuHcnsbZpNoWfSagz0M1
Yg4HRrERfJftRJ+7lsXRRXMbu3UHgeWORaEuXVwJMZx0dJL2lcsG76drKGoWoMywVlTRH1yuZsqK
J3mh54tssJgnnAk114yUJuOOapiyCDkdRRdenP8/G/0oFBzT2l9YUfqwUbA3r9cbGNTWlH+xTfxd
Kj0D+Ira3vjhVIuVJZujOpeUb5EH6Py04xXq7pjbN4O7q+6DS+iHWYKwlogMnlL3gF3Rbq+IwYLb
KojPySCxUP5KK+/OIIfl9Tbqn1FQMYpdOqw/bxtc0d79DgyU33WqJUyy/GIrZ0B8kKHA3qn4fFiI
6i/3axddfZv10yK0QQEXbVcFEeyBk7VcXkHMUGnCat82EyPp+KfjyPFsPy1yUSDKYu+CK+CDykcg
LPgGwe/p2NxdA96MjIkwAW74zHr/FaI6HzSAxFuXjHZP+rP+4jvxGmHcWEVUhH6SpcMNhtkM/9uE
bZpuf/asHqCtTJ7FbUmoPAQQpDg20Vnf7gYzSNGwPsXK9YL1HY6LMF0JSQqqrl5GXfs9dWo5UlT8
wZmY4Zdo9ZMbscoFsOBBy3ZAZK3H+YH0XCORm5sp06ujbFETZPn2NJl2lEKgstwGWg6JFXDMnB/o
/82jf/qAM+iIlZWH5tCYbcMQcHUkGxYHocK7PdYO1h6f0eMDGtzp+pt/qhpO/qPAsG9rtTY1Yoab
QEWYRZgrGwIvbqU9CEUU0veWD6RGCc/DbVqVg2aCs7RRVGqrlHCEBMwYb9ouqqQK8PkJtkZ1JCzt
RCBOh/RBmAavGdlpSKsgY2clPghdUrAgebvyUt79wDGbzs2oCbWzmsj/ThlhQmOyLmORpSEcHibv
GA7JXz6xW7lXNDmg7df31gck5ydZMlVS0kCHDFLcBuHgKICBBLvZ2MBXLsMb2IZPmjQ4TdK8mzt3
pWBqcNX03Q52S2JuaFyCBnxazGn58SAgjJCVte58sQuqUVRfhI0u1hjXyBUqNs5wcR6qVllq+f72
I0EkvwN7xXf6yeDfzKtKu664SNH9MpkWSFUKfiJo2t0uMiT8B1PLWD4vrebZA867xtWtOzaIKVrn
mBFZCRRR10Rs6FjVYk6x3F1btFNy99n7uo6bx2SVvlStupIvn90FIzA4V1IPBBZ7fgQHH02bzqvg
qhzAiGHnayPEM440RpBq1AeVudnGJcL0eSOgSVl72FG3sDQsEPYjdlKEZVPWW76yUIJvHTa2nd3Y
RQ8gi9wW8Rtvn6Qw/I25Snt/L9HjxVrJnQtpsyutIglBRB9JiXNUT+E+759ZFco6XZVj0xoAJULE
/vvJL0zplwY4N6rD/vDkk0aYCTOkwO3bDE9XwAetOAc1hS8BiT6Wlhs5UF/t2uNjtBUHajOreqpY
cOZxSmzc1hjmlAKae06+ShZTNjD44ul3CAO72sJZtAxqI0S9tLNYq7qEkGOxJsNhrKUycjQ744Go
iyO9h8TRIf8e0q+p3Bs7gXIcz7svG14Y/caLflHeq4W8YGPjoblagDcs+6FxmS1lRz0fgdo6MlY8
6cgoJGSJzwhNopyUdepQ0V2n4uDCtPGrJ12BDQLv/VEGKEF6iNFyXvhysichXfiFT0mhBsfAngQk
dlskXSPkX2MjqrkcAvsoJAd2AOOv8PuCmrl+ISt9/IFe+2z490Hib9nPhsfBypHxfMnfhQY8lfVT
8nq4NnKaaVmfBHJgedAqUYUG1btxViRe05Cr2AGpZjr0SAOuRO6Gv5GGmWWRpydSdZw1J/G+JVPB
OeqIHuASwYTBVKjB4qq0NgTfwyg5dg0nCIZSZJZLSMvpic/PDK33nuPn8s0EFbwToLkgPKqsGR8v
/iljZLBrOdSf83AHenb/Pqbh47O6QNKB+q0f9ZDkvk2GQ/5zESjLxvl7PtG0wAhj93FZlZKiXPoQ
iXQ8VsGScvf2Az9o1Ba/Q9LYPcFIFmEChH/kNHWOE7FHcQf3yEC28g3tdEiibuJp/rt76knOa1+N
BntRZVoehGUvUoUZAB4tpNB/YUT0GB4TuDrNeKBmyRpIR7Mlj2mvttKveOXNYtWNA/oGS+RDm/77
CVC0t5lDPwYB8FCHwoJlIhlsS1FXJ4TbESTvDBicBbnpOpIAD/IrY73sOOZfuyF+sQMrvET0mzOm
KQW0PbdZvBktRiPUK5Zxe7Wkpri0BIUYfxmkAItaEQr3FiUc7IV4DMd1I5eRhgUhPbXLRIvzowr8
zYP6yWBkj7tVql7sJv01XHkhSTs2NCoSQFvKKerz3HwuQYhwMz6PiLKR+Y3bwnIFDixD1oU+WiO6
JjF0bb2HE24Y5BvY6ihOlfHpYIMETjMMiqe63LBu52azO1lsivyM0qGhwAnUg5kbCE0k4dMi5RsF
PaePIS+0lkgseqpqEk25UQgXAw8Bqmd6LWGBgcnfzz1tXray7/DxSFvmSjW5+onjZQMrBeuLHzH5
OhaDz7PRfWnhrY0K62d7a4FjT5md0Vi43j2NAUiyP0ygGK+nYX6yzJMdrRAswl+2x748Uv2qHDQ9
RazExn5Nt+o7YHNMhgxOBsKL1RQNU1Ff44GzpU/hp6M5aXNgGy5AvginR7aqWX+h9yWE1Ikk/RHG
WEOL8YS54n+jx5eApYV2CJFGryo0wr9zC3Uz588+E8/PSZzWaSUJz9lWqCGQHq8F58hAD+ISrwsX
KlN4bEmrDLFcT9zZj+QLSa8Mj95tX3AbSL1MdeYJT7v3+0T/alhM26UZFsuYnGThfLRMwV2i2M/P
uM5nhlX8K+xwr64N3g5Z4Tvo8ekMYVGAsO91SmGtbnVI+ttqfTL/jT62xNZX8nQ+ctGsfc0nUVP1
+SFIIBpmc0lOYkYFLPNTU5ZySC/6/enntpTSJmvT/UxuaK50RWvclUanWZHqe6s1gmRA8lHcR5Pq
M420fsKJWt3den13ighN15wU7ICHwkvdcXIIOSAsCGH7AlW0LdpVh1JnIlLRNAEHQkfsDOSCbCyh
kdFiVlfGcmzJGdZEhv3eLTUR58IU1slBry6dvtL404pEhJo1nF1MWQ+cFVEoXnKr7t1Kvx9M79uO
tvfWCtQIK9wIU7Wvi93T81dwWqBauhTA0SaTc4dHa52Gwy6VZN1/BAeG9IT9WuTdJ3gbGHrJQxqA
OVn0x8m07E82XS+Kk/yj5xSqdDWm3n3uZhVqmYTrXYi57iaeqeBGjZ2+v7gzWkxgYOfP0+4D8mMh
mEA63Fm349XjHW+jfg6E1Q+3A2ctROpWczHG4JiJaVxP3f9wEFDtKCJ9OAD6DVB8iTnEdW1k92r0
ORmI12miKDwtb9dYKx2QQnQi2fEJ4VdMaPBZqYRp+BGON3zPpECkO4vFIqZ8TPE4TF/EpxS5QeFW
JUcLDA7iO2F4MnwEqqBDPG4vbqJlY3i7yTkcOPEQ1S7gg/tTV10eCQSj0lI/SCuKC9wsgi+73mbA
NbDaODq1fikpodVGPu9AGwIbg0j3fdt2rYYYpsjBxL/TwIaIBGBnpPEMmd1JvZFQ/i7KAajAkuPb
f/P2sHQh6/ZXqHXgy2lgoB9TcNftezq5OWEoSRAlBrNn3Ud/1AqC6BNU1cX6y3gi7u8E7FmBOib4
dpN8kVjQ+4DsN7p1C3sk6xBom3Il75mtMIbfI0IdWKeoIcY8nHohrJVDpqI4wsk6amNYHU+0CGKf
AfA9qRePIbXdwcLUZJ1EsJfcX56D1XIbZE6y1mxO04nSxEai3dzTohv06NCD9f23EKrY8umNsxAp
EsaQk/1ut6u5M+9n6tDY/UfmZMu54vDgpsqov8Y0WMOBwSNM6N9DpDbGlDDwNUlDEHb3/JM3LaDy
z/lcOdY5pKyJfxyvMVNEBuGPGwWzUdxJl5f0ztR+uJVE966A+AurLANueCLlZUWmw3AewAQqzs7s
shqXRzILDsiUhIAC8KZv0uXI5hl9ALCk21STReoo4D5pXjTAK3sW+bAprPtiIVEdK1Lihdo3ievm
hWlFcCGoY4m5MJXoql86PtfAXx845WYpLu58E5ZsInqAiP68StOC7S5coZpVib8bXKvGFPh1+2IF
u+AmkmRxqyZ2DanlWPBevZkyR3H9LUz7UIEDzYAs2LLBC06FIAJ5EMnT0cqA+YlsbOACoDUUPn8e
72ddL0ktxrCLRlnnFgQ5v4lbvxwnsjhRQNpZoA+7L3MA0/NdFaGpfJPC9Di6m87SpD/8GV4hrdwZ
MO9bYRcNa/dEIleb0X/iT5zf5GH/M3ZpmOPiaJSsAj7B2y9bKsNDtrx6PSykx1mB4JL1lXm9oJZ5
gQ2TadUHqKoSK+isym70rhUcNH3rJNFxu3Gyljbs5DJFxBR/UxWbljRb6wvIdePX+lEuOgpScZ48
MGUtuH82Ewu7r9mIKAjn7DnbFREzBwm2pRTSFqX4aaPO8yaacssranV7LQa/jBlCpYWoDKLppFtt
IyQ5Qua0Ck+FmFQACaBf2M9ORk3ynI7nNaeJ2lvW9dzlMgWXzX/BlbMYLVQyPqwdTMs549HsGWka
HD05EzhAXoJ7zgEULmMmKxaTBC89nDm5n12ZNmWWqasRlIoKGUkNl5BTxEsfxx0aI9hmTzsblbVJ
8rI8HTNV5UYh/rbnROKwPNh8uPBtvU3G42n1MX7I6bQCd3FAvRwE7iBXI8VgIaQQYjIBe6tPNtOj
/vsMbhtNdP5+5n/9OtC66G0dsQ3poou2NOuC1JY+lE4pNf9l4fUCoP+7VZNeg3QRjHQc5/XPBFxz
jGK0tNIWWK9wqWRQUslV2i5Nr2cqQQcnQcVm7Ibdb61i/h51daDz2n8oPezcuzRzF9Wjo20q95jV
9nHanv3T0qnI7uu5Ewed7n/MsH3aTTWWH3Za2EpbJ0eSkexzUE3JvfHHo5vXx4Ao2Iga3tYhuzcc
2wzrn13Nodw8CHzxR1pE65Qpct2QDjEcMm4isvEX01rIowIEzXJWdk33d+QZQA41zYA2Pjd1q7JX
uHn8RD494C39DOc0LDZ3OY6ZHpDRvJ5H3M2J/2VYwOHBhuUya/UiVw+H87pMdM88T5c/fKzwI17N
vZ5yjACOicmtk9kZYYkwPlE1rtzrBrVV8/cY+5DeQyxMZ/EbWCflDSY0/sMYiBcxLAvqol9c6mS9
0w1/+PFOhTCVpTYIqoIb1cIciISkxDWP5w0OJPwPmz1DgVWtRNdyTWXMTKmqqX3N119B1FtrcO9r
9x3BkUEsdI9rvz+4GJpwYPwYcE1ATdZaduTgZ2rB9bYvSdnPsLMEmuLAZRmTmlXB+u86lNCruhab
nX6tczE0UgDAraoGwdRw8pRbWj8pkbaPfCKWMp0tJz3drSbwpaEyO+bXIl3Yj9GNdg6Yz254nhSe
Ru/bDMkx+ukwjsSRy489m+sAlyaqiG9dqdoe2W1NXSDgUey+PTraN1xypS6tyI6WfVD/Q2EeTunQ
rYu0QWrFL07P+mkHAa9+VuGyylRMnd+sspQo06GSHPaDc6dp+HUPyjvP+OI39qA2m7AQflHLP5gX
18pPHyPmaW57QcCzQEAIMLlZBITgCsLWSpyXN3S5rvwwnc1WUbFwBeRfDDvIR8ZafxgmHCAr2FeT
x/bWScpF9wGDervrEBNSqWbqiKCXy4ffgM/Nuu+yqGpbzlKKEykOF2o46KaUhdd1uqW3qC8k15q2
Ep7gdI+pA3OC8YPXtV5SAZ10qtxJkyC72HineOCf0aTwNFZq/AUwcEVuU3MZYj1yKGKQj3yKuRBi
9LVMJLi2qcLxmIKs8Prz8QK+yFagn1FQygY1CwmN7tZJhw5ALBpQHKyr+ELTIDlk8v6iOh/WDcAZ
vKr2xa7OCWxLEN/MhKlBQsUyMcA1Ioa9OjV2LfFoQRqwSthjLix6fOHYM7Y4T3cfMItU26zG1XDK
dtPHy4VJqipcLMLdER2ZKWSqSV9kxT3DrolAzHMPwSaSylOpkUUIAjKTSFqVr5B2ooWnchCzhs2+
Mlp+LiekIxQ/E78cLvP3lben61qeukQaYPUDk3ePzyLTQPSNPvM//8RmknvMo1HyZt/8IXctFOW3
+553iI1i0hR0Cly/6biOXJiJ8CYl2U7gJvjqI9cH6czTonBffpXp9m9tDyMzH8if9MAE6WDTwbez
W2XXzJdDp1TgGDX1yftElGpasSGJrctRUIyhjhuwuksPthbDBvEKeO4unLWaawPPsgiE1cs61liz
EDvp2s8koeRIOUbCMP+hs3vv3WB84Pr6bWiWSOlhYAK3LuqBlzZHjfpvaf4Xu3bBkCcNaJi1pL9Z
7c0Fk75/t/19JFQsyMtz6qY8/bQK8nwTZDT6xej4pufwWX6z14280FzjLSHhTqJrbqkFVRV02LS3
WZOW1f59I8bk7VaTD7Mibqf/NUjaJdHCYCUzbzr0L+B4nIuwdj3nH09WD2+iC/Wh7j6vmeHQgr9y
whHHCdBsxjnqCq+xf6+vxv9844UxyJu27kyyz1N9zYrR9iVZgiyNUTwaP5QAjLbPWq5YObela+Vj
MWf8O6clbNLTlbcegJOjjesZbseIfp/JPfE5B8Xic8P/7k8tnIE4QTui7hNtLTZVbJEwJ0+1UV5Q
j8QaVtwRfObnuTFNRuDy+4HjgstW8dXgAvZ7gdpKVPjJ9J/OTZ6OKlJmfl7DMXxCtm/OcwNCf67L
qK0sc1cYMpQewKprqKvpzGUAYGP2KqoLJffI9N8aSzQicLx2zDMRkOIwQSQ/87HJ8+PjzoIewZjB
rSPQET/hAIE2nSkYRjyDnlYVTeow0QM3pvIZojGyzxbkqN0/AqG9xhbcsvZa4DdY5fuPmDQHgDqK
p7WQ6pM5gEfjV0Vy74jsOZo60MkvIT18qiz9KVoFld1CPhAr1RSQ//G+ocETxvMcy+GVFUpduLE0
zEEAVZp8A4+koqVBA2vubi7olg0hzFxPvM/EpC8AUAa1rxHz/y+tL+hZPWY8mtpuQS/4621t/w0E
lV31qBL9GyWOJsQGPEpeo2m2iOF4RLotkQTbr76JEsWYeg0QqWOoNyRXSQTCjJjYy/eOZWFtvzTt
U/VYCVXuVdGXdkdUTbqW1tZOIYFHRJcAGlqGUgksCiWyWrrQp6gOvSQhwv34Q8mHVF+j+vdJ9H2a
MLx68zYVfNfe7jDNyqH9c1jFSb5SS8qz7k3kblDfedFixR0Y8vR5yhs+kkrpSchhim3wlUYu5V6B
Fkx0NBQ9Imjr/eRNhxVtCJ2KPMJr1fc8w0Vbt+2zZikOrQdhod3nSehXwsptPP2UjXNXKObV5ZNs
l1jeZn7p2kEjMJzDQh8NwVsSFOiXF9AvswX8w2GwnX/cY0oyiaPH7eVkbwKssAW6ENz3Ur+KB385
aQoZJmRAUl0w1RpXbUXHfXawiba1U51m84v2CTlsj9CaPrsrXQpsw1wZG/Lc2CyNQ3X12QHkNjM1
M55ETBoZkr095r5YiIsP9K2wFE3G45iYFrxO/IwTTNCcmAMEvPNc1jGXAlGH5dXhNMBVUD1UqFae
vggBRJ9JwwkEXEdksRN7/DqoIXgcJ0neAbrgDsVdRWbDgq34xIxUs6gd+pI4Gg6VKAssDW/cKufq
Fa4UaREerDopTjd1p5crgQuLn4B2wSuTBdXttZnS6CfM5+ZNSDYU1FTIsaG9Mx+ejzCrN8nmobLT
eUra7V9ZFx9lq0Mg+tHZiTUFchToOtkzHQvCnM3uwVILcxRZI4u8km1H00IqpUqQKbIc4Oe+MFCB
nFTZfshfoIcgeBk+MD793hnXNpBGVeIFugqxMjJZO/3KcVM8HEWNiBh20rWPisV4hEk0UCErl3EG
Y10s25V1lBJkiWXSOWr8KlmS0/wwAKt4m5i3KkVBtatTG1J7UroEk3fB2xw9di/ykXUKFaDmjNH5
PmgSFIUXB2nB3m32FD13HD8g5H5zuv11SsbaM7NTAJWW7VrkTL1JBzMZYB3CZJYn/6Q4DuSBis9g
R+2HeliMVjAPEEdlI00U8TSGqOhn9JgX6myE9XMTGci1fjtzfO4IqySW64gQ3b7BcUs0x4SWke0/
Rjp6XONt9Q+Ay9PLFMKTOsxp6GAAXP6y10R/WEUnteqtRjAlgbUxtLathk6uDrmpehK87reMmf1s
PNq8mHfCDX4mGmADlmPUuxQVh9lXZlCtiPmPIQbN+qOUxEtpwFIDx+gAjVGeEvW5s4yfA1ovC3vM
4VWGpfjCXTWTzTi0F5U7Y41yu86NVqpypZ7hy7x07zUzvbv8nwtup1UhMmazOGOHtRA0Ro++42i+
xwcuxjagGl9lSA2H+ioIhNSqdVmVOdGBV88/EerOhESkNBBY/un6VvfyFBpr+phr4Y7iabrRZXk3
VAmqMz8hxQY0W97AEQR6ZbtCu3vcmF3f+mW8i2VojsCm7A0mpzAxF+/Fpzx7NmdgyyNy8OFe2hbE
ao+BoW7c3WHI4VbhkGZGiZukPEBft96R0ZOqsh1VfvUMC8/seRM6jqj1ojShFC3sZXuXZN4Y2i86
KI0H4Mqjiz5baM+WkzeeW6/j6nONNskFtnR/ErlQ2xHiYMatfyqVYkEUNeQAb2b+mHKoaPLMAFkD
sLwnaQBtypFK++nutCvketrP2VEr6HgcZkD8ONmA3Nhfyo/V3eG+bL4HRpSZlNWRl3jgyAkwMl0T
K6Yr6tErv24vzLyeR5UWgxC/con771FAm+uzrg85WKYfVj3qHQCTN2gybiH2fhtp4WLQPM9j/05m
DEZXg9G+Yfuk4PZHtu6jnwxssII5ZpoRkywRF+vCvF1Ka6BsJ+NSP4ukGedjwbrAizBK2aRl8jUx
ObKNglT3TMAC+0hWfyAquM3zpcLqa92lVfpwxlARUcFN/pJRXVNdc3Vp0clHMbmm6ZOvrEaNXWsO
KNn841c8pBv3JjZJFzbHACFwCe9C4IUwxMSROXdVwKfhEgvGo+lfS+ekMbO/eFVQqBpcTES5NJ0w
GkhpboT5zCbKSj711xUHRlgu61K6e6BwdStMvTLMUyTZ9EOd6QIV97wycxcrSzhvuna14wyovBNx
JnuBHzP0Xpsv5eSJY2f08CWP6QM3tSTO79Gm+2YVmhgtRkxnYwabJAlC3PAp1X2fKceMX1Vs1Pkq
um2np77AKOMPWVE7B2R596Vza7m5HQNdl5c1WpJphABlVanoudJxxJzP8uWvlFQ+2jaAV8w8R20q
0drdcoaKLi6sbrakuhVJD57gWmUMZyAxyUtmFsed/2mbKLvCSCe33a5IjV/IIQaOJrD9W9OuU9xs
8EHpBfGHU4mV2wPMdBPfLazxX4NvhZfDQKHGl5dg0UH4FSqn00UnjY+vS3PV+BSr2mGM0UEjLvo6
+ZI0qvTnuP5SbZ96F2SOdGidDietDt7BTlOuQX7GXXJfV/VKIvfKUHJVoPRefRgKJ077QP1sSaKv
6KJ6FGbH7E2juSF2lkrqTwC+4raVCiOFRCdjvwQv9V3KM41EvFmseQcGgRyS6biqwmD0JPFqADEz
9ZUxHwy/wHxKRFXrWbywhwLWZS+JME00w4cQI/JQ8teUz2zGPnhSj8YrEdqiuRnVOLJHAwxHRCs2
gRdj7xTLbuJdHhFibhm5/5JUygTIrRQOGxI9aa1qO8bzXI4bpx3hogmlEGu+z76h00qUz/PhLCdr
x+IRT6v2Oh384A55qsR9V1uv3c9JrKMHGrsdHFTeqCFMCLir6E4PwBm6hXvohGm4c4LjAStKrocV
sQj54jlGW61zkKwRRkpYWLlII+mVCzHUayt9kaHU+qohR1/KzF84u3xS3NmVs10ZuDvSPefLXq+Z
/qbQxyPO1jDlyUxRrivmhCMSnkRXF8hk46sMKP2onzVfsd/fZ1az4u/lwNKajHemdQULrAomepeP
1pRU71LzGqEvlBMvP55L8XiHm1YjCuVl3omY6vz+GtSzgPi5PA+sgQgDR4x6sXEmLJomAeSyKo+d
24fJWOhyAyneg0msZ1szrjKrYqIAakxbLQ1seG9AYVrR//DKvGe6TRpnyb2eUyXYyI+AfiDiRL2I
Ez3x7zuPmtegT49wiTNCGg7Nz1m+ZUMgrxyL83CnQVkb7Tb6a4tbizrMmrhEUckuA9KywHeCmh9h
awHO4K/d+lTETuIxjBZg4ITUzS66ZLpZ4HKHmD6lTw4uEPlhPOwnBIoEpGbyxTNyh8o+UpNM3i9N
dThhvk/kGb39X/hl2Hu60dlik6aHT7zXez5cKwKJw07mQvTDW9g8oh7/qCWTqaPhIO9DePC/fMUZ
cpKBV2hWQdAdOk1xZiODWhlvxETuEaptiKhuLJVdS8+ZWwkYHXz3ubYOREb2e7zLoYovlbXTEghr
NMtdPL8ciOWuq6D1CTPDczsVi0R2mAtSnnUFFvbpJZmfXNG1T2BFn6OeKpLjZhhWabfkAkBEg+KV
/J+BtXfyeM1GLqx5+Tvpldvd2ZuIig4mQbXsCOe1WFaaidx7j14kMaG1kdvSHE9L6bc35fKYfKCS
EPt/QE2zgV2bu3gqOEUQ3mwMXmwMGWq9He4ak6nxpRM03AeZ+Li5QSu44yV8ClTbgN6R3srGmPya
bGxGx1Cty5VAo1VuKQAN00ck8cGruoeQe+94KsziwXrilAz6lU0uBJln2zBQRrHB3O9o3gN9cyw0
W5KL2D3arvh8RAxHpuZAt6+WS6Bz4pJKwTmCAPB7A126eWl6dcWWG1x+vAiOasnS51DtBdI28jmG
NSmcpd5c9iFHyrceOftByc0F2H3BW4aoUEa7kCddqEGFINaoomFaLcorghWTQ5kRk5iwUe0qHgur
muJKXNYkewCePns5CtLVA8VhnpGElKaRzuOqmsWQGfR4FhZGSmY/uoMSvfHZH8OSX3b0UwGWCQnw
S4gjcYwmrU1F6APGtb73HUXM7AH9kWx598eJACnjXEew5jZYrGV3HplSUqhsYfsWyjEIPr0sCpei
0dEXbVpl7R67TQXIh04ePeSS8PJVgLpYm6mX6A0W9/XpMMN0rY4qOaNz3xUBPHCQ/WMckZ4Ofx6k
MlffrbbWWCyMwO4PkpJjvJRmQwVDkqcDVq641/BcSKQ6lRiPqxFc+Z22LEyhKaWRv7afnqBS1IpU
Z6O+7qGs76I+JqEe9/8At5TGG1u34qHqoO7v2p+i09+LhOp9QtDIG6Wfw/oN78tlWVXkFcmEhC3R
pVugERkYPW1/QAQM8ZfXHMlnyOEFMCbrs3PW2ogUfhcLaep4KjqOYkWYfDmud1UiGYehphSTC0fq
m+QL0tPQwLF/aEXLJ5E0hheGcigxaBgVYjHeHf1gptiwZ561kS304NUS4sBLpI4k83Y/rpbYxy8q
WXVkKpbc7LhdmR32IyRFXfjQ6y8uGOcfHL7G9PKtMl8j4QvD//s+9R8Qmr1+vpBVFCU+eIu8AcfL
KLwo1+WCL7K/AaU2cYu7pELPXxFgypOWmUh4pjsRQfqYRJ+r5FhUKS3MMTRXu/qwto5S/vv5Gn/g
WnXgX/8VGnVMigm+EI00Dcji1wW8b6wziJQU7T8YXdxZap4i4bQc3nCBGgslcLBWnt63Wh2VhbsP
zpGbAsuAjrLJgiWi3QpCrxl8hvDjQMrUgVIGrvNpGOaqNJj0fjMf+ozB6sI+Lojs4hQfQcLFARHx
K2EvAE2IYRWFOqHhJ3DvyLP4psCIU/iC7l1gS6ue3G3jxbJzwRcZc3NynbH+j+qn5Y5pY6pa488o
cu5q2ZpQ2ITUt8T/qq6M3BP1d6ABulFASfnEJ8hjDCwpWidgfVf+ePV8OTqnjEeDUnZMLweSSj9I
e9UA+LUD/2eHI+V0Ani/FUiGLRklSh2NoaJ1di/pNaxsj9zzN7UjLPVklgT6Ilsv9omzeAdwgEbD
movzROja9tlz1/u/gdTXZEXggQ/asiqpr0Yk4ioDTePyVlvCBxFJsWQ2HF4+BMI3/JUSpvTFJSBe
3Uf9ev01Ih0oOIvHlOFZ7zp5hkwfRN+joVgUrrayVBE1fTArk7U2s20zZvE3MXaPvXSOpNzSVrET
m6JKGjgfQeme9dBIa85wasA1jeluEX5OgiUImJITC7KOATamg0kskkoSDnxvzbs/zmpcXd+lysOW
G48aTFHOszOE9NIPZygTOOuZmg4M2bPA7v5O/mvx9+n7KtHYEbyq1YJon+f64gc6xTI7R73AvQZZ
rk5OqBmt91o4QxEFG6cx/D4GNqF2WRGdIKOJT5QF4dS1ltLewySdPd3y2BmUMHtNliCYdA1w3fhR
+61F5uBBrcYDaDiRfdM+2i/sO0bo/ndRJa8QAYU1h5Rk8ajLDKVtVfwNq34biBbc6biYNPg38DL4
xLkdmW5iipVAxRGROb34TQ4fRuLN8dvZB3F5rw0UpKO/E65qaBjyC+FmElwBKHclJOrgIFe4u/LL
rQ+sJTLvRKdVUgqDAimZst4GRwzfngb0As60paF46grjEfM0Cay//BmeGuI9bCqLcPITokv080T1
AW6J+VzAkhI2Va2q+u5KYOs0ZTIdEHmqdtTX16YRiNJubKrhPNQa5RMekOvYkhoH37vtz9hKrMsK
c4CyGf6U6b2x8YOkw73xnXRP2No6w/0RtEmnf1URJm+qR5PKfAPerDXax2LlCQML9YJahOJ+iDWp
2CfBTFPPp+c2JxIQ41lrch6VgTzaFCVlKpUACdKP2RXFWABdCFQ/egGfKuDgg4Cedv5GyORXNXxN
kRvy87/zyLShWfgTrIvm2psSCJ9oBNjJj61FdBa6vW41LYLdFh/zO2BGuVjpXKDLZWdC5NHWwgR3
Qs/AYon2kcHWKCVVuEhmWJX9mEos8BUrSXi6nfBt+LPML97yXfJ/ErKe9uld9nwTpyal/6a3jLg6
DOMaMTir1pqmN3k3k3P4kfmqduNqFqXROLlanpVYB+uCwKA2DajDbyLbyjRsjbUsuydGa27x6zUu
/JpQOE9a3M+k4uHEU83m632mcfJa+IcmLrowG8dUJLQ2A0ihUOpjCSyI5MVPUk/i9/uB0730BYj+
EPvc4pwNChhBbeMQEj2oDebdqkwJV5DYSy+/nJ+MMiHQeZoF6wGKh6DLlf4p36NX1qsJWzv+rs0k
Kxamha4i4IuJnv/dR+8+PbnQcvK41kPmQZXtn4F5sghNI19aIddryUfHQjM6M1vXUirJ1KrXwbGP
yQmO01D7EEcKeLNkUPYL3lc8ALoeloXiFuUfsMWUhzFqI5PGzQZKA0JJxFaXNR1aC0LsfS+BFY0D
3yD9GVsN8Bu0VQ0oyNAJjQbJbCVPr2dT5jPqEXUv1v/vmWKBywvAspEzhBgLdJvmgPGsU4QvKpYn
X5tM/Fewq+x8vC0mX09PLUkBwVeV9/npZxGED3xMnO9ik2jzfgenxP/RH46Csnoow4aBZAaW6R2q
oOdaOxhKqZevMhDo+7C2ja5W3aJVKaXreuJR/sEcrs0GbYSk4LTL2I3DAng6Slnepb4Ye0y5bphs
e2nbbZ/TryN1UexL5n76Qf/ih9vhKLHKRBFFaQYAtmffsV7eB3qa2/s2K36q4STiKRh6ONSK+1kP
J47ChOD6uRLkYwTG+4PWEy5B7usv5OTlnui+gB/IBnmiOjAG/E+qg8qLz1rudnZvCqHdUOS4EqmS
zTPPMr9Io5UDV6FPaO6A+bLvqLo1T4qtUNmpqsrGJO1gEDNbz0ECnC1wLLBoJPAi/nlubPBhkhiF
KbWurMUDIdz1IRgv323h6ctkAsvKdbLLypHUpPIZwvhgPruCtSfn0PIePNyjcPsRCACL7yxV96xx
r43WgOUjfXi0cGWOrAJ9jyOAcJBbhtza9MZ/KmXOYA2Cyx+/hnobVOV9fdMJE+TGEahqnyOYgoOv
evM7dl3TSKxqlpNAl4ygjQVqLBWCdqZR6bci/v2atN6wq6YxjJLcBEnw6MYWqzOKTixqkUBDK5Lx
JzMmVy7lRcc6MVfu10WkIdTxZndAOlZ4U/yySe8AmroFk0jTbfXHPkyPuHIIpVoDwCpGFXcLtjo+
Dh+bhQOkGq9nceUi8hUNv0XT9yKLAbbejIYqwKM1ld9spceWiRS7MAvcdw4O1FhYINmIm+Zxz1fI
WTCPVcydedwoNHc1r/pFJHq2pEaxBD0IkptRrcUB5IsxSduJoZWwoaNt5iOeRwPhspjKKBfnePFt
CYOIr/eDwnhf8OogT9tqiTZahT8weZoBK/DxxmWh9l3LhYhSeJv9ILqyL9BLwxncEx8Hv6f6qtbZ
QO4ImMH8SAVzPrYWIcJXG9u8BsXEYqE6F27iRKYcUETZuXJoK2e2Y5p7WW5jIZCVuzPTfGK+apFu
Ql1nROfQ0hHBOUeLMd2tqxVOb7pU3hdV1XFmSbnaISZ47EaWw3QomZ1mHzUCS3jvaEvhd2ZxTnKi
ACuZVV0VEfnDoPA0tDrxtKvtvesEtUtKHBm8adnSd3+3kGdII2iErDQVwmdDiAkigKr05Nqif7iB
LSJcOPNlGT/mTuBp9YCiS09l+44JyOLGG9Oj1zFXgoLXtQC+BDg0nKJAw+cBcRa6pHE2uPm+gcd3
LcawyU+58Fw5twCBJQMeyjKM1L2P7f63Nk2vdM321OZoJMrfTcHHpbmbMZ9KEIsghij7BaV/gZdH
7++S+dNaaLeMCAmyntwr2CcCFOwPBX+7tP6+PDbvzfMs4RRg/dzYReK6MMt9fQV3PV+wG6Jz25OH
VDtCYFtaTmPI3dz1xMQHLqvuIwm2vFytFmDxO0IyeEyJ/FfxGAoMgqiqO4+ga5ssPK34oYOG0h/n
IFy7Euctx2BiRR0RmuaAvA5q/3v9c/1d2vCrSl35YrObQ9P0nL/pND9k4E3+9E2v6Pap/9/VUsuc
xWaJoMeEzXwoR0kViAugPK2514Y+Yr4iT7R9fiwf8Om75j6UBlcu+7nK4wJ2TSsI6Z335cekImKP
9VvkR5d1kaPLA8B9hssAlEnXFz0oOZY7iCX/jTy3Ny5Vc1tIQp1cjuIAI1nhV/EGQjg5jL+quz8P
ksZgrSsHoI1+V6GcNELCVEEOXWmZHXKGSjXMJXXnC7vmzE/+u+UMmToUHHSEYQg6l5bOty1ZDV1i
MMCqahJWoL4HvDH4H2AHvSommM8fbNzY+LZ9KRoR7ASfHiTNknfX1YK043uI32RbApV6cRJkuL9O
JNkfcq1oaF+e3fSTp2z+1tJW2BowVMjLKA5cPQKaFYCW3L1VHHg4ULPOSmeZ7DWybmuBQ5cxvr8d
V66tp/6Pj/zpe7CgZJE54tDU/1gq08irmBO4dKGBaet1VyHFfpN05s7k1al19GN43SFL2qlsDgTT
F/TNZXSV4s9S1BTqNY5rLRBYejv53QBNQEEJ1KIEov6oCeCUIMJySA+/iq18SWxvlGz5rBRj8EAu
HFfeuIvLbAk2YEgF1cIZioO+BslSpz7jxIASOWBSKLx60ECi7Bj5aMr4VcA9pHQw14ecm95hLZqj
exbQOks3mq5gO0o+O/LSGoVEfgKtsX7bglnc7i0pTZdzDm9ymMtGFxX6lcWOxH9GQsJzxenTgiLC
iNLCOzqlfh+YGa4OElNr8nrhhncaMFpFaXZ2Au8XOrbBhsy5CMEHmHEdM/IEn+UOmMj1+czmjrOl
6onbAQEMXdthcPFk4Vi/6/BurftGDTkyw3E8W5ooHNmAuojzoCFe/BY7j9O6zdr6QlyZ7lAuIqNh
6jv4Td/kn4kzdIZLfGo9a9NUD1M08InSCAKXCHb6I8dwlhr9qTpFwPeWnEIksV4OxYnNmjGnVmdl
XCHrUCJur720QY6EF9o96KJE16kuVnBwHkQJbSy3QMI3X7sLe5g1R+2yferiWiJJLjgY7DLyGBKr
poWfd+n4P+4zdqMbXfr8YfxObzbsG5Ctrfhs8FWbVzClQHCtUc9zC/R/MwaDaOnAUZ/IhrFus4cU
GqpBm4q675f7oFfM+IHtpeLnHcJ4ECjxKhDed8NsijpfHtVzUMXgPhQB0uFJhAKk0tksH44IkXU1
dkULhyxah2e7B40sQhDkujOLXJcDLNElnk/Anvf/cDx8ZLLMxg/NOsm4Z4vB4StcJYaK+c4/jz6M
39snNRRZ12yqj0p3NpR8dQ2H82v4DG7yscvoAeNLnj79jjgvb8yPdEPOMrV6LC7YVqBxLmKJY2jV
2IvJ1iR4wrksN2eRabKEOZZT7WD7yxZ7mTFPvJWLvmxVHB0NZU6XX5mMT2RLCoUKQMH6QvLtJVgH
EY65+oBWN5dGGArfRJmhxiMRJoqcNLGbPBEQk9D73oWljAS9eJTE/C49zQNI4LZstOM2KrsTcxMz
YhzQbrK2aPLtJwZdw7ZTUILPMbOFfkAJ4R0zx5eqaWHPyjb71MpiCyrTjJYy4DFSWA//IQKSwduX
1bAq0S4CYAQTIygTjRNb9cipqttt97Jx70X1bgO1iFgHDzlrF3OVFLK7OCP9M+35XDorS/Pq7PGn
/QTZZAJR3ECvlNHz56UtoxcqvBwqvZu5xnECkEmgp2x8v/zoCl0M/rj031FGgEl8q7cV/WN9toK5
Mesv41E02V/EsX9vCnwd3/UfSMsKqsE9HAdCna0idJKMJlgYdIRcgFWMzaYubMzyrxudhYgTpGVg
SyOEJHIhHH4bxDYlt99moN4aGLQ2HCBb/wLIPhBHOxaCkezXRidCmKogTdPcOi5R1hqf/UY7rhNh
A1oePVJD2YQAVJQCgjWQZXmj3XRBL7GUkgtR20sl3vl6SR/BBmQaUZ9cfkM5IbdWxYT5K9pJ+4Rd
52d0eeiXt3wVzlPvqojMV3++wYpy+a7mfZZWEk1t3MIxysL+FbLN3UHp0oP+06LLIcKvOOO+1lup
0IyyV1c3Ss1wtWn1zmJEdlWscg8c5k1LdnbRbgjK1kj+pJfuBCh5O+1rwMdoFfius2M9BEtqHNcH
leqpN40uACKJzuS61HLkVpj6tJd+HI0dgc8bBoib037QlJ0RNsMAenLYJqvYjJORzogcXThnmCEY
ETRRVZLCwz/g/s4WpXm+AuZff/S+hIiAf0EsCewZbQSEsVtmGSbJxk+g+bLYVcL1tJ1/kdtcRoNx
NCKlTTN9d6CH5vHLvv9Gl09oJBK3Bmc3CYh97YFhaYaa15O62fDfZCugUPpfyRy3OJumaccLqgNE
OkufztG9YVpgaIGe2Jo0bY0n8coHJWcuX+ipQZvWTxqGkF0I9LmcOcFk+u3leGfd4YJYw7G4urYu
hEianCWg4uajC/+pkGoVRItb0GD6d+ljDYwq5CfWgywuP30IOezg9OzIsIcOXXbK+RZoVEZ1TPGe
fvvVcw1DONEDFabFsn+AMKs3Y7eCBAsSCnysuPkK2gQ5ipK+ub6hfbpwoYuFEItAKPhaSl87u17g
tnqkiOftD/zeZdqWmrpcodSdeCLmbA85d4hRsGgRmxBAoK+RxWGM4RtJNY0kVfgNa5b8sRq7jbUF
faG6q0j1Y+Vc99zS9d+3qRIn6xM3EIBNvQhi1gY27bBGiyvk4r/f+3ZoUNCVJutbfiJiFUt1KEnb
552JDNbkoCQE6mPO4DUEwAjb4VcAWMXdnaDGKJY0GGPqRoCfzSPVWKu7u4F+IEOCl9XCSKsnRAEK
Tx6+Zftfr/bAy3uIy5P42L1OR2l1h57RO4YbccCpJHlGTl3ZNyJ30HtxYgSl1kwE0uKoZMhXzTNq
Ws95oRaE0fCiNxIOpgj6EOociyEu96y3m3V3NJxRJnhzhGJ5Eb3U7evmP7Gm5CCj5G1bssT4+YFG
Pt9Gw5GqSeOEzNAHSiwCy4StwaxWUJqOvRAmzdZU84aUgsWCiZyTCax+eMZrBLhRJ0w7sNBknaot
0XpuzDEQIjZxNFV8KxUnxY7GejP/EfU3Q/MoObaSFFRQGO+YbFvJVPmASFKttkjbo+tY06F7Swdx
ukSGmzcOEWnEqJsQsfVCaI8TtV/F24PMfRG23YiSOMAlWzSNTyK0OaZAfk7/hJ/mjYSVBsGhGEl4
j49yaaxh75zo1bfHuAgxYotEiVG34BkqN5F2Adtw0MalMUJJijmLhu3hC3g+ziyQi5bZlMtjxFfy
xuTAun+2IOwr17DuxHql47AnQRRTxG3v3tVONBJtHwOdw8oHWNd/axiS3hHF0qEsRbLQNsB/I8KS
+S5mQNmDIUJvd7caGjmQohXqQlRCrAV2wVT8lzTPspItEDxZMH0NuhZ5QhF4yr2I46rLXo3VFuOp
PzIuPBGRpZGlErldtYuv0TAhgrDNY0qP6tTYUg5uIGuwOfO4WsExOCeLq/Yxpfp35OKU7pgCBRJ+
oxkQCFTnyKNNvp86CLFO0pA+4yUfvytwYTqWY3ajmSaZjfpTk1cI7Di+5B1+CIoMnceFaSd6E0I7
BpAqiQAhzs3tnYxDoTNnPY9Vs/IozCXNhm3/h6ghoKOHksGwlFbl4bE5DbEHPH6TFugIjNeMTMSY
B4bltnEvimu7amTnglvOL6pKkagh+azonclqA8Fc7wiYADPb2cVjZviUbhw2RpSdd7LAcoaEkEJF
PgBfZQNWcVOBlmoPew/Syisu/56pXe7PgG2L1Ht3OIzn8SzJ8muVs72+CheDuOA0wBOfqq6grZsb
ppFlL55PKNjcyctq9R+sAkZ6KwdGwCOa2eMKaJThVZPWIn8oT1Bi+CtcmzYUGBt58AMzwSQ5l/dL
xDYuZ5tpGWauj4oFPcqMT4TuLgsx/XQEkL1e2A/IQZ3Kp3X1FvtP8Ele/taKCsUTg5yxhTeldLHz
9KgWohH1qb0ffKbh5y+sqek3Gi6mN3uZQdCFcFqU1HU99h6LZpoDsIwbw033y7Yw5Yn7Zo11gN8A
jrSGf6NT5yn00zMbesQ4taSgyBX1x0MCKaSQ2qthrBDjHrIoUPN0GdmsJmDL6bO7qmj4SIepOLSd
RSbTo0Ydr5GnF+Zsv/GKOv1amVQNO7jFuaWoacEhOPLxqBB37uFrDh7jmHlm4nhmz5Yi5dENtFTE
pCirjOHay6OZDxlOqNZMA5eVsEm4TohjIjk6HTa+Ui/JoT8OAtVQhoX6rM//UWSHyxyv6oKBIlGy
31uUm81Aj9HsfGJhT1ChNAXfybv5r5eY+LO+VrMBdJDIaT0dfN6J00Ov0rXuDN+fKH40RlShPyIZ
bItERAuixFVZKJaDED14SfKFOE4a+rnETID1VRvLFJ6df5VO8YpJTpVIsDksvPcrtP6HRbLuBg0V
cQlYuRlU80ft57DmL/QLwuzS9U0gPsD6tpiwXtiNlPM2iYBnGiJdSzZWhsVLnNrrX5NICzAuDixS
R7DFJVNKx8Cv8jX5iWwTbVHTdiADaWSj4vcBTDRzkvV7JPnYd0z6iec/TLbA97pmGBLlR9l2LX+t
NzVrE99U39HhH084QxrNvqScyZU6aYakfhB9HMKVZQU9DXE449imYM4ZQ2HJMJqtCjKUu+fIexGm
slOPARkyJNQeHsGxDbnPRP/ehWTvmZlSAJIsS6ZfP8ewzhti5x6z4lwt+ckSmUqcxI4d/jgb4CgM
U8SnPjM6MjgQkLpa0cCCff7L1eERUZJ1645mA1TZ10+1dA6SmbJIuNI8/SAJz73qusjA1Hnb/gYD
Dl6K6Gg4XQQ72PWaEVKdvAcqk3NjgHFiVVBdS2MHPDQZ8umAMwqlFwbJ8fJTic1d7H3Wf1o5VVbq
4I8fchoWIaPXUk5QcbxAILy9Kr/9KS7blH/uu6s5qrgtObU/81PmafWTMJLNod78VU7QjrWPglcd
yy0JlQWaPczRNyv9X7FMdrKvPgFQkTgi8sjojtA3SNBual9mf+EThfJeT7MTQuiRnhfgfAYqeQjq
G4bQsyCPxgxLXstJdaTcHeCw/kazKvwFBF9HbDox3J6KFCczfc2cOIm2A+beQJ4EybLUCcT8cLJu
xoQux8FvhHAOuAaJlX/eXWBCPUKbTTu3I13GuotwBmKRv14yI3+5urgx5m6McBXfIoINey9aA7GZ
bIixMXu6F9Vkyjlz7tSNkBrbnUZSAf/DMTVEKDnBx87YhGyg+JwWd28hjKxpFb2AMGpmukh8Wunr
P2HfaNpIp02SPb/jV5ovXMJJYDHzPo9cvd4j5d6UYON3T2qloyrGNdoCTioQ2+6N8Zr5Wy0h8Vpn
rDus7c+hlSsnimqRXKJPStp5rAEsGl/JsSGXbUVWslbpQvBthvQhyBoYvDodDm1Ch2xvHciCFRtl
UO6gm02dFYVQ27bJlznSCpOYKR2IDBnhwqcp3EXx2GlfvpVJpm53W84siPVBqoIcd11itoGtV7hs
uL+3++nxnUqRgG2K61+jzu7TYc8QjVnu9OKJp8wreTyOM281XtiCIfiFLtuWetu7HME7VCTInFXl
AqFLW7aigJrFheQ8dAJjSEOPGCxhagNX1tkT9Tk+MQY/42+UsH6aZgQe/YxOkGdmY+L0ABdEyNWe
3NSXzy5mcT94VyM+DyyZS3JHEdYTgx+BEGtqBQLmuEzgiAk4AdTZ96yDBlms2+8O6wwW+4oi43PL
dpxzgFUZN7iAtXN7IRK5wDMf99Ie0l4hEaBYKxRdbZQk7XLtgWjb0YoLAppU00CasksauXhEivXE
hGnzPsUVpvGm+KuFs8W/M6GNLKwOvrrg5k7PA3PhR5CkVmwNHR2WWPmsL+fXoodEyWNHEFo+gl++
y++6yn/+xbnJvm119LDEUykRAa40JUQxuFQjvjl6syE2FFbUHQmfC6+/ZDhkhllyPNlNKSs626kH
VjkjOSUbyqRnx0SHOJdHMOTJFH2GUBPN9Z4GcqYVbxMG2fZDvWU8tZ8n7qdeBlm8P9ILxsz6Dc1A
esYGVHDa6tQhHf+J3UgefuUvQLUWfSopMMX9crxod3At6IsH18x63GUh3shT9LJhD1PfEP9wXtUk
by1pQ9dWRatsnluO4Hf6wH8689Ro7VrubnIA8sP0q3o8PSMitNfQK2effcO1qu+idyCf99FxdOaM
616KfAeVKmZVQuku5cAxHAzkV+PKS5tpQWPBHRIPomP2PrzYwfvF6x56o9xY/dJdWM/WIk9fpiWQ
OpZsDGJfiDPkHFPM+cLtFfvsYaacoy9RDHbwQ7FbuMis5C9ClC6J7yzkLeolF151JoGRLeE1PR01
hSp8aCOMf1439mntshFs6NpYqiwj3eu31s3RHWe8Fh38tiFVNm/a0V2TiL8ku8ALbQcdB2h2i1fH
VZM+1RRx9HEpLmn4qnd8abAbfneoN6qUsqI8SRmJwiq3vB+xvJsH7E3nq9htWeVNPM7A6IG/buGf
oaOyrhWoi0OKFgaegp06X2Pfj2GPhQls1G56MgBA7X1AOMnhw5qdHb+DHu/jB6cRpnFVbVZevpSK
xgT0RYI3RqQh+4gaOxn/Il7vKlqp8BIAjCUfKljAyVwDKehIwuDKjmr32J4J2AdKAjStz+GUSGI9
s9wAET2uCG5LLNvGPMSRf5wDG26+Vh4FZ8B4uZkGwWyrX3Xp/TsveXVQBfeXUD7ZQHH6FuWr/0V1
5ij/AFI8NyKk2FM8BKBrFCUBqFQILWeOUmA0A4meBV8ZkCjcSSbAZ/jPpYR0ONi9fkHk0rVoaUYF
c972RKUwXiQgjupfCGSIs2uw/ixKrevn+RB1Kw3dwtLuVSrn4hbxumBEfulfsmfpknomHcog+vbu
zwM0Zs+FtS4hp3d0tVfwVkffXgKsydE/PA2P+EZxycOhnMTddz2Vb6SruXVUn/ZqDWXqzh/cL7/5
vg5mJBCAdJM6hInSZkAy8WwXAKD7Qud3RN0VlvC+MI0dyX9Q8v3Zg4Bzv48KHVrYSatnREaI18s0
RsQh1VElJHpj66Vs1i51irgd6IuLF9cHkHDAZgvn9sI8+Vw0oOGfuvkK/nCryqd+ueo1OrIspwy8
ymQZotf7YK1hF9Qyym3kWeAv8wabzO+fUVhy7CLrG9ZhusQSxVaaEB7uLao/tP2+zKCd1aGXM8Sn
rvtTeLJcJeQuAQejRYk0P4H/h1fkxVh3kpNpyROmKD5rc6tysl107fwZBFFMAktrCJIV1muoGg+8
iAyWJKrUfHcnMDePvjHSY1d/ZcvzVv4DTWNFlG1M0I5zQhn9E1LHrAytt68EQ617xgRIFttBjZKV
7Hu9ENYKgZA31n1zTFYlOS3T1cNFWzqo/8DwDq8FZ8XWbyXxpoaZCrqSNszZDj/I+nPrDNvI1lNG
MHmbE8z6sbNSmb1bfzpaNmVovRj3+1DVjHkCHC6nNu123U32F0cbpoy0/GO7Rs4PKhM2Nw8yuQB1
eQYdxMFnxGtI6ATxpA4ArhjbeUBO8XnXYIIjQvX0g9GtgHQZZiLZ6V9G6Ghd604+TsE+NvzHxIIW
55y2ST1rbLo/BU9wIZGjHdL2ITwL6ZvPiie94UZAIhAQaQWywKPjgyBfHilc25gJNTO3pzRplsWG
QxqY92EATfZHnaIuZTHBVc8TusBAuZXUweZ33bSY5+bizv+SVEU6tKBDhuFFaYYWh4qpywm0Ritx
3tVfyffDIpPeA45Rw1kJD405VMrItLeDSbm1CGoJeBAhWyJ6dagAagpyPvgPPWvgbnwPXMckqtQ1
148YVnL9Yy9xxp4k6go2BOHINEXlnQLO+sujei6HJHDp8NB0X+5+sPs3PuB3qFnIUY9L+7Q8/jMv
gFVtbSlDazN7X6265ZlzP/7090mu5UAyYyEnWOC6vXb7LOZh4g8mI3ZGVDHhCWXElO1je9nL+G1D
Ev69rnwkD7u4O/qMiNC7b6/7JVEdFxmhA0SNIYorq23O7JQA71U0ZqTrq7Sc0wrN81WWl0xIVGot
s2aHavO+SMbLB9OM2jsEJxBKzj6BlbE+RKyC0O4/+EMaFFIoRbdifhVnTA8CIOlbjjoOINpeU/Mk
2NhEwzniy4Aus1QPEol4fd0kNBrcxgIkK208lA4tdlokgStqM3L7GzCAU1pryrm3H2ubwRRe1n/w
Obz1MML2QOy++QgbsIodUiGgghPd7niYm8OMcjhz60RfhhWQPqB8+fsbP+R9aWTO4sKihX9uzxzt
tQay6L/XjZ3i+mEqmM0pM+D5ai+YgAtgPSfRKSAgLMT1Wz2dFCxVImPqsXYbbVFGS6NRkoeX0DbQ
gaWpcWMoNNg2xFov11+lAyJnPJ2yT6mrfcjA4avXILosVuGGaozv8n+0PpIRCN51es/coak+GilZ
84QshuYc34wJz+Jk3jlhRxphJolBmD1dn4pN/OrZUQbd0rd/nkiKJvELyTH3+p5Qdv7sV4E5tW/v
AkjDSv8cdf1RUQ1hWCalQx0trFKhWvRa64gdtyRW58GUy/NnwCHAIt9cW8lZpE2Fb8cFqBjQ71rr
KsYfLE+Zo1d3F3ifgHfFDGZr3ExvcWjZyP6kKRFTTPuSWio8KtXe3v3SMpLSj1Lm66i/TK9O4G7O
NXSQV2yj4GOVS1LAXZ2xJq7c4cFNqbU2BWQjA190Db/f6c/7YiEOBHtj6LWOeyVEWgFwec8ZGsBG
mubgyYXfgd3zIcC+JoJW/mT+NArW5xXd0WoUL4jaAv9dQUifs3ESVzzFbPVKIC5IzizI01Fax5+Y
P3q+YEnnwkKt+foMmLNw/zUeSLtC/NTVz/oJ/iNdWvMBDiOU8tBx5mV5pj7PzImZ4B+LFgJHI/5X
qAECQMaXt9toQ3a5jauVhdGatCehbOH1aPf1CNQjiG3J+xDGAGEtv8vIYIkE7J5P/HdyTs5vYmMv
HV1BQ16BVnxWYvDmUUF/mJ2PUAzAxBoEAhL+74Odnndj24nB2tWNBcJQwvffA8vBmCzfJKKsMFki
UgQQditA3YD05QVK9+xcehAWUdhA8QxpdayAacui7Iq+7qThRVC0fDh5GIkpz+uG1tu2zO+wmb+D
qjHyNv8aECAjt6pS2ilgIW+oxeSMqp4bpIILnW9/PD9u12lczON8ys1ZYSfU2nOOW1PU3If5uvqm
Ic2ZWBnyzMPuagX8qbdZw9M1i87RYWlvqHygZS8Av6ABfwXGCVAvIba1pS+gLJqx6FssZOyRvyAh
xRjeyWg0HUx7kv0f39hn0gRnpoTpZpyOHou91gN8N3UUN3mQl2/aSzbJi2zuJany8mtqPr7L2kHW
RMv4RMfzVd/B3viBr03h0tKP0aoJ5MBgsEnAWtgVanWve89VpxyBVGORkz0QPaiV8d97MoQqyWOv
UwnfcEUpnugIGZRHKeEnE+eQKjw/sym8khYG1WlFanCD4bxjv3eygI73Crsky9Rw8+KdV4fy3j1I
8OZhOCHGjwnGgoVN5UTyf70OG9Nr8SdzHmnLG93QEdg84a01YZRLX0pq2qwKB45B99JyEwakG/mq
v5gbc82D5D1/Z3LHHXbZh6Y9/Y1Sjvun7ahsjmJTy/D63+6nFzj646EHXgFN+zzinoltOTchdPqi
PR5d2blIis3uwtmg54+w3WBDJjKugqVW09a+14fGdROOajhW6HlHOI442x88935QFfXFHJWC8Tns
nAq9/dFL4Aw7sgb2W5WNSURLdfy2KZ4U1TiqAS9RxR9fZ0XkE2gNg2Vt6DahSybhEPdnbXxe59Er
WjVCiSVoErizmADL4ho1TAaCYPs3uBeJhVFF0Nh9r7ZOCIHPhuZwmCo/n3MyqLm/pOmDrPqsY7qp
VTOFrroMQfCuHkQvCzQ4Zbubok7E2U+zpv444g1t+K06cRIw5peLnu92UMY2FGmMnKO32Vli4jIK
g6Ual037SSEs/d0WRGJmvyOWVw5/T6QVDsc7ClqJt1G/6aYDVi0XU1uBnERVVsiiKnPDmGJsXav9
9W6uh5FkEieluRhbx6bCZkK848zNRZ0olTPpnN3PEHwnRsuEB7dimj28PBN6bOeUCHymj6I/bg0l
rCFCtgNlYUbHfgqqxse7DemREgDT1hlMcMkM4AB0t+wasMzZcEqQ+eNFnLf4ELn3vhGgmvEPkUJL
V6mz77QBGD3nzglAX4Yxi/ABzeRNkgMksrK0NYYHPIIhYNpOAZ6jhycPPwuCAbMJ4pGEfXJYTiVS
WqajThPchGl/1YDnMhgKe6AtLJDplTMcfyosayxVujX1bZrqcSb0DcQ5mpa8Y2heaNiJ7mAwipd3
a6jMuh1An7UZyr+2aBCNGwpOBaWvOBuPk8kcBvBuSDXN8kdk8VnPZvdfT0p60GoNrD0dFtW7pF+p
B8tf0mnxSARi0k9GHsPqHEyqlhX4Xtej8zELk3+IzlUd9XMiBcqMh3H2DehfkO6FmivSMtloqdkl
VL7QPp/Z6TVfk4SklmX2e4a/FVTq3UNLQjbQ2Jm7U074qkCm1Ak0zsRN36UiFdIkDd1zTgjgymKp
OVPHIWVgS5vvw73gbGgtm0ovrnsy36IPfnjeTwk+cdJIhr4BoWNCWKfcuxwJZlbtwGyG3s5mPYcr
kh79wGggjkJ5y1/v+yFWixGWvxEx6WwT+/7GmYuUzRg9OCTH9oyP6CW0T+7ijO4UPLS1aTgnXp+l
YbpTRY5PbGbgd/X1DbE7lRzhwc5Gxe0N2OIMUpWjklDCDKkdL8ailfKKXW6e0rehGflh4R4mnUkb
8/s9NX3bRJ22qN1TPJxnlmnt9j0f3gIloIA03C026CcKquqdZskMoJfT5/+JOPk771npNkLLVIwN
cklOLLubXmta1nNecd6DMHFMK3KaGAWS8mWpO180Ay4N4Mj6Pm3h03YrDWYz56E2a2Hi2aKaoBuf
wdNbw2Z8p1Vl8+WSzoh+kK6O9doqLeiwcHTtJ3tc+6TDweDDuuKvbN3TjT/vppuZuvlTJtY4HYYs
W/OHWnVjQm3HDkITji8OLbpcbdd3A2kNeR82c3wG2fk3fRZofQUXP4RrQz2iBZ1Yt5air0zWXSO9
lP2pqyaWllSRnetDlm8rWhvkKoJtSqNJV2uAOJBe5lUvjyhtrRe1Vul+8sDlaYPvn3/UOtZqrTiq
DDKVO7nkfyy2TtNVia6ljd9XsCQZzSZn43gN1om1U6LezsuYnv6H0YudJZbJPdmlF4wCsLYFf0cl
eFI4BfTz66VpMQw2E4L/Chsb6y6fpiz8Itcf66byq7WmCa/58yRu3DCnRH78/BVJDMa2408GXiBE
VbVkC4dC+Fc4bOprXRLMhxs8wqfoF10TlPqYgfmAdLP97tkreBd3yi6on/nvBjSTT2cJ3g9Gb/wP
dDmxInjJSJT/b+F/OE7IJW6QFxoeRDpupUg4LP13xOLudfsOy8FfXnwa01RgFQBq7kns+5s3NWhd
BUBFyBWd5xImHwvxHfcWd2dSzmmF3v04ne90dJpqYDW5Bgl6iswn5WA/jLQNXejlX0yegmuVFaO3
8UQo1iJrw/INz/7y5DRNTnn/eJ/iR2LLaWMDho1VKAoby60r6IGSqzpwfmCl8cTU95XlQo5usVZq
xOtRrarxzGoQ5NoWX2ZoHn1wueF52WGnCbJxoELAcbjx38Ria55UiBYxI0fXQyLG5ySAXBmskotF
FG6OmRnIXKnmfIDHuz3SGpygGbyEQa3OFTf2+pU6sf8N3P4Vwwsl4rD/8zaHEp/yckX7vIThq6/F
ziMzERhAJ90H2UWbi7cnYpvoWDSsO0lKATwqbjnKn1oOOjUbKbDtw78Ai7/0eshmmvRDQeMsX9IA
cPezDSLqiftTbSAuQQH4YCqYflDqGOPX1EZm9wIUfLIbmI4nnR17nb3gVHNathw4r8aI44A4FuUX
uErGOSycxrJ2aF+37t1UA9wqxb4CKm1uNoiBLaiu4YYsE1H5S+9zBqeny63gbmGA5W2t3Q9doFwT
bpikKTX6HxopChUru1U0V7SMRn0lqt4+1PX8JBAxUMTm0OvAgCmeRP1L/vB6RAgwj4uiX7gn79cl
1VjQtQivCuwLL40PtjBoWGwnCLsHLxJoEVkdJGasx+EQxGmT1yvCd2/1uli0tay7afm+hqL5C+HN
R/UT2h+R9oYPUzDIFPffi1PFrSAPXDv2b00bYIXu5NYCUJ3UsydjGNfTLK2XrAor2nE9P7FZmXHz
hYJBMsS+L5VB7imM+YIQ8mer7yWo+9VfoWE/pnO+TyP3wQq/eM72gfY3xKQhUdgjxR3KX7XWsVgJ
mcplKS2B6bcsgINuC/BkucR4p+Mk+1ymbxPP2bBuS+/0shiPSkdJJ9IBEhL04zy/9QPBqu9mXr4D
CEtWqHhdd9LDmOh7JkCZ4jcJYBfJ0Qd7taydhs9m8OzKW8/bvssu3lx2wk91eP6Wzh446I8qa/sQ
6XekQw+QW7ZSMrH3a+39app3DCr5CTNITdiorisVSygkOqnKMrGqv6PWiuNjOHtCtSUwlTAOE5v5
BwovN7hCov+UoC7XinoZ+8pj74+MeXRPqWpM2fA+disX8pJLUqUd7t1UlGUK/hprx4bHJa9X0q2Q
eoA9DAly+NH69w/oBFeGjUKBhJVbDoSpzivHG4/Mjf7i+phi9GWFpY8XLH0U48xH/B6piOyGVFzQ
JtTBW0yUCICRgXLKD+3VBfCC7+W3y22BBsGdAi5PVuXg/gv+2mPmlMjfLV18aS7Hw6ywwpHTVmed
IMPkdca1s1wE/pVylydSehztJdlgMUcPuVojH/E+Iv9vPVPIkFe6I2cpjdLfXUrtZsx9a6vd76Fh
Bx5q28t2rMqSQP6oEmpBzoy8jAb16alRAtHt3gms9qI6mBzhhxgqU3XR6FIMUZfSb8fUmA4imfA5
zu0NY+0qyzo80DkWG5vmlXvR9aSYkz34kY20jAewIzyUq6CIE49DOGczo6UQLSqHqLx/s/HMVfbJ
M/n6Aq5UhGwoMc7p9/kSzFicV0GKiYJXy3fZDRTAGiJPdOazS/mwLX3LCizVXejvZNSnkABuwTTw
lzAIVAPT07Tk75arLg/TRcyzmZsZxXsIgVqDilQpTfMa2b69QG3JMwAOlUS2zeRj8ig7yrLin8U/
+iCEIyH9lFSFWoJgoMRqUfgotdxcOSHkWssrYahroo5EW4xQNa6QUohg1LJBh5UvIFxrvvZj2Peq
0ahefVNO/72qH6W8/0c0thVmEX8ciT9Z7qhWfctn3Hjyf7cfwwzl+cKEuni6/XoRr3bSW/zFadBb
VP12XXpgOQmepAsU1TV3wQRjQuAqr78kuDKDVnRHeXn+reYhFonmHjMbWka92BU0q6KTeuXXb7+P
QASuHizxVgYe+/AadvB0n7CzTAb0Y1klI8blxpCrtIE/DfVH0ppq2QN+pYN5rGUaW/yRAgimpeuu
Hvy54cMgV5dhzXHzmxnUAfYmtFJTpwZBXhD9UY5F52KVxdYUonpQehUfghV08M42rlFkxBfnL4oa
GhrKUvly7x5m4OreRwigFBXltAGsrPvgR+ZckpOoRa26awaYeabRiBDGYFPtjqBXHVes9X1hoBba
a8TFmYVPBhVLHSx8x4n/mTkHP7QjENJJ46XDC4puEZo1t+O9h5F4HfdogZDiD2FjdZQciTAN6tMu
ZC5icv/TF7CY57VKK/6RMB2U2+yolDTc9Agtzhs3uiY8abcOJIdHUiqppqEeRtaodag37dQD0K6R
ziJwFjc68SUSQ81g6C51sR0/lC2qgahZeRI80B/GIvvusuGEML08mXBzZii7OMICBx+KGuZWUAW8
GPuDdQ5KnxlGgKNvmgJjK5Wg7h5NqF5WB19FJZ3U27twYS5bIL+fj0xaRyiHrVZyn/v927I6QKDY
Hml3CgvoN2mdiCX3Tzp5y5WDaj/Wy10PB/b+W03/ee+DkVijUqnZwB7/VXizECIRK6kkb3wCvMAF
k0WJJMeE1Ns8u+8ND/5H6AQuD/vGxcOUqiTrz339cp8U4ZxkO/7E5AY4F7JkOMtfnQtZsPTCEhzW
Uqh6Uk+2MwhpgBCq9cETOICqcWag9F5KZWfIJTqXdB0xEc3gz5diIU1NnJ6KEl+Tp837huKAdhQJ
DVKH71CMEgApwlbx0VWYWhE1lnhte7RMepM+UwsXDA03hi1xtVSIb6MAsTCSyqlFw7H2HnInYM0h
KRELFI5ct7ZzQmzlitT/5C/K6vROdPlZQFI+IOoXj7ziumq46VDfrNMBMR8WTxJpM6z5dV0TC9bE
aQH5IddyklAhzzIbiZyfDHEwose0vPaPFEeCJYQYCtoCYboW+zSKHmKoUJWvcgGgTG+6syXSD55Y
XZ9Et26aek/JOtll+6sGD5XzrySE5a+x4s7C4wOLQ2TMRWmAzAFQ+UDYdHiSOPoOvu/+CdB0frI4
V8WfFc0uxD65eD5O//kw5TeEbNnq5INxta/aGar6iFB+zk5pZ6DI85Ygm08eDnMcmIbcsQc1w/2k
9VRG0e53ytpgw0FVqotlddPfVc4KfmKyXoreBF0lcWx56qFTG9JpDEyEZSpuRT+Sw0mkuKBc0k6t
oijMXYGW5e3yeTZTVJN2fn5hoJIv3BDPFHkhMtCHHlQn4U1A46Tzo+XTsHqKlRXvHN/ffKfp6tuW
dH2Gy0f8tqP15p5AOWZ7ow+XlpZfbc05OknoVP8Z2USNUq9QmJblYKxw2ZNMKqyFObD0j8eE7Stx
HTneQbGYsQpJ2cYNSXqtwGMifr3AZtd8aU5O04pAuIIsKDicLMIImDMahtqNwpBf/qNHl16wqK/Y
+MmC/vb66EAtGOClRsag/Wsas20pOaUpT3WDlFkAkOzXbUu17jwLTGMHB+FX+9TL4o0FTbBOQSoK
HG9pbPCemz7MX72gPToq/TP4rh2odw/62w3JlwOKKMpMmlOJ8AD6PwuvLM+06coMVEa6RFEe93lj
GPcYY3Chade/amR5FlBO+C4vgHzkKKSeIamOeA0FvLT+SGOKdbr0FpcETRuT+saicmyIXEgGtpbw
j6TmqyXEaiug0r4LrUbp4PlzBSZflyfGnvBxpZ1vRvQt9fu6iaPut1nDHugpkRoYRgEvK+nWhTQv
pu22XJDQjiHwccmH1HMZre7eoTBN4tUPSqUYDYeF9BTPRpeGiRq3n+ufHVwvWSgZaPfvDJzMltgS
vCB4ZW2M/FurdFP0WPd810uJPubnqY6E+4l7PQkHI0/y8mpIt86HmZITgEZDuujDnEoBCBaFN5ym
vtezX57rOnjawfi5FKRCOztPfsi8wrN2rembLjtTA/tcmCjTQuFCn5J7Xrm3AQBwDL7Q9eiRsAUc
Quf0ysRc/NASQdInMzN8ysYbXMc+KjxQUiFCU9pBYNQEPBybPwzeOrsX13k0O42fo7m4A6hJCpkY
vyaQsuQQaB/VBZOvRTlmv8eTV1mxie6oSqn094C5gTgI0fZgUB2d+0stTSY9VcnfhndNOPgVaD2S
4L6v25L+BK7sj0AgyuvWieZAelTv1wRqvGXzcuIjHSVSkjpvK5ETssbKQfk6mZKxt+xu6eCANBOo
PqegJ5kJborfALmuDYTxOC4HNI3CWBoPOTE+LlRGmYwzkh/5ZSGTXuSDgvrGNytTh6bxxzYXUGfO
LeaEym/qWzmBbWiuSJt0ot0KpEzDwK49TJcg0MPNEQdAI5wWbLygJAJ2qBze/cI9MOmd2MK5qfXM
qLeFVMUMqLjv3Fs8a0pbydCvun+bjAv6HqMg0ZwOXGQvGWo+WmezbJTEYkIZDWmcKTsxtIPHOaDD
c5PNQMchNQ45K+gPsV6Sz5v2AipZuu0AWvscBVIezAM6TP5akl99msIn8n8T9S7a9fkUXNi54K6O
xW7WfAgDLpkANdBeRq0o4IbYZwstv4hTHLRDlPRZBaAqU4asV/6z6qx5LECk1W7fIdLXfakQjOL3
2geYq2f/pW1EAsb8avwR6HyrXHV54D4RxZTbML2ryA/4Su4jvwYjK89UAvKBENZydPxmxXu9Rpk/
S6bYxxlK5Gyvv2GU3Mx+Ip9WGATC0JY4N/E1Zs6vpYAM1w3f6bxbHCOFBiBZE7U/j4hTE7t7qXr8
R1wszAlB8oLYJIWNJhnaaS99MLfIcBWVI8wVhZ4on4wzUZspOW858ZltRNwTUWfad3XPtSFuVx4U
6SvaKrP59nZ7+mTBFdVnQ+h6X0uscFF3WdRMQiAU8PwWxwphKIBu7fJgLmj5LIO/KWPeV0+lt/Js
7oc7x0eXd4yHv0aL8y0Kz8r1WXJO9YIAXmtC5qV288uagtakqGSDN7Kij8akmGrLqo8MkfCrdR3L
c+n/0JPdon7GdDjTzwU+gzo2GWqQq+19Wmb/QD19HJNvaUjyHwAtL77MFuiSn3DuXZH7r5eOxuLO
pJ/wu3a0Ud1x8vdOOIBo1+TJg83TBtFteNNiLFQZVlUJ336P2A+jRKsW/XjkTSebUsPIaMUhVUJH
50E2XaY8rqt8vpiN/zsGRbRb3YjOsSJ33l0zAQDjEvL7WxwLHAAFE4oneuxYug0QnoOm6dEmdqt3
I6mUCHybZInDsHubBiHeHyJuyf8Ajm4F43EKiMIidDhC638xK4KxWjW2tcGmEhUnQvJvI503F/OR
n6FMLEP9kt+szaFqLRorFp6pCguIMtR25cyfyBM853Yh4fjMHPBB/BmvvjtNNnTV0qrNiu7YoF34
dbhOw5OJBbb7q+Nzc7VpVVfVglSiTjdc5Rz0IVmAPJtgDCk2n4GUYmgYrF//N3phMTe34dJbs4nI
XjRcYrPWRH+VbJ5mE6PVXOK/hJtHE3ZBAKPhamJJMns15D60ds13lfxkgZxtQeiJF6qR9jp5WhTz
lpZckG6Ds+Wz8OqSFdc5d8A7wGhfUQt1vGtUi5buO33VA19SgZdE7fV5qup2epIoGbwcOSdpwswI
IWWk4Xc/tuTbccaZSDk8TwCscokPjdRE4bRYp0/YpWZbFBWKW5V42XC2pD4YTsS4+aLpAkIq2zUv
qJ3047viQAjixcw+AvaUcZS7VVUZvc7EJrHjlhWLWQAQ/nwn/5uWxRLFDvyAXGmxCdx4hiWOWQTs
CFdV7yok6s5eauT+rPi8Q/9gQR2VXNTqKEz9Cbv5Cpb0J1e5LUj9D6lp2A00nL+7kE/FnXJq/PGv
3fEKB1BgI4FLS8dS/MRsBcBygd1WmsIfuFWpeQHrPNF7Mk7p78x4wk+oIHd43vg7j0KFlx9EIGdp
s10kYPMIa7xJwGP2ICGspeJ8Kti+od2JEZICgnfufFYxTg6JDTjMGVYHkcwY7xVaM+mYSZXg5tLo
3d0vEYhAGQ1EXJ0uEp2yv4YIu6jZvPNVEpnU2Sf3VuuPnSydKfqsw8GmnNv2NSaG/mCIhoNfSz9D
h2cuQyyp5Kapjltsbop9s1cNChrk0yWiNxYcCSchqqQkej6XfNbHenns+5Km0t+0HT8xSU3CQQTZ
zqC6+uUq4620LVpEKNP9AQDsy9RUrK+QVJlX5PYUOrfkPGX+M+cKD2MFTPRiymSpUEa7ilzuJpo4
0wnLg/MKYYM4KpnB28wiYZd8QSNOHr2Wr8m5Xn9FsmOsA86GIPPkNPlxiD2LW8hthh9WUGBFWcEi
V0NWuAZRi9VilJQU8lyMlnEQrH13ocA4eGGm7mi2kc042QxJD1ll2r8S/p0zexoXmDvr2CBhZUcC
fcubGkNDa91kono8hVPYvz5ENKKAR9Pbcon+V9tpDnUyBi9AdC+YI9arww/uxRwP7qp8JMG6oD6Q
lUqECunHUYm5WnUOfEKJ99nHa8kkgnk+mAQ/u9MttiqpiFcwvCt7lm8nmFnaUa7x4E9h0WcaVkNo
tI4y63fRB4SVtx9wAlLc/eZQxnX/jQ2Bj7zp73X0D1MWz9IdWzbqLrIy3bg2Z0RnNQtusa1wQHmL
9Y1CD1Zvh1UsR00eWu1O+O/w7gocSH05I3Cjgrnt4jSMQuM97DEojJYtTbVQXslKTBolsM1gLJ75
56QkfRhZgylEJOQ35YM9nLlVp9IrVI9QFgVLY/MYgZ8I1COtY0Q+W1nr0OgPUWXlFCWnVNCK6eq5
l6TlD5ztVI3JP96ljTabIqJmOVY0tBUAcN4AgmL8cnMARP3H8BsRZ+u+Ms8y6YPKUwVQoM1TGAZt
3RokR/5Pr61lt8dr2az90PFdLu468K/5CxvlGsh86419X+kRFRWZerboGtjlPy/L8Ydov80f7n2w
9NRH9IBlred4CnXXeTsqND4K1sCm2PBS88uaPwUkVgWtey2W+8YJuF3oy+r5pNOyN9XspKITc0Wd
xHy2SBksmJqIcLAS90WYtJMwPfbnz6obf/mgMCP8myf/IVzJI6w3rO/ieSSPF9deQ/N5uioKb9ih
6lo0iQhEuu+2Z8BHIHlwxyfnXCTvCoAc+ZCH1c6wJnN1A/wpKU9h/Q5f78Us+3cHPFar3pgTkU1f
9F7EagCcqPg9Che2996JLEiV8qTR8iVTjD2hnSJhPuBMxm5CxKFpARy7uoAW0d1fhW3Zo56WCBfe
ZrVFhzL80tUkGHwLb8NNURp20qmfLAhphEa2Gbbd1uLmkKgS1b9XHqKqBfQzLcVu9plMngJGJ4AE
Ql29BuMfUwmfK7KGyvIpeqgvTwd5ltjysymtppcFmXptI41Ih6FJXVcccVHV0BouneapZM2/LD5i
PBKwdPGY7x5FHGdMAfCTzQSpMpoDHpuWwH50UDLxAJjCzSaKKucL0sTTu3OFMey8nnPfMCW6FN0v
7UOv5jAaA12TPSJe4316bHRYbQekM8h3zobMeb8hLPqWDxn0XSWNzyMeg9+ysU2VpHXjfVsx3xMl
TbzV/xB/ljN4Vw6q5Ab+ztqKm1zTervOtFYaG4Mv485z5xsjgKuaMUoidMfwWfieawk/+QzqKWgL
rGsSqTwlkpp2KkCEb4xFsBd9RJXlbffln0AWbZnKS+j75ijOZ3L1Y87wyDtHhhUxmUZOT1RJsZk0
g5NGRHGaGH3YkUWBRutBgg0GAfabnw+enWZkqavNbdbIaJeZ94o5JKYkBgXfbHBDLZJu+9GIwM09
mqUKDauxA1rkjDnfU3EgckCBJSqK3ec+h9KIoU20dBgJR3gXzD1fjZ663op2lSDucc3hUwQhRDYs
pJvbP7nsMAcXe8zLve2bDZoeGd8D6Rip00aAZV9QqkfgClyhGMiv5YQKdQlIJ7gPjKPiYMfWg35e
broVjaxgWsusBWuaan6TMxXOwLkq5z9E/ZFqA84OEXukfcsKuPFdiK3l+Uy04yjZJLdBDLab2Hm3
WqxStC7G4rniOssGW54b5V0IYDUB+5vbZu8RGzx+HcPfbnUOHnscFwk2A8I/VGpdu6FvkXFP2M0w
1fYtytpxW+LEIR5DXC/wUdfy02fsxX9Gy+VrkmxkzeOaFiI2+mSxCvFDpHh6US+FFYcG5CuzpQOz
HMn19xdJEEyyS+l0EsPuJzntd6J7l8d7RNAhWa67m0oM6aL2kHBtZS1gWc20Vcolt25Y32n1pfhf
Jtd+48PdzhIjLRBthyDzJkimhHQowYGLdqE8ymbJ8BbAWoUf/Bi3GmTOt6zVFiP/dWIrC2T/rLXm
u89TdSWoLVZmM70ktrZrzNEjCA7hQ4fALehoBNKpG4cIPXY1mrILGzAs5DtzK9/sB/Cx9gmEn3WS
rQt9yDhHc2Esg2lNKcRGpiHp6ojVdCiKRdcNb7mQb9jhB8lchnq2oYuzGmuomNHdxOa3jOEZ0XWM
eJ4C/jAzBHZ3lW32cSrwKT72WMnwsB0kld8yRYl5AtTIeMSkf3eGW9Kkn8OGJgdW+/6H6MWmWQR0
TDTjU6Fxm19nB/JydvbkjCqs9DKvCQmiozLKvKdMECyPJJ2SEnAJCyduaCQon1cWHxS59BEUT5Cm
nBeQv1oNbeUdeBl6mWQ/h+u75/5M7FHCvx0mxo64Y7sTA1GPsayFwNnLSn2ksvMSdZqNzqqn4e7F
ga0tfuuIgnJQwJf3QLEAya8yqQZKVCphk8snboAv/FVu+bms656YATnrTstI5EfyGTd64QknXEQx
gh+2jEbgl+Qf1AfoaOWQsFCLUbmd1l3wiU8oFoLCTQ2/9DykPF5YVs1zHiab/cQsaklPuN+OPFFz
HDecXAYU+9EWuS9XatMRRs9PkNMTUrMQeyavpwvCCNvyGdvVVA3G0+hcKRar7mAvtX59+f0ABuOU
5Jp4AvZ1XOl+aMm+6rA7TMei/+ZClitV1IvUr6fbnjRv/AVwuFauZv56X7yX5TMDa7fb0LNvlTOB
/0qa+54dpVs9v42YvTTQBGrb1vUDmSfDGaO4sypWNVUsNSPO89qRs2SCz23MEvVIGfNQIRpkMgY/
V142VW+hoVd2CzvOyVlfDGQuQnq1CDUIl14ag+RUdZHAPfmkq90OID4jAj5/yAfjZVijC/hsDanE
1W3UPm2u2Ap1iRi7aJJyYRXRjajaSg+B9VQPRJng4ASM48aCflLSI4m42jCycNy8xNJL2oAki62P
WxWSW/IcfvF+2thgWGAx0PhPuO7yMJvcIFDbqJN8Ndo+yGQ1Sa6+f2Q0cHW6zI9VSBgI9d9P7IkB
aLxOT8pubD7wyswdJwpRSYaHPx51notNE+M4NB4hi55F0V9rlPqj1cjqEFaNnj0xZMz3LLAPhk/r
mL9S/Gb9IfEP61ZtchG0ThaiCyUSmhB1A4ixAc/x4Ptd2XLGbE73v5ccj9nBhR99oOOiWK1Gj1Um
C2S5d+diEmJqOSpsHZFP55OYuKbWt2sMG+JQCJI3YtjniigFXbPc1nsYD6oyWvOMYVT27dPE427m
p+1uIz1+zpUo80I4OBXT2HM7tD0wQ801bm5Qonlq4djEV8l1NoXPvPQM2O/lzzDfnJt855dkqx5z
VhR2JhbqY75lL/r8X1flfHe3S5JcjB5JjJwZUFMYbrlu0NzijOR6MidxXJ+ywu+5w8UtW+ioIk/m
RS3//UdduLfximxtIdZSgmqj9TPqPmAVkEmq/hcJxU+tc2dD9xGbGtHmHMvuTWQeFAHWUG6Z7GqY
HWRRwVbQ+24N0k+0nuH8qD5UJ69pzp5bqQPMnD0WNdWWjWYC6FhbjBJzPdP8HX1mFK5Hi5eMEuNG
5FrM0CSwLqAk6kIC+3jJN6xwOxfvn0Nzdsnw3b7027vvTkQQKzDF5A3UR0Fw+INLlpMzE1ZFzHJ4
Ods0oLKMj2f0wHnoXEzSzmkqJGEMMGMkK3HPKU1hY+1Tjvp/Ah7HdcwV8K1ocHxmgBKj4q3u3F/U
pCZmXhWaSbDgRwF5CKV/ffjuKituKCH3l+i9aVym96W1DY4QvsPabUvM3TtwK4OXB/hvoXTFaJGO
siQsAbKw026W5Cu/X6yeRl/MpWGyYCVHq2txLLMsvfnAsrV3jpqfiF/WdK23KlNy5OrxKwyYM+Lv
yujUpOADOhxbQ9WB82xFi+9qYuIQCIJ8nXQEQja0bg8zFI6stj3gLTU3nLfmQsiEzGDFePNZUO1b
jOQjQr5r5GT/gPDIey94tnhXz2d6Og/XtxyzUIJDNnrsbhA9O9SJjJJyVXtn7D4YQkwryi04ySwC
aag5RQRU9fb5pgy1kdaJovsBNUr3WdxXpek+XFZjwtdfp+9CZgWnYgyWWNZP0+2rCTbxfOCSvCDn
JT/HLbIaj+EW4fSWJg+lRPBP42apGfslP1+HS+R+fQK5iWGheIjvfg94+WVtB2bXH6sXvtXM5WEO
NDfsmjLiODVyCeiNxsFUlHcC0FhpeHTJMoJuogdhnV8hnI4G0XSELmhl7GmvkP9rSlY6Jqp9G29g
z7MEmYdlbxhjdmoNayvYBxxthVogE80xeDY+mPfbxn5IP3lwhNe2yu/Ckcbth12F4Vi8Q/6HjsBQ
mf+3/GUoG0/2azPiKC/kHkVMcX9R6/J7EaHZAfOqNlzaKGUEKChtg/o6/k4S2arGJmQ6uaKWT7QF
aWU2dDP4zgfpKkhPu1WYBal/TqA4BSmHvQ08zKhSBXZimvrt1uMLz6hTAi/wAI8nmWlm4hIO7Jlo
XPY5BfhM3UsoJty03TgkuSHL7LOlcu+FBV4kK0BArwHzDqBp/cipX47h3g3BjpXbz0SMihSDERCO
PFjgGYxBCNF1BPwagyM9Mqsh7LzbBKCJv+X3VRga01Hx1mslUrni4iPsNWoCxWDnPmeDuY78CUYT
sK2XNULduBdD1PZi6ZHE11ybViQNKao/EU2g92hbc+7hCJPSfAeSJhgaY7J3UkbJDeqzzn3c/+Qo
iv+/3PkeEgInM3PqyzbUFL0df59rUZgSOzM5yFauPOCzccvUI0spuLKzwkagZ5FP8BA+137wctHt
FFlXIkJk3F4O2KuaYlA75w1AJjedJJAfNeJgHCC2Aj6B75yw+WAdmJadK9+5K/Mgz2hj1kE7s9ua
9EGCvOCSpZOSrLQwOrHeWonzva8IOXzFxj1CcCY6aqxgUE9WH5G8b4lv0eOK49V/pxohxezPPCef
4GlqOyNJM3edWMnn6ek4honJiEZ3JaIIf7FJSVrPSDXn84B66QfL5NHWV91WdBdsD6CfDJaKwvAx
w8N2k4qQ5uO9t+ujWDjRe582mfMYhWwYR4kEMef078fDzaSzQ0Uf7QNeA8tvL2vyz9q+j8+e+OEn
NS24Ti+JVZAKsDUNxtyKsJKAkUNNszhAaxOWk2NQmRYyoFdC3DIdpRNeukWuFKuw49smZ78HYqS3
jUo3vxovHhpuR2RnDj2VdJpVHyRqRm7HMyiSCf1JXtAaQltooQrnbB9bqA/VTG4jOd1p5KsNZII6
XHhuRCGH2hzRd5MZ6s6Qg3V06njXoykUO0+fL4YtxMfqYP8NmTc9NTOPo+XVy87kmWYJbd9kIho0
AjWMU/mdHDBpfzj9Mrq5qSVIV3Q20UFlT4aeAR6EWnn6SuQi3+cX9bgWqkDrLsph8UfVDThengX/
4QSgV2cWDJ+Gqw9hNLh7ljYgakJnh9ONKl5hLqpkobCzToJlSmd6VQc0FRBIKufUsWJYhCT+jlmz
zKtwijvS25cnYbKVNil7DKN2FEvecALQIxed4RQ0kMc1vV5eJimTxJIQtAhjubNFyaONIsAaNWxP
UaaHQN6czWVoAj7+sUbS7uZeFsvFnvZsII2CSePlWe1a/TsRnauGXifFyjVoJLmtqI6cnoVXaBdv
MEyxzOEx1QD+Wp50vM1Icv+zMKchs/qYYjFQ1ElygP20Z7i16oTxFhTDo4SQzHjqaFeW8j4dQHKx
mmzbtfD8HsN2Jg8R3mGTkQ4Eo1KqR4318TJDpDw7fBn0nC9eOY+6oKIAEN/zxEQ8Uii0GNixNxk8
1pLIJ2OSMYdtlPHk9/maAlfMyO6drT5lhAvX7WNRAu1qYTgNn/9SxhJWYJVTJlxWsq+bzOoY5MfM
H45RT7T1jwfg68lncqTKm4R1HfztXHxuaiXVPyHfEj1cHM/ZqDbajQ3se7076svSxXIlP+swhK49
7MQLVoomWTEwg8rNOFaBPtwAp1zMw2wc8UKHVXxSFRdifjTm/I/CGsbTQdLch+/nyukze578c+rq
fcv4nh71r7Q52URB1ORqQBDA5SVSU5pLyQiMW+saj1Ncck5kTBSh7XwkDNBn8812OrA8xlcGSJOL
3bM+nlJMMMj6CYgw1B4NuQjD1TzEADr4KmrKLwzpT9jfugbzPUBjGl3yFy+OdDkgk9V1/mtwg+Fx
weGLoTVas5F1Zkmd4vT8HD4efWJ4uC/ISfkkIUwBF0au+A/ZDqR1O18X3xdir23vIKD+hAhmRA47
Oj+3uZMz1nKzhYsH6p+4xVO3GGkKkSc2VT/aXCB5Mrh64n9SYmkzSku6YdbS+PIIGZ/TXCtzaOJa
U9cIpNGXsWGlSHcN0p2HsKE2guuPB42H86rMH2bmf13NXqVak5hFboi6jXROFUAblYLC7E9Z7aN3
GtFSDkOGTB/fuwKQBFPb8+/6AxTI1XzaXSmyZrO/KrE1Q1A+Yn0TvlKrjezbvRmNbrgasb7Xyo8c
9w6sSo1cNOGI7cLWSXb8ssMARN6yDPOXQ3W8QFYEiqofcxCm7+Kl9C67nLXmWHSYYKT8GUsm4o3M
QcmK7fWpWk/j8TKnZBqrG5clY2lWQU7uXgQ5wDRRlHlkh+pqFgJSPSUgZbPDkPTSyNs57O6mT9Jv
5CCfQNDHPw7TnCaGXGUkANdB+i86OHhFz884ObDBRrhkz6mkPffV3N29zQinJzgFXj8y1GjzdLHW
sG7JVnxw6hliiGUSbhe+HuFEs3xH+WchNxOJ4LYXo5YAOJSXp4+0GRV6/OkwUvbao4zKVKMvyBvA
StKhgNdpF4+2f6W/fQ6dzzx6dw10XD4ndZ/7mPaUa4pOxNOCSg1QmVMHj+dYr76kVRma7kTM+peM
/e1W2VVKn0lhRFGezbL3nBYFO/BOWwHEjOJ0Pws1WiyGdVdQTurx7ScwhByUylpdPsVJfv+Fy2o7
aAqAGmEIXyTexVYi9lnZlMWZ58eDrWEg1lhg0e4/9Hkd5B6mdOA+tCJ1zr5chdjhhgQOwkgUDylR
qwquqEv3HSIrzWB/OF9VrHuJMfH2IOrUzjYB3NVR8/LIye+2AM2kh4CT6rlYiUmzTwBiDL1+UL8v
aMU3EJDGEpK5h6cedd692WdnArMOmWery/dK2Jki/5CTBOtowfzsAflghuTD9UlQZSMURuMhHOho
EY2wVIN84tWZCVJWvJwQVOD8vP5Uv5Dgxw3iFJIcEtRQbVEcpsXF/TqkV4ohuZ4JBrPH4tnR1fCP
j6FHw6P7JdXVEa2Hs0XkxaeCBu/UfgWhKlilOAOMOccoxF8Z30mf545PgRxNk5cD+sNeJmSBjIqG
ULJ6ajmalOCCZg9x3Ne8pSgSXxLnH+OxkQqxhfCUWQRA0V1le+x8rQGs6ZlDIRnfeiS6yhj0BkHh
IgyGOo1yb7LAZiGnHTga5zbju5DkAN9FUPmYgJoyWu/wZlBjfERj1HEqL4P7PYzsYtGUwUarY2x7
IhJo+cCouDdo+Nu0YT89/aE2TK+PreXFsUInNLWNA+NY1UklQNJ065VjPXAUFwyvpeoHTXWh0p3Q
wx6pQMINE0Qd6523bfUZcdQ8tCcLsj2udWg/lnmfgGrG13UZENQ83TgqmoJK6QTyGMpz9SsAnLuQ
mIf/it19/HNe/yuT/IhFtBzvLJXSed/VxmxFfpisCk4yMq60nTThiLZFuxw7TLVslIBTspAPsvdK
+wgTXra7dvZgdsrGmviMIv7BX362aOao7n+3mEMUnj1BX8BJOnDR/Wpq8kiRQT9FyIMPusjW+adu
cu2QC/nHs59W/iI9oNpD4j2GWed6TVHOHXLBamLcUrcSdDViH//bZy8/4FJBCyFRCMqFmt1JZ6AD
/ZPehfwiFMCmyWtqXvx/h/e9upf/U+CZR/j8gBg8n8EpAkKrfeFRbPuyipHJkDnncq0rE8Q76lxe
y69OqCbf0ZcugagRNK9Rqa+gvKuUZuT293bq25yK2jg4XZ6nsgVQWWNAwV9GJEBTbvpd6WiBvgWL
maRSMHFJLad1bnTDXC6cVAMdTDuphsh7hmlUL5xTAsevnfwS6jhDjAARoZJ3Fc0kDo2KOr+515qL
6WVcKoZzs78QXxt0KJcxCCxK8kaHdEMUiiNSy6zN4oG9dV0KhP5ajQfCyXNC+BVhgZodRU+47NkB
+XcsdmOugXJUB3kyI1j2/fALaiZLRe5HaBx6ywbdvK7agqX0sDZg/LUcPtL9Lk6jxTMr+cswlLH1
WMtAVaFaNCtxzsbxhkXZywbXlr4KNr9yn19F8i1B8kAn3eg9uIIHkZ+IyDDM653ZJWYOvg7yniYA
hMh5YLRO9ozsjPs5dwlpiIbPIvjuSojYiTd1v6f+VP8zea1x0Yc9p1S9+62FFGwFOHkI27HaXEoR
Ly3DHjpXH5yL923vfnLw4q+lhw5TOO+1//nHdefP80CSg+QlW3SL02ir+1oUIWzXUkEWYrMQqKyN
PY22Ee4TGmSU0s8KR0A0x/ze3GdMjoK5YoBbytJMTzJbb2qwavvZkXM4bnQ8t6hNNw22KvfKfWi1
yXW8b4O/wy6qRd7enlTUXHiTyuuUojCBLKNXVYjHQkWpwSZV/YajOogDyD5xUWjISiBowuts8SxS
yF0lndXecNr3XtE5mVSut1zoCD+hkesndhdnGy6poZ+WK5q9upjp3niOs3v92YL80xbt2O3XiBWV
Yd5tqYKaPu1IKqEKQ2KngD/sjoJGtIQTKeWNxuQL4WbeP1Y4jh9woBrLG8KYkInaFQsO5Pqljxuo
h/PrTjYcL1BCjseWCI3AK3ot9ywfy0v+jYT0CNY7xsXcJLrALeXY+vleMzPZFEdph92cgSqmRy71
lC9qaR2WG0zUoMr5s5KiqGgThHpZYGPMHm0elEIy6dVzA68PU39MBql01CgDWm4IaV1DISOX+WJG
OH9Grcz/3pFHGn4rbYg19CGSwucuODLcc6HY4VSM2d+VY5gSHI2OO/aoV8KZNnDcMas2aBTsys3H
2Ri27xFhB1j4kq/HlAcENk2sAZ1lrtfXpLycXkvs0Xqp/PKMMQNOmXO/4XJ4V12O/6Aqeisrrm1q
7FpmihPRn9kMICjefxxW41CtKekPvlfoQ2/Sq7q8V4T3xSdjvSAaOP4Bcc6oAelN//S7Lek2TXY5
MtAUAGE31N5yjTW3wF5IMcP7Q1xb+l5kLuT5f3gAJlm1pJ6O6NMELGbzWDoAgn/cB/URM/WMsClU
niyiQkJHTe8Rw9XOJsAxWld+6ye9Uz/ZytlPLW4Rq+0ey1N8y4+WT1kb5Eix/tb6z98No5S0CPBX
dKI4YlwxW9no/X/HDRBkDZiBHLhgLmsJ0B7RTw1oKYlQjQAggp/TGu9dMfC6qt4stHvEUEuLRy0E
iAV9LiqTRM4wfIK5CI+nAZb/vTMbPJl6c0MNDzTvkpQ8wbvQqcVTdG/Qq0qBtiWntIo2RDskhN6c
2pooIkO+D7d8KEYDgMsVHZgGyoAyCqZ/S5IaVBVQtVIe3WAplHdn3tXA2aJ9bs+v8m33e3XsESpz
LXa4CU9FGfS3LzbPQTjBHoQW2ugdUT8VUBXmJ/wypcYetOfXNApU6t94PZbTdpeEmzJ8uw+gDQkO
8O2D48DmOo8bed9D3LCmv0ff5g0SZpPZWJcuochT0lj4R8Gj8s2V0qFuksHG0imvQP9SuTM824P7
OXOoPpZMOBR43aXO41AnP+v7icMrvM5HD6D7OEqICFWVQgqPwreWIhM4ESYwMLn3uP/6BMEte2lW
woGUPDVC9dVzATnZ++/0s0VT3/auwgB8lrtcFaBi10hVm8G48ZzNwzKQyY8r006ZtgvxyWb/ZWzv
7meFNnZzQHTxsbxltNgMQE49XvcMLKO9DoH4J3y8rx/bG81XY7JYaj9JE52KwTkxnB4QP5JZXfdu
BgJxNYvw4lJLdcjQEMYJRjopLv6Airclp+FPJ+h/uw/e3OQnxYCl9VVqxF9mnJuY5td/N/LZuGSZ
wjGsrKmMTaXVv6pCMgLe/CrbnK0476aVBzTcVc2tE3m9g0/1mJbq3R3MzXU3/87EbbddKvFjDKir
KPV2EFy6gYjyenF0mmoJ9PNFEQU5pA2jLk8+8Y4MQ1XLJcaiV1QOtpA2/1zlTy6H9Voc0OSnQU0S
n3RFNFWV6ScWlpHCvuabjZVTQzc3xyJmQIxIESREedEfihdSaFIMWvHYJfWVvUkvLPAgMM35swLH
FJTmvjkMkPjREy17Xefntbll3qWWNBqO6JLsiJWOkEnTJWsN7UBqpSPc4LZCaQcP1j52Enzd4O+q
usp2Db99t5nY11sPn+924QzZ1+seCxBJo7bF4RkzBMKC0vbMxTc643wv/9rBL55cSwt6kCSPRJ4a
FgRYx81pQI5zsBmox9o6h1BkT1tqzrC11VwxT6gubSdWQVHvA9dMdUTWIoy1WLkAFuQwmzoqsJ9X
dDJKDbbjEg3XMSyJxHUnud4FILYrBBAUwqTWGqea657QyMHAqaIw8vv1Cz0LGuWsoPSnz+noo+q3
Oyih+B0xzcFUTChf//m33+1OSpTvzIzW7IVg8xYyylUvZXlhiGj6ZooBKvQgTKNRGfH0RUSM8CpK
wucc/0xr4qVR6g6oQdQAyDa/HWXYP+hvjmbDO/HXoEN1PzbiAOw2WBe7iZIUcA8fDrjVm3PXpIdg
0yZhTJbnGnBrH38dfLvRnSVz+qusaphCXQKERdQtQQ3mRFPYUW75+Ur8RkAWPsI+Q1sPgUrM4RUA
m8xg4HQyMuFtcR2znXP80J/LOlYEbKs9MAFA0eIMyQyveO81ndNgJfuge/lgbu3HjqYT556AVMrb
SSKvI0KlrZpSWyvn9G/tMw+ZlIF/H8pC29yL0ULhkIU6uZL6S3HUmtArqDl/QmTSSyAcTwpU/+z7
oaHWJV37H6hkiv4MYvobYb+Bkwm/r8QODqOwvFguCl07Wzw3VvYyRNSptaHiuZEXWN4asxWwTApF
dvgmKlzaMxzShm6THvqqsrzAEcn3JDnMTzbuKoyCMhMCjKGOYMTn+T4TyVkefLdsF160Y6Ll1PHV
DrIc1ubH2qLkaCT7iKVt9IxxLgWYozeXFgQ7SjgYJWBQ3WPOfzSI+8PT99I9BWK2EYU6UeFaaOMU
WMGn8CZDQGuth+sFtFIavuz6Hi+p07IPttaIRYBBCDWNADkjbeifUK3Y60UudjGxLi+S7HLZbExc
GM2ZsCV5vpgzHaY5HICzz3K8FKmRgmaFaYpWrAku9sAU5wv8MMBzzxyhIARW7EH9VnVSHssmcIlg
YthqmTaJIGwk0H0cpDanlQz5P5APNa4f3bcpHW6qAKtJtA53dN0Xuh/GF/pLtdTydksyRs3Io4bs
w+Dg1zfYbmk54gMy7XdOLLQ1vudi0SoYhTHVZqmEH1U27d0JLfOftGv6Ob42Qt92p0LJXA0W1k8z
9j8H4Se6gy/FHjBvpQZVtQhmSp73Uv0dZe6MjcRDSry5/LMyBY+JIUlRDKBJB+sBtrZRjmAwRm/W
3eodh6O/GR+yRHyWyfBKE/E5tEjPb14klhMI34GMBs3Nz4O08b5IVG51zDCKCpIUnG1GsU43VCSH
w7CzwNlUHJ8N5euR1IPX7/l0oidw9DYMTI55mi6RcvaHiRI4SI5A8hM9n0Q/2NfKTdiQf60QgsF8
aUdOxcq/M2KmO5IhCtpQosoud2mgyi26mxeH6+WIuHYiBbwSEgB1zX54uvJpPEZFBZ23qk4xjKmB
3rqJm9iqCkR22sGoc4qin3PJkY06OOd/RqLcXGwZzpV5Gb+2NT9wK1eUmWJUDQ+QvGignf46UiDp
Aww4ThPxxLChBgO/iI0ltYu3Qc4OhMTiyHkQWvl0BRBtnQ1ChPp+IkSSFRMRipjFbev8DSdLgGFl
YP33dh09IyvlY6s7XD3z6sHyPD8Ym2eTf8hfRJLazmfsMbxq9rdoXOkUJ5MUU0/DJeZtaF+JRH6b
vlM+f+vNJpscM9hebMo10G8LZcS04xiehylc29OgKXEn3kZel7HyGV1HG1rcRg0vfxa48mmFWqwd
kAaZxqm03raDSyqhHwuYKdKHhvr8Im41Tkmevrb0XsiGQRr4cRk469rnvY2q1ZP5mH1e2nSn1YrN
PoTHVsQOdYeu3G64HIfsmTtKn6feMw1VbitJ8Vbr3Kg606elwIaChgMvBCQYSmo5TH7ZdHyeCuYg
JXVHT2tr8GdHIxeZrthrcgkKJVD10zIWjmX9kWZbvrujOtaKxnd3JdSaMZBooEpGWZJgc1XEZRMa
ujgiX1PtTn8uDIGJ4qfUJgsuGkyojuYAHIg0ktc5nw/npcXQI2qHVjv+4xpFgukuMsgUI/rxnwMT
CsW5tRCmlJEOaPwulIl6VzAFb3fuyAH2fCOt7sklkSl/Hqg08DY9zbdod9MJ67ouW98svGoziq+9
344jHaNpLHYPvYsQq3uycnjXfT9mrk3KBlYSkp4iQqE+lMgtQ6Fzk8BQity5bcNNvnEFVIDH3HFC
Sjv4/9BOHoAE1ahPIxHjQiBdeLEPqsewieE1p2VqzUPOX/kyKtUhvroNxR161sJuIxmNoqhGrCur
/VxpWVWzY9TXSo26ebnMmWE98WaM/T3QZNnaYmKb6AfU0PHPah7CUfva6ZhXulW2otCpcwQcq0AG
LCPQw7WJXXEB/03b4vNk2Zvnd54iHW2d6vzSL0w8O+zZwiiotP3AY7l/COcyooialVms8Gfmjdc4
M8sJWeEINkiwc03ek6V6W0AM5IrA8kWqEFguFP2SV40MlNS3wUlO2EOK6HO0wrYaMLVHvJfwYPnq
23ITxFKc7hcARamUQPZ8lodHzA+kXWSq7QhTedZ33mpVYEVGjd0VmGv4W70h1SH/ozqCZmoXCtPk
Srr0MNKhDYmMRu8TYBLG62+sk4M/P84aPnz54rOsH4vmazcKcCtv1Pm+NSyKj+kJgx/81PMQM/VR
fSy0oDnWdG5fYVlN8tLw5VsbA5ivLczXOBAh1Kwr4KuXa1LrbEPqS2zP/NBTFXm7YeQBdiHw4IJ9
OYHIt18U1YQtWaZ7JuD6e7z+i/2gLugtQqdhOHDMscMPab/HIWm7yTHphc5xqxpkoAHdAuiP+bGF
tN41QDNWFydL3PP7vnuiaBVlE+5Mscx6/RilTrD59oR2uukcjDV7ih/e7EHWxlZNafTTjSfDVwCH
x164TxrL0kUHrUn7chfhO6UWbqb9XpMJeKmWCqZ3tGUtrRb8YX7CNpnkEJp9xq1E7reDz1RPc59w
AWwez69eZRASHvGHczDbborhzT3Oqwjk/A0eZ77SV/E1iZCtBEq11EK4C6oXOX+Z01mJpmxr60fs
PruOXIzHxydQ7OjDj7qyq8uqZpSdq49X2iwss+7bQ8PpVmTS1Iz5K+2EKFtahUaVO1EAbVCWmu9u
UrIl9ArkajrwcUjNOAxuXySKdgSShJkG1tuvb9/hXECZ0AdIOVbAKBydGmOksKGPwEBT5HLkxjp3
93957ScjRFmaUWFKRVDpg9n2WkARM2vN/bre/zeQoC5hIfQSESCskgzf0vm7mfXHP5mSQcOAvwTc
KADENNFVb8/oEh0swBFXdDyHUxfoW3LmgxTe2tQQmzYSbSJGxVcdQdFe3pT6odlDshVJOCjqs3U8
70SL/09tBT5KIxX4wu2tNLIPyttUj3zxv3Gc+79jCS6EtjoQG/YWuGM0m8cfk5EXd4msE6s7HeUl
lkrZg/LF6FFTqPlOnNeZFGBLsdGGTVffbgY6TYHCdq3YHN934KW351sG4PTfJXTTULZtFjKCYhHM
O081bpJ+iIoa1r0/D9oOWR4pO/1WZK8xzjssX5glr+2+pl82c3VVr8eGofsuXqEceTpE4EmY3CYq
LVbw3DfQaxL8HX5O9EdYTFtnLQxDprlZERPO/5Q59b+FK+Dynb2od7tBcDGovdepI74fyoO8rqGj
G2+xgNBFuCzEINYdzOGQVODa/+7eDq9z6dYA+IxzkY7QMd5MwNcC7qa6zBfF7ojdfw58RueBYNgM
cPeqPdVIEorrqpQp4k1pgVeg6UC76Bm5TuAp3lh6DNPqBxYEhVsgxLgAVaxH6b/etjKNj12SeQoV
X72as9T0ny+bIKuyrKmDUQkN42R1nKFRkj74EEkIrVEVwEU4w7rG6DDZThhcU+DF079uaks2AGtT
eN9/AzNDVI111/5ZvETOhYcNG0Uzl89U3OV5uu3bLiYuauQCnz4NG0u/GkdK32t7rgu2verN/AoQ
jyz8tIOAIoNlD6SfR//3Ax1oKbTjZchyNKbJax1cZtEKb0De4S/XT1EVmGyI3N48aL4d2xPAJpA/
C5jo2jBBRr5TomPFO4GIqHrqXrzfZAvNxBr081gjRey44ZoYHIyY1/dS/MmpDKoznXTLMOZ7bmwO
qeXcB+Rt4TcYWsw0QPpNA9XUOjuKsonqpSEONU5qUm/R2eg2edjq++RXeiCjPhdj3WxbrH2XhvZM
0qNs4sX3Vqln4AjsnX+UIGLw4bqcA4KGC/U1OnFWElcfVfKsFJcr4fkBlpxgV8v4FcPEV6WKHCSf
RSWnW8bGrNfopfRm2BLzVXKTjnuVi51LgBEkvBAaL06Ahz11FhqFjtL0wQiBb9aBTl0gCDQhzzhG
B+lyTnLa7d9BbfwZcsvwhChEqH+K24ecPMyNZXanvf8kOtWDP7OVKiTeJdJlTb5fh+SrOWtM3aJ7
izkpufVISyn0gPKXwZq4Qfl3+kAC12EYLm6pHc6KaLcrW3Qbuhe+jbDIVTPIEbou66VTeiJjgUHb
PB82LO1pZIdnLSWeAL1earoMBRKhBBbxzs3ppk4jtE8s0kPYQJtSB+OAVxvLBw52yu/Q5WL94bO3
eOUl5wYcxTQvr7VqAaVKtsjWrQAylARWtMJode07FdqPcmuyXGGDaQ68X3TJVJMXf7Z5frHJFxRQ
wkFxLvStDufwYUMplK4JvTFUtBJd1xU0Pw+taFGd1mvDKzfQBXU/ztqT4Ky2MRkF3pnB+tfof6bf
PKFeIIni34w0EhtkiagA6jqePji9cPFoyvyJDDJj+/H3kKj4Oo2fzOA8fGtxak3uFSOH8MVCCGe8
LetvcfSCjcKEEtaIPxXjyCwA+OiJ/C9Bfnv2vE83IULZCitCdjfBNAJSPOsBoUd85sY9n5OVdpG1
rNj4YoHapdPAE1wMnhoR0E8/dR8rBJekUiR3GYWnEl+dYrMFV+G2lCraJ27tqtuUBYLCq9cxpmjh
JlHmz4KoI2IDE7vb7nT7HrxF16UU7l7SkzV7IDoqlyR4GdpTg4i/sBPmVlk52LJEzO1A1miaqwa4
aB1nL/9ogrSg9W+y/lxFIac/jqLjK4llNH8R3aXM14r11Sgit8p3X7CFlRnA+mkTkux5/oTantye
7taOEM2X/iFlMeCVJtRFNJdqsYVXz9nbErNY1yMFGnzM8e2IWXW83UjrEp+yZPpxsOkzFQ+mnGQ6
QqOpOG5zQxcF0Z2+Zb2+cupOsGV3zTIXnUmB+HyI4KpqqsZryDIcNPUQIRrEQgrOJ6H6p/sYawVS
HYoxoCWYKqEUx244+wQYsUTsGhNWY6bwFjcuidKyAgQoypRB5ilkYByypo4XOpvzQOZobWjai6Zb
tuMgKZ65LtNtAZ22ZojLUGKnhOvt0BLwVllIzdgUvPqcBacBlY+xi273y88SEZexGVgxj5uqgtd9
DQ32MhPiupI1wKsdj0wyQBLoQqBz1n1EOoRvxqkRnK4QBHJxD4PS0SoFmbHyDcXjDVHWIvP+yG7R
/YxU2nJjKpZIffx2CBImy+hd0ZqOxpAaNwq8e+PVED2wzyNvrizZahqedz/cjXGiNAU7QboCSHo+
otgrWc+uw9XA47YEZNLEy2YQu3TfpiezuCulm82agKt9izD09QAVu1bEyhM8UV4pO8Tz69q9o4qn
MoyRc4KYTLCtYaNc/ISjRxiWFSYudgcUnwP3EcwvsUeI3TxJSpdOF1DTAolep3sU6ZAJjq0mnVnm
M5UTrGZnhvUN97hfOoEYtDPfntCMLUPW1ak2MA9paA1GpIp0wYlt/0YwB8084Onv3JCeUgm5m8V3
hgvR9/qhms3siJbR1YRpPIw0cxwbCjSgj/y60vfRh0ajxH84aYaEL3fr/beoq6fhcPSc7ZNCHdRj
TgBcW9DKmT569qJ1pTD2G/p9slSKh4SOW71gg8z+AYbLiRE+TAk2Gasg+tt5vOeAyqi+K51rNoxW
qfWY2WzfCshs2bEL3wJXVPA7cvyj/wmbhSmiMCaWv8Z/+p/mudviYBcxGrmmIkmfulTNd9zrBhx8
MTi2eAvjxfmtd5U16YtyE1kBtWmS/g6SB9gcQ0mUElWhRXkhKePstceUJyr1ZejFD3ZXopra74ET
SAIVppnrpFzgV+OneBAEHEOKI8Bqm3eTCmaUEP3qMOoJH1BdJQzh5SNxvxgEyxg6sIalt2xoyscy
3GkGxJIBkKAY1E8glIUAVmjxCe7dUTJmapD/6v67tioi6FYPvbsEuvb2HeaRa/muyBNh++6erENz
KSE8G9zzI/1njXjzZga2TkDdLLEmT048ZixRsJlhz9h6MaUXWs9uf/8G5k8N5YmdxSk6c2xXtK+O
QkwkjcVV93hxo0HePHvrYHELmX3nl54NB5Lgdes7xT7wgOKw+mYhBtiLXPfjjNCRDn+LalI5gJR+
fTqFva1zUzv06JIsn5oX4Umh7BCdHe0JuVqJXjBaj1ecaX9hXh9042/N1rE1beiIRuNSXTqEGWsa
ejqg+FSaK02XAsjJORrmfvm+KX8ZpfdCwGYd7sl6OOMLHDcEioSXRitmvuH3NHAFTPI0drrFxUeF
3qkXhUyhKj8Fa2PWNMGMzRmscSiDu3lZyz/1ZWwBBzzKxIu4iDUSHimpNJ9KgLEVK9UXFBY3hFRH
iHo132E/DakjQWYHwVsyMEfEYoNg5TMN43CVF6sgrSklG5hu9wULloF4O9z3btD6/YLJMU+vsCjJ
97fuLSwPagjxtKoJG/Kp9rAY0+prg4ySjGSaHxH0sM/cF/TjdSIAEfbucygJPPCS2plrqL1iXUJ5
ICJkl0bUtaiqzoHmPTsZGqy3tSSc9IGtLWcU7VAVuv1+FCUmnux2Z7rGlpK+6SFZw/SQZcMj6JNx
eJprBmmPXRVzAHGjxOBGw2G8teGIHEQsif1nz3LodOSgQbX862Hwi0Tu5Im8lDj3AlPbx2Sqs5xO
idNU9gETXPqxcOiiHEcmmx4U0n1fkFZoPS4ULbEnX8lVckQTQYZtxJ0k7IVcem4gxkCjZF8ZVQrw
mG2hbTbBC/nkkDNwzzrEhBhuf++9rl+GzgLzqzPNKKVzSc2vOSgF9o7JQREVdKxWJIM+Mxi5gadp
xjz0ESglWEsiB7FiNdLZdJ8G279UUVAfBM8Uap6wl1wTzTZzLQ/HIdA14mFmlx74WT56CNwV9kVl
cXYfIBAMA/Jgt//60MEA8awZttK+awxCW1UgWieaBTJtV764N7s0cHHtNuqHIBk8PjQLDc/Q8Adz
kmHmaetEBpLmx6MVhCyH4co0/aW1EN1F+MDeiI3hZRwrU30A2VkRQtMMHsYhfWuTKlJ98q0DqO8n
ICUyrUB78m5qslGVYcLVJHbi+TICEfVP16Opu51eX/YsJm7EWqpevd5ds03rBsnWu85iYsN5M+sP
fPRXFWMVlGoF/XLIMp9s48ghqDIIhzqCG7H3sdvSwtuJq9P06HTvteV40s8BpHw3PLNs7Ybe2Avp
BMTDt5mxY/VNGClRKnUURpkibB7M6tLR+Xm83PDHt5+T6/2XBP383Jv1Xe+Pl/wG93PsfMMvrLGx
xcc6fU2MMSHy8ISHl3vpcQEsfm8+5PxhWLDq23pUucPdxPh2+xEpG4I7zzLj83s9Pl8kjrvWROB0
6lZgEqtUz+LxliaIvJkgpXF5po/EDz4IhORLZgp25lRjjpcuvkWZEpljJlWpaV0CjjMTNWW96oI+
CCu2nUhTWUsnwKj+zSst2J5yIwx4sPg/DD9tKKJ4wxN23+xDozGTKdX23k1Us/gQNatmtsK2O8Ol
xgajY3ynwCQBz64WFb5WhfsYJGD6llVJBOJJimsCOsCjTFiebL/AQ81ZwhBYFPHffWw+83kEtW82
jy1wDxktRtD/WPGlTyrrSFClYhVHe33ox7RJa+hyjin++E3FZzWDRZruiIBf8tXoGbGuHq3cPeOr
DCeGIUQcnMJ6XSb4rUER+HmvhvrRaagyft5YuhdgncfWzYP5N5woKZFtyr4KNNPBrshPktIeI01+
GqL1xdq78e1BWqimJMn8XVJ/3xgg7T5HA2a3iE0ZazLy37o5oY4kZgwNIgth9CbsEVJgxioBv8YJ
/YSCNe2zN/IIlEcPdB5H6j11EkVyqJKUH0m1A3NQI+7OnLU6NbXZ7I+Ww2YFQRrte5aBLrJTXDv/
NIVnyULsQ3AMXXHUNhar0+6QfuNfR9EGVS2BgIZ6x5IOl/j8rR7wwyG+Hmx7zCRb/f5o3UpOxpSS
+qr/BP+7XYqcWCECCm5/FIfALLh5S+zXZZzqbuR/gu/phJ4SWUv8nmadVGC4c7HNPZb6uN781PJF
9zqUlb5mEQ/cWPdvSX+8SUwOZEbJXOOHdtGy3tamqgjTqOzc5ij9TWwmICm0HKE0AcDgYk5f0BMp
t6BmaNA1CftyH1zLcH5cj2ExEF4P45sNm2OFuJd5lcQz3Lm6zjiQrJ//+by2nBjIlswRocrPOhj8
wFPdnZUyNe2fFUBxQan/+iivtEt/kWMtIASe3YHRYHeIfSfkrE5f7fJnseHzakTRHODCERBzqopN
zrenw7fNT7Ka+7Edc1CLVVykxslszt3ffYw7fL2lZ6S9zYuYCgBNXzBeN/CV6UHUXW+10jVqDpuj
V6juMZWknuBZvYlfqCWrERKC5sF2Bohi3nM8BEG9fMxNNUjtr2LTKnVJjtwvdXwRYHw6rxE0Jssl
p8FdwL6Yz++DaX+oaAwMuQtl2BhjgPPD2txO+xVJoiz4W8P9oa4pa33c7BpkgETdZKDEhPbhPd42
OxOYOsJ/kEzyAphrP0hyA6szzJtIas+MRsqoo5OdyTWY4daIRODOe5PuYHnItneuQPM0XDblv8Pf
jCzreuO0N8PUw/DdflInDvvcgebTSuiAuAQV9f58faMt0qKjGDQSsA6SHFcOzLB2gsisoZZKJRKz
14Rr9mwXfbKyG4Bj95MnMg7TNt/tcn1cNJFlX6QnpcuEaZIyUCmIjesEPBCoMuUp4sz8MRA2pi5H
vq30/NlSCjd+nUi2P3oaAkJxPVHH/esApWmmN3RAGBTgIBIsAXZlq7DHnNAYbAEOezWWPDVfK+gh
M3rMYYW7SZS4MEArUk53/sU70tuwpZB6mlbjPZYtg0tXZzOKxEgOGYdaDVY/PlTaelca2SpTTfw8
eM7AJfxXF3d76/4/aYPCjF0cwM/k41tpY2nJl/kqQMtjlI6wJm4N9YNm2rdBYNEEEkfawvDKs8Q4
gv/FTKqTt3LWlqendgqs19Pjjx8fHGm5c1QfMaDnwop45R81z5AEf6nEMGeCs3V3Qet7ZywDEqb7
o6VhMZDnVVI1R5pKEaWNvobx66R4P3ruPFuKya191VZq2Br+n2ODtaxtl9DkzBGKF5h/7ZQlstZU
W9k85TMkvMEzYgUY63XNglbUkloxU0JVWX02SkU6wdpGqOvS73pxe2JaPWZdUSbXU7NJR565wpkv
gl7012DbzeMOb4zYWw7v6oiFt8OGpTsN6qHJjrvQ/RgwCWrCopvcWSmUXZTmfWqEnFsPEkhQxNjd
xfqBepd8OMIeDQDPQMmM8vWqE3KnctgnkSoskS996djsjOc3f6qtTo/JOb6rq7cjD7uaTIDCiYb7
o+Q3SZAzEcm0CCRNkbqW45LHxmy7EvFuc0U5uFgD48Smx+eOANaJbD5hXJP2ApjjgrtNQIsnajKL
6GFekDfYxe8xZaWJgscZq0gzFO/S7lNDk927yO8eCDroYEfNlUnG3dby3hpOYed3opWM75xRj0OW
gEgovsiZNRt3wbCFsxemVExeIsxHQc4QagFqPmldvFEVr+5dYsaP8OvzOaPMoi/997LmAfyxP6DE
BKhsKDUikOJER2J70dm1ZKPZXP+rth53P0RUa0ORKsoaQgfAJF7QO27XRZAUleWoVX49cFrpispr
sGB1jHGhqK6fOGl3RGcOLCTuhzAlYdwyfihjv9q7ClqWi9eQzFJOgcQTxeVmVEgYticyt/UPmH0S
AshAxwIUaXF2Ozqs0zEME5jRBMl1coJAR/Eek9zNZeaB+ilO9rTJkiecvA0XfSIyV2E7MBjmNJa1
LeDLLiYYAELOTwuq/rljZVch76BgcQIEfBOJLS1fsbbDuU3f7YnmYxdOkQSo92iBt8BnmwAQKyA4
pN7mPuC5g1IsbrXZ0jcUfAnP+1mNS5L7x3l6it6Z29I2qSFFsOC9QrsNQ5pNRG/Eov+8WhLvkMwx
IyDC7i7MdGz5LgWOlci406tvsOwcTpL1R7UKHJVzNfPKJqyV0R/f15Ml9FppNe6GW88LHl5hwg12
WsO7rRSDlooAPCv/OPhv4scaM5xTTEUvjZqq8BWRV4BRsV/JZ9vZqP6udcJkgT0LeaHYF6PGsiRA
8IaOPtTTbNGn23U53c+nDHss4IRgaWB6PBqJ6uW9SsxmbJIvCpXz7NGOJaiK3Y3KAWKqnmz7Q6k7
u6IA+rEl7x0SQFjOQ9oiTOWz1Pp9k6BXYKl46PFa3h80/kSgqxOwwqlyj3kKB7jPID4LbRwTw8q2
FzLeAE/T4y/H6RotV6CamW7AUL+PZZ4JvbtWWj2KqdvgQxPYChFYWbVGLbBT7g6LQqoERTIKIrsA
8YCTvp3jfOuOemh9CMb3zfHZ8T7cyS6Rc3G8DlvrKqtzAEXOssbHle9bTApQLDQWptOu6rSP7S1j
4nFZR1+BsMdFJ6nU3EwIp6zB8dHpUIEeV5vyIqlHB2A9fox7oK+h6D8aLPDTC5JjOJ+3CKVLpxN/
E/LRWiLNLv3IMt4TeK/vZsEIU8RP+62/ArXNenfzGq9lie57rrqZrFV530IdDg+P1+bGZgZI7mOd
JQXJQ4Xn5OkkgwYHaxyk6i181DnVo/tpMlEPM55ehfgcbS0XHF9CcFQoty4oaMBuOTXWgff3ssKb
egCRwafRwYqiE+JDXLRohnSNULNayoJUJNWZh+BtHWVZQi0Wk8QjfuCBTXizM0TpUIftBP71PLCR
2SL4eDsCZCf/ojenHqQI+Yd9St4KIuU12S5xXVGznDPZzWqyGlyePr0ecKD/NaQKmpHtk3X/PVJD
HwkcQ/Aostr89PBHV9XFM9ITq3bi8/sw0AU+3/M4oYfEaw/09PS/OPjSXw+yQhebJgVb2vz/4W29
lLEph6HMfXU4pAL7lyCugAOpVhw8jtl9Gdn2OO+/kcaC7hV3jau4uHUGZtTka7piiVZ+2YRj6jJw
cS/Pohh4HO/Tsz9YU2uE3TTcuTC8xQKUJCv/PZ8gPH0OVrTcPfHeRQzrGtCPv64Tw86rltIUq8u0
suQLEkkwOa4HvZG9iVWPXNfDinPFQuNaVO/3rGmKrpm3jWAYeLLV7HvLz4EagnGxOJnU/AzwbniT
DUaqMd57bngela/I1yZAPrmUZWzauTFrKrkxLknUjeUiGQlQS0uGYS/y8p3g6PQBckiG1hNi967G
ghVidDJag/4B5DifmVA8X+U+/ulzV9JM38uM6p+mq07OMWSkIQZhjOaH7cc14YKxkQhWsSD/kBoD
/61klllNI4kcrVYKrQ+GFyrWZKQQ+oFhsLtNUicabHk0s+mIssxsUxY4VBcBJmiRC2DZ/ZXj003O
EBsLGSQU3PfIWwkVBbCmaaYRR4rAUkkYUgzrTROFnEcve7QuEYSIV5KlCVXPvDk1i7QB2IWAUCbL
z2HptmyEWACt0zbyeOO+NjVJ+BWRRLSS9HkCGibhzQ1leVQfYXWK4MwA8UCIZGm3TgpJutodt8Sp
h66Xlq7nV7zN9SlmezoaKsKse1se3c07xTskpAkBYprw3PJmwRgbi9K5KuLwBAJsTaQOs381+FLb
18tpfXH7DBQyW167DphZpVlqsVBf98eioNdjii+XL08jB71WtDe0VIN8PS6aZTWxl1r2wzwtzr6D
/TcdUFMJcd+1628LXLkWx5thXe/qbNjwZhr38bf5ZcdQ/RtMSHPiCgxrEigmBSSTBYNzHaKmen3E
9/1i3+3UZ4mexGI2i8pTKaVJZGROwQFYLRbpeq8RstqjAZIK0mHGG10nuz5Ss/zIAO8XhwcYSRvJ
UNSxS+BRsL4YK2e0az+fwW3nLbr1b7qp1wfo5wsqmt/NHeD/SabVBIOEmfSNKDgmdQ0tMHK93Az1
kMfOOVMV2yVTm/d33ocLrl/YIf3SGobBz+DdLRdmk6Ma4GLwKKYXVhnhGL/wbLUK8qC5DL0M5bZK
Py5YmWcWEQtHPZZHjJUyIH1QPXNz4UoJ9PjUCvVoTzoUoUCTO2wByTcP96IEsdVZxU+gQoTJLB/C
15tsUUivMZKKIGqvDgS6YUKF8g0d9RbiqpAXX81R72Z281XLD4UjB/kEIo6T8HWtFsmCey8ZG23S
MnWE019yHeJYBzRAxmqYUb3kQKB/5L199eKmULRuPLczvBGlnIBDENwq4PP1fd8PWTRmC1ecmm0d
iSCtaW1W1VQV0BYTb2uqLx7nl4l7MkOOnYgrXwmflxjpWdkErYnT1vYE64/JxJjHEO35VoMvhXKe
kmuIaWZUuEWa4U2pOEXq76DvXPjUY4RyukI8srVfi2z2qRP9D9P1BwT4iOq7HcdmjTN2mEtNv5jr
gQpDjE2errLCD/Ybl1Zw5+dxcUofIyoiG47/Vwc6ECcMWO+dEaYu93dG6NgIgOPm4d1845RovlSS
xih0KnLfqRwBKpnlso0653oniOPXiA2nxtHZOo2uQIgpff5mgHTrhdNGjoyKATVoqf/jMQ5NdRLo
r9xfOu/j1QtWioXcr+2VLzIOIBKZhTdYxsxUA/goMGfchMCZ0KsAlAGN9FcLBCNqn+r+VHt3RaiO
c9DQBcBPWodir4XxCF+/T4u9GSpOIl23YRcXcvBzZVRP3m1lwqWpjTMCjUvSCMKAw4SsBP526Xf0
EYENoNvQIULLSSPnbF5f1g6kO238uxYsxdtGTMBhDrJhVmWNlLqEmIAn5b+qP0etZt99Diqkg5rO
KsHD3Im+yO2S/87v6SH/fLyzpdkUAX01CUwD/YluWtoFqx8uTu8Xv8ZGWZgem2AbBhj3WJU7ZG8P
nHNVIbT02y6c9vj0l6tBSxPKRcUWZ971u4N100QN+vqZ1Vh8FfDbjur3LNR2Ac6Hl0v5vsf+6hrs
BrJDmN1l3ONpTi+1QdXR0o1p/X5jE4iFwewHu5LvDps5+TdTPlhl382u9QhsAIA2cLMI2IZ1Lsof
SYq6jlWSIpA6fbAr7SNs/YzL1p5U1SmOZrjLhuswMsFnGBtP4/IJKmq8GQCb2HmQGICqq2K9tOJs
LbjikENNi151ZqcdhDqdoRkG8k20MSDTj+ZbnwmzdHOQvz80sTXiKzFGEDF0MDHX+an4o8C5xxZm
KZea6xvU7EZbIqMDQT5eUHx781/MAjCe2RhxOE/5U0zGCDZH80fb73KlEeFZdAnLo1Qqi9atPZ5/
0BU20cO0q5biJaqndEPH9pdmayMVxfd+gQWEcbAEHRXuqtNRqFuijFzVhr6ALX+nANMSlCn6CKYD
EaK5j7OLGCOJ7fwhJEv1vvUoNRdlAauMREGlag9jSEWwtjPqVc1eWSrTLQbl1WX45aitXJu3+YGw
USaaGLkZgybkNKwhxNgLqGapPvTaF6tfHnZ4YIGOs/KQTPKtNhA8L49PSUXT/nxYbs01yo+iY+2w
0Kw4TjxffczMKhTQuZCZZJ8hjQ6mLNu0IcD0Ysb3Fgg6qbzwM4nXujmOG0w7KnI+ZShogz6doo6Z
xX6HTSvXhR+wx4XRMSPZ6R5jwKl8S7NDZGg2FuCeBOevSYSbqgzpRommlTaiRsnkiLcQglHNoZml
DXMp3oRfwNjJcJfx8lAH/Bsoly0r1rhT6Q5hCISKsIyhAQ3JGvPK7ddvHeEzp+l2r2j/TELDfdXF
+8S2BZkrNaKbe8G8fLwjuOB+p4DSrxm7AGKhQ3NvbQuzuC4g81Psl4j8sbUzOEnGS8StxeKjYtXe
bzoYRdUlLr/PMV3mWqvpUcFwTwb3HbaA+OjjZclBiD0xps4mkE29ZENIsfCveUV4xbEvBt4DFOir
nqaaBW8cRivLsKl6Jk48yv1Jrp/YIYNpZ3gav1ssVtgUWA6wi59QYo3oi0YlEiil4J7B+vbhZ1dG
hJv2wkCeJwDRBWS9VWJlAD6m5XAOrczHHtYwqW5AtR96CdDR2ZIOSY0fT2i5oumICxImj/mvVj+B
0dnAmBsk4rAUbbFoVgjdyGPvVLOUMrMkjvMlUNDw9WuSqBBmqyaqlSehz2XV2bv1+EpeBS7/F4vK
4D+A9HP53ClaspQQCwwa6aKEBVbIdF/5dUhzlCkFfTGtjdnLDgJC4ZA+w0a8+SDMmvDMV9Zkwkf/
l0RNZ1ePvqZfGk0ufGYoCSeyoT0PmvdUjTdg6Lv44wGfCO8mwORpZrjKLcEq6kn9xNCMFilgTWD7
whTG7MzWp1yuHFHVkzKA7uDD+SmbsIGZyZGZVwAaOzp1/4IPAyoNsjX1EoaNSC3nFk6tfYhAI+tW
lZl1r2FMuCAD4tCeMBDTbWFzy4uR2StWyCH3ZIbmdPSZMAfhJN8NBlEl4DY1bqMMz/zCBvcc42Je
JwIfiTpX+aCAA3IAde+kMiTuM6GwjjidAiAtJzNjWQV0VhfBwY0+bu8x4b2jUdTjg8WBzxDkmlpd
Oxw/VmiYmkw90g/EVwpzwT7q7xQ35hEeBxO1D03mmhAMIxqVrLtMhAowgdR9Ew3fUWJL+8I0Yi8t
YqO2mG+e5IBYrapPcc6PYwxBaiP5Ymzo6pBACpMQem/6rnN3AksqUnM4BzmFIUk+FSjnMLxsQsCA
AytkwjC90RbY2hiwAySC+qppTs8AtRYQvDzA3EZaymD5PSpg7OGfanXH52FNg720fwX89QEswk7s
XY+2dvOn/hNzLZT7q8gLQwQWL+lm4+W8v4inCaCI4lKMmum33H0r+cgY1lbj83DpmLYk6DafFOsR
yIlPCfBWE7F6ea0Upa2ji3paTsXvIO3p32QyGM1EPQOqcooU9BpjbJqnyosVsWv7E4ywb37yJ2sR
zSBeKW1NH61Fuc7g3MkambKzB9GrgcGq/mVw0R2YehNqDaduPAozUhufFj1v/13EhDY3fmKEAOF5
pOH9JARW9BRlRsTKEDj06kOpauBqfX29Zt4P3jEuXKJrPBwvMRPGNRiz9m+Dvsa2qYJdgx64nPdq
MHrjXGWgyVGUBqHAUIkll6Ni2d8cQ1FzzH+D0o1g05JkwQxHlvZhckKE5k+gau0HLJAreGwIrt7j
+qZw4Dey+BW0aLf3gdGK7bH69Rey0Um7iiHLTcO51AYE+l1d+FNRM4HDmSNsEbT0jFXia+HDAXxA
9Fne2qxR/boMaUalq+OVMP9a6DLNjWL0pdtEvQz4vBebInQQZCmV2fyn8zptyq3VzjALhWJ0QpoA
vvW8+T/1gKSyO1JkUGNF5pGqm1IN3uirlbVEGBBKu7d9B1YfZV3HH0610oqt1l/n89Mdci0Dfv6N
YhX5+nZdfRBgMnjimlGaFPcMaI9QutBQp6qn8ng1iJkng5QhOexAE5cyTNBDEm7TBs4XMEMPIfyd
QvaKDdugoQqVLODimUXCgcjVgkey9ysmh5PqvxeF7zHg4GkciRJxHWaP/bPEdkd3HlankTBLv6E0
eKFOUiu8GIDw/2U64OdOB3qWSoDcdN1THqOZvkZXvGpW2QnQTyxcJcNxJgDEIpnenmE1IpFKJlYo
V/IqRwTUZt4G7XHD2NCJ3uuIOHV733Yfds7zfm7tXJ78Qa59CeVQAknN8CIzzj1cQsKnkplnYgAh
k9tCIV2jeHxk2lBDCJKQOs7eEjOlpVqKMILFDaBcLiFrDB1yOPVhMD0IeJxPKsOpuM9BS4CEw5pV
oBQI8MtF4ZkE6CL/Gmv6T1eJZfyiYXMzPVfP9Y/Lg6fB9aLiFR/rzbONol0hW0BTwRvjeulOX9E2
5xpC19ywluS2dKCxE1w9B1h2xCeBLmitnRrlD46oZY/SWLNeDGfvmDwzTaFKFO2iwJqP5cUVTaFS
o9ftKIVnq9Z0YvuXInwp3C3gwFb565MwK9+DAjfe3/li02DJ7dAQHZxHQX5hcZa3kilSkR4q4m7N
MVZHch3jKJekfkjvM5bWlFzfqTlSKe5GPm/oUdy+AblUrzQlOoXb3GPPXhps/uyc2dNnf3HHO0SG
Gaw+WzSfkFASL8NnbxBHAU5ii8ckTXpQv/yK4kF427nSvVIkw6GCB+wmXW1ncmdK0StoBnLfqK61
z3uuKDrI3oOOvphqe2jS41fU56n+abNzUwttNGasw6gbyDbEFhWgpJrqi+cn5NWpSdZ7C8/IyniR
ANLMtkxZSCNE/QFW5yA8fqG4As1SHF6oOh4xH4JFCnKo4T4mhSw4qrLYcWNVe70zxlLYDbOY5cln
vrjUeOnHXQygsS2/IT5Bsm63YC2kUKjTFtMJBWt280WQPf5rpbRJceJpu/Ind2hVtAcNFKnNWwBM
nqhhEBowoHvEL73pPzWAEW5iI7G59a9BBT3N8iK7KHg2pn0itrNZ1J4WjnijJAhwWNJrNf/aziHV
SoRZXANEAuj44MxarChCRoMvSO47x9BTwVJTGj7PGwe9kUK6wtKKkf0+vYoixLjoBzQXuUGyUxh0
tEQkA9NBgvA4Cpsu6C0XFXxKmEqNNdJGBWToJd5P6nGoqovv/ZRlaZ4qZRhYRDUIC/FGsbAvRoPT
H76KPz7WcT+Et2VkCCsilrQ2bqY6tx9UbQXcjmrxgHzEBEuiBT0zK93AvjupOXH1l9PghTWyw2o4
xRpgUSCXNBdBwU5BYlcibL8Veay8yArUneA9NE1IU+vS/qEhELQzEUEUZoTSF5T78yvrtcqqWqWA
fgEG95JyTpK9bwmWQO3sUk2s8W5GRXfy5zMEHTBK9osctR4CxvMu0EAHw+fh4eZlLhSRhC3NzwqH
G6bh6wJLXiSAbmSkv37SVXeRTqu+57RyxEGn626dOEhEDImXf8FKmGXSXpfGOy+pmzwCKxEQFpvX
Jpb0MMcEF7Lpyd7zdXfhjvGTlD/YLWFFcHlSgBZjOnjkPlxUPC7KqTD9/PMwoD28JhdEP7HDEKKB
zV5GO2Q/y9GwfVKSD8m9F5530aV2SkfprGsab/rJ9+q4XkVRvIcEJRkbM6Orpdj5u0nBteBBREg8
5FGcK8/cHcmDCZnWFNZ8GU8KlL3xd/XOxFfF4FQoG8Cp0qP0arX84gtwuBd4Vfe3Z4nE7CywNLkt
dbPkwY8YxRQvcZLS2Eg+Dk0+kzWqxiiQ2SQcG7+H/b8gp514R3TBzldiC8mOrjsL/OCsObSTk4uZ
Ej+nHtzpeDln9m1fa1R8zimwomXXWek6QJjCSdNWE1/WNJaflosVnsI1WQBwl5GqjWZJJANNSOwY
x4eRbOeqgnNWf/G+/kjMYyo/VOz1J5wvsDsBXKAUiVh04jhNSbf/7WztrscbLKyS1PXFX0Lw3EVd
Us4qcUsx/gAJh+bnYKwG5Ke/MPuEZeVkx0HSrmbnx1eXAR/j2QDEe4UUlvxSmfECkIAbT6MJPkjY
GUfvVoWEsdPSLRkoYmyJscaOdjp8BmAuqO/RlTwESeHEemeiGfAjARAV/3aJoOWpZl8T3yQcIY+N
MB0PB0UZukCBBM3RRKY0G+SRj91QTL35By56/Q3qQXJ4obVQPjlrpuBjNMnGutQ1qw9cF17Y002F
30mQHhILNm73YyyIvkJ4hPA6nLKZ8ISjOoSxIT9mBKJ/dtTdPyefd6+KD3tCK6ytsEt1uaqUYC7m
ZoQDMyc1j1BrUkoM+8ZsNwptG0Qoy83JGgdeOdXukryWRWa0rqbhciky4xBtfIs/e5qg2QEeuZiZ
NwVTmWT28w1MVDCpzAHcubO8J3CEZ5+LJnQRGhcmvdd7vFKs+y6YjkssZA+1BtR2+EIK1RbkoWuR
6M6dHFOH7Xk22vUI6Ltqeso9sJSf2sdlKdi1h4rgSKo9kdqfaJL4prParv7HLeDIY5VXoW25YB/f
hhhkeHszPBI/5BidF7DsZmX6J8NVJYVRpoypaPvcxp1LDUuqNvhFyxphYnANCTXsG9W/eWFooTBx
nQXNW1Q7bp0APJyojlxUx4mZp+5zIqaG6rhwF4a4Lq8gGNnVlormhDpNLkMY0e9n/NgEAVHPyufJ
VNd70c3/LjwmaOsCj43fMB3fJ1hMfhL3i/spqKPhw1QOI+GHR/g6vZJ3+D4haHB2pzzSemCbv7yU
1jJWvSjo6kg+7D6rExF9/AFPI7mp24FUEcmnNEUMmq7xPuAAFZyJhCfjXpzd6GeWOwwF8yqwgko1
18m4+WlpZzKWXLsm8viMOMHtAG9BQ2tDKggHTkkpnB66oJKyIxZOaa3bZlDUdd3gGPWxYmW7rEa+
PMPJfp54n85V7LzlU3h0fd6BleCmATxOUAL3SpN2O8ik+K1AIv3JUfXWSto3XYkUoe2Egwf1SsGR
beeOW97v0YcevryDvvqDem2eNwCOVLcO7AMMWVOHRQjti8zK+id56F+Kv6uKK9HHZaKQmYsl8YPq
y5i/AcWzOOKPNzjFx1LVpwW7v4Bzp+BT6f/ydmsoy5UFogivWfGlTlS9ILVv3XnY6zXbKGibvZpp
q9cFAwTdE930iOM+/0MQ8mx1dVfSI8sGo+8VITzvm9EN+Tr41wKg0veU0cHHFlZGsBM5+t+bLmvO
FTuPNQ4Y/fnuVANWm4JgRjM7osUPLEKiHWKEbcUNQ2nQDwd3Ia3De9bUrRmxXQnuc3u6UR7vNmnx
xS0/hH1q38Dbwx7Y5ENyv7liDz7lCh9MAFcE8ePikCxrdyoFbEe9vsYFAOlpvc6yOf3FEhJ5Whq/
+00TAFdKxbSczZcvpKIjXbZ7JBrxUQWviARuuSFZ29yQhwoM/dZPeGKrexBhU/rKpYolqp/TARrW
amfIMGa3fILSf92wXdl/zIJfUpfGSR92spZor9nr4lNLhD7THsVQJLTwALoA8Ic+zPYCVLi8FKLy
V3qjAIWezsBOQ5iz7WnOg8L/sbCj16avyJzeNRWLWd17o7nXEeuOxD1HIsr8ySE43LAjz3c+pcqt
fcMLtcwLVt0TQ6z80BjV1+D6DIZ2Tj01xmOpZoiCzedGNBy+D/gJvcyrt7Byhr2GvphIp3jT4nvy
hCc2FUZNYJUoCfEn1Ct3OuHbrgLGIlGYnVZ3Y3dkiz3qr/kM92UNtkqKkKju5DMcaBOcBO2VgIJv
l/T3Cv//a1PswFx+SLUeO9M07oge7pRw/EY6/dQxTpH6Ev36zk2xO7DgdrNQAxqjhphBmEYs4x1a
Dw81lLJYCdswbs8BWTEfIh94SamRG2+/2qv69TcIpL+vEejOyEXwSvl2c81yLIzWKHSDEa5M8Djz
Xxn2eTjNSYf0DLMBzvPi7ucOKf62mIxpyVj4ZqMlL3Byk1HX60H3zqDhkzD/Q60i3rfs6AeIhIP1
a9ncRKcS7tTfHM1kDuhRpAFXwDIH9LI9Q8Z7cnRs0UOlmu0/DPtmoG74Vb+/W2HKJR6bbn/+NkKW
fRCBjvZg5LzW5cZ+YSQj/Qb/EfzWJMJQutTQYG7niclJYEdqZOpSA7ZZiAeYyYNObT2Bheim1N2t
uMkQy8sDs9WaT/4pvnTrTFWf+iUNXsnF/pTBpj4FSCzPJ1cdklFKWq9Lbc2JIo4gWny3y91RtUZh
5szddcnV0ERHZKqhJfqVAdWuVyD2K4yAOahSbRJDQ61o3KUlrpZ+dJ/EhaE4S4iLyi632YEJLXPL
kRG/O7zwWMsQBEIRteguJn2CDWrrTgi8UhzzuIa5JF1bJdLNgV47Yj9upt0V67rn/aVgciJSZEBY
40rou5N4TZ4UhbZSSuBMiydn/ytP2MmD9R6aVWieaP75/kW1c9NDB6wM8pXsvknnzJez8LqyURC+
eII93c8Q7407kUNP4bxx+MYKxionxp+TOV1rYzGKT53F3YoIMraGINox8TTCmk5/dVWdB0GNo9a2
9ZN8u1jiD2hhyAZtwFovzLfEAl+YlTyVMoDw3Nv7XakZfUVdvhHQRfxPtIPSz0M7DvosXSKo7tCZ
8cShs6J82cZWcyFzOcUopvR8y7Pbc1B0ZzR58VcSNLFsFrOZPYwUDSi9In8y+sGrKhCFjQXHNse4
AaamwyaJIfznattru6LB9kdfLjs0Mj+Gx+s5Xyzr/JKYDJmOuSsW+k005ZlEbXMDf+pDZzPp6gWU
6g63XBUs344K83c6KR3oa2/RzMRSxwMx+qKPaS9WrZAitcWBUkzE2lQb87mCxoTkopmdEBRguldt
TuMkCCQQazDXbLYPoUM/MSjjnXTyP51NZ4yEcUQ9j9XF/ZAnY5oeORkUK9PG7Sihq0qGQfYBF3P4
BSLTOATdGVsNFqI+XZFbJG0kwWVHNDJV61lIU/nTvXBJB16bBttPMQvCy8wApBnBMByzl0GutNZ2
8jj+9FbTrtK02WHrpM1WB+FolCNfb5pjLy1shJ6G1kxJiusjr0RByVbB2B8DwXTUl70HDv/WljDK
YaEFNUeacgiJA/cwTJGv4GktsWYTjoKHs6QXjBNJBLkM42E6sNv0ylpXLSSflYjP98zZmr28hZXt
3G7EIz6SYMUkUQaeKJZ4qW7H1iU+/tzdUHgIVkjKnrH5fzMMY5uiNMmRl1D1WkhoP8eZpYothEqa
4j1KHpwcy97rJeSBSa3VpM7D71FxMUODTdiJKwo8uwh1tDOr8xc17d3d0L3NLLytpnsK+M/MNxTd
MuoI4Gf7n4zcUOzc0MYqEZRRBNgV/s8OVWvAJb55yWQtQOTa8KmBpZYsP5Aob2IaHnEi21TpDcrO
88EaQBphypglvW24YPR7+udur3DZKJlsH5LVU0gbZPU63lk+TajG0clmOlXqnvz9IXt2sapFrqHe
1P9SzpKR09FyHJpIkE+4LQdLxsxQAjWgzaSz1SM2cCX4aHjzHfbH7D4439I40VUEVqTZB14lBF1i
zpsdC2f77lOyR5dGZd3IukPmlL4dtfswd1CZRQcpk1l8CUpwMiRRNBU9EX7hwtY2Hjn6QMBPqeoi
90/tXfy+RX+3bLVwiU2vHZFbWQ1ujlRWIPrG6TOiZrk5v4rIdy1Mb3pzm8PBS0R+Ap3JAw6q3vX7
yF2pLEJLZfpfpxF8BJ0TvXr1B9Oks2wskZ9Z87/Lgu2TIawMGRJ8bhLhbmLAxDSv4Sfx+TlQWJcz
zfkPqbWdMgXGQkhwxdy2zwQyib5vxNAqGl2h2+JC/gNM7IpGKs1IsajYdiinwhsOw6J7J+DOnuVc
DLMO2Jcb/djcj9KOJ4Bo7lCLxTtA1ub/AvfsJKQS6N19I3qvCx7e0Dz15B9DuhtL+xP4BEAviRcp
96HsBGQ1DtgBPzPLt6uW+8XSykuxrj3ryMNTx32PFZNIYxzWpH5Q2uvLrJaTBW3LweUcwhgGJuF/
oABcaY0UTKGmvx3Z8If1zY+zXENII4xx+94BMrXTe81CywulV4zfTMuTvNbJd4JehuQK78aKWOce
Wk694PRp294tE0E2qpAOSjsTZt1XStBLr4KHQC1VJmzpu4Ga3/z0c3ve1QR+BP9lNUlhHNq6ydV8
367K0wFUelqs4kerTLCtHUtRuRyZ55AYm6OWDiZgxMmmdkh2mX8n9wNJTlHoDmFParjx+FVoTdUv
mjObAmgHyZRpID5BkdJitMYG8AzpHfdd0dos/xuCuI1W3tmrE2sCLFb/l5M3CtG3wCI4RmbZeCB5
we/1/EjEqWkvWP8Qti6ZDvihPk8qY8ELCcoL6ORITY8+esgnQ2ZOCInSxK6u/CKBZ7zHER6+BHCw
P4tcveizAAduOORbXsMnM9RGxSVILY0bOaW3XGBthZkHDFOkuWQ3LKLV+KgM06E4st5/RTfQ1agV
nmoZ+ygDTao/Arn/uFohpzx9YAj1+7dNPXXpWA/qQNFc/0VAcqODnFBzveNvC8prRADWDsW52jrs
E9adOsDotQfjFsYeEXhU4KygyUErnpVdtAT/vIJTLt589AbHeu5qAMgfOJh0qXprtJQC8b1GF+0E
3NeiSU9tToyNfAF0gC/8lOpRWkge0h/J1syqanbs9+/mVgUomIHrSRqlUU/gU25LP5GKvWTxO/oc
DN80ZMEXyeY7EPmbxDCMqrb9H1c+qLl66Tqrqxw66oplXv28rmRVj7MZVpZK4ixrelyv0IQlEiAn
UA82ndwm0kVp7skvszdEgd2DiiyRSJmWczrlrvbPfH6/Qgdw6Ywc/Cl0qiBf7quaaAu4jpBdyEVt
29yuFbg6awxPVuwyMeK8xrC9WNSvGQVLdKi835lhe1VeD+/rZcZ2KEjKsEJvfHiEw+06FBzS6AeZ
X2b1xeHeJJhl7Hacsm5dSBPp/gb+PXSftZJ0P3HxFF9g6ASg8/j54SvwgtItyfgRtWjxSOoyAJup
AKxbrmj1zxmKak7xpLNN8776/wz+ttybFE1hN3c8bRF3yjBF0bFklZI/qyC6cUDlUhBKIBxkL3oT
Y6Uqcka3MIpTMPvl1Ep+A6pD6HZAPizcOY97M3BnZrqxKqRYCQox00jyH8b1Way0AdnxYdUN51TQ
sPfasg2fsfKn/qZggmWYO4l/iUfQq8AuqgR2k7KfrTGPDddyJqHPcnB4VhCYRHOWgYz+1ZgVe4KB
i4byfm2XhPdQQbSwWktU1NUCXrmBD+R2EsiEQqizDAN/f3BxDF8Jo+sVo1IvoZwtHvXrzY48iAiG
5E+tJxiYKLFzYF4T+sEOXdhl8WCR76XZSGWGxbBiwXzDtgCLf0qk6PjeqFAyz1wdmoVjxzkfkG8g
9uUebGTwcelCQgdsiJLwu5PdEnofXlAG8I9ClwE5Hk/ZoQv+/IamQmVsX6Yk3Yp8SNu0IqWDFaNy
Cxl53ASo7pkr9nfgNG+i6QZnyyr7druG7KFiRRvoCflDmUAH1Pg5DTXTGYXYVpFEZ9fk8tbG58/O
uQl82XxSQz+dsPgWQnplsBuZ0UO25YQO4kdU0s2IcRV4QNL/LX9siXtWSzYL5j0Z+/nVwFiEjQ+k
Sm1j6CHTPcPWghNUWXRi2saXRiGJyiW5xLCYq1351E+lNXOGhJbqhCnKqKCnOsNytiYEtbaH7Vl5
aIgqfAKjjyn+FZ2Nh0Cs2UmzqIPvvtw86Pq3bL/Uj9v5ujGdyfDktydLa2TP4MY2/k+Z5TX5lNAa
ptViFNpX+zauXIXhjdzJ2nSWUf8N0943MUtV5p3qCfrmgk/3/uaWYgIgrPUgghgxoguEMqW4vMAi
NAL8aIZrRz4mNM6rbTrghuljNoqYKAA8psgWPx51vGlyiQ3nqrphme8CcvhtDAEjXtID0e3YH4pR
k/GNlmuULsS2y6eGc6tTUAYskgk0dRP5nqCCS83eYJ9a8KZHJvdeJIbRA5CiALEugG96Pxm07Yqh
HS8kQsvaVbx7LHZHOU5gggWU1uDiZ4aXQzQwhEH5n+BHOyyMsLh/BCrwW7Gjt7Feigp2WUe1gorm
DR7D/bCrxEzs4WDQ3mSeXtjT5HTPlPHIRFAvab8dhsvQVXSuu+egw7+Vz3SwPOepgUqoy+T7uYkz
MkCsJ3NGjfq2HBPcyejGncc1D9h5Y5Ih5OC/1KsddA/CGqDH5lBxXfv3um73vE8SIt3Dnpf/mV9J
FlvJ3K5o0IuEEcmCEjWcMda3Vrm17IaMfktcLl1ST6hdQboMLn1O+zEToLwNkkWUdgxsRDenJjRp
wt8R3cl1mddnkv6JW8oO3e0KFrRoTbm2Pn/rU3o5O/lHQoyCjOrEc7BQvX47t+ECtilFl1n1Z0Fn
xSMLBvwc+b/Th40rf4QcTm3UG3SWaEpU+RiInvX0w0kXlfeIrCEQTkUnwQc2lkAMAFJp0YCScSHK
IrOezLQtetvyLFLmoMSS5m/6e+4auBW0wpgaZrGW+KSGcRoxRrUU4RH2ZDvaHR5q3/oKYAJ7Z9yJ
co7M7lfurGNwhmaqT+wM+hTMIDwuFRlQJvkVnv/QSC0jOYWJaqkHSVqO+4/x4O890anSQqlQ3UUw
/IvXgHTV42XAmhbhhSk1RsYu3mhKgjefxauKaVVxC+xSPUTvwBgbvbMsvFSDsxsfQUhZwJB2WHW1
eTcMgvpFdEJ5eYWu7/p+m6itSk15m8QxpL6f4nqJ5AjoG0JkAvJQcnOHec9ptr1PlQk1+CiItLQx
fjcZELyP4DWyPvsxPFFzPyN+qQEUWgCBYh2fWUoDERFOs/DqIdPOok6IKS3ptMb3WZ9xLSE+zAE1
Qh/gp9w53qQu6QInr5DARSKt1KiOg+Xhj82F45xEkG7fj0pSqHKm+nFxCrHxRQvMteXzdFgmfmIJ
pUsGxOYnie63cMUr5vbNDyWIPMGK6Jz8zoLySUynqXUAwsNkQybuLwDmii0qF6DoBKXk2bJA6gFH
6DJQe5b3ox/QJD92T2a9lEBrDt/oiG3DcbCy5g51gLkiLdMeRs7Sw3YQ82YLNFePv37d8oN3zO5P
c54s6/Ll6O6WQ66buPX3qZ1QRt280oTPaMm0xfp5B/Fezp5rOtlAHAdAjXcGY4KcTkWCg85UTK4l
TwIJivpEd5CReZi+kFJloANoyS2v/obXJbr5RTY+4BQI6W2XZP0OUxW3tRRBoQjiBzBSG9mBThR3
b7Ydu9izwaZ2+t36A4f72pLjNo15QhgyTRmc9tTcbXvWZZPf1G5D98UPodgf/veiUK6rUkZM8eaf
rzjJ8Vkomf/K6ClzaLh52dol0T+OjX/SmXExaDrUBGln6rgDo9peN1iPwbRv7hmPCY66DCovw7+2
4wvtaaUFxSiOTH2VS8SOMdqXOWw1jMDCLLfSnrsMIigLDGaDHARXQKtHsrBqy+FraZQqaWANZlAy
KVpNCHA+m3OhhsHAErjgEBGpd7kY2UHwanpOX873ycA1lBiqEDE1iduq6xAM2v4O2mQ6EOeGg0fV
CO18Wfislx1ioyObOEHJp6zW3mGy9K8tN5tg+ZnIgcGr+Rqd7a9GBgSYPyKM44D/LG5OW95KE0YV
V5YyM/KtIh/NTeFrBANUrdvFLJajouc3xxOStRmdbbEkTlezAyKd4B1IxOckqwfhXeVg2hJqI1pp
3D43PUb+tLH5JuR9YjOXToyW76lygks78EOCE5lz7q4XiBVhYUorLP3niU9cmGbH3owOQJaF3pf6
t0Bk4CCK1v1mw4LjkbZ/z6WpsGwkwDMD2KKytu7cTA5re9f6lf7vx/QBkDDqPx1hmZfe2RG6hM4r
EpEsYoGFQXZ7eJP8KyXN7EXWDwf8OZYkwYYjNbMqjEdzb3FGhjUxsmC8+S4KVsOIdNIdNadWwZg/
0dvSvxUXfFqH196IdrNxG44QoM0+2vkW4CA3DyAevSWUKszePl3gKYEqHbzNCDIUBmbxgGCTxBe5
C04SZKn+V5U/bTJDA1B1ObZHWXeQSz62JTMuqC4+SSYwVgViOLXmn5SUhsd2D9PxKpnz3I8+eTuq
vwCoN91ZOILIvr2Jcy5WRkmZl/U9Te0AhfDRrF75cn90pFa624WxdoD8n11YUg7bIPEe7KVIvSZF
TnsHUC0PpwJDlreNRJirEr20PwWU8zGHEb3YJYpU+8yJcI3gSXesGOqDfJY0YZixLpCTIlZT+RZY
MPRbhq1+7G9ruEZj89vBxBiQ6lMXpKdgDmOkQWcM1sEe3YUSVH45bSeZvaSuSYv4PJcEUH4WUZl3
W/lAxlF9UqJQMNmPEFXjsS2vZPm7bcOtL9F6kaaAw75MJrT58G9Vh0PgFS10eRiWTyj27WjtjvYr
RqWuf5ICMzWWaFMVMiG5JYWmHuXmDrkt6/1Q6VtrhNe6DQs3fZa7GbYJqJkFO5H9qhI5WfWM7/Dm
lA8sZgdR3f6xXSc0aXqkn9hMi0yJMM0gNxkoTI3fxsalji/BXFUr6BHZbvDA0ItO0PmRv68BtSe9
bA7D86B8PC6Stz80SPmXNms3czydB7+xtZZT6TBLqxGoY5AAzNcl6T+BQW7+uyC4qlgollT/oKal
lI+qlhcDfik/VuY1/DAHjsryGv08AXgNWfuWGMlhaSV1R17yuKF+Hd7gzMY66VVGZjXeVSVXLsXY
apbZwteqgyaV8aoU/vMDZ6ZQKen0eXewOIXdU08tvuyHTuuEyFh9xk43yaOajTUwyOJ9HKhOA/Pv
dg32ydMfPopkO4iVRzDMtnRUGyoyL/ko5B8abtTZmddwmVoZ3Sc2eial8U7qUtFU/fDV31v7lsfi
BoqrSylWU0qFiK16+axS7GdukbXO0R930hgCtyRYQ4PqILPJDRJvyN8rsiLoUasYXbHUsXGvqpa1
YzGT2b5sKQgiDwsOgjeMQXNZTyVnit+18K5wmMcF3MrSyueQ4iBmUiNmrSIUa7d9+/p/rgK0Z9cq
vMqxB7yrayNTL9rI1G+Ke/9PBgnNjs15mB4fz6lRiZk6cljDV3T/2f/sU0lTxx0ENddWPsEOt1Om
zzjOj7hCpObpUjOZU9LiomYxHl3hBsoKHTLE399+VxyFdHsC9u6zo3wqD0s9XhWloa1yNXxuV+Dl
WoPt4wmqreWH8XeFSRnCqkdAiy8/Cde6A/+2heY80hW0QdIcTotEXLv+whzmuzw6RzufZ12CyUMn
/Ziy+HbbWVLXVOHsoXPKsHafZuvcEkRB54EnSXpYnzvM+WxVAIqOsXdNSY7f7AzsAl/MbEO6Cgkh
CnvGeL7ipV/MErPSiPt9DyFX8IMyicOPf8WPOHwe51X7Y6w7OU7FWQDBykRtwruW2dTMHCLs+OUh
Dfn0Du5LXfiwK1SNkxHWN7isVpIvyKgVRzh2tBG+SFB3MPewLQkPmayOuMh0aXN7OeAVOBJwV8Gp
zWSgMB0L5+mO8RZL0y6pwKR9jkk2vT99rycayCoxmtNXrbdf/AEDBExPJNhQwvasDpTbELmUgxPY
vHuP0/fFPy3GyBB5cjdAIRIn5gqL8RxcP/LeQoeUPw3Wzlb50+eN8yn1Pdg6hztMXmghV8thhRXE
LpZzNFQhCX//H+Dz8ifFZEXILDy5ycwJ2BCCRn+iR3HLbpNIQCr1jAdDt3H9sRXNLnUvNXkGEnFJ
4RZ2JRp+dXhRa3XNryI29cA7Xo5VVRM+0NCv1yG/0SqefutIpUAHmqdVHxz3FTSi7xb+j3deQsgC
5kIRO8fFsEo1UbIoh2YWDldhm/hu9ysZKDNLAInf1rfbbQdk/E20fX3l+KPIyVCTqzOHSpuxDAxI
dwuJ1WumF5znq3JZVIZ+lyHi8rieYEgtH9PSpb9bAYusMGmrsh6QEumbxH0yTN4/I91d2YWyeN/3
Im7EhLd4iKXQQjvAzCMkcN32IIuhXIxctiqzZLMZdU9hqDQ28xfdvNRrO9RUcz9dIPuriFxrnzzp
r4H5o2cRk0ZzX7zV/helD4IZB/D6i5hYdlfvGP6RH/rPseul1ED34gUjR6qrSQhy0Cbx0sX9wClZ
Yti9WNKUTAaOSfHTLkNxhCRU9POQFaKFcf6o9b2KovMVBNKtYis8MEg+br2i2b1Ms7+YGv33VAYw
1+dVMpLRyv+x0jGED4QXhWQw7OP5A5aKW/0ioQZSjK+pgKDjfw5DCpCdw64nbuP404o+U1ZsdyUV
zm8uiMV0gzTYgdCF/0XYpfIG0q2OE0IfCSmHz93XfYPkGEhkXYhxtXWZH21odpYdJZpMmqkTL5OZ
SkYYuriwg9Hmfq80NKyOrj2lU5EYbFMl1lsbE0EhYI05YgLEX8zkNdlBVO0X7VWvmxbwLvAvyfer
6lCaBHAjLpjclKz5nXqlaAHkIIKQVdwONjftN4c0j+f2TBOcEs/HP7NwprEb20S5xiRzCAKzF294
a1U5w+666yVQQdVcSraUVq1qWX1L1OkGLjBF1EFpQmaZqgs4Hq3eZzuJKm9+vuCB8g5ARr1AKZle
sr4ANcFP+Fd7yNGehdRPQuPGeiz+1NPYOlfu1b7CcRGzIexd2DaXpZOeqCc8Thuvu2IukKlOX4Vk
EUIQpgjIUjpMqC+nQijU3lTasD3PFsYRrhxn/dSvxxAb95g4VtJYjdxsdV8rGXwoyvA5lA6+ZWBP
yR5CarWjLia/0ZzMJFix27RNGI6SOms3vaO4ALt7uOibcWrsjWJASrRTdoqrBMY7OzbYYbVdbw4Z
WjIzgWHUBoZkgRR8dpn4esmtmxkgdzUaK00UXuxX47fRggXe6wR9XhRppYwWdekyOE1ZTJr+YSfg
4MNGWsHPylhVowex93mpcslxlrNOp1Mej5DnsYE1jCALAaBfFykVbu3oeqdsBo7WN83cbqYiDDkF
fai6Ev4idJFVXixq2+O6aOC+6uvFb92wJIIM3qDQ12KAKSyzX4JlzhAjQ3tDyaGJlqq3wpr030UG
vzd5tKpwaq0hbSJdv60gP8LpshrqFafDS20ZfrvcFDmxbdm0QaJkyBGoC9lTxBY0j3mX1wKyv5rZ
ZsKn0iHCKJh6kP2MbcG8n6pWeUHPndSLY94ajqF5vqi/XrFu+EE3lktLR3c9hEV9l3REwckdlGXo
cYgaswAiNjY6w5xNJEB5McDmHuF28iI9yaP8dU7YqUhmqu+IcIEkAjSMijwrRmma95B3fGpjenw5
BljlehfRFEGWWxXGTV7wq1V+Ofl4iu8SKTskujnj77n4o+xpNJmIqBZcHa2Kmwa5WvP92Fa2VKtT
A51HyCmSlb9QIAc8halvLDJ8sA9rXmsD0R2YVgVBjEXmFL0tYwIvj3ZXWo1c7MX8Ad+QH+hcMrm0
zJI6toSviTXS3hCnaFfdKMJP/MsSAcs/AVYEey5rr/kC7dPgvp5o31i6sUT3AxB4ekBCiFpTulOd
g/ypSfdWwdRgTxON7SI2IzjPgkwFzvI9ck8gYsOLsZYoozgMXxhqt5JKaIWL3jbjCSquEGapLnYR
fdv0K2mZWLjrbybnopEbgOSVAmXXKOfKqLKMgbAfQAxB9+2OPcwocoRq6wUfxVjLAyL6HX9eC/Ag
sNlffu+eJeYkzxktZtyF8+udzXlIrkkyirY221VHe5KoryZVyEwixrK21CxmBsGSs1wqRtls4gu7
eLsASJdtlHJMQ66mtRtfN769B5UyyzUuYsXQ8vIUv2BcK2/r1pBKCn5AhrHWz8wnhEgmY3safZTX
w2f9jtIilWy1X/QyqYclWfnblro/7r/y6gowHu/o2YlCZPHWLrMffiI/jgnFGlYyQNSVRLZYbSBS
aFzUFUgy5xnoXvzGV48kIScqA4mtVyKoh+RPlS+yavMhgcBgfPWFbYLArQLjb9EIXfxpX6mvQ6ew
tW4hxkd4z1lG5dUfSS1/W3fz2Ss1lsvZ2zx2vzwj/kYbVDZFI1Pp0iMTQR7Ga6jtsep+nv5yUIfn
fiE9RKRlapKVtjFobD3Y8S0ggHY9PFNY/PI1b9ONbIFRGoWlFtNEj1DyQP0T7D1Jpa5G/oXf12x4
5Yk9qBcgtFjz74VeDnruUGlXMhUAa44vFS51Mk1ezDnWSc1VYtdB6v6dLDME2aEEqJneaNAflrny
5YfL8Bu5Xjm+8IPg7/15vckMBr2kQjzUtwZMmsgPOybRsHnpuJRIJuedW9/Bnr2+5M73i2nQFwvp
I3QsYFTecaiqO0F0egbelN0DPCFvlGfLoB1tfkCdm/3n+bqDEoLWkyMmXjMMe4NIVBJuL6jIsu55
pyjI97jWS+NXln4KSb+7EtKeM8arNmAJf7ZmTSt+mBWvPDmPErS/fdhj46qtvwKyRbz5RS/PoYR8
rsCjJFvGfynXOLiih4ghMFvcSnhNgN2BlYo55VpRCxcjqYZcHl+JG4F9dFCn2NkECB36zIOIjEzl
H1HP1qlio/08s7QbTZiJ4QVTqPBAmc3raMAriINNTk3IayTr2iVdAXq5x/bCEb18oIAg2TZZ4uhM
Jevdo6eAj5unNXHOM3Aw6VEhyHQkukj5XoKk7gXnPb9lmRdJj2fexH3KMsHzMcmYBZxlFxPi33fH
z7HhMyvI9yT/2aEk9cBMF7g1MRjCeZETVNl2RN/h1y6SVeEXW2lPNbGDGoUIybYh2ad/TOazs80w
6gDwSUTI9sW6DitgOv0snPpA9jGm0eWlTleJAcRfNoMUWLxRQ/So3vc8Xp708biUz2Gz+ND+XkGT
ekLirqgQw8QSO81RlK7uWuYoelUoPWLRd2XQPCk5fWMzDPWk1Kw29+F/w4EdiLd40Ie0XkZjsQ7v
1pmrpFTmIHMUClbca+O9inyGt52hq7aPEsmhH1G5bwUfDJXBsTYXkTilk7TMb109wJXi3hfVFMi7
9EuZe6YIc49ck3m33L1kGvcLfGkxWk14FJ3HUjehncHeiBsud9dAoLumdXZsjv+rH0V1iyvQ77cX
dTY/FvRgfmqeTsjmUIo+b7AW4avOjNHF9FR2jLejEqpfsUMOrCtDYTtgk8UiE4DYYQ3GBmaAuTmw
cn7A/tRKSv3xBGL77dEwI7l81nFQnxwCAuQuZsu5njO8PUenBNOAWQthcGwhse9aeGloay/O5mVg
IG7QXcCX8Ri8JKWX2X7QIbYqbZLGcW48B0JdF2ZsW9QqkPkefPRgYhbIs+BxhX/R2YcwKp0k7gQf
twUZhWWmzCLWEqEFNQq9HElUAQCC4qOJHw7m7gSMqKkoMBTPJdo1ogW5rWdv3o7G9zw8QKPT8/Py
zgjjIWRuH6y5yLvEM8wIetWJRAWEriw9IpI/xgxYWsYKL/2bV+l8Mgf+g5d0AM2MQAaOfzwamyEf
crHNNF1n73zhaUoStHeUaue8PtO6abginyYa5J3apQ/UiRpipGbGTa1j+gZNV8H+MWqMhRGUncmj
jASNi5Eu/1vDuN4xFI2MO/Dpwxe1NeSD0i5D6KeGqfGUNzsH1yF99yfjTgo4yeWXXxKrid9LKzla
cBgHup3JtDSdz213glJm1EMxaFNwIvP0u689RWqu25xY14YENsBFe/LXzfS2I0Ko+eP0sZAsLfxR
sf9B6zdetL4GlLmi+KfW+Phx4//CCkkn8h+bn5viMXffbkCCek0Byxh2pUJODk3cCB0W32iDhk2n
yvpjEWH/xyOSMKGPlV5UA+1ACjZs1i9J+yzOeHsI9suINIqZ4c4UtGHdwZy+SCwvMn57OgmRJz+S
IvXw+TVnaGRLuCZVO2z04p1jh8uQxPEeUQg4vVAZR75RLrh7lpU2E6nUd9221S0qga93MMVWWNGt
/2/OCvX8rTMqrp8a4a0L0MHiZTyCDQQwjIH3D8mUjDdsLszrb/pJPA7m42x4JFrlz+1UGsn/QUzd
rLUh2k8FTpgwNQtT647jZR2yZ2JNZOnkkB8B6KsR1eJGwAjxnNZX3IEG+nKJRW+5SPT37AeXhvI2
nlAe8vkDCQwZLS5oiWgkOBAT/Sj6ihwrDDIHjd34zvE85NpBDrIMqOW/j1aBdjkPH1DxtYKCAGKZ
6K1IsSxe0YtO9+jrc8nsSkB0XVlszQFWHInaUqzr8Z3q3Gwma0c6fE5wLwpy9Zvpt2IGdxPEEYLF
cyBbz8iA92KuhHqtkkthU8jfSu8ofOlxuLxSNKz28ZZEF+q1g17hwbADFaDUQ+uW505+294srY8O
WjR00Cma/NyMKrZzoWwH+rKz/aaX5FhDeKK9km0bhnAxzau0mheUFUt13aeoU+/dIwYZooN9j2uE
pNuvQ+J4RDsySIH8ykIT4CIvc47jEOFc1C52+Nr4EfnceJZWU+h1V8rREuvD/EDUdggA1Bkw8kUS
on5IDXkI/x6E4t3PwDE2iG6gEv3QQZsV4wBgE/2JKeYLSRKMG33E8cclPS9DnagPwA8khjuWtQ6Q
i3Hn8d2nwIxzaodSZVmlmeHNyODgPO/WkH8TmBEH31BOjN8ye72xmgthB89Od9eUy0fRM+pcRrDk
lAO77YePVRovdqkGWS+YkEhl5Xk1eWyo0jLtC1Kj1J8wpjva1J1l7iy4g9jaaF927Is5Z7oLtK1Z
ojxPshIG58YfLeA1U4AsQW5Hh3gcF89Vi2ANwvjDU2q8p7tJB1FvPs3TtXYqBL2emXPnhh3TPb1o
moDSMZ7cPYJbO0F+BTYAbvwiQKwQj/ITm9rLVwEoxvobTy/QNsTkQifMjmLdcU0eMMwlwv7X+8xf
+3xquP9JPOxt9O3oz2IxvbhPv+f7oN3mHKTd/mXOKCxYZn94L5bZAyPof0L//axSBy2EWFThs0Nw
ffEi7081ttJlKX0itsOvWRzbzzwvk8euhPKVACeTUw6nzqfdRGuWXp68AFiOIY1TUsgXWKNQgUIY
NQWDOvW4Qh2J6dSdTaoYxOpNusn89Xvm26VpmUuG1nT7fq4rbPnAWSFzuOfZPEL1ZX4ZfkVLUM6H
xzoT+S1PlYOqTaAEvMln3dsHq7V/BQk3uTOEzYPpAr7vdefyc7fB1OjrhrbafZeTk+F7vL00Ykos
LDyp2YW1cxab92aAftiAXvpW5jkB3pmaJTk9G8kblM7m22DyMXDoZCSTxK7UHhY492MszZumg4Zl
ExJ+kmCU3Y6cQcx2VrthLA9X1YLULjHgd3vJ0Ssx/ujxqLWpxhXsMX897uaqO6uuSvO7iC00FPh2
VC/uWM1PMJ7PXVsxfpQUlyFsteHcAMlZzp8qzcq+Uqff4OVrEyYIiq0WnPLdztJe53eAGs/z76QO
WsjR8csADvndRMeuUa93imoYu3JJEE9QY6KAjGfyL1GRQeqXrGNE8fNHioYtoPaULa1I+fg0LnvD
j0eMrrdyT72rcEl4MY8dnpS0o9JH9yDiNaO8MAEWqqCJU/W67yGIHCmNH/CA8Bygu8M6XwbStphf
9OUC1LYh3wpYhaizWJe3GEaTxksJPYaQPlDRiRHkNmpMiicgxpuBHnoTvZuzQnfg8UaTqA7jcYUg
XRg5Sa2lfxnJ/lHSsnGKJsELeCIymbfewATKwoHa+qPZPq4XS4PNrcprxWbrpycgKQxq2s/Wy/+G
I661BFF9ignI2X2/sDtA+xgxRd0CW+CwdNe52gylKVUClo7VHWE78ObZ0Flo29uG0KVMHihdMLbz
qqKu4QeJaui9PX0Gllz0wxHPRXLZzJ1IaGV+VUZu5elAo/iL1VhM2hLGaGMz/csLDd1JJ3lKGYJ4
0+wu1IPY7A4TTmjDJuw1mFYRER1bgCxL3qYyjt+8wrurKIva6ujyarDTHFahCwXULLgPAjvomiSv
wsHUiKCNMvFt27w+GXT0FjRSHMDXXsNlDSXqzw/wPdhc5Bm45dSvNIi4b0VZXzH0NJuaZKKBS+u8
OaAT/MbzHticEYCwQswkLyp+2Qww4fAHHEdik59jxa02bGhTj8lzpSyq96/+kpsmY5csxBtu6Yh5
R01cku7ORefZrq3tfOoQxAo54GsFbYiFogpS1gMwzUmgqcrMU1rq8GPbC8jCaIHUtkksOkSYna9+
JmVHQJxfsqWnlk6JaxyiBDu73QQbVtnRxx1mSGSEzHPCm7QVnaGHvyahYfYrWw6eqrt5znAZBI0f
mRVA94bdi10vhSGS34Bm30khp04V6BCUK2vcQbXmjzbwNGWuNe0oPS9loLqV29EhkP45tz04cVeW
d4nw/ia9IPAZlO5KY+PHF0fU5CtBz5j7N9W1qLGKP+w375AWB/BFke8YFoXtWm0jdef04E0HL5OB
5nrv3QBeQMvPkGA9hIjp8aQx2VPA4NFNERtN5tbOB4bwZ0CURUBmEPuRTVUWgm2NixDE2ndMAOcn
o4oaZ10mfJgj0vTOmYEc/v1yf3DgIBW6wBITUq/U4rm3TMx00BDbgDb5kLUw2ZQh7TNWh8RgV6fP
agSppxg8CDfzo3+xIPbFmqORK1CoFRCPHsSQ+fVFHSV17IorXREhBzcvIRcTGymKvPSCrm9/qU7s
oAwhuVbY5z5L0UkYAUrCYtAXFlGnuG2uPwURX2JQpmjTtOl0Ej7ta7Pndb9wMYWGVRHmCqGa2B6z
OcKbwT+IqldabhSOLGWQvJo9MWDn+q3xq8+JvEwWIxFpzeMyta03hJmJiBo3SxLeLdxtPTq5bGJr
FoPoc+ozqEXUwvmH4omA6oWmSOmg6nGBqkiruiAdhI/rc7u8AiwCeZ/CF3YXGVFhQX3icboaM+t+
ZbJpahnkhmfzUG4cFT3DRdMnyyzkzJrxDOIj7PRmAaR5PJrrf8zyXVP2x7In07//JEg89oamuKyn
A0awyN/soG/7WoT5ASwvnENDmwwCt8NjhANDW2sU4rgKY1NrRa7g8uhnd0S3vruzkVThbTk+t1xd
6pvkonzDegttPnz9V+7ziuQqB4TRaAVEbX1JhUjUJh+x9RJeMWpxP7K/eK74tCyykO4EA4Q+zkmR
wmL+JbmDEi1ns5Ok4VrPo0UVsz7lj51XoGWhpwGDf1mMttyFMJm7OjWSzodMjMXdOU8o0BRzOUI6
tJNeeqI7cs8mSFHNID+DhsM2+hfEutpZaR1+IiF83P2Pk2Syj4zoWXkGEv5W5sRtJbAZl3gikpVZ
+Imw9Jcx3HgQSfGdHELHFhun6mCLiYQVM4Wix8sKhquxQH3/4s+Og0dO53ptBdJeXRLMU7v7lqZ7
VhjvpXndpQmuRMAgdabPjGVQc2S9Tr3xYQxjGgAQpITTkDxakiZX/tOefvGUGCabJsEONd4Resfg
OnuQNb1LDzEnPAxjaldpYGqXinz3yLS7+kla8AkhF4GhAnYyQh0lQvyqKuYWqhTW2Qbw6a260CzI
APoY7aMOKbUAnnfGgWkbWAUC65czl+r5CHQs/W7RfBXMB+SGrC/Pj9Wvhv9ZMp9FliU0Rw7RIlML
hJLl/PLsPxuIWYAA/hjzC4HUoFyytxgAUrFXS2Swa5qCia8sM/+ZW2UnZ0ooxBfZNrDdQvzjOjFJ
u3wPiMo95fMqLCl4alR52URCP1cCJ0oD0B/PxxKA77wjkT2JY0RG1B+K0nYuZeYTMotiObsxQqch
Fmmq4AX8fUPutpaNlV3shO5cinXLCBYheIGIzWfc30V31v55XhPtXDvNg3v52grpmIoXAwpvqFN8
LWL0mElJEnrmB0RYoX+GuoQwsPdbVtfljKb03lFBpWs8LNbmIiwQZ6ISih4e72wP5RXylMwVTqPl
8u38/YKTxJTpBkJYaNpkndvrNm8J3DUvJJkw0iM+RXiwU83bUVVIlBvSY3z6egc+7YhWYYQo7oet
DOmOT/JUqKF7sBIoTE7urGwFwaF+YnVM6Pt6VspEJm0B+FlV7jytEt9uZPFJsVFefqdIz6G8BM3e
crWI/xLFiPjUEuoYmGC72m6yiiBJbHcSVWCARnPtcVFbP5QNduIaHjcHvUpERZpsQ41+jEZukhvO
64x+h1uhB91TWbTNEsS/uthxO6ge9qDNP8u14bi4rez5jqs0/BhS1Nlvjrv1XByriyHeO6gRolq9
7POD/WGijJnkCBJsWOjoDk1fWk6nDveFTU50QJGmnwXLjn6DocJQkwtXL9C01QXtGfgktg0ov3Wt
LcucZGua0K212CUMAsOKkOnR9glr1Nj9CYm18XFnD1OiiXKSLxV8maeBidAbcYVsvUQa23utIRN5
A0Re7tk25tDlvYQsYXX5VSEKORpPLFOsxN8Ccw6/0i/lNqm9l/D64SYxy5yBDqfGBuag6qmnS/B2
HfEeNKERkRiGvdWKuLR3fJ3BtKB6E61sAIJTdSXG0pVo/2Hu4nJ9zMYXJvFTj9Hkx/q2gMockP3J
hIV0ANq31rYGQ2p7XzAOevnnqDGd9PI/GeYNp5YuHC6UN7lHnBfUjuWU9oE42BsU5Df+ApS0Hauv
L5RgBtcd1zsPhew0wjHADerZ/dqDd1ZtW+FPRRaOw7RdG+IPRzJGkhHdegiaFFYYO0c8FKIVsyV3
KQJ4XwgMxVtd8xpiRvBbbUx4zuXjg2X4dbLCD/eWJGnEe/lK99YATSdrOBDLRzcsf2qf8p2J2hPr
I35gd1fCeguMvrlcpfiXxUar/QErWRvSwG5BJny0KYWb2H4BgPHWlAJ7poyLHJ/irJxk4N24vEye
kOO4OXbBmybxTVpySdpoFRC202KXL/UGlGBh7nqf1WUPnktontY24iC0DbVlEftQBwzvANhQk/QS
sNbqW4BWkJ5OJTfpP37APEI8bKdz5O5WRnB+QQdcUDmpSauBexj+UN1dTuyIttjcoIOf5oCxwYjI
w57QUq9EMxcByLIqIMsffxBCMxECkc6zLgRPDjqCIapVFAEmHxpsICdiSOPZUy6yWxD6BOEEpVbH
Ra2tRFigtjJbYesaRbUrmrwoOb97rHluUhn29lcPfsNjP13fnTf4ebBE0Ll0pzwHKiwGasqjI30E
Rih0Iesq2yxxFWfVWYbcwCFtDL8tOzBBXLvSaVJeISbWyGmkneTNqcKPpDG5qf5a4836FeCBApA9
H/IwmxgbV8hZdywBbaQTgzQQM7SUx45kb96qMftf0YvWsl0UsoqE+WYDWvcKV6oObNtDu9cpxrTu
KbsCTAX5uSPw+Qi/oj3O/25zta4aJaSNK5fBt3xy7RON4RClE2b1m6gnv4KA8EEEqj9sXCWaKHeo
6X3eA+n3Bcb0q2xxXfG+toHK2SAiei74tYWJ6cSkwsKZJr1WENTbSzoNKtOZf3YdFsv5KZ/zSQ2O
K4u5sSPKMIlx2Sece/GFGtwaXXBBOt/y6TbBh4FhTBQUk78yQrGpD7S3gIoYxe1kO0PnAyNTAJAv
qD7DkE6+1b5woj3610OzQIeK3t5UycMNPYyKPInIphWV5TtXwOe0wIkcCnBxEsz9GMUtFX/4A14j
csgfXcOaUvJ/xW+U4/6flkIkRKPjo2VIw+sTGQhbc6g75rf5DQihARAK9ir/wqSZdPaZnKCT0mTp
VDeUVyrNMDWvzaUgPLfVNdylZytOhT7NEANOOU40Og53/oG1oOh/3fmrqu67NVwDEGhEF2Ae5bHs
LfXzY4rN6snMpN0liHcDMmMaKoa+9RSieDuu0lJyFMJswAkdQT9goi5gTZH55YZgyEgmQY7hR2vo
mxy/aAh5rpc4F+GQUHrrjRkDE0j+UmIXjp9EOSXvDr8cDbxyS/IUpAcWaSMk5TBm57mfl09ESjNo
KhKQBpAVZPfThSDU7d1Fxk9r5kHipup/nsoz6gc/k2xTvws4b5WFPYOunqOXnDzDT9teMu6K/3EP
UAhUQ2HcCCaYV6e3+0+Je1WvpegyZM+IFrbq14yy9PUfQBOUtcxbv0GN+rYLm/qedPOc7fOZCYb+
4gn+GjQSvQVOdh7QVy7qHck6wsNmhcHRXCWRMizUhZCLWLtNrsA4WspcKyfLwVzMKM20T/SXVpvr
of0ffOoQElPxfOcJcKNOnDbQQ17S/Kh+RsSpRldIFO34JzImcIdqXl06rAA4wAYJcPqEzy/7cAnD
503ZxYxBgoo5p89MhQ1qTA+SSe7rpYOTF9SEHDWkGxBmbFlMXMKqDWyq2+bt1gGDbuMYOB4ss+1s
3tnVTqCtphfKFbnhws36buawuohzPQ/feox1Mlb54DWWVzEKlMKQHD0ip+OlXXeOrv7xaxTeUedo
6AklC+LA99NxKbP/ptCBlYH/7VGWuTOCAcXdSYj+xkuF5EPqgdkOYtplWhaisozTRKar6MMkdwJB
7J2mSkzDxMtw/ucGeixUbPrVkiDrQinwHRTuAbhwhvPwEfD9YlAdmfHxkvosfTWsgRPS5DaNvTmJ
iodsxPIhQKFV8lPZC6wbA3G4Qhn6KNsRNzBpyQhTwT7L2sf+boRy2XuhmzWxpmRUOhgapDVQ1bOY
smjfSbSpCB+UDblscRxCHQA/T7HT6Yo3MXMZukrhxTWmpxNAUSqOfqJ2Er6oof0N58tBWBec/izd
LH6y06I1HOoHZDU0MgXAW//I60KQgzGTb87sQYB+QFW3+j2wszHcAEZrhgZ4MC+muXizJJgkDXEt
nRQC4RY4X2YO4v53oszFOVofP6CoVLZV5Qw3nVYV11kD5Skc28xAdLPYint1relZdOe2cBIZjEUo
+OjgzpwnMVuIOQ39ulv/iDBzt9+b/hxx24CjMqcwCobfN1GRTFi27ugHi5uKiBtXcPaNIKFypP+/
KdCTjb+5E3iQGyXnij0OFNryybw98vO6z95NRstV9EX3+enyEveBtLwEQCD5QKaO9dMmfEw8kJxP
9TbG+J3FiwcAqRkm3aqBqDBNA2P2amalSI9Io5zt1yNKkd4dJQuaX8e/1fvIOGmy1ncfBl56F/6s
ZtFnAwC6cHtcAZg6Gdl7JWIW/W/012jcqUjK9IKsPWrITsp03ST3lgY/aum4a8cZ17//czBfAVSg
6tb7yK0NOl+ZmEY7DmVc6Cy7xoLkD2TKJtbrcZToSgcyie2K9P6v/SlRqs5/+6Y+Dfl+tPZC1rmN
QXLp8zVm+DNyFTlOyMv7Vj39UqL/kQU3eDvpKh9Hl7L9VP5jCMof4Y9bJoqzPhUQC5n7BN+tUfsn
kNyNmAN8O33ORZH4ApLBui0WoKizL+ZrQcif0Zfg8CxLkM9ww1r9BnArK2mopdtvwbFw7tPRVLnx
pb/x+CVE0ApwW8qsL18ZL4Vd0p89zPQIBxD0cfjnqGGTiokqrUB8Br/Q0ljQ0NNtq3s6ajzH0Ppn
HvuY3pnuzjt49ML5vv6T6YIqvaddFElJgPDvpMyj6Ffiboz+aWmz/z+jI41EipdSlXg7QhBltQfK
d8M3/VUcSE+eF7YVBZycH/XZm15xOl0B4E8Qr/uD1QnM3PN5OPCStPHBuNnPUZVm3+nUM1tLxll5
hhN8EWlfRv6oGPKpDRCbeVSxOkW1DL8GxQqWaYaKBFLX67dZ9HrHbmbpRTLXuBdKwGFpkgcGXpHA
cxc2DqOdtvs8CHnXTqgu3BrikZEkq+Ro7E6DLE9OVA5u6jR+JnThI6YNa52vD1n5dfDnM13y7eTE
ABxVSehidYV/hF3GRI/dTVhEgY7FJ+zh1XcvKLoMURIf/gQPHsb+5pId3fA7o/1q8KQ+X0Ddh4sc
sKA98yojgmPMII2ZqZosC+BlcEHa8+DwAytGORh9xuCB/d4nZ4GLcg3a8GBf8hbgjYmepSlmM/Hi
L+n9fU6M1KOJl9KM8nXij4uMhITuT/Ses9Ktx6MVjWnMBGViB2hEmOjK+8A/AvRTRmkS6dFKyHr9
TYzUOY4kEsF/uczoNivxW+FW8HqcMs9b9DLWQJcVYaFg4jKiNvEeW1SpGPyDWlXRQlqLbPJztZxm
e6nNfHL0nJgnTd63PLjvWJ2H9ni3aVNmMRyL1FoHvilcMfnL6Gze8OY0Mj4KayCtnwcOA8M8UAA2
3B+K7vRL3UiSQZZUqAmZmhTZAPtQsz3QfUhWUCQrKBU48MAFfWmEi0zGzTwJW4FNzZsU0rIr4BFe
uXN1oVMj1sHNZXRT8nrSGtJQPrAOdaS7f/6TNbLhSMz6gc/IbOKBPe5+x7ey8ojcOjs7u8u5LQWx
z4RkxPaNQeny85EIX5a1qnLG11ofJQrEd2h/CmNj9aO0bEmPrbn9oiqu9/dwcCF9GHtXs9+zTIMl
N/WYbCrfbXGnnrKsLWW5anV7X+qZ6kQkx/R+Y344YBOUPw/4QXATULDUSt5iBLHvtNtYjBgkKxEr
GCdIUZA960NNjCa8O6QA5MQ5XhlpvG4dvwd68EhuVEJDFr2U4XhJBcoNJujbx2wqW8BFRr6aQVYm
INCD/J5JU1mS89iBl/ZUh/5V4aP4yZB9kt45E3GvAQIF4u5ilSeFVKXqbNx0jLLUYj/d1egCFF9C
nKHxddFw/+IePval3ogTYgLSKiEEwUuWEpy87D7UkSof0fmXDWx6y9ztBQnWs/26I+VJTiVmvoDk
iSI4eMNEkafvH3sMSPnjlDzqNZGppnzAUSFL9lzFidznnwGIk54lEwxvGkp54d+lscGDf/oVM86R
JWUzxhSB+LhxWrdeKJX5HQtW9BuVvQ+MsyG6QBlQ8FJMJ0Cho4OdbD4wEiR1uU9bM7PCl5whi4u8
p+U+wCprh/h+MlaQVBqi6MNf8NvFcvVhg32aBg0WAozXP5ZG+IEs+oGe/4v1a2zmrq29Locc2cwQ
Zsw2YMSr+sjwh12HFFrCe9XbiTmhwe2AzJ4QZUO0Od7k75YoTg9HqKPbEQ7p6tyAQC8IAtGhBLYm
p0RBaQAmmf5js0riPA32Ea/Eq6FtgJuND3sOyl+Kw1vUrUIKaMmfwVFkmgAslu9QnsmMzToab2AK
lYmezdjlm4qMKi8xtlyLu3ENVutEsvds1mytiRknDDuPFXdmv4RpSVY8kBM8I+j8gGQ93gMLWNEO
na1SyWmEQPR3VmMyqEwKT3xrcfFTVtHL2PweIOLrZKp/Wlfy3hWQLfQmXRYJP+3HTAlCinR+K86q
Q9ICKRw2ZN1ruBnrSsikDrZK06dehnmFw7W89TKSqiWEqxP6Rkd6c0b01p0ZJdfyUyvb0KRQj/nv
FJxrmA4uBk5neJsqW6XG+rmA6xBtT67jnB0+0CUO2yK9m1nbnr/sxtjxgM6p6T+8jkYdzGxiCz28
xHaE2kgYyjTSdLCJqMu0jwqdylxXgoePBw10uTNm7lBZGtkGCGnSYG8DISbjd6GaNKOIkV3Qa0C8
hsLqbK/LMMBr5Y6Yg0uwtx/WSYvgRZQPRr8bNM1TmJ9SJYQIOk3ADlPUonEk3LCbroFaQB3iYdY/
+frmErgbSrGNGJ8ue8VgM2r9Y+aHJa14XW7AvhRBxe5oI/P2aIHphP25hmL3oeHDklcCp/kQiUhn
Yr7URADwqKcykVEyHZgt8EIsqIIJHB7E9ukVgRVhfzih5s5d4UEy/EA9PkEDqTVkHLsKgazso/bE
DSy5rKaC2LrLrUaJA/EW+KrY1lt/trIeSD+yprmvFQTOxRPzd4YhLZupZrkTPDm5Oz0eERutqJc5
5Ch5w12A3TWWSrqMYg52VlBwyPaDeitQcmzWNYS3q95/LWgi8De94LTpBpc7CjVrC+gl2dQgN4ZJ
H3PkZrPjpuliOd3pP9gk2ogoSnOsBlfT7s5MJlbxfvS7f10YQHWLwKIbw/JhCfx53yIKGoF7LSdN
L6Qtt1Uyz/cxxhpDutH9sX+MXfp/c4DUhQSH55QGOgiVGoA6mtCCIheDnMpjcaOriwvYenfXwnQN
ylLYbx4MUsADGPGqFZi+/O4pnshVpzljeqrJu7eYezNt9J1sSd16DGSyJSK+4FeLkog5fxIuHqN1
sBl1X8YUjhNtIu4zFDhZFXHBFNEv6TsMW8KfbAGkLaqZXbKfZWgXSNfONO0TEKrxczYbvXLUb5Yc
dQgoaSqYLoo1A1qrddKl3EjpvPMStUZnMHrZKPUMSmkuUKPfAdGL6hXMvhUnggkvOELwBedA0jW7
E49FzECve5WQj56Mv+ozCc5Fv0GO8og+0iPqX6xRA9cYL1qxaBio5uVxxX9oybjt98eSmfIhwLfS
Tr6ctVt640DlR4XlZUA4ZJ2WyKwQrB0AUggkaxkkndTxReTAEXYgxCv8wk01OETa78FrEQwrwfco
tMPSmT+FIlQ+fklr8Vo07susGD8isfazw5gEfKKQflBkPf7F8GIxqUTOt5G+d4Hjf5VphbtCNIGI
O4E0L/RawJDi0To52LzsikIPkzbcmUixd+FXXIBY9qou2JGhVfyIReVC1yDuzlBUeYNzQfu32x7G
owQFarpR/x1D47IQkKAKk+aqqCFVoSBTcJpOXUidJXc/zQclYwHdJtYzU5uJYS/KWY9mT4wiw0RI
U5GpC+kddVH+l4UcEHDy7cZOoZ15ZJ+iUFsXxG0bYCNe9EvgxYqZX7ZskuQ1JFmrxkm3Yert8YuH
gPSnFkdfhouX2MApX3WSK1pjypQT2sVH/XN8cJjY8zbAqvpMEiIi/97SulC8bwzKy9McJPJfYhl0
3CubJc6G764UAfAfBp/JhLcTtpCVv6wQOWZGo7/Dvo0O65o+uFvJoCQYAtAd4UksxxhSiHKj7/46
gMPVmBzytI3I5cQW1a2hItPb7y+bhDDa+H0RDdjNNTYjhIEGDv9p+D71V6VoPIyouyeSCL2i7/fZ
E11agckUX0PbBKgQ9XkkwASuhCfZqZMauY+YRstiHnWyzbB82TqzNu4eKVUYjszPyRet300Lq+aQ
h91wLri40rj5ZEyB9vRJcLKBgy3xoseKMvmoQjqcZYH9U2KzRdOuCtnTlQeV20mIgRmF/J5Ej1xH
B9KJGz1k1bo03sVJ3q0ADRYRaBFsUmJxcXmAvAOwtBK5SxX2Ogj1R5qDL9BZXOQ+dOYJCJdFyfeg
Frtq29iQ6lbyG6lf8hs9pg1vvwdl5cwUGNheikJMRIgGwtad/VbOjQir6nT4rQHhL6Kp5Ivpl5fT
L6aUeNfy03G5+dRRJ0T2xy1iZ3/7MhqRRL42jJFSc51zuJhGKQcI0vhqDqLUW1WyHHtPDbRoygOb
lKjaEibnowE8w/E2auwpCHuH8gsopE5925kFofcZIJadn9gQ/GBu/m/QA1T/CL8Gkrx2RX4tW2iU
NqmWkzRdkEne6iSlicHZVljkFT698J9lOyU0slPWHcgMsMiPO2wKzDWrGw/qC+DiBWkHL1Tp1DJc
rAMCVkuH2Jy8/5qSj9hp6d7rSBN/HMqsNPJXzwrBZraFVz2ZJtuYAgsOw4/TvECZh/Q6+E1RkDsM
/gf34x2yHaTHo+/7UTFmfzJ1KA6jK2sur49JuzIzuKGJRRwi1RXcKoOy0vTJNETXAExtKfXwbWFd
K7TcSmGTxWWVjhIGrV4PPIy2SRs+RZqMNIjZNbcnbh9/ACrRU2kfn8MwtKAQvv8BhDlrKpzRMEjS
MlzV6t2OljacHK7FDrrIeHLBJBA2df8AUdvpI8G872QeVAu+Ieqriu2cVKh2DaoNUi/CED4AyzYc
r7v+BhMTT9mWNrJIfpGz3rSOGn7h120sntAJ8pOSosQijOQOIbI9K6+EMFpGKJcEBKl6L/tdvs+N
ZnttxvQ05C7PKin0kkJ0QJYDebqUAdTem7hxLHfHfa/HkJFTlnlC5G82YkYNaAUY0jGPUbz91vQz
vo82MBcLeSoRKXj4Xnm3yRjnzfldfnmHA4cp+EZWViTOgfSS7hmZGOnX/FcHCFZgJ9pBbAOALhBk
ljZy/LlMxEsKU6kLBe08pnH4DTQ78gv6huaa4tO0jMO2001/L/f8yxjSLZTGs9hIEHoaFxdZ+U/P
PUHLKI8zVLM0e5/yWp5TvDuu3D5CQFckjB2ySAk81wxNo/kfZpCPRm7EOPgAy5rUMxuE/3d8M3e/
egHSistNMUjFXabuW6bypZWDvgMPzz/teXeb4CBqKno0ngG249ViJKgzK9XpC6qzkowPrPE1RZWY
PEpUpBzwCvQ7yw28bYYrsM3sxp9cgFZHsZLY8u5WOqjRGSi9lMxWHtQMOUD9jPUezfhaMg/k3yCQ
1orQqj2uNnCbMnz8xFbLHvjb33kTX4Xa2ypLfdxSiZjbGu8m/raDaRoT5NICuV6bVLkhgGKLWyRB
U4bm4xlpP3LlpuUtNB0hizR7qho/RpbK611pALeLgb+l3Yghg4745Uv3BaXln/K6ts0vQdm+U0hE
B3y5/a8uTeKoXIGrRckBjdjz2kx6RMjQRuF839qRzAvuCDabndzzKl0ckP5gIJkBnBAwtwtQi5lu
kr5Q5pUhpj9rIH5YchBfF8REY5MHKAvRBkbPoyDwF70hwKNw40Gt3C/xTvE1njgNrNgcZfH4cIzq
FhsbTG058Hg9EmvJOm3IQFDvwPL98HouSVbLTdHic6yS3PiKUzO2zQC00Nh9Z/X0wexxocxfCDh6
aPFxVSD4RlUFV/Rl0LPZeh3QCZmfKGvytjyq73fWnr+/42caVTvGz4qU+waB+ULY/OahAPuPAczN
EZQJSzZEqa/aR7Zv16SbuM2huHl+AM2BzGgn6tltK3hSuizINExHF1K0wpJ3hADlR7l7U+9ZVeWx
YCg7nFJStJsOOOXcHqrzJJUM5LHCYWS5t1yKDQO5gh4NPeJjunZL9AoBhxMApzObKmHEysuVzaqD
lUiKKXi8D8tg/qCiJs3nWVNbWXbDpeHqVOPiO3zkag+JuOqOni/zrdNwbG2OI9E+F2s6JFbqsT6V
hoJamfYcYjatUy8EbdpuWQhmxMOPtJFgUNavo1SDShADZ2+9Lv6hU3j8MDbF3DgMNRubIHok7vjx
7spvsPBnraIQy5cApJdeh1gHgQLs2pJ0d4yCLvRmJmRswkrxi7dz4F2cDT6Z6f20gabePJLF3UdI
TtcIP9cnU9rTj1IgzeQNnj7C9NgDHOuD4zQLyGPldZgmCtAUa5NmHVgSnnqXrkdL3Z7PN3Kn735t
7+9Qj5ABfMd5hGZFuhr7wJ74smZ2vWjWXzjRiL+OSaZwewiYz36mFtHOT9fN93UtxB+iH9+z/G/3
2YIq4IM6luib2yxirFO+JfeRX92ujNqm5+TKvcp0fP+pEXn0MWszLnnLsBTx82XVATnhdJ6ZJ2Rd
8GI++4DKGaD0ysmObeIqqaoj8J5/XkNNiesecCumJKB8yyZYr6lXdYSDa5kQIVWaWZvGUrhpCpZ/
ohT9Vr5feBbsqS4K4Cy9jjAPib8b6J5SmIWkP62UguataltVkax27FE8hGeBAdAjWl/qR3eGbPkD
sQc80eOy5Ker4TD0XNx6uRw7LkH+tT/m4lhYsrQjHxxMctn6cXqmc0UauwUnw6JLkJvhRfsHj69l
m8gc36qc++I6N9VHEwM7t2wUXHeuSS9GwwH2i7bEAliIfWTRyDvxJusRUKlmEas2EwoyqO0hHqor
xtAMik6+hmoFyxM3ryseggJZaSRtFxNtzkvGtqT+EXjc1xFDmzNN/QWFiraWCPJr6tT+DaclvTwl
z9gt8vP0ANL9FyHpkSLRVEwCpw9Dfai0vKQrJKJwN7721Qu3B1xbgsffEv/EifTckSDotpi5MPpK
/W2tjEuzvC2LsXijm4kJFv1WHC/iOWLd4xsF0CuY1MgAEq0IZo9HIbvGUp0fQor0+RbheqqQkdXc
u6arxZHrgyZoolkXK7i3xovUiQHezV9+WFpYtk5M4NZgpcpOfsMBiY0BBYqyIn6PHq+fBsQDpP8h
wi4iOO35kT3HIeLHJh556Hx3gFNex3rS2tyQdetQcd60G0F4cvX9tQcvK+rhHsCV4y04krPHyPeA
FugTsitvRISXyINyL0IGUrlxmM6fG4EQXJH3fX1tbODsTIazfwUF1mHFolfZ+SdH+U8P/w5vy3JY
A4Z6YMsz5gVVb1g4/TyqLtl3sXFOwWqwwVNHmBJNNZmyYPV49F2rZ9WTLlf/bHAB6fRfP0+EiZLY
Qq4JsIpFHwv2G16AyKIz7OCxRYk775+aKj23GY7gbElcC5L/vGP4+SWQHR8+r4nQSYF1/+cbsSfZ
IvIQyy4f3CL6D2+Cme0ADJ7nbqXbQw6OQSpIHonTMWxejhLLPqwd50E4KlvoRtC0ZJLH0ebcIT2s
tTFx/+3vc2Xh0gkE/hORYY/jkkIBxfUNcQX+AZ5pfVaH2ydE58xNTnXXzYJkQ312zwUy1HoUM9gW
8dmlb6DxeHhpnPq/bxwBMwb3aV2lkhvCY8ylVn/5BNphhZRl1iiZDE5Upcnj4Mv4VPPpPnsq6sPy
/E1D0t74d7aeccN0Ekh1dtc6V1yOQRBYrE7TzAY/kpapAY3NDVopE12QE4UbhMiKGHDDHHJrDP4Q
q7xOdJIWVa8yhfBiMcKrFbjajX7nueOJIO2yvWyZp+Qpap++4Cyp+apKYIVI7xyVnLM7ia6GNhq0
/uGRZVS5UCEp176i8sZ8HsqBGpDsGNL6AkLxsyQK03DwMIew1KNEi9+iR5l1ZTlbXRMp2oLvKy7b
DrbW3gwB+pSy24PejML7ITACbZXyo5wq5vNKOXCjixppHEI0AEgLwF6b1eEf1ro1oAQHNQl/fDKE
pYRbE1/RAbUJcImR573w9v8n5mlVbIt1zO8zUH5bvZUQntTLop8D4OyHOODkOpMAc/SSEy5ldI8p
PA+rEC8bIBXUD6MXoogVGnZ5wh5PnYpLp7yDiwjwAqnzaUwk486PJt3Pr0ejOI/w5ZXL5Tw8j2Fz
KgdpA4x8McR9efu4yTDbN+kDAbkZdYI64T3inoLpwFqpdNvLgWpnwicP3E0V+fcF3OSEb9I3SoOL
0MoYAa8AN8wOpiStPCLEXUXs1Is0KqjyaFE6WXdT0KhY8b4u78BTSf5lGzEWlXqoMpMptbNYbD+D
hlv334rMimQXaylBmGGGq2hXHaYYMzKXodAq1qpCURnYd2h6EbSo8cZ7p+yAAzbtDW8EpcLfdFx3
xLS6xIbQcgK/T73DgdGGHSIrLHBJ4lEHHJ/4OqV1U6E6HP8oJurmOLqeRwNc28G5lQYQLrf+2fPO
2MCWVrPIMUYxKX/ziSeR2aiHYbjjNdJaUvADqAvaI8JZ6F1clVMyFBpoT74J60rayVymIPsloSxN
QAXr3FkeM6v4woIwhJnDsRzuk8BhODYQk3r2mSbqVJEX8k1aTuO7rC0aGABcselej2XezxddlT1w
IKlvlpiy8nQ2ManwtU5ChlDxHB8W2pdZWh6DgxozmoGpdKBRCSBi4v2OzNgmw4LhU1/P+bJfqvEv
SqNaLgJPrm1+oXcI7wQKiDcQcfcZneN915Dg7H/mR6sn1jXO6Fqsy//2CFMNlNZ8NqOA6J59BtLj
3gDBJkiEhMl+tV9J7Z+ETUKKqpTgGyPTyN32EN2W69yUk1WTW9kbohfGYR6fMgcii/Afyt4THvMi
kyDWSCNHUyW680rkeUZR87Y0KtmQdRes4C6JQYqQg8YR3JmsDjGagoxDZdcE0rLJT3P+zRxhKOrJ
scttcM4/C2b/bGTc3bcDy1ZeflVaLcMXhzCmI5osraWb06ew8RSPo8QeBmfo8SFDCli2LnpezSPq
2I9JX1/AFI+kWrBk2v4oJ1n7lu15XwIddzkfZpaxnmL8ACxK/v184weJRe6aYzHyBNZYYp8PK4xQ
FQxx3T3PzVkYtnP9BPK2PWjek10YjYJWOjdi1XJvFkSAlchfJAR/2bRaAvn6EgyQAXh0RSdnvnZh
yzrp3e4SmlD3H9g3Xp4ay1ntIIy7K/D8ejqI848lW8egPfgmH+VWBzYaL57Ld9t34gazITcbFxTT
afNcxrlJcvNm1qHnISGYGlQwFFiBD0PcZeQGn5ND12JKLyelhp3UQxiP1PnWLB0Un/EXXNpTndd7
OMU/ePdHvfl/HK8kUFUovGVfx6R704GRU1zH27vVpeeq+ve3yyMmIIzmbeyHy8lLgosPslLoCFis
WT3J3nzK8s499ltzYWetxRI1Jy3kYs0Tqe934l/x30B7XWUuZi9gYBI67W21WilJIilid7Tq5rMz
b4iPW/pSf52CTTQxeDoQLeJz0XAEagTg+ByFDBZB/EAP1OFZOlEAXJfCj0X//l+iMVmFKYcYaowI
w5szg6JIcmI90Fz6VNmYKpfFNtQc3FU1QTMJqaTxCG1YSBUHXL4zKTpd7+YEGmLFAyrMfNuoy5or
p91AMpgyGYOusB+jxs5pnAGW6wm35inKnMXtIIdnfVWo6Px0N0D4aFZAJmYuirFi1ZSHR+fmx2zX
bCyIrJ2L/GqxdKfOsvW/9+znwVLK8a6gPrs=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
