// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:24 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ font_rom_sim_netlist.v
// Design      : font_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "font_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [10:0]addra;
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
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.2196 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
  (* C_INIT_FILE = "font_rom.mem" *) 
  (* C_INIT_FILE_NAME = "font_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1536" *) 
  (* C_READ_DEPTH_B = "1536" *) 
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
  (* C_WRITE_DEPTH_A = "1536" *) 
  (* C_WRITE_DEPTH_B = "1536" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18032)
`pragma protect data_block
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
Os5qjlFEy2RaW16D/J6IzJNc29w=
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
