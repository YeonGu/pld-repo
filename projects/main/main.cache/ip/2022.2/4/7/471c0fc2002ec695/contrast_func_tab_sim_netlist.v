// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Nov 11 08:56:46 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ contrast_func_tab_sim_netlist.v
// Design      : contrast_func_tab
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "contrast_func_tab,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [7:0]douta;
  wire ena;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.3768 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "contrast_func_tab.mem" *) 
  (* C_INIT_FILE_NAME = "contrast_func_tab.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
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
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
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
        .wea(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20208)
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
