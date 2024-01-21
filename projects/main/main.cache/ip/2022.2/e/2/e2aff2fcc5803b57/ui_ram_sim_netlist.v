// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:21 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ui_ram_sim_netlist.v
// Design      : ui_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ui_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [7:0]doutb;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.53475 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ui_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2400" *) 
  (* C_READ_DEPTH_B = "2400" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2400" *) 
  (* C_WRITE_DEPTH_B = "2400" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27120)
`pragma protect data_block
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
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
