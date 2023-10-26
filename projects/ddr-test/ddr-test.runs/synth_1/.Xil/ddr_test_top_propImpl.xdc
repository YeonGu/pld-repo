set_property SRC_FILE_INFO {cfile:E:/Xilinx/PLD/pld-repo/projects/ddr-test/ddr-test.srcs/constrs_1/new/ddr-test.xdc rfile:../../../ddr-test.srcs/constrs_1/new/ddr-test.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W19 [get_ports sys_clk]
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y19 [get_ports sys_rstn]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list memc_inst/mig_inst/u_mig_7series_0_mig/u_ddr3_infrastructure/CLK]]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list {memc_inst/state_current[0]} {memc_inst/state_current[1]} {memc_inst/state_current[2]}]]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_CLK]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list {t[0]} {t[1]} {t[2]} {t[3]} {t[4]} {t[5]} {t[6]} {t[7]} {t[8]} {t[9]} {t[10]}]]
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M22 [get_ports init_calib_complete]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list memc_inst/calib]]
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe1 [get_nets [list memc_inst/sysrst]]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe2 [get_nets [list memc_inst/userrst]]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_0 ila
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list memc_inst/mig_inst/u_mig_7series_0_mig/u_ddr3_infrastructure/CLK]]
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 28 [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list {memc_inst/app_addr[0]} {memc_inst/app_addr[1]} {memc_inst/app_addr[2]} {memc_inst/app_addr[3]} {memc_inst/app_addr[4]} {memc_inst/app_addr[5]} {memc_inst/app_addr[6]} {memc_inst/app_addr[7]} {memc_inst/app_addr[8]} {memc_inst/app_addr[9]} {memc_inst/app_addr[10]} {memc_inst/app_addr[11]} {memc_inst/app_addr[12]} {memc_inst/app_addr[13]} {memc_inst/app_addr[14]} {memc_inst/app_addr[15]} {memc_inst/app_addr[16]} {memc_inst/app_addr[17]} {memc_inst/app_addr[18]} {memc_inst/app_addr[19]} {memc_inst/app_addr[20]} {memc_inst/app_addr[21]} {memc_inst/app_addr[22]} {memc_inst/app_addr[23]} {memc_inst/app_addr[24]} {memc_inst/app_addr[25]} {memc_inst/app_addr[26]} {memc_inst/app_addr[27]}]]
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe1 [get_nets [list {memc_inst/app_cmd[0]} {memc_inst/app_cmd[1]}]]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 256 [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe2 [get_nets [list {memc_inst/app_rd_data[0]} {memc_inst/app_rd_data[1]} {memc_inst/app_rd_data[2]} {memc_inst/app_rd_data[3]} {memc_inst/app_rd_data[4]} {memc_inst/app_rd_data[5]} {memc_inst/app_rd_data[6]} {memc_inst/app_rd_data[7]} {memc_inst/app_rd_data[8]} {memc_inst/app_rd_data[9]} {memc_inst/app_rd_data[10]} {memc_inst/app_rd_data[11]} {memc_inst/app_rd_data[12]} {memc_inst/app_rd_data[13]} {memc_inst/app_rd_data[14]} {memc_inst/app_rd_data[15]} {memc_inst/app_rd_data[16]} {memc_inst/app_rd_data[17]} {memc_inst/app_rd_data[18]} {memc_inst/app_rd_data[19]} {memc_inst/app_rd_data[20]} {memc_inst/app_rd_data[21]} {memc_inst/app_rd_data[22]} {memc_inst/app_rd_data[23]} {memc_inst/app_rd_data[24]} {memc_inst/app_rd_data[25]} {memc_inst/app_rd_data[26]} {memc_inst/app_rd_data[27]} {memc_inst/app_rd_data[28]} {memc_inst/app_rd_data[29]} {memc_inst/app_rd_data[30]} {memc_inst/app_rd_data[31]} {memc_inst/app_rd_data[32]} {memc_inst/app_rd_data[33]} {memc_inst/app_rd_data[34]} {memc_inst/app_rd_data[35]} {memc_inst/app_rd_data[36]} {memc_inst/app_rd_data[37]} {memc_inst/app_rd_data[38]} {memc_inst/app_rd_data[39]} {memc_inst/app_rd_data[40]} {memc_inst/app_rd_data[41]} {memc_inst/app_rd_data[42]} {memc_inst/app_rd_data[43]} {memc_inst/app_rd_data[44]} {memc_inst/app_rd_data[45]} {memc_inst/app_rd_data[46]} {memc_inst/app_rd_data[47]} {memc_inst/app_rd_data[48]} {memc_inst/app_rd_data[49]} {memc_inst/app_rd_data[50]} {memc_inst/app_rd_data[51]} {memc_inst/app_rd_data[52]} {memc_inst/app_rd_data[53]} {memc_inst/app_rd_data[54]} {memc_inst/app_rd_data[55]} {memc_inst/app_rd_data[56]} {memc_inst/app_rd_data[57]} {memc_inst/app_rd_data[58]} {memc_inst/app_rd_data[59]} {memc_inst/app_rd_data[60]} {memc_inst/app_rd_data[61]} {memc_inst/app_rd_data[62]} {memc_inst/app_rd_data[63]} {memc_inst/app_rd_data[64]} {memc_inst/app_rd_data[65]} {memc_inst/app_rd_data[66]} {memc_inst/app_rd_data[67]} {memc_inst/app_rd_data[68]} {memc_inst/app_rd_data[69]} {memc_inst/app_rd_data[70]} {memc_inst/app_rd_data[71]} {memc_inst/app_rd_data[72]} {memc_inst/app_rd_data[73]} {memc_inst/app_rd_data[74]} {memc_inst/app_rd_data[75]} {memc_inst/app_rd_data[76]} {memc_inst/app_rd_data[77]} {memc_inst/app_rd_data[78]} {memc_inst/app_rd_data[79]} {memc_inst/app_rd_data[80]} {memc_inst/app_rd_data[81]} {memc_inst/app_rd_data[82]} {memc_inst/app_rd_data[83]} {memc_inst/app_rd_data[84]} {memc_inst/app_rd_data[85]} {memc_inst/app_rd_data[86]} {memc_inst/app_rd_data[87]} {memc_inst/app_rd_data[88]} {memc_inst/app_rd_data[89]} {memc_inst/app_rd_data[90]} {memc_inst/app_rd_data[91]} {memc_inst/app_rd_data[92]} {memc_inst/app_rd_data[93]} {memc_inst/app_rd_data[94]} {memc_inst/app_rd_data[95]} {memc_inst/app_rd_data[96]} {memc_inst/app_rd_data[97]} {memc_inst/app_rd_data[98]} {memc_inst/app_rd_data[99]} {memc_inst/app_rd_data[100]} {memc_inst/app_rd_data[101]} {memc_inst/app_rd_data[102]} {memc_inst/app_rd_data[103]} {memc_inst/app_rd_data[104]} {memc_inst/app_rd_data[105]} {memc_inst/app_rd_data[106]} {memc_inst/app_rd_data[107]} {memc_inst/app_rd_data[108]} {memc_inst/app_rd_data[109]} {memc_inst/app_rd_data[110]} {memc_inst/app_rd_data[111]} {memc_inst/app_rd_data[112]} {memc_inst/app_rd_data[113]} {memc_inst/app_rd_data[114]} {memc_inst/app_rd_data[115]} {memc_inst/app_rd_data[116]} {memc_inst/app_rd_data[117]} {memc_inst/app_rd_data[118]} {memc_inst/app_rd_data[119]} {memc_inst/app_rd_data[120]} {memc_inst/app_rd_data[121]} {memc_inst/app_rd_data[122]} {memc_inst/app_rd_data[123]} {memc_inst/app_rd_data[124]} {memc_inst/app_rd_data[125]} {memc_inst/app_rd_data[126]} {memc_inst/app_rd_data[127]} {memc_inst/app_rd_data[128]} {memc_inst/app_rd_data[129]} {memc_inst/app_rd_data[130]} {memc_inst/app_rd_data[131]} {memc_inst/app_rd_data[132]} {memc_inst/app_rd_data[133]} {memc_inst/app_rd_data[134]} {memc_inst/app_rd_data[135]} {memc_inst/app_rd_data[136]} {memc_inst/app_rd_data[137]} {memc_inst/app_rd_data[138]} {memc_inst/app_rd_data[139]} {memc_inst/app_rd_data[140]} {memc_inst/app_rd_data[141]} {memc_inst/app_rd_data[142]} {memc_inst/app_rd_data[143]} {memc_inst/app_rd_data[144]} {memc_inst/app_rd_data[145]} {memc_inst/app_rd_data[146]} {memc_inst/app_rd_data[147]} {memc_inst/app_rd_data[148]} {memc_inst/app_rd_data[149]} {memc_inst/app_rd_data[150]} {memc_inst/app_rd_data[151]} {memc_inst/app_rd_data[152]} {memc_inst/app_rd_data[153]} {memc_inst/app_rd_data[154]} {memc_inst/app_rd_data[155]} {memc_inst/app_rd_data[156]} {memc_inst/app_rd_data[157]} {memc_inst/app_rd_data[158]} {memc_inst/app_rd_data[159]} {memc_inst/app_rd_data[160]} {memc_inst/app_rd_data[161]} {memc_inst/app_rd_data[162]} {memc_inst/app_rd_data[163]} {memc_inst/app_rd_data[164]} {memc_inst/app_rd_data[165]} {memc_inst/app_rd_data[166]} {memc_inst/app_rd_data[167]} {memc_inst/app_rd_data[168]} {memc_inst/app_rd_data[169]} {memc_inst/app_rd_data[170]} {memc_inst/app_rd_data[171]} {memc_inst/app_rd_data[172]} {memc_inst/app_rd_data[173]} {memc_inst/app_rd_data[174]} {memc_inst/app_rd_data[175]} {memc_inst/app_rd_data[176]} {memc_inst/app_rd_data[177]} {memc_inst/app_rd_data[178]} {memc_inst/app_rd_data[179]} {memc_inst/app_rd_data[180]} {memc_inst/app_rd_data[181]} {memc_inst/app_rd_data[182]} {memc_inst/app_rd_data[183]} {memc_inst/app_rd_data[184]} {memc_inst/app_rd_data[185]} {memc_inst/app_rd_data[186]} {memc_inst/app_rd_data[187]} {memc_inst/app_rd_data[188]} {memc_inst/app_rd_data[189]} {memc_inst/app_rd_data[190]} {memc_inst/app_rd_data[191]} {memc_inst/app_rd_data[192]} {memc_inst/app_rd_data[193]} {memc_inst/app_rd_data[194]} {memc_inst/app_rd_data[195]} {memc_inst/app_rd_data[196]} {memc_inst/app_rd_data[197]} {memc_inst/app_rd_data[198]} {memc_inst/app_rd_data[199]} {memc_inst/app_rd_data[200]} {memc_inst/app_rd_data[201]} {memc_inst/app_rd_data[202]} {memc_inst/app_rd_data[203]} {memc_inst/app_rd_data[204]} {memc_inst/app_rd_data[205]} {memc_inst/app_rd_data[206]} {memc_inst/app_rd_data[207]} {memc_inst/app_rd_data[208]} {memc_inst/app_rd_data[209]} {memc_inst/app_rd_data[210]} {memc_inst/app_rd_data[211]} {memc_inst/app_rd_data[212]} {memc_inst/app_rd_data[213]} {memc_inst/app_rd_data[214]} {memc_inst/app_rd_data[215]} {memc_inst/app_rd_data[216]} {memc_inst/app_rd_data[217]} {memc_inst/app_rd_data[218]} {memc_inst/app_rd_data[219]} {memc_inst/app_rd_data[220]} {memc_inst/app_rd_data[221]} {memc_inst/app_rd_data[222]} {memc_inst/app_rd_data[223]} {memc_inst/app_rd_data[224]} {memc_inst/app_rd_data[225]} {memc_inst/app_rd_data[226]} {memc_inst/app_rd_data[227]} {memc_inst/app_rd_data[228]} {memc_inst/app_rd_data[229]} {memc_inst/app_rd_data[230]} {memc_inst/app_rd_data[231]} {memc_inst/app_rd_data[232]} {memc_inst/app_rd_data[233]} {memc_inst/app_rd_data[234]} {memc_inst/app_rd_data[235]} {memc_inst/app_rd_data[236]} {memc_inst/app_rd_data[237]} {memc_inst/app_rd_data[238]} {memc_inst/app_rd_data[239]} {memc_inst/app_rd_data[240]} {memc_inst/app_rd_data[241]} {memc_inst/app_rd_data[242]} {memc_inst/app_rd_data[243]} {memc_inst/app_rd_data[244]} {memc_inst/app_rd_data[245]} {memc_inst/app_rd_data[246]} {memc_inst/app_rd_data[247]} {memc_inst/app_rd_data[248]} {memc_inst/app_rd_data[249]} {memc_inst/app_rd_data[250]} {memc_inst/app_rd_data[251]} {memc_inst/app_rd_data[252]} {memc_inst/app_rd_data[253]} {memc_inst/app_rd_data[254]} {memc_inst/app_rd_data[255]}]]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 256 [get_debug_ports u_ila_0/probe3]
set_property src_info {type:XDC file:1 line:47 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe3 [get_nets [list {memc_inst/app_wdf_data[0]} {memc_inst/app_wdf_data[1]} {memc_inst/app_wdf_data[2]} {memc_inst/app_wdf_data[3]} {memc_inst/app_wdf_data[4]} {memc_inst/app_wdf_data[5]} {memc_inst/app_wdf_data[6]} {memc_inst/app_wdf_data[7]} {memc_inst/app_wdf_data[8]} {memc_inst/app_wdf_data[9]} {memc_inst/app_wdf_data[10]} {memc_inst/app_wdf_data[11]} {memc_inst/app_wdf_data[12]} {memc_inst/app_wdf_data[13]} {memc_inst/app_wdf_data[14]} {memc_inst/app_wdf_data[15]} {memc_inst/app_wdf_data[16]} {memc_inst/app_wdf_data[17]} {memc_inst/app_wdf_data[18]} {memc_inst/app_wdf_data[19]} {memc_inst/app_wdf_data[20]} {memc_inst/app_wdf_data[21]} {memc_inst/app_wdf_data[22]} {memc_inst/app_wdf_data[23]} {memc_inst/app_wdf_data[24]} {memc_inst/app_wdf_data[25]} {memc_inst/app_wdf_data[26]} {memc_inst/app_wdf_data[27]} {memc_inst/app_wdf_data[28]} {memc_inst/app_wdf_data[29]} {memc_inst/app_wdf_data[30]} {memc_inst/app_wdf_data[31]} {memc_inst/app_wdf_data[32]} {memc_inst/app_wdf_data[33]} {memc_inst/app_wdf_data[34]} {memc_inst/app_wdf_data[35]} {memc_inst/app_wdf_data[36]} {memc_inst/app_wdf_data[37]} {memc_inst/app_wdf_data[38]} {memc_inst/app_wdf_data[39]} {memc_inst/app_wdf_data[40]} {memc_inst/app_wdf_data[41]} {memc_inst/app_wdf_data[42]} {memc_inst/app_wdf_data[43]} {memc_inst/app_wdf_data[44]} {memc_inst/app_wdf_data[45]} {memc_inst/app_wdf_data[46]} {memc_inst/app_wdf_data[47]} {memc_inst/app_wdf_data[48]} {memc_inst/app_wdf_data[49]} {memc_inst/app_wdf_data[50]} {memc_inst/app_wdf_data[51]} {memc_inst/app_wdf_data[52]} {memc_inst/app_wdf_data[53]} {memc_inst/app_wdf_data[54]} {memc_inst/app_wdf_data[55]} {memc_inst/app_wdf_data[56]} {memc_inst/app_wdf_data[57]} {memc_inst/app_wdf_data[58]} {memc_inst/app_wdf_data[59]} {memc_inst/app_wdf_data[60]} {memc_inst/app_wdf_data[61]} {memc_inst/app_wdf_data[62]} {memc_inst/app_wdf_data[63]} {memc_inst/app_wdf_data[64]} {memc_inst/app_wdf_data[65]} {memc_inst/app_wdf_data[66]} {memc_inst/app_wdf_data[67]} {memc_inst/app_wdf_data[68]} {memc_inst/app_wdf_data[69]} {memc_inst/app_wdf_data[70]} {memc_inst/app_wdf_data[71]} {memc_inst/app_wdf_data[72]} {memc_inst/app_wdf_data[73]} {memc_inst/app_wdf_data[74]} {memc_inst/app_wdf_data[75]} {memc_inst/app_wdf_data[76]} {memc_inst/app_wdf_data[77]} {memc_inst/app_wdf_data[78]} {memc_inst/app_wdf_data[79]} {memc_inst/app_wdf_data[80]} {memc_inst/app_wdf_data[81]} {memc_inst/app_wdf_data[82]} {memc_inst/app_wdf_data[83]} {memc_inst/app_wdf_data[84]} {memc_inst/app_wdf_data[85]} {memc_inst/app_wdf_data[86]} {memc_inst/app_wdf_data[87]} {memc_inst/app_wdf_data[88]} {memc_inst/app_wdf_data[89]} {memc_inst/app_wdf_data[90]} {memc_inst/app_wdf_data[91]} {memc_inst/app_wdf_data[92]} {memc_inst/app_wdf_data[93]} {memc_inst/app_wdf_data[94]} {memc_inst/app_wdf_data[95]} {memc_inst/app_wdf_data[96]} {memc_inst/app_wdf_data[97]} {memc_inst/app_wdf_data[98]} {memc_inst/app_wdf_data[99]} {memc_inst/app_wdf_data[100]} {memc_inst/app_wdf_data[101]} {memc_inst/app_wdf_data[102]} {memc_inst/app_wdf_data[103]} {memc_inst/app_wdf_data[104]} {memc_inst/app_wdf_data[105]} {memc_inst/app_wdf_data[106]} {memc_inst/app_wdf_data[107]} {memc_inst/app_wdf_data[108]} {memc_inst/app_wdf_data[109]} {memc_inst/app_wdf_data[110]} {memc_inst/app_wdf_data[111]} {memc_inst/app_wdf_data[112]} {memc_inst/app_wdf_data[113]} {memc_inst/app_wdf_data[114]} {memc_inst/app_wdf_data[115]} {memc_inst/app_wdf_data[116]} {memc_inst/app_wdf_data[117]} {memc_inst/app_wdf_data[118]} {memc_inst/app_wdf_data[119]} {memc_inst/app_wdf_data[120]} {memc_inst/app_wdf_data[121]} {memc_inst/app_wdf_data[122]} {memc_inst/app_wdf_data[123]} {memc_inst/app_wdf_data[124]} {memc_inst/app_wdf_data[125]} {memc_inst/app_wdf_data[126]} {memc_inst/app_wdf_data[127]} {memc_inst/app_wdf_data[128]} {memc_inst/app_wdf_data[129]} {memc_inst/app_wdf_data[130]} {memc_inst/app_wdf_data[131]} {memc_inst/app_wdf_data[132]} {memc_inst/app_wdf_data[133]} {memc_inst/app_wdf_data[134]} {memc_inst/app_wdf_data[135]} {memc_inst/app_wdf_data[136]} {memc_inst/app_wdf_data[137]} {memc_inst/app_wdf_data[138]} {memc_inst/app_wdf_data[139]} {memc_inst/app_wdf_data[140]} {memc_inst/app_wdf_data[141]} {memc_inst/app_wdf_data[142]} {memc_inst/app_wdf_data[143]} {memc_inst/app_wdf_data[144]} {memc_inst/app_wdf_data[145]} {memc_inst/app_wdf_data[146]} {memc_inst/app_wdf_data[147]} {memc_inst/app_wdf_data[148]} {memc_inst/app_wdf_data[149]} {memc_inst/app_wdf_data[150]} {memc_inst/app_wdf_data[151]} {memc_inst/app_wdf_data[152]} {memc_inst/app_wdf_data[153]} {memc_inst/app_wdf_data[154]} {memc_inst/app_wdf_data[155]} {memc_inst/app_wdf_data[156]} {memc_inst/app_wdf_data[157]} {memc_inst/app_wdf_data[158]} {memc_inst/app_wdf_data[159]} {memc_inst/app_wdf_data[160]} {memc_inst/app_wdf_data[161]} {memc_inst/app_wdf_data[162]} {memc_inst/app_wdf_data[163]} {memc_inst/app_wdf_data[164]} {memc_inst/app_wdf_data[165]} {memc_inst/app_wdf_data[166]} {memc_inst/app_wdf_data[167]} {memc_inst/app_wdf_data[168]} {memc_inst/app_wdf_data[169]} {memc_inst/app_wdf_data[170]} {memc_inst/app_wdf_data[171]} {memc_inst/app_wdf_data[172]} {memc_inst/app_wdf_data[173]} {memc_inst/app_wdf_data[174]} {memc_inst/app_wdf_data[175]} {memc_inst/app_wdf_data[176]} {memc_inst/app_wdf_data[177]} {memc_inst/app_wdf_data[178]} {memc_inst/app_wdf_data[179]} {memc_inst/app_wdf_data[180]} {memc_inst/app_wdf_data[181]} {memc_inst/app_wdf_data[182]} {memc_inst/app_wdf_data[183]} {memc_inst/app_wdf_data[184]} {memc_inst/app_wdf_data[185]} {memc_inst/app_wdf_data[186]} {memc_inst/app_wdf_data[187]} {memc_inst/app_wdf_data[188]} {memc_inst/app_wdf_data[189]} {memc_inst/app_wdf_data[190]} {memc_inst/app_wdf_data[191]} {memc_inst/app_wdf_data[192]} {memc_inst/app_wdf_data[193]} {memc_inst/app_wdf_data[194]} {memc_inst/app_wdf_data[195]} {memc_inst/app_wdf_data[196]} {memc_inst/app_wdf_data[197]} {memc_inst/app_wdf_data[198]} {memc_inst/app_wdf_data[199]} {memc_inst/app_wdf_data[200]} {memc_inst/app_wdf_data[201]} {memc_inst/app_wdf_data[202]} {memc_inst/app_wdf_data[203]} {memc_inst/app_wdf_data[204]} {memc_inst/app_wdf_data[205]} {memc_inst/app_wdf_data[206]} {memc_inst/app_wdf_data[207]} {memc_inst/app_wdf_data[208]} {memc_inst/app_wdf_data[209]} {memc_inst/app_wdf_data[210]} {memc_inst/app_wdf_data[211]} {memc_inst/app_wdf_data[212]} {memc_inst/app_wdf_data[213]} {memc_inst/app_wdf_data[214]} {memc_inst/app_wdf_data[215]} {memc_inst/app_wdf_data[216]} {memc_inst/app_wdf_data[217]} {memc_inst/app_wdf_data[218]} {memc_inst/app_wdf_data[219]} {memc_inst/app_wdf_data[220]} {memc_inst/app_wdf_data[221]} {memc_inst/app_wdf_data[222]} {memc_inst/app_wdf_data[223]} {memc_inst/app_wdf_data[224]} {memc_inst/app_wdf_data[225]} {memc_inst/app_wdf_data[226]} {memc_inst/app_wdf_data[227]} {memc_inst/app_wdf_data[228]} {memc_inst/app_wdf_data[229]} {memc_inst/app_wdf_data[230]} {memc_inst/app_wdf_data[231]} {memc_inst/app_wdf_data[232]} {memc_inst/app_wdf_data[233]} {memc_inst/app_wdf_data[234]} {memc_inst/app_wdf_data[235]} {memc_inst/app_wdf_data[236]} {memc_inst/app_wdf_data[237]} {memc_inst/app_wdf_data[238]} {memc_inst/app_wdf_data[239]} {memc_inst/app_wdf_data[240]} {memc_inst/app_wdf_data[241]} {memc_inst/app_wdf_data[242]} {memc_inst/app_wdf_data[243]} {memc_inst/app_wdf_data[244]} {memc_inst/app_wdf_data[245]} {memc_inst/app_wdf_data[246]} {memc_inst/app_wdf_data[247]} {memc_inst/app_wdf_data[248]} {memc_inst/app_wdf_data[249]} {memc_inst/app_wdf_data[250]} {memc_inst/app_wdf_data[251]} {memc_inst/app_wdf_data[252]} {memc_inst/app_wdf_data[253]} {memc_inst/app_wdf_data[254]} {memc_inst/app_wdf_data[255]}]]
set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property src_info {type:XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
set_property src_info {type:XDC file:1 line:51 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe4 [get_nets [list {memc_inst/state_current[0]} {memc_inst/state_current[1]} {memc_inst/state_current[2]}]]
set_property src_info {type:XDC file:1 line:52 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe5 [get_nets [list memc_inst/app_en]]
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property src_info {type:XDC file:1 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
set_property src_info {type:XDC file:1 line:59 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe6 [get_nets [list memc_inst/app_rd_data_valid]]
set_property src_info {type:XDC file:1 line:60 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property src_info {type:XDC file:1 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe7 [get_nets [list memc_inst/app_rdy]]
set_property src_info {type:XDC file:1 line:64 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
set_property src_info {type:XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe8 [get_nets [list memc_inst/app_wdf_end]]
set_property src_info {type:XDC file:1 line:68 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property src_info {type:XDC file:1 line:70 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
set_property src_info {type:XDC file:1 line:71 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe9 [get_nets [list memc_inst/app_wdf_rdy]]
set_property src_info {type:XDC file:1 line:72 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:73 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property src_info {type:XDC file:1 line:74 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
set_property src_info {type:XDC file:1 line:75 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe10 [get_nets [list memc_inst/app_wdf_wren]]
set_property src_info {type:XDC file:1 line:76 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:77 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:79 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_CLK]
