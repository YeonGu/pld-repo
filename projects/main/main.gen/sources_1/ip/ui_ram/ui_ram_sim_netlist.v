// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  2 20:48:13 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/ui_ram/ui_ram_sim_netlist.v
// Design      : ui_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ui_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module ui_ram
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
  ui_ram_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27024)
`pragma protect data_block
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
s204xyEj
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
