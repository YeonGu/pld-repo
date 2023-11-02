// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  2 20:48:12 2023
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
y0uE/Q9sVObeAU4q3UFZqIj/XtQ=
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
