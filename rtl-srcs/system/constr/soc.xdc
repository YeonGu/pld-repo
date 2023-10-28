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


set_property PACKAGE_PIN R16 [get_ports i_key1]
set_property IOSTANDARD LVCMOS33 [get_ports i_key1]


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

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list video_system/video_sys_clk/inst/hdmi_pix]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[0]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[1]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[2]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[3]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[4]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[5]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[6]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[7]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[8]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[9]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[10]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[11]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[12]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[13]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[14]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[15]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[16]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[17]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[18]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[19]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[20]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[21]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[22]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[23]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[24]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[25]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[26]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[27]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[28]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[29]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[30]} {video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[0]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[1]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[2]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[3]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[4]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[5]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[6]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[7]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[8]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[9]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[10]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[11]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[12]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[13]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[14]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wraddr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[0]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[1]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[2]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[3]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[4]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[5]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[6]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[7]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[8]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[9]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[10]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[11]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[12]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[13]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[14]} {video_system/video_generator_inst/vpu/bicubic_2x/o_res_wrdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 4 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/state_next[0]} {video_system/video_generator_inst/vpu/bicubic_2x/state_next[1]} {video_system/video_generator_inst/vpu/bicubic_2x/state_next[2]} {video_system/video_generator_inst/vpu/bicubic_2x/state_next[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {video_system/video_generator_inst/vpu_ram_rdaddr[0]} {video_system/video_generator_inst/vpu_ram_rdaddr[1]} {video_system/video_generator_inst/vpu_ram_rdaddr[2]} {video_system/video_generator_inst/vpu_ram_rdaddr[3]} {video_system/video_generator_inst/vpu_ram_rdaddr[4]} {video_system/video_generator_inst/vpu_ram_rdaddr[5]} {video_system/video_generator_inst/vpu_ram_rdaddr[6]} {video_system/video_generator_inst/vpu_ram_rdaddr[7]} {video_system/video_generator_inst/vpu_ram_rdaddr[8]} {video_system/video_generator_inst/vpu_ram_rdaddr[9]} {video_system/video_generator_inst/vpu_ram_rdaddr[10]} {video_system/video_generator_inst/vpu_ram_rdaddr[11]} {video_system/video_generator_inst/vpu_ram_rdaddr[12]} {video_system/video_generator_inst/vpu_ram_rdaddr[13]} {video_system/video_generator_inst/vpu_ram_rdaddr[14]} {video_system/video_generator_inst/vpu_ram_rdaddr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 9 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[0]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[1]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[2]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[3]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[4]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[5]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[6]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[7]} {video_system/video_generator_inst/vpu/bicubic_2x/raw_data_load_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/state_current[0]} {video_system/video_generator_inst/vpu/bicubic_2x/state_current[1]} {video_system/video_generator_inst/vpu/bicubic_2x/state_current[2]} {video_system/video_generator_inst/vpu/bicubic_2x/state_current[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[0]} {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[1]} {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[2]} {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[3]} {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[4]} {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[5]} {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[6]} {video_system/video_generator_inst/vpu/bicubic_2x/v_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[0]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[1]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[2]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[3]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[4]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[5]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[6]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[7]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[8]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[9]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[10]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[11]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[12]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[13]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[14]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[15]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[16]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[17]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[18]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[19]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[20]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[21]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[22]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[23]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[24]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[25]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[26]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[27]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[28]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[29]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[30]} {video_system/video_generator_inst/vpu/bicubic_2x/vram_rd_p[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {video_system/video_generator_inst/vpu/vrr_wraddr[0]} {video_system/video_generator_inst/vpu/vrr_wraddr[1]} {video_system/video_generator_inst/vpu/vrr_wraddr[2]} {video_system/video_generator_inst/vpu/vrr_wraddr[3]} {video_system/video_generator_inst/vpu/vrr_wraddr[4]} {video_system/video_generator_inst/vpu/vrr_wraddr[5]} {video_system/video_generator_inst/vpu/vrr_wraddr[6]} {video_system/video_generator_inst/vpu/vrr_wraddr[7]} {video_system/video_generator_inst/vpu/vrr_wraddr[8]} {video_system/video_generator_inst/vpu/vrr_wraddr[9]} {video_system/video_generator_inst/vpu/vrr_wraddr[10]} {video_system/video_generator_inst/vpu/vrr_wraddr[11]} {video_system/video_generator_inst/vpu/vrr_wraddr[12]} {video_system/video_generator_inst/vpu/vrr_wraddr[13]} {video_system/video_generator_inst/vpu/vrr_wraddr[14]} {video_system/video_generator_inst/vpu/vrr_wraddr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 16 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {video_system/video_generator_inst/vpu_ram_rddata[0]} {video_system/video_generator_inst/vpu_ram_rddata[1]} {video_system/video_generator_inst/vpu_ram_rddata[2]} {video_system/video_generator_inst/vpu_ram_rddata[3]} {video_system/video_generator_inst/vpu_ram_rddata[4]} {video_system/video_generator_inst/vpu_ram_rddata[5]} {video_system/video_generator_inst/vpu_ram_rddata[6]} {video_system/video_generator_inst/vpu_ram_rddata[7]} {video_system/video_generator_inst/vpu_ram_rddata[8]} {video_system/video_generator_inst/vpu_ram_rddata[9]} {video_system/video_generator_inst/vpu_ram_rddata[10]} {video_system/video_generator_inst/vpu_ram_rddata[11]} {video_system/video_generator_inst/vpu_ram_rddata[12]} {video_system/video_generator_inst/vpu_ram_rddata[13]} {video_system/video_generator_inst/vpu_ram_rddata[14]} {video_system/video_generator_inst/vpu_ram_rddata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 16 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {video_system/video_generator_inst/vpu/vrr_wrdata[0]} {video_system/video_generator_inst/vpu/vrr_wrdata[1]} {video_system/video_generator_inst/vpu/vrr_wrdata[2]} {video_system/video_generator_inst/vpu/vrr_wrdata[3]} {video_system/video_generator_inst/vpu/vrr_wrdata[4]} {video_system/video_generator_inst/vpu/vrr_wrdata[5]} {video_system/video_generator_inst/vpu/vrr_wrdata[6]} {video_system/video_generator_inst/vpu/vrr_wrdata[7]} {video_system/video_generator_inst/vpu/vrr_wrdata[8]} {video_system/video_generator_inst/vpu/vrr_wrdata[9]} {video_system/video_generator_inst/vpu/vrr_wrdata[10]} {video_system/video_generator_inst/vpu/vrr_wrdata[11]} {video_system/video_generator_inst/vpu/vrr_wrdata[12]} {video_system/video_generator_inst/vpu/vrr_wrdata[13]} {video_system/video_generator_inst/vpu/vrr_wrdata[14]} {video_system/video_generator_inst/vpu/vrr_wrdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[0]} {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[1]} {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[2]} {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[3]} {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[4]} {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[5]} {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[6]} {video_system/video_generator_inst/vpu/bicubic_2x/write_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[0]} {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[1]} {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[2]} {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[3]} {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[4]} {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[5]} {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[6]} {video_system/video_generator_inst/vpu/bicubic_2x/calc_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/o_proc_unit_req_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/o_res_wren]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/raw_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/raw_fifo_rd_rst_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list video_system/video_generator_inst/vpu_ram_rden]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list video_system/video_generator_inst/vpu/vrr_wren]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/vsync_pulse]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list video_system/memory_top/mig_inst/u_mig_7series_0_mig/u_ddr3_infrastructure/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 128 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[0]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[1]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[2]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[3]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[4]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[5]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[6]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[7]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[8]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[9]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[10]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[11]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[12]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[13]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[14]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[15]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[16]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[17]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[18]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[19]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[20]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[21]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[22]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[23]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[24]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[25]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[26]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[27]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[28]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[29]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[30]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[31]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[32]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[33]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[34]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[35]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[36]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[37]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[38]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[39]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[40]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[41]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[42]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[43]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[44]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[45]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[46]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[47]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[48]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[49]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[50]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[51]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[52]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[53]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[54]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[55]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[56]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[57]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[58]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[59]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[60]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[61]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[62]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[63]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[64]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[65]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[66]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[67]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[68]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[69]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[70]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[71]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[72]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[73]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[74]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[75]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[76]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[77]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[78]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[79]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[80]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[81]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[82]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[83]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[84]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[85]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[86]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[87]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[88]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[89]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[90]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[91]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[92]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[93]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[94]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[95]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[96]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[97]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[98]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[99]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[100]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[101]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[102]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[103]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[104]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[105]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[106]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[107]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[108]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[109]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[110]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[111]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[112]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[113]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[114]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[115]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[116]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[117]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[118]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[119]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[120]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[121]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[122]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[123]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[124]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[125]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[126]} {video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data[127]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 6 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {video_system/video_generator_inst/vpu/bicubic_2x/wr_data_count[0]} {video_system/video_generator_inst/vpu/bicubic_2x/wr_data_count[1]} {video_system/video_generator_inst/vpu/bicubic_2x/wr_data_count[2]} {video_system/video_generator_inst/vpu/bicubic_2x/wr_data_count[3]} {video_system/video_generator_inst/vpu/bicubic_2x/wr_data_count[4]} {video_system/video_generator_inst/vpu/bicubic_2x/wr_data_count[5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 32 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {video_system/memory_top/axi_read_m/M_AXI_ARADDR[0]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[1]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[2]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[3]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[4]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[5]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[6]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[7]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[8]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[9]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[10]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[11]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[12]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[13]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[14]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[15]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[16]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[17]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[18]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[19]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[20]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[21]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[22]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[23]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[24]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[25]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[26]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[27]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[28]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[29]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[30]} {video_system/memory_top/axi_read_m/M_AXI_ARADDR[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 9 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {video_system/memory_top/axi_read_m/video_fifo_cnt[0]} {video_system/memory_top/axi_read_m/video_fifo_cnt[1]} {video_system/memory_top/axi_read_m/video_fifo_cnt[2]} {video_system/memory_top/axi_read_m/video_fifo_cnt[3]} {video_system/memory_top/axi_read_m/video_fifo_cnt[4]} {video_system/memory_top/axi_read_m/video_fifo_cnt[5]} {video_system/memory_top/axi_read_m/video_fifo_cnt[6]} {video_system/memory_top/axi_read_m/video_fifo_cnt[7]} {video_system/memory_top/axi_read_m/video_fifo_cnt[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 2 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {video_system/memory_top/axi_read_m/state_next[0]} {video_system/memory_top/axi_read_m/state_next[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 32 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {video_system/memory_top/axi_read_m/video_rd_addr[0]} {video_system/memory_top/axi_read_m/video_rd_addr[1]} {video_system/memory_top/axi_read_m/video_rd_addr[2]} {video_system/memory_top/axi_read_m/video_rd_addr[3]} {video_system/memory_top/axi_read_m/video_rd_addr[4]} {video_system/memory_top/axi_read_m/video_rd_addr[5]} {video_system/memory_top/axi_read_m/video_rd_addr[6]} {video_system/memory_top/axi_read_m/video_rd_addr[7]} {video_system/memory_top/axi_read_m/video_rd_addr[8]} {video_system/memory_top/axi_read_m/video_rd_addr[9]} {video_system/memory_top/axi_read_m/video_rd_addr[10]} {video_system/memory_top/axi_read_m/video_rd_addr[11]} {video_system/memory_top/axi_read_m/video_rd_addr[12]} {video_system/memory_top/axi_read_m/video_rd_addr[13]} {video_system/memory_top/axi_read_m/video_rd_addr[14]} {video_system/memory_top/axi_read_m/video_rd_addr[15]} {video_system/memory_top/axi_read_m/video_rd_addr[16]} {video_system/memory_top/axi_read_m/video_rd_addr[17]} {video_system/memory_top/axi_read_m/video_rd_addr[18]} {video_system/memory_top/axi_read_m/video_rd_addr[19]} {video_system/memory_top/axi_read_m/video_rd_addr[20]} {video_system/memory_top/axi_read_m/video_rd_addr[21]} {video_system/memory_top/axi_read_m/video_rd_addr[22]} {video_system/memory_top/axi_read_m/video_rd_addr[23]} {video_system/memory_top/axi_read_m/video_rd_addr[24]} {video_system/memory_top/axi_read_m/video_rd_addr[25]} {video_system/memory_top/axi_read_m/video_rd_addr[26]} {video_system/memory_top/axi_read_m/video_rd_addr[27]} {video_system/memory_top/axi_read_m/video_rd_addr[28]} {video_system/memory_top/axi_read_m/video_rd_addr[29]} {video_system/memory_top/axi_read_m/video_rd_addr[30]} {video_system/memory_top/axi_read_m/video_rd_addr[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 2 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {video_system/memory_top/axi_read_m/vsyncs[0]} {video_system/memory_top/axi_read_m/vsyncs[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 2 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {video_system/memory_top/axi_read_m/state_current[0]} {video_system/memory_top/axi_read_m/state_current[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_data_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/i_bypass_rlast]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 1 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list video_system/memory_top/axi_read_m/M_AXI_RVALID]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 1 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/raw_fifo_full]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 1 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list video_system/video_generator_inst/vpu/bicubic_2x/raw_fifo_wr_rst_busy]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 1 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list video_system/memory_top/axi_read_m/vs_pulse]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 1 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list video_system/memory_top/axi_read_m/wr_rst_busy]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_CLK]
