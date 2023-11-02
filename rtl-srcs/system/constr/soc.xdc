

#sys_clk and rst
set_property IOSTANDARD LVCMOS33 [get_ports i_soc_clk]
set_property PACKAGE_PIN W19 [get_ports i_soc_clk]
set_property IOSTANDARD LVCMOS33 [get_ports i_rstn]
set_property PACKAGE_PIN Y19 [get_ports i_rstn]

#摄像头
create_clock -period 11.905 -name camera_clock [get_ports i_camera_pclk]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets i_camera_pclk_IBUF]
set_property IOSTANDARD LVCMOS33 [get_ports i_camera_pclk]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports i_camera_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports i_camera_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_scl]
set_property IOSTANDARD LVCMOS33 [get_ports io_camera_sda]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_power_down]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_resetn]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_xclk]
set_property PACKAGE_PIN U20 [get_ports {i_camera_data[0]}]
set_property PACKAGE_PIN V20 [get_ports {i_camera_data[1]}]
set_property PACKAGE_PIN AB21 [get_ports {i_camera_data[2]}]
set_property PACKAGE_PIN AB22 [get_ports {i_camera_data[3]}]
set_property PACKAGE_PIN Y21 [get_ports {i_camera_data[4]}]
set_property PACKAGE_PIN Y22 [get_ports {i_camera_data[5]}]
set_property PACKAGE_PIN R18 [get_ports {i_camera_data[6]}]
set_property PACKAGE_PIN T18 [get_ports {i_camera_data[7]}]
set_property PACKAGE_PIN T21 [get_ports o_camera_scl]
set_property PACKAGE_PIN U21 [get_ports io_camera_sda]
set_property PACKAGE_PIN N15 [get_ports i_camera_vsync]
set_property PACKAGE_PIN U18 [get_ports i_camera_hsync]
set_property PACKAGE_PIN P17 [get_ports i_camera_pclk]
set_property PACKAGE_PIN U17 [get_ports o_camera_power_down]
set_property PACKAGE_PIN AB18 [get_ports o_camera_resetn]
set_property PACKAGE_PIN N17 [get_ports o_camera_xclk]

#E203
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
# set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
# set_property SEVERITY {Warning} [get_drc_checks UCIO-1]


# QSPI interface
set_property -dict {PACKAGE_PIN P22 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[0]}]
set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[1]}]
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[2]}]
set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[3]}]
set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports qspi0_cs]
#set_property -dict {PACKAGE_PIN L12 IOSTANDARD LVCMOS33} [get_ports qspi0_sck]

#######################################################
# GPIO
#######################################################
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {gpioA[0]}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {gpioA[1]}]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports {gpioA[2]}]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports {gpioA[3]}]

set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports {gpioA[4]}]
# set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS33} [get_ports {gpioA[5]}]



## UART TX
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {gpioA[16]}]
## UART RX
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {gpioA[17]}]
# set_property PACKAGE_PIN V17  [get_ports {gpioA[16]}]

# JTAG connection
set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports mcu_TDO]
set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports mcu_TCK]
set_property -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS33} [get_ports mcu_TDI]
set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports mcu_TMS]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets u_e203_soc/IOBUF_jtag_TCK/O]
set_property KEEPER true [get_ports mcu_TMS]

# pmu_wakeup
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports pmu_paden]
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports pmu_padrst]
# set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports mcu_wakeup]




