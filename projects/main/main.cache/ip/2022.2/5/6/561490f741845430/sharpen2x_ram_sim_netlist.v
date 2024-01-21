// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Nov 11 06:07:16 2023
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
