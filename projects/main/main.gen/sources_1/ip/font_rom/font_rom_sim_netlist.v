// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  2 20:48:12 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/font_rom/font_rom_sim_netlist.v
// Design      : font_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "font_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module font_rom
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
  font_rom_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17952)
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
