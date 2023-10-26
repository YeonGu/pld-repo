// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Oct 15 20:47:10 2023
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
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
ia6jtUvvi/2vikQ7tmxZx5yXRKD4eUFSuAs=
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