#hdmi_out
set_property PACKAGE_PIN F18 [get_ports {o_tmds_data_p[2]}]
set_property PACKAGE_PIN B15 [get_ports {o_tmds_data_p[1]}]
set_property PACKAGE_PIN E16 [get_ports {o_tmds_data_p[0]}]
set_property PACKAGE_PIN A13 [get_ports o_tmds_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports o_tmds_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports {o_tmds_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {o_tmds_data_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {o_tmds_data_p[0]}]

set_property PACKAGE_PIN D17 [get_ports {o_s_tmds_data_p[2]}]
set_property PACKAGE_PIN A15 [get_ports {o_s_tmds_data_p[1]}]
set_property PACKAGE_PIN C14 [get_ports {o_s_tmds_data_p[0]}]
set_property PACKAGE_PIN F16 [get_ports o_s_tmds_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports o_s_tmds_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports {o_s_tmds_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {o_s_tmds_data_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {o_s_tmds_data_p[0]}]

set_property PACKAGE_PIN M22 [get_ports init_calib_complete]
set_property IOSTANDARD LVCMOS33 [get_ports init_calib_complete]


set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]


# set_property PACKAGE_PIN R16 [get_ports i_key1]
# set_property IOSTANDARD LVCMOS33 [get_ports i_key1]


connect_debug_port u_ila_0/probe0 [get_nets [list {video_system/memory_top/camera_axi_write/wr_addr[0]} {video_system/memory_top/camera_axi_write/wr_addr[1]} {video_system/memory_top/camera_axi_write/wr_addr[2]} {video_system/memory_top/camera_axi_write/wr_addr[3]} {video_system/memory_top/camera_axi_write/wr_addr[4]} {video_system/memory_top/camera_axi_write/wr_addr[5]} {video_system/memory_top/camera_axi_write/wr_addr[6]} {video_system/memory_top/camera_axi_write/wr_addr[7]} {video_system/memory_top/camera_axi_write/wr_addr[8]} {video_system/memory_top/camera_axi_write/wr_addr[9]} {video_system/memory_top/camera_axi_write/wr_addr[10]} {video_system/memory_top/camera_axi_write/wr_addr[11]} {video_system/memory_top/camera_axi_write/wr_addr[12]} {video_system/memory_top/camera_axi_write/wr_addr[13]} {video_system/memory_top/camera_axi_write/wr_addr[14]} {video_system/memory_top/camera_axi_write/wr_addr[15]} {video_system/memory_top/camera_axi_write/wr_addr[16]} {video_system/memory_top/camera_axi_write/wr_addr[17]} {video_system/memory_top/camera_axi_write/wr_addr[18]} {video_system/memory_top/camera_axi_write/wr_addr[19]} {video_system/memory_top/camera_axi_write/wr_addr[20]} {video_system/memory_top/camera_axi_write/wr_addr[21]} {video_system/memory_top/camera_axi_write/wr_addr[22]} {video_system/memory_top/camera_axi_write/wr_addr[23]} {video_system/memory_top/camera_axi_write/wr_addr[24]} {video_system/memory_top/camera_axi_write/wr_addr[25]} {video_system/memory_top/camera_axi_write/wr_addr[26]} {video_system/memory_top/camera_axi_write/wr_addr[27]} {video_system/memory_top/camera_axi_write/wr_addr[28]} {video_system/memory_top/camera_axi_write/wr_addr[29]} {video_system/memory_top/camera_axi_write/wr_addr[30]} {video_system/memory_top/camera_axi_write/wr_addr[31]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list {video_system/memory_top/camera_axi_write/wr_cnt[0]} {video_system/memory_top/camera_axi_write/wr_cnt[1]} {video_system/memory_top/camera_axi_write/wr_cnt[2]} {video_system/memory_top/camera_axi_write/wr_cnt[3]} {video_system/memory_top/camera_axi_write/wr_cnt[4]} {video_system/memory_top/camera_axi_write/wr_cnt[5]} {video_system/memory_top/camera_axi_write/wr_cnt[6]} {video_system/memory_top/camera_axi_write/wr_cnt[7]} {video_system/memory_top/camera_axi_write/wr_cnt[8]} {video_system/memory_top/camera_axi_write/wr_cnt[9]}]]
connect_debug_port u_ila_0/probe5 [get_nets [list {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[0]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[1]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[2]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[3]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[4]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[5]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[6]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[7]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[8]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[9]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[10]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[11]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[12]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[13]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[14]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[15]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[16]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[17]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[18]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[19]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[20]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[21]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[22]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[23]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[24]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[25]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[26]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[27]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[28]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[29]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[30]} {video_system/memory_top/camera_axi_write/M_AXI_AWADDR[31]}]]
connect_debug_port u_ila_0/probe7 [get_nets [list video_system/memory_top/camera_axi_write/M_AXI_AWVALID]]
connect_debug_port u_ila_1/probe0 [get_nets [list {video_system/debug_cam/sim_data[0]} {video_system/debug_cam/sim_data[1]} {video_system/debug_cam/sim_data[2]} {video_system/debug_cam/sim_data[3]} {video_system/debug_cam/sim_data[4]} {video_system/debug_cam/sim_data[5]} {video_system/debug_cam/sim_data[6]} {video_system/debug_cam/sim_data[7]} {video_system/debug_cam/sim_data[8]} {video_system/debug_cam/sim_data[9]} {video_system/debug_cam/sim_data[10]} {video_system/debug_cam/sim_data[11]} {video_system/debug_cam/sim_data[12]} {video_system/debug_cam/sim_data[13]} {video_system/debug_cam/sim_data[14]} {video_system/debug_cam/sim_data[15]}]]
connect_debug_port u_ila_1/probe1 [get_nets [list {video_system/debug_cam/state_current[0]} {video_system/debug_cam/state_current[1]} {video_system/debug_cam/state_current[2]}]]
connect_debug_port u_ila_1/probe2 [get_nets [list video_system/memory_top/camera_axi_write/cam_fifo_full]]
connect_debug_port u_ila_1/probe3 [get_nets [list video_system/debug_cam/sim_data_wren]]
connect_debug_port u_ila_1/probe4 [get_nets [list video_system/debug_cam/sim_vsync]]
set_property PULLDOWN true [get_ports {i_camera_data[7]}]
set_property PULLDOWN true [get_ports {i_camera_data[6]}]
set_property PULLDOWN true [get_ports {i_camera_data[5]}]
set_property PULLDOWN true [get_ports {i_camera_data[4]}]
set_property PULLDOWN true [get_ports {i_camera_data[3]}]
set_property PULLDOWN true [get_ports {i_camera_data[2]}]
set_property PULLDOWN true [get_ports {i_camera_data[1]}]
set_property PULLDOWN true [get_ports {i_camera_data[0]}]
set_property PULLDOWN true [get_ports i_camera_pclk]

connect_debug_port u_ila_1/probe7 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/p_0_in]]





connect_debug_port u_ila_0/probe18 [get_nets [list video_system/memory_top/axi_read_m/video_fifo_empty]]
connect_debug_port u_ila_1/probe10 [get_nets [list video_system/memory_top/axi_read_m/video_fifo_full]]



connect_debug_port u_ila_2/probe0 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[0]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[1]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[2]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[3]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[4]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[5]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[6]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[7]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[8]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[9]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[10]} {video_system/video_generator_inst/vpu_conf_ioregs/PADDR[11]}]]
connect_debug_port u_ila_2/probe9 [get_nets [list video_system/video_generator_inst/vpu_conf_ioregs/PRDATA]]

connect_debug_port u_ila_0/probe3 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[13][31]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[9][31]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[12][31]}]]
connect_debug_port u_ila_0/probe7 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[10][31]}]]
connect_debug_port u_ila_0/probe9 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[15][31]}]]
connect_debug_port u_ila_0/probe12 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[8][31]}]]
connect_debug_port u_ila_0/probe14 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[11][31]}]]
connect_debug_port u_ila_0/probe23 [get_nets [list {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][0]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][1]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][2]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][3]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][4]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][5]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][6]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][7]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][8]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][9]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][10]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][11]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][12]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][13]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][14]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][15]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][16]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][17]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][18]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][19]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][20]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][21]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][22]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][23]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][24]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][25]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][26]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][27]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][28]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][29]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][30]} {video_system/video_generator_inst/vpu_conf_ioregs/vpu_ioregs[14][31]}]]

