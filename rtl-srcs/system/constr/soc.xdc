set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]


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
# set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
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

# set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports {gpioA[4]}]
# set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS33} [get_ports {gpioA[5]}]
set_property -dict {PACKAGE_PIN H19 IOSTANDARD LVCMOS33} [get_ports {gpioA[4]}]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {gpioA[5]}]
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports {gpioA[6]}]
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports {gpioA[8]}]
set_property -dict {PACKAGE_PIN D22 IOSTANDARD LVCMOS33} [get_ports {gpioA[9]}]
set_property -dict {PACKAGE_PIN B22 IOSTANDARD LVCMOS33} [get_ports {gpioA[12]}]
set_property -dict {PACKAGE_PIN A19 IOSTANDARD LVCMOS33} [get_ports {gpioA[13]}]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD LVCMOS33} [get_ports {gpioA[14]}]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {gpioA[15]}]



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



