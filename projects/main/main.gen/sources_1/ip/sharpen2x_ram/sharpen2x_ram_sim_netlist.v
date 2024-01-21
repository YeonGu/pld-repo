// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Nov 11 06:07:16 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/sharpen2x_ram/sharpen2x_ram_sim_netlist.v
// Design      : sharpen2x_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sharpen2x_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module sharpen2x_ram
   (clka,
    wea,
    addra,
    dina,
    douta,
    clkb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [6:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [7:0]addra;
  wire [6:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [31:0]dinb;
  wire [15:0]douta;
  wire [31:0]doutb;
  wire [0:0]wea;
  wire [0:0]web;
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
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "7" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.62665 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
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
  (* C_INIT_FILE = "sharpen2x_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  sharpen2x_ram_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28464)
`pragma protect data_block
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
3VyZmrP9gsLghtrtae2hr6fYGMcL
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
