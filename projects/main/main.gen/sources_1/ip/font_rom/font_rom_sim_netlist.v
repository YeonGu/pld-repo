// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:25 2023
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
