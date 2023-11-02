// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  2 20:48:12 2023
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
