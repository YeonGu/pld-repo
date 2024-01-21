// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Nov 11 08:56:47 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/contrast_func_tab/contrast_func_tab_sim_netlist.v
// Design      : contrast_func_tab
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "contrast_func_tab,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module contrast_func_tab
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
  contrast_func_tab_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20240)
`pragma protect data_block
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
s3Hh4sA=
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
