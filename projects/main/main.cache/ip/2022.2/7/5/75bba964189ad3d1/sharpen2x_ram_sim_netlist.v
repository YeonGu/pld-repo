// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Nov 11 04:55:08 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ sharpen2x_ram_sim_netlist.v
// Design      : sharpen2x_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sharpen2x_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28480)
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
