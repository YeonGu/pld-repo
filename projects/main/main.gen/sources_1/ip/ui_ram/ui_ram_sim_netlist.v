// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:22 2023
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
Te+D7Bhk2ajxgkk/pecebwBILMm3GvzQRs4uJmf92ILeGF8+8daFFg43YHRcyZLdf0BhZiXJPXGY
W58z/HF/tARLNAW5ZyFmc2iXnIrqCEswbydZa3g4GE/ZHgT8umKUS4WvuzYfuDsvu27Ppo4b2SUO
ZIdN0QQ2tNi0g5Sim/gc8G5ms408ehxupgGmNwsK1COUlOQTCmJ2JEop68z+a7MQWwPinCj9ymdL
CG57FydkjY4y+UmVbUsKTIJng8trKfe146U9deSfeOceHQMuvmF2t5qlBMJDt9qA1R5bqHFKcZP7
SAF9Ixc1f5JP0sbrMNI/0411EDwoAU/kkROR1cYu75XOrXQynaGkjxYOzmwbc+8rEdmXUdJ73OgK
CpG2wUPdvjZX1Iu5z3HHuX4x7tZgSJ3Kfqz14fR9mzpYBBpdw2075fiEkswiRihNLGCFJC0S0WTM
ErN3sF8wt6w+dXMFsmdoFUGiOQiXbZNPIbMxzSF2EZtirQVkzHwkiWQ//32ewqr9CuLzPeqPcK3S
d7/BfZn1xyxaaz/YdHCJTuEGBEc1ryXmOgWQXN0He4+x54Uyv9r2/9Gao4NOjwBvhu48ynw9vkZm
vOBUiMAy6927M+77TsAjpjIKtkK4kdSdHHp0wdPKH7nZFfNJNDbvUQDA8OJovXcTOSFUKzJZPD7s
Knhl/0/61d0mtXbs82oMEAg5Wy//YiP+aZahSE8yd/SghbhVcgmuZFX/Mc6/peBuQkfwBw4bD9FK
C6HCqensre5eUr/nZX3k2FYUFpMCISxhqquoNprO2J6sRl/dYlFwhs3TTVu4viI+dSeMsZto7wnz
6kNgwVpL1XfHfjudQp2kPn9mnwWkXDehbvto873pHglZ90U7ZGQ3lUmq8OXcGu3U1mhS7I7HkZR+
p61BUVeaD48jkuCBVEbChMI+Otplui+q/5Lk/mkeHDOchDH7TPTLu0ps2TKcEv/MxStLg6e3qG0W
s48uatKbDHIBKp2xdpQ5tvEDd2vXyUhXkLth3wgKQSbS3EL6IWeTHNmX0FmetBdFMaP7us8Sv8Mg
Ir3Mr4QLL1KErqucHgQOKBKpsM5c/yNX9GHIqbWXW79cwoth9/Esn/PItE32fj5BGRXFvTtIROUp
xaVihYhtMW6k82epoHv50FkC0ZpzIzANzzWUhMAcYQe4sOX6oiCGdtzY4WzQbYBC9ENTo3dMSode
vMLdn0s+XOPaeMbmDDhMSPrpyDNk97vDvhToLXf8B0u3S2wLEOmAxTiNCe8ugpshf9nC3RAbBUIE
l80ulRJGVWJCqqimOzKHCQRv2VHACBld0ySuHrNat0sdGb7O1UwlQAQNFS/8qXEBcW6Y9n0LuFeQ
W4hArrMhoMmdlcDhAK4hoyaRmBxvrWEAHSTx6TobOUN9Pjf/7GI+qo1WRoM9NaBL8O7EzdH/r26P
WOpG7VCCiMuMS2o3XV1CvuONOjCDL+mlc5t30IeehlDY9Emoba7NZlmoP0R01a8ghjbUifJUoQq0
nqqfnkXnXjepAW2x7cMuVK2+dxLbJ6zidM0MCJ++iB6PHeVoR+XBb1C6j8/3ma1FTjAPov7z+OrJ
/shbwmASzgvD5tLFWyOcygxacS6SDGrQf17slGv0IP/V8EI24Vc4868XWCHq0+3HK5eJYL5rBfvJ
nqdS1UvrRn1jFkmq9il8K3k0gyd+qHkLGHrtVI+Efav4BeCdG+gX6aB3g8Lx/03aquudnq1gteSo
TmPfdlELjjMZ+g3uA3sanelDL2+K08riydANqpA18ugTErWcA+QswlBPWfwiM6WezprgTaLdLHut
+lNnSfFNd6EqjaYgYb16vwfZA+e9wFlt5aMTl1wCnJVkbqIvIuFjYFVSfHlTpJ4BPe/VVhNYFigQ
Y+2t8z5UGpaDsJV+cq++4xXj9UDc6E9NMkUMMBJ4xAtVxscuuArX27BIBmFAuTrsgsIJeFkOBUpo
4SUAd8LR4GYWGzEHZKWONhwjiMaSZi52WRfygHDNUFlkYfxIaiCQfEGEtQxufzzqJGENUMt5LaG1
Me5RnONESktwZoJupQw4JvJ6Gf3xisaWOsBfEZO9f795L2sY/h0mA3sl4OtitOHEYSbdJwDBwxup
jzwXvhz9Mea6M1NtSdI/AP4YKlEcuQq4ax717PzBPmHAnFG/ErGR1Qo9TntfO/Esft+KfEAgfyTU
yipEeykGDH6qvqtDBGAgop+eNecrrwgptwNKZMOs5vE7P+aJXyH1hklrfwa9r+TBPAYMxGrsjFJH
KlmF6CusRZFUXG4GGanthpjrAvwVR4n0wfP/D1f6xAn1U36Lk8Kaheno2YEL5DnK+ZZJJ0R7oy6M
Bj06Y2JaJ2XPYwA2ZoARnmS3FQPOwi0mhlgnup/OypvGd+0bSWK8UL+G7YZaQsRjxtsW8AM2YbVX
x8mFSEYRkIDwELAz5v1LYwfx8UogNzY92sLYGqOX1+BiUyWJHdpJSSVZCDKHZVqVoaheGUbwq1Fz
1ow8TR7pjbeDrLJk2Auu/SnAIgEFpyz0DYV4kRtjgy0QxbhorXWA9UfD2syTcOWhQV4wQ7xFXv1Q
0SToV6EYxMKyWsDhzqnSyqgLqhOq9kGIVT8ibnH92mj4sTSXPeuLKNYFMaqBgQXbpCvtGw7HGrWX
hRUlMSqy5KpzIRrBx+gYIdscmfASwDVvGrP/QEkG3pYabsi80OQScSzKKzOcFMP6osMHtB7cAQqJ
SUGT1JnkH3wPEY+btC+VanpaUxvgCHmcURjZDtIs1ZvwOJ9q71d6YP2T2Xk6OwxpSgsUZaMIPgX4
f9HCQugSBawg7xxYwwr1xlxnacSjQRvxsWR5mhqoJSrztcjJnXJ2V3Nau7DoWK3NIbRsBhfXqZFY
cozeu9Ba2sBkaMfeZtzS4Vc3bNb/tBtgf5AruKSs74D11Zg5mwDqQkVv8mDCYJeB5O614PCbSE13
fNkpwwI7gPf4bV7MXqcCa8R057OzvBNLgipiaWdz80Z54TWKrwaRZep4uNbD3DisZP3SDKxJRPUz
Vq0DmdPxngYNNA8EnYFILglE1oZMoXTnN7CBPjN9CLhfoUa94Hphgw3efuExEIzQIeDY6hofp/SI
RbvtrTYTvd0cs6JcZdrZBjt0OVCaaQlO0AbTfO/2BAZ66NwTxoaHDcoQbHeQZNQWpklFYArtlLuI
dCuQJH00YyAvgKZW0KcXlYv4cimYIRG6uaAoVPS+G3q4Lzr8zI3igGY4+m7b5yu3r+Rxjfp2f5Px
cnOSQJk4HXKL0PYEGjABhgbPsBCU8gUU9NJfFfUWjtyZ3nJ2mn2dbd7Ty/bC5zet5gaQ0s/5vmVt
BAaMrBf4+osSl+zXZJmIPW87TMDNA/ZYf0i+W+t1CuOhsZSC9swn6TLQdQlDM8ICbUD1A6UgAPm5
ocF7+73dXeNL12YMrKrzMXdCT0h3SbP2RVIB7DvXMxmH2AvQeVI6Y/LO/ffYGkXjnN1CRtMS/m/2
ECqJ6pcvSwFIR87T66jF4X4fCEE3b1yBtQO/Zb/SOfeCDr91arCB8dgxhB6NrM2M/FJT3xoXhv4g
WvdQrLOscdk4+wD/EiOdMqDUnu/WwE0el5awqK8isMDcQsAFcolWxM5kMyzkKkikhMCuyroiOOES
KhRRxB5JhQZldwiK96i/6kcZ0YgvC4v83/63+9VXnjuwHf45C4QYOlpLPQfiS/GKftgLM+3o5a/l
nTzwsuYZnu0EZ5vlvq6a3vH/ZXV4gfWq7Qh0ux+Mehd7DUYt08Ow2JgPy8bgblzZae+xGLwx0fZW
fXFLjShRt9zFvyk6zsIYWYeT4lRkQPCpSsJCuN1HejrQKtBuxLARk/8LxP9gMyFODcOsqKTzPtbe
Tyk/j34msynH8e02O8Zb29jECR9WZ+CHp/8L6KOWD9q7tlHvWWL3gbklBSf+KLuRx8vUOjXNvhhe
V0/GWXb+UJlo3bTTS9QMJtCpR89uYoSW2MDXDhyWs2lehg1cbSA3oghDcuRBT7v6aUo6CDE3tnQY
U5lLP34AjK9UBYFgmFkqkiljA0Je/tDvKDRJlxfinU9J4xCvHqAHquvS+mqZUQf7VwwE1QPKyjq1
J2UP/bQ7YttyMD+sDmCP9F5saeBbi9jGN0/Ilh+HoZv/Pm8/lo+aO05sNt93oyvcxk8y4/WtIoxB
TANyxEQBatPBq+NNrgFHtCBO1a7Qsqbvx6UwvTjT4bdE5E5MWU7RceeOivVRZIpXA8TvTkwU6sX2
GQLpQokP2bX9kbrX8x+Z94JoK31IntfvVQ1Msr78UZMIv22l11K1PwUZZvDb8oXsIcKlZEJAF092
T3Z1R2FwoPqt2XQZqUWqThFjsOu9ot3YD/7AxE/WxErZwAoe9Zrma97N/+Q8SyBM6nHCpEDv9+ZG
s7y9kZfltD+6AAAD+/7HgDtWcy5UqJvehZHuLdcV+dFrOK+U+t32r8YrgjCptIdvZg1HU4oofR+A
TVnNC6PbmkEvxkF66nUOjUQYl6zX6ud/Bxg/xE2CuYgrJ+DlgV3kuM1mcxMlMTJwPtkRJkUhQ8Wc
QJ0k7gWQpYa3EXKeAEkhrbMfIE2tG8sER9+2AbfXnvHfLFjIfSC3ipBZ5bAVL7ixXIYCHuCM5DMp
b5XfaI2yh9639U5bZVkW3vL3yglMo3vKnMMX7R8v7+bXqGuNkr2gLDoRrPsYAT4rDAd33+NRI75Q
umzi02kX87GeMgT8bdtVPCmKtOXfxaWl8tilOy3ndO48jn+a58obnn6FPi6lV9MO8H0jlx7RShr5
XdqFz9OYdrtCcD++Dybv3MetRf6OMKeeRv7gPQZKjbIV3QESOwzWY0uys0nTai7ZQZR9q8o3TNTB
cm/3+R0vWb7jiplM4bSNbAUucN/b9OewQvEG8zZZeQEjKKDzBP3BtbwBy1aI+vPzke5wCT5DzZGg
PNJchivvF6K1X0A77+1CSsrDrtssFX1NwQ1eR6/57knuVtKZSRtUwVHg6kwdPdwE+nZOL7DFqH5v
zZnQdOrUZWjJc7A9dIWZ47PUOAe8DFw8JwGlKoFgomKpdpq+XiTWQrVrzfZb6aII+53/uYqFhEgZ
Sx8S3niYbkw8O3hBo3uKmSkPzGy45tgwQt0cOrSyDdD9VnFX5CdVxFeKpk9kYbWDSERpPZn/n9p7
jmvpRHLu77bC0REenGjwuhwSCecZb4BXIN38IZUmEkk8W35RYQApBU4COZYm3bsOpM+CVAwwF0O+
AzWiLq0L07dl/JkJeKg7M7n7CZxMwccNvkX+VbuTl8zbvIsOnd7kFmoAq3wN3twKXy+fvT52mIWd
oRNKJhJB/ZT9ZqEBhrrZFIORFB1z2x5YfcOMaS2MliAO3pf0hKCHnXYGq4p5L683vntsIHaR3OeI
JfF81Gk4HYzevX4y13XU+qdAQsiSmgmlDZ8yFor+WXGnu4l5I1nBD6C7CI+CkCLJELR3N/Yi7UIl
95/HN7GQ7kFgdjm4QV/CPLG3pkev5mx22oZ9xstZGEztnScfbPd955IUg2ZtGzyGVnMCUfLl8zBV
99e/nidonwSZfO4EU9A94ZhyG9NljnMCvt3+//fJl2IEXrsr1Rq6ZLUkJT9nOkLjsCcnldnUyRe7
7KL8fvMF7WoW3+f7pGHveVTP7gTCAskK6FY9eqFSto4q4szNoYCMwtmbQG4ApdWafv/yp+oVw7OV
kHNVjsY+/Pmb4gbbgt4bWrGRJ0pGpu2Njjb0w1Abs/nXF66djFDawY89qXqeUCqQfypfAFIQCt0b
4ISU5CQ62xhoUsTW6h9soBeVrTPF6Vc/tYjGrN0spGJ0nJ2IYJ+lStnY8n5V01V8hnHf3zz+W8Yo
tEQbklFHFeE1yR1GpBfJiRmdYVbT1cUIu6LG/fXaEXT2RMIq0JqnwdCAR8kaKZ4SuFX4sPD1kfNy
OLux1ZNhNz+Pt5xne1KlwIgeq05XEZSytTkZdmN6aTPiW9j6IsCJkmPdFXoEUo4U6Tj8H3mQQ92k
KLCv04BQDvvto408A6IfAJAqWXLYWivetU6qZPthw+VYe/LQQygNPnmlZTF57JiiKA/WGWsdQhi2
GG/Ru9keiVZKtvp9wW/uU5vcB+qACjaLjxJ/8QK8BeS8vs4AtarGl0VLR3t4ZGHEyRPM951k2TyM
NiQtmj1zAgM7DzQwm1ewZNavHbcMAz37wvcnJwRnvxxz2wclcJp2GOR1jhHP09ZkHti16CZETjaZ
aYGtcCwzoWUWoINzTKvM5uUBcwky+rwc7RIsuwRwpvLsvHPUqwr6xEU2lOjZf/RrKxGNG+VwzKZj
0nFNnjR9sFy3I8pau1MM1EnULpAVkKP317K7MS/mGEBMI5Vt1/aeHYco+94qDbh75SimSwFwXOi5
FKpO0DbelKpg4rkKK3Jwh2Oysa9NGaExT/YWkO7Y4k8TChCZ68z8Yhxcr2UnOvxAAPCu60e5Zs4E
FeQ+s3743Y6YYxY7ijnLwUhFTZjoytuiFiWtQVKfrpkiRA8hOB/WDRlKIQL5NVtHgDvur5JcshS8
K9I3endpN1fFtajxHio7ncpGiM/jx6kwjasVE2cN677thb5mXB9VP4tsxUsUJLMJbynDC6wdzyCN
8z+S8Sm0FpqfJn5IcWU8WYi5hhCWjkVRMOzsBwJgFD0BQsMpztyZY/KYPI7PkohNuQnwVEJgEuaY
ELZZhVZ2lznOBxtK1OPeF4iHMyIAxDW+PMY5fRRwbK4WmCs5MstW7cJSD6B5MMHwdz49dtLN1Sx1
mey7o2j/IX8KPEzY6HGY0Be18Xj93xmuNSQsqO8fCBavNl7VXRQWsEmAuyaP6yV/+vrfW4V9vlc6
60/UpZcW9mS2FlJcSJTi0v94U8C/50uKUIU9tuofUrrFFt8t4B3pLOFfgerrHGRkiFDwhwnGUh6k
ycQtwzhZUC65cDsY3zopqUO9qfZuAI3U+w5LjD68LcQTDRNwYkQRwhJITCMnymk6bgKc7+wE0whk
0sGoCiIBvdFP5DdyxMeS2R74pd4iLirzRiRV4zSNN/UYYbqQmd2qVu4SdyJkangXnbSzINk+hjWP
YJOrUPEiklodnZGZF4QvhKZzupR+O9ZyeHbQQ1lvAvgotX9YC19DSiqozS/EPQgc5+rJPhj4NrqL
h8PL1T5FCH+NitUiDkcT0QBp8q5jAVmWwdyYVh1Z9nZ/Rfqej2Bkqlk+pM9vu5y38AgSQOair+pd
j+L2SCSbTPa2LUtTRVsjksoUTcXAsrEZH/lRID50Ii+j8nTPyr0Jvh9PKqyK0HhVEcZfKmv15+x7
Qq8MJr2SzOt1P1YAfFcknhQHPVDO2SFsdmPHIyH+k1J0cpvLlRDMrLU/IVHxD5+KO8G/rdWxCjIV
12WOEk3pNjtNeprKZag3uNAMYs3weihvowxgNpXVHkN0z2JNlTy5QJbSG1keXzGdz1qUNd2tEz3o
zPassVkzv7/lMuvU1VDwrXE/GpJgwv07WPzGaAB/FW/9UBfmxcxZZWAERz2y83Ou/P9RSwJyQhRe
V8gjqWqKKXsQzWITq7xLLTAX4rrbsnrukQ9kPMDWvqM7JD0bnoMZVHmdV4kYvbYuhzqprfvcK/wS
351Ij0wQkF+X9tOKHfPPVWMvv8j25fqby/2M6w6Do7ZkKkICHh8y2te0h7eH4wXyCmkROEY4xUmV
x/OHGnvfzTW3VcWHxlSP/zdEqXxlt39xYCNm/Mg5tWYsCX1PJBAYpMTPKvwrGZkuyoyn2w/kyDHA
I8/z//ZhuRpO3qqtoJwv99zD6qMTYSTwPiqrnlSJBWRNwDfTG72o4huNAhEgwK+yIaMQT2zbfmhq
spr+ffv444VAuUrZl9T+L1XQW3y/2D0wKAdjAzP4XcxBCi9DHRB7xVSTxxp5RZm+wOQg9rRYQRTV
iLz1UATU0WQP1AIACso2j/zUyPAzk7X7b0fa3lOzuKt48+VdsC8Ep6blWumQlP8vxM9pXM5pWHy4
fXkpekdbqh+l3s8JQ1v2kL84MQnXhH2lNqHpBbqQU/jpleiEfz4DhtFVzdJrk8QBNunuB49GxzX7
5Te6sfQLza7tMJ/MxhjqVPU/lFZpb/HajMlLAxHwCsAY4xCUXQBUPRMnJ/efiWizGDY04g3zOFnu
pisxiSnd+eS60EddD5mkVn9n9vVDR+JsJvXp4VxhdJ9jbPAwzZaJRtXIxd3Mj22KBj99mm8FSXx6
LKngfOJLP22aHr6Nq5mFoga/9NWTbK2zAIWyn/3R+DSEPB2gEuVEm3iXps6p4WGfoALNqjYL3MoJ
kDxek/YdL2CbZ8PkO0gX8ZNG/0f5efvNqHL/TVE1RUgiB5yJa6GfKrFM8uqxioEM4mRP1TAfed2m
Z0yWhWcOCy84TqbSC0HAVhGEsAwwJbaKPTvV2VOrJBYpyE2phw3zy4QQQWN38Qu9LtvKWxiAG5Ik
24D/+G7vKK5CBKXrdylJDFzHVuH+iA+eL/uTRieS6OAO00qilTXLAMDcXDaffbY5yu/SrOH9YzR2
0La92nn5JxaiwaB8Yw8Nyo4udX0CYFcAvrkuXdcDKSWithKrJnUMLDt9N98HaimWcj+5MRqwjM3M
mrdALJL25jybLDDACkAIF3iSi9q0jYCSVJX2cNQZedEZVe4dWmOmWN/kQoWeJUVDUf8Zj5QTo+ak
UqxjlGohT+iSI/ErNZkFLfC9ivLtfg2A+ZyOkOGBaUnUDeQdDWV9S3UQwofdg/PCw2ZspBG3VwGH
zIr7IJKzfj6gzUmuE26SJkKrRahSeoVfmUDI5rkN9uZ6kJdtBexas8obEe4NIYnGTE5ZO6r0pbJR
ZfZPYbE1BK1ljdGC8jx2v7QZ+Lrn75m01EWi+h0s5et8q8nZufAEGxe5JQdRJaYblKTv7pI4b8dq
nGKKUOO0AK/aCL/+sVMuv/axDe1jLKPMtH79uDp8RebO2Mn2SKwVxW/WcsWtNuXhSfqTih/Nh3Pw
1V7RqUrSoZX2JtSvoIDJbtwElW3Dw75XHZcU1uRFmwHOCGcw8XCx4q4Pm1GFzazcxkvAKFGoa+IF
YuWaZcFv6SVJImyfBcpAJcJIp9tfNpIiUHUsy0eEWYe8O9PpBcc3wKnIBr9mFvFC8rzbcNr3ZTTQ
vAo3SEbsxLn1dwYMbZ+5lTmDS+HyLE0CSu6kyH9eBCNN7EC4H+1wTi9mrZSxSjtbHKwgYWrllujC
2+jGeitMauCg0ag0HY9GuQjXuvBSQRiHKwdPxJTzZOFRDI0gmfDH9qNdlJXFmEgNqPrdK29VeHj7
qREj/Do0t3TNGtTRtgZbFXsAtXM/hKPW+9gnLnCCgUSKrQM5AaArVTWzDKIbGHKAzYqvTqVtLx6E
VA0ckdYhwht+XK+OWU7VJKXBnyz0Y1OZk3a76VhZT5Q/69jQvuF85BE6vxrkt0KQGdhW2kMOrb+f
XIa4pEY7g0iwBgAn7BDHgb9saOWJtwHQggnx3ksvWgxtOsNFyozhH7fMA0tUrSKmnUBTgdfXSISM
5S2/DI4XKRxiDlj8AWBjYohU5ZMeR4xxnB2f+ICAjkVfpgQ12J0tSWjDk/Vw38p9s/xTrKj88t84
oR6z8kl1AdwcJdRwjC9oxjbxwTB9FEpB/rFvfdgalDjDPJMhO06GO4hADhWlSqZvkQ+uZD5+eTin
bWXPucZbybJ8XIoIA7gIXpyP+qNbBev3k6VuWG4AlmrYs4UP//3BGkRSKtCJH8L8UTapHpZlRs8+
42y77Gl8+E6WO7QQzAKF8O0mEQaZ9B4+t08tzv351pcuhn4Pvu9FRgGg5BqwDpI1P4dWWcxa1/Np
RD4Od70mJVZ5ITJwy2rN07yyDYQeD6p4xlFNtsxBsPOUuFQhzwJcUBQFOEG4w/THQN+fJIEpTENz
skf6g6I5Jy5+CiznocLnX0iGw1LUcSrC6BZbK+sgFunALkCGew+U6H8X8Y90Oz1S8iWrRg7kMbLd
xQP1B2zUR+oNqa3awDytKwf7vouasNf0bKwmuIooShI6CLd5+MXLsYTmA7/vYdJaq9JTsdlF1qMv
DozIrMqFiPFwZaSclAeIZUyZrBJMs3RwCs1CT6aGw39MhUwAtnMbW1I3kBpe6Y27r0rnxVPi/x4h
sWvRlmqhsFIN4eelJUYbw1s7sdwq0+sA4d+/8PXpP3OY7pNpwGVg/3oRucIOXh9MjaG/Ce9juCQy
ynmcUczJPtYP8rZSYUKTC3vBWrA4MD+1kTuIkLEhTfSvWNETyIe8N268Scg03dDLA7gfrc14vlja
rKtygP7T/fOs4wd9aNXiQ6TWxt1LgY15L5vewtfY2OpNmi5HZp++QQx+/O9p3+xB6pSMwQBZSJJJ
rmbKp1bfH2YfVbyJ7AGf+rHPW89kyWpkKyecFhNlKjXwE3IRpWTH0sT17lLCvUtr81xtI8cnpOMq
e6hOzbiNXETAmZPSdWSX9WOl8LZtcC26rKTdWI7xFo3A3eY7XDbEvW9/ru2jP0yl5+5a1VnNbVIs
9XEIOfJ6f2ATRibVop+udn8nY1zrreM8jJzNPq2S3WEd3Rk6ET79BastPxg3HIlTJZttJmN46yIX
t3kSvdTNPrcXcrb67EdJplWXFApotCgoILbyGsUaFifGpTbQjNMdmqEWjtqlOk/4yPFe+bsCQWFb
E+z09QiCdLbcoB4uKGU3NqLN+UGbp7e2UCnC2T0Noe/vLiR0ql6M6gGnzNKqvUqHYP1FlnbLgG+H
4jPHJtquUH9qDLUFfxz4pOltjyeqKJuZ7rKoyLYxNhWaM2eHgkR5xlxVPmYmSUkxfaimxsYYQUNb
MGRqe0T0XRwaBSFgAEMCJ2XsWAd+Axo7Gwivju8YClsZRH2yB2eTuxFQdxkHoSi1kNyF/5xZHds7
jDrOSzv24L7Do7iJn/Gll3eZre45KSvklXjbLjLrknWGig6UCW4pjI1Z72/bn+oXmwO0wOw4+2dc
FVLwgCcET2pBUjLA4S5ZT+O+9XHXKm5+9fVeJyyHFieYfP64pazHmflSXI5j9JTHpYzgGUbnTh8q
tN+M6pbGtzfFbxhw0SveW0hQ069jObonAfD8Z/Av00njSla7H9WP5iTaN9qo1wKcADJjFeh869GO
FwCyQMZY42NVhpJgHcGGHH4IZBX7INjHZnpUSUuN8VX9ZzR+Zny5uJmitYeOUEnmebLrQj4asoe/
ekFbfdtPrsEuEc6xuALoCx28J6yXVjIYrawkdwTwCteTqhlMmrAGLOCMHAJECOJop4mk+y0k/LlL
YD682rkNgvOC2VF1Uy+anmUppADM2hKwrIZTryB0EDLVV5rXQcwqH9nb7aAeC+yvxe6xyFjkZip5
EYzrdZKcx+hj+fnPOfGIDnK1CjlgHroPKC45um4Efp2XqYUGsQ/NThRctxLQVqQm31NUh783p1mA
3xCXT69aTrplgMad3uSZqCB+MU5fviP87LO5hUkoZQj5B2dO/CfcDVdFEWVOceVGzSxRzeIk0GY/
TedKpSOOu5LmbEqXJaXXq9YZ04mH8cMUcCVFJu5Lym78yuxYaGH1wDwPIdv8Ffi6Ynz54pseaZLh
Bom/kRmBybsfFTv70jzDgmD8h+JAQDsLwmxZBRIRou7n9ygJL8BsTygDWqTUlxZ2ksC7R77wYaFB
o+J5IVN52ufssX9VzNiZK+t6vqnSoDqvqryZWZASYFfLJCxDbbuzasbGR3psThZHmexwIL+ulGmn
EKXJ0Zbrws0WwwbOJZgSJO72KhGrilH8RfKEOZ/W9hpWoxPZC5YMq7c+53Tswi7vehGQ+RcsxWwO
17Vv4eSvkmcxqkJFrdEuRFNphiW6v00umH/i576cDeKSBJ0acuz8nXvVzDXt7wY1+f9ZHC7mEX5h
i9CsPgB6vywom9PW7o3cg01ghXU8GboB/nbHGCNJb/NcanFfTiDSOSht0LW2HEPu5gSyEB+ybGOa
frqiOlkhr1XrRhqqYK/Qm9zNdduZXSkeZu6Prqh61AFeIy4ulJMyVwpBamHLqJYcJGv9535mtUjp
LHVIWQ5ytazkEDWEy5ztlsQoNg9WNwfXQN90HJUZdaW+1KBV1TIe2Xd02h5pDRBPiZKFXrzLEipV
U/9TnEHD0OqtV3hog2QK7GLkRht4YnTBAIPF74BzvwHAgcG7Az//0Ggr9FSysvAzbs3XtyiGv2Mb
bDYZXTxa0Rt2yoYVlgJx95mM1oDroQODktr5HQFlR2DPbGt6dhnZSoSob3BAd7KiJz/CxfsTI3DR
O76dk5NsDvkaEKc6enYbRI0hfg0q7juN6cc/5aV6csT0SPUqQTt+j3BVhJQkZQJGt1DAWQhHG+i+
wlgzVXbsTB8TsTQuNJW4IQ/mrJbDO8JpBAHPVYqynBds0C/quKbTybMQLSRTI7wDYb8xm8SShGHb
9OhcFAKxdUsq5ejW/Iof+bDxgL+GUmFUf4tQ8fJ6O55rEJTo0RQJ7UFoxL5oqDQjb6nCQWsA25ln
t40tDdCNTCzWtI8t+mBx+mDbK46FSheitCt7bey8h/ylZT2ylASeSzzGXa2ocbbxZYcWxdN2dRc8
4dJ8QhOwNkZZ4Lo8Z14cPTahJD40nmK7QHENomLsDObGvgfgEpxMMe6HdDfRIHfK9iRm/SyTLMfM
gYUWVP7NztbJG6LOPkZZwGU9uyXhHPYW/KG7llMhqy1XOlUqKfChfUeiwIJ+Obb1SpRwBAk29+nC
mKiBkWG+C3g2LbMFkmEKdfVYN5CIb9S6EGShJt8fHugV0MRgJRsYuMJNR1be9lUuBJP5xTSCETjx
yyQ3o++7hcWSB8LLRtCuKZEayJ/S+0O/VA2HX6PgaubOvfckIohPQsIb5ipmUZuSqbo5ljKMC19U
va8lXSdRpvB5zTwcdeJbOfs2a2GTJSqp0rjYttX2e58DT6vnFslLKwlnjpp16WGoo9wqtoEMTW76
7CR3IuPpENRmpQIwKu7zb4gxIZqg4GRwz9tN8iw7UTWzMDenoyZL2piW9FvzAyDHwJV48NC3MUrj
cjvw8zpKGAnWFeDluBicvRZKJekibWgGES7BNWEp9LLyN15wos6TIJ9d93wFVQj41O/R0DpbRJzq
K25zeCc1vDdtOdj95CBJv9p0QFwzPBKIjr9DhNtMEGa+BTiZWU9LLHGplwQkIMH6V7u0w199fwr5
Bw1w9RoshcHae4lmAx/DlUBEp2h3VzTWApHZ0+83akUNz6CZPG4d3xpqa3DbFp/GAqlxKGGMzha4
5iSssNP5VFLbfLecA73ZkShj4ayJnKm5KGpqTJ+1hg3BQu4SunqyJe9fxM/z7Q+3RnZA2KbOYcv3
hXy6ZiwY3lKVABElsBbguJhNzi9ZrLDobfC8rllNF3PJpNV7R5+rJHuIn3i1pOLOY4awsl9fVhie
QjSf+StB0fuTy0//DrlnrYlNyhKUDHua2V7zkF9s9Sjssgthe2CFyL8CGMwyoVkrsQqnCtM5ylH3
u64EZ0d8UUT7PsFGgWe74aAmiEiwvWbtrrj6H5SG6zvUY8KcPhDg3xvzFr8VJ/Fu4VzTi0q70tXP
C0tB9viX+n4nrwSrgvCLTn1TYTVEtlNceHgpJK/hiMiX2Mt4xkGNTmQCaKTfK7tXdW3Sv/+fh98i
1FtD2R6SfS+FvoovQK1TjGzk7GWN09DdU6nC1WBupaj5whlPUoGoUtMjXdpIvJ8dJFbie7BDrTvF
Irn8sn4Wxnm/2tUxn+H04LqraDC2Ggsy2pfHCOIXalaTtSwBu0MDjQvdRphWRls5MxVah2UetiEa
nrry88bkmmWSwlyc8q/lvs9WQ8dr3xg8mD1MRla/8cvlWGNtxA3NK3qkM6Cseho0PHxgIeS0oSAO
VinbQZ0lgiR/KSMO39wOBu5jlxhkh56t6ajq94A16YWsNzaB+FSev848ottxIYl8t31OANCHBiOv
HKZJBaNrSyZ1vll84OO0RhK+uDG+ubyO+GATzRYkYM5ypMhSvkjpR3Ge7DjChGfttDvvmPoqYGG/
HbrBjUksE3yRGOKwsde37hjTE5JPCAmWwcbxKrObEGQiSn16LUYYY7ZzFf6VOUed3XYwF2RvUpF+
TYGoHre33fhUkUxFksHzA85aH5huo3JU3uu1K4IxIDd5az+gbBxT6OVGExy3uoc0aAqhduFciieN
vh/ZE20uDUMapw7j3n/+L4Caj1JTyI/flHsLPbgotwqrR86FlTVQtW80OO3NKTFwMRs51C7+X3Rr
EGFz2ppVwvjJ7w+yYPlhHc1vrDosueSIgdESQDwOWz0uuO8qYuhmqGZ3INr+3il0J/lk8SlpIm7x
rvVGiZ5cXnOSrPAe1FtpLmw51hjqnc7QldCi5yj3D5myiqq8KI1ysG9GtiASGHMRIYwVb55dwn5E
q9pVCSNXjV6Xxwx+OAYILxkwVyC7wkvddjQk9a2ZTWRnMhjVCv4aXYNt3Kg003a1kYYjK01ovh7d
AHXzjAUP9EJBB37WElYChDfMW1A4IU+pvceJKlBv7pERhTt2lL0y/bQlj0Lxr09F8GZ+O/GC3oiA
Ykv98UZ2Gu8fT+UkreILZBZUuVEHZXOC08t8RdADacWQi5xMiW+lXpP4s0sKIWmaSscWl+lMqZ4v
8yfIKQ0U7H1Tyv+u+eswNLt8hsGHfuf/W1gA0hUfuYtU3FjdMNXx0yVKjx2sUtxA2NAktObbTltB
C8L7MPHT6QHzbzzOlajXBb8WjMTjaX31YMJO3Bc73Vk+jHO7fxLrc/gPhWCrNT61HqBfMoKhQ0Jk
TS7L4oeD6Bzwkp4WJXEcraEYnijwCn1cHj8YFBL4ozfTCHDOQz3JsrhH7vuOrxoQC4bUvzl9B5bt
TgJ3afSLCEOFfTUXWvh8fH0LYW07fFodxXo2CpTR3LK7rhcJ42B1zl/kSmJbhzL3agjQBw8rvd0t
hNOC+BiXzDgHpFxoIr0/PcpBrLoC4uzcOQCJTQSTq3ypZVNMo3YHi1ItiIczbiZCKmMqsQE/JFZu
z2yeVarNh6U5Y5dBtKE4C5BAUtY4QCmBxxA3TVal64x+XwJ4iswVRvt97UUQN/vBBDRD28wWvPKi
ew6SOaXHJXPesUf+e5QS2ZC5dg8xxvxtfcoIpPtOmi7HofJ7rh6QOlK2SgsnWjjbwSXkvsv8FhGl
UQDCoC8VYD6Amw7++ftK2Rfn1S9JbWO7NVM3IwZdZcKuhoQZ7Dfas4t3ENbk6zmtnGl7vPfODe68
p/xdp3BbuVitdx8HE+m8Xi/WdHGD8NGcluDoiRHkvqgjWvNf5NrTJybhTzP026DmvEVeMfC2LUdF
N+alkVS9El2eJ7u61ERDPLo3szN9fiH6d43PoDHWosZ/vSd2O88kY4vN04eWysPvdYLxqPRVRpEN
gLpdBvarvWGyW8iJx/W7WLqGLyluII9uPzVwtz7S9yF/ofVvU+jLfc8iNw5GJWOAodGyTVufljjB
reOY2HdEtyPXBlWe5P3MokaZAAleaJ7digRvzr0jNmQvAfQwQIH8qnC88UT85OIM5cIS9ABN4SfP
QOoNbMWUfUYbFNblhZdLH/YcIw7tICq91TonkC7yUY21fJgDN0elZMNRifTDdI0/UMAt5u4Uvl/K
Qt7q0aV2fSTG72FCY88nyAHoU7aIi+1MHDNum5BBQqxa8BU7Q1rj1HhCeC2Mq/pnXoZn44RTsU2q
iUiX9btGXCIFtVaz24rjcv4autjn4wAFuvGw4s2TnVT2zUTXQcvCYt0ksbna/zPZ0dOUvurcbw+P
sFkuSlTQITTYySiJQXjNmEx4hTQdR7BI27AF4mCgEmbkWhO/ZH6N3eFuAxq6jwzx8Ws8Ol0HdEYu
Rc9Jk00I1qYS2IL5SL8qLSQDchdbEJIDnaEKIt5mpQbCRcfVkhOxgK4fluMhVu8IWoPAh3l94bmq
h6QStlwZVWcvtQP2243BMb8g/7DP38m/qcAFcEohF0WwbOrmUwEcrlbwmCv5Iru25sn9db6b3n0g
sYXBhCK7afCn/qcWZosCRgPV/vgxlVoyj8ZlKXbA3Pf4xFzOfj6g8Ecs+MJURHqya/1fw5vFeKGM
W+2ocqjDUO2IifBjWVuPlSD3k74qW4U3f5vqcLUQH1Q1fTsumjuXVvEA3/U+uIpsgYUiMZsUUPEO
oVxIIMHWn00VX9Siea59hLzR+001+jh6VBL+syvFJ/+p2JcPt7OUojFSh4ih/QRdvXNyzHGVLI8B
pVODkmvIx09IgoJYwqNYvzDmllAQQTJvySPFkfFqPTbWGNXkAowYtTlOjGLHQVybPSHpMfP3Zwkn
V/AA89JStDhKNndixAz8RYKhkLmxEf65/kYNPux6E+qc6Fk/SjQ31GdAhq6CKjbYRqKJtJC6Y/l0
XF1j8ce//AfpBrr0jPqZ8BPrRCuMIN4ZJer+ep8/DNqBE0Et/M7CsMNPOtwqxUaM1lBhIvVeUpfs
XTkbojdDWW/87jKr7jiLihPOr/Gb4ElndYjQwcrZr8aYDdbCbd0726R3SJ8wtgmp175uIok8MHFx
LcgMFLf3uXkCfopY5BDQvEVVw62brdPXGxl+jZoeXzpDlIjBpAXOhW/SAWvvLVGfbgaJF8eDIR5M
mqdc/f/FyJCSw+V8TfV/BAqBNb4MRWqsv5KIZVkUM3mbUshH2tl6AzCWL4PknQFeSsF9X6qJckJZ
UEEj9SNRAjEZwT5Hzrx/cbiW7aSrxMPL2U9PkQ/3hb0UfVHJIqAX2J1eV8UfMI7xBzt3iqNrBQEt
B19C2V2PwNnBGy4V12o109lyNh2jMyuEMwY+KHdxYL7L988aTPFvvQcFEMIfyXTiRWskgvRDOyCE
jHQsS20w7xfFQ4YNThvIIGRvYrbbdEDAQV3/Q+SNsTXwlB9FTLXDoaOw83UAeJ9nzdtRiiTG3ZlG
Mmjphk1M8DKGDUY7b201ejcXd2mBNSOXyZ2wZrzUoV3ixz+ydvEXte7Si+kqzPyDAXQFpV2p+kdr
skhGcBJ/dgy1l3i08rg0px0Ygs3aD4fb+dq+3jWKUbxwvXUXpm9S73DzGDRt538/6jh57U/HIyro
MR7RbxJspm93zkzXazwz26xcVGG93uWRBNTw7SsDeAeY6DTXAX4rXmdmqu9XtMFjeaZyJqG0LLx4
HdVU/yULtcw251Nauxdw960iTmrWzV2sd/9yGz1Pm/iMAnQq5WN6apwI6aPRlSSpBNKaW8Sf5XnU
ZFH95Ve3U6TBe5J4vJs7WuIlvHEYslRYpdoX/ySqgfT1sd60RFzlOxc5F4W/H3bhN1Rr6Adxouyb
/z5kplMG9k5E8TJYDY0DLmqr9pSF/CkfuLeRTDqjq77U3i62WPJDJgXqW7bhhTzzA46Xeel+CnWh
Gk5/Ay3dsSMVCm+RIBniv90wmGQxt9jmnWCNdJsObqv624smfT3SRW5VzTHfQPtrpy1KJauqQQlf
SmhwpcjQbNsS2sVySprcSJ5gVx+yNcGcd/CJLhRKvhC+c3mJKWH/iyhCaPb+RfHjOuueMJE7kMQr
FAeMdQcEeETwr49SseFtcKD9KZtfY+vy8zi4kM3UF/pvUp+1OKdi5I/ACQb0i+Z6p1Dg/CUO4WLj
GHD35xmAZvHbGqJra82OQp+5TppJhG3CMoxD4VpARpu06nYkKSTR1A879LNL24JeSeY3TMt+gfNj
ZGNlSrFSe/mhSgDrNJT7CUc5jy3H+cxo8Xf5t2R2B/5lHLVXoT2ocRIjr5SXas9PUNYMkTCYM9le
cKD9lpuSkw90QsUVpVpUlapaC1y/ooBdH9HYVa3MW2w6PQtbCM+X+7LpgYL2TVKCX7qjx7vblkTm
hoJjcGxh4RleFRnjmWBZIAr3da6p9NpFxDpPuezy+YIEFILxCO7LgViLrxVn15Qn/FWz6EjxlGeb
Pzq+tup9+OOriNrhBrOzps0Md2oAHczVyYW8pT8lh1KIe2QoB5ZBgvI5mL8mUz+j61Ss/sp4AY4E
YyLHL9EgHy2wanxManljoxF1c4HoKbWAk3V9aU7xSkTrUVUHQQSCcOzKJ/X/2p9HBy1UlpfQ7gGq
sxYhjeQzrrrnsHuXULcHfiW6rEZxsnjHeGDUk2x/Ab3kjuuu7xN3YJeqcS/N2o1CtRhFehl4w/Tu
2lkP/urDTVOKiLKiBPRRuCrVntnQJxgGYXEBkqvxy1S/SLr4+hxVLh99md8ZzsgT2Rmud4hoFBrB
3VXPIvmK9jhQcmOmIYO2Z9WpnTITWZUb0ABC2DIlZsXIavDd9g6IzhQqUuWXUexpwhWaGKxV9bz4
0vrCbAjHJw/0doeuYovHfSfN3S6Uk/OXJE/Ac/74PCovcjuravWn/pXJ1xy2F3L+evEC+14ou7dT
jezjjBcu14/VmVW8DSVq3dOp7El8BOjBXWEfux3oYer6WYPO4sQmzDqfX8HOInZP+zDBrJQqZYnj
BQEL3xSuFI/5g7AW4Q0mimcmck1Mt3S7dOSHx/1QXVF7H34sino2Z3Sw8Ey+s9cbih7gnJbKKZmr
EdCSCJDofGrm5SnPwg7UoCTEgU4AydrFS8ONOvRdEqLWKcMDnXP1x48HM6SdSU23EXHGnlkdPwNj
OvXWJxUYHUb3BemB3kDgSM0daXHkkINd/gs3OSva/ENNA/VTfoNGYIVWCrnC/sscAQHNKIMwWCgl
hvbaB6HQTHVEU8byTsMX86B1q0XLKpidQCEUB0xnx1NlT7z9ObF6furLYE0ZotY/zPRQwLURIECX
V9bp+Z8CQlMm1eT0mSnBcJqYu5jC1CFysgCIwpL+2DxqdivMg7iGE290D618RPyXFpI9pDrUHAeM
3dA9vktSzz7fNW2T44EjFkalzZ6HA/zzsybgHjA9I7TTAXcgKDlnQsMimpHNJhIqDHylI3JNvXwH
oqj11HJMqw1YP64SMTjtnkfDgufOmJe2nkOw4O3k3G0xgf0Tb2tdd6vOgtcuikQ1EtB+p4C0eduu
jkT//G3JBHJpmSkCd989KqUoWsaSSPHeAdHySCpL3f5BWDhxtHOMaGr9BUdp7phoS2VRVffUeW+I
v+RhuTGVe6zOdjNKsBUowz+EqwQjxeZTQygNIdoUdoRjox7IFwGJoElWKlNCfG0KFVx3WvrRbe2I
Q3Asq38mCU5iaJkNXE8EM6vrqV/vb96qHpzKM/sBZpU/RCW5xamEd4n5i6oKQ5GK1lfdf6gPADj6
XOdC/gmUiVx3G4OgKbScyTvtz6RQ8sdtRIQw12YIsFwwYxPiQmYTnRQP8MtbemX795Xi04Yg8/UU
yH88DeX7yKmvZA+II4cyP+TnsABlGCqnMojYa8UsB3tA8m4NMgKqjTEMAe0PfsRPSVLcmpLwXQPP
7v8phriUiWnL7V1roYfaqpzWo8ca+BvteDe+dc3BaK1i1w0GrJTpkDmAkRauV9rOZErrb9MSp6/O
yCd2YY5uFiA6e/ulUdrbkjonX4Bz6QizpqeD6mmYyK+HVovHunRB6WMf9P65NOcq4h/k0ugwxv/V
5WqixOgJYFnXs+oDDusuHg7z+txBAxvvbf346caq9HU0Bq6Gscvj28y6h7Jc0uUVeD45NEnFnCqV
BeupZm9JXqrHYPor8cSKHAvxpmsTT12Tw6hYiU3ro3NZ68e1Q97XvEJLtNbhHGmHlMy9Z/6odMye
qozJH6J0Q5hk/KrxQAYJ6IAzj9+gF1VZOb08UUXqMdKV758ciNOjtwOXZqGcbROaKiH320TtGTkG
8JCSTfkl1vFtFI1slGeLP/cAanJwMphG6ABsL3V58ttllLcszkwB/Nc796hXsObk2lMmzxrQtdRK
8eiY6WT14CxmesTIKiCeNTqAXFRWoRfclb2jq1qOPGcVED3SbpvgFdGdhGX2Ve5AUdhtto59PtvD
91+ZuQPLawHrxZr4TTY3+ZU8duyouYClTSjqBOM4cQNZu4V2Wxo+drDmG3nWhySgzJhXwFhlOHif
NVGVr3heFtZvc9eMeS3amSvVzv+c/9T2gvzrMW5mA0NENHhHEmCzqP8MepCMjbXFyletbXvp12wP
Jt8BFPYSqk8a9Ba2bcsgk0AJvTEg/Pb8x6ijeqKvw8R7E09GL5RbU2X+7dl5P6tHFnQJqXJk/aZB
pbrGdxCWvINVIFO79Ja724jfpjjuC3hKtHP0Bom5BPA8d3Qmf/RKL2TBEEMU60cPt31M+cWvzz7+
RfZH3Yeq4KKbbAGlXWdf6UXaq8vraTq/QYB/hKkGOghcBEHT+tvRejJx59qXHFZc0wxtplz7TNqx
xJoDe5aMH/LtaF774XaAa6RK7sE2bnSvB5v0nxhSLWfIqgtd8b7mVgdSqgDfb0Pc14kby2cGFLe8
cBxsyHw/XsakKIMJ2qrfuJVPHqR8LabVVPXtipr9Hev8BJ0yh1kBznemALQBRwjUhkYnZ1DHMTzH
CI7NlFsHy+HPGaAm03YK5TNLOQntaoA/0aLfNjTyEamti5tOGZTnnJYx3jqhsIqlXDMEAfP6gFCL
nRUEGKcu6mddsJmBbiH2fM7hhph9GnDlRjZjFffqWGQMEiBTR+wvLwJEG3rlxBSPhOwgeTrYheaw
csr0rdRg68C2vVXYbx6JqBImhukClaiGfAIBZY/kq4iPfTzF+8+Fot4EM7DajF3s7WuKmrsXSFzp
3yhrYh5yjoMpFME54nYjYWdMZ8Upd9iKbexY2VcGKLbUKt4DIB+w/8+F1r9Ix+TCZrROdVCeugFJ
GimZIwGrZWjokbJPh0ea2whw7qMQBlDzXSSZrA25SWqMDHkV923+PXdAoO2QqYb5b7Q7reOrHZvV
vU0MogV9U3mh+mhG9sycW/x6vkImT5XpnM24cZjJjVDuN1AIkHUzhIo+4yI8Up9+94I1EmW81yyk
S/8JIFEBbldzU5/UCjVh5rLvGnXXKeWNSS0k5UBW9eQWTlogQWry+AWsxRdE8r4a7L6HFNuGblMb
H/W31OeoI4uWrN2DjQK1zBWxwWTIuuVAx7QGOoTOpMNZkvGZTZDNN2KsAUTFl/Zxkwgy590gGlHg
YtqQqt2PGMjtGp2updYhTrM3p0208DTsppGpdb86g8ZY9xs5f8675J5vN+tT0GQQAJfqIGWkvhhP
ZX5CTsfODqjqJ4Ev755X33Xq+W7f9r//XrtPptRs1Z4nxgXm2QydYAf6cih5po+FPF4YDjCCSRbI
wVjO1qbLQ7YcIrI4oYpywg+UhpJwtg7iQLg/raFwhQ8ie3frxtTTmAdiirWEwzazZBmR2NeTNlgU
nrPJSBryGnxhBc3nT2sp0GKzPvsR8Aq/s1IL2bZ7hYf8bPQzkZovqs6jBquChftqxfP/OdvcACy5
hhUQLegOcLdd9RmZHdWZYpJTUJn2i6YaqsoLspZsAkc7riRN0jTMwj3jzhfjSXH20GjXk7/9PL9o
lim8XfhtKcMOfA2GIY4Y+cMj7igtRJdyfcTgSdvkulOs4Jh2hPc+XTt75Lw2EtLi0vMV8YBHgUfe
xtVqQpOGrPxAWT17i+w/IitBLNpSelmM49ovUtZOfemAt8kLXcurybFy1NvxMJJGYoEFF2AqBN8E
XCA39i1pfZ7ojF5HB7RFsESAvX2XutFqsVRShWmSZ+sb9tFtKI1c6Vgtf0GYh0+ItbZei+XUmvgW
RzTK+qRMez+vkDt32wtV2d+ix0TJQWpJ66pc2DEugzvngZa1eVdfQgI3x2E0klCnbcteuSD431Eo
AFlvT8/qV9TriSNmz8Rn2+o7T+segDOSewuf0gn9Tnb/ezbgeSluyROdUbwbD8PGZS7S4E4xnSzP
8Gc2UoC8U+73mkCa6ZQfmMI/wara33CIJg/7hRuHY8J179eBtnNHHiMpyKw3tApoWLA1fKcWJcdM
e2GTDTb3x251OFc76ch3Bwma2XlM365a93RG1BRTDfQwaVfW6gTEmXVv92sQdR6bYC1FaPitx+GO
OW7y/4IeTdaQPXkvlYPVAQzFQvXveuel1sMclN9TEbAq1GT6V0yuBSt+8KXF3Nl6C6uHtfUwfPU8
n+06B9/8EXOncQHHV3o4Dpgby83rd1F6D8O7OmyLH++vlfCupSsUOe9bYuI+9+BFoKJIaPSRFmoS
3VehuhbBE+S1vJ9hC9UtXAyaH5P+STjr64u6bXT1ozL2uBNvHi2ia7UdXukQ014Q/RkxJA/luS7T
1r1PMoKypTy5M5UDLMXE83siTjYZff/i/uZVqoBF4PQtlfhpgx5orex4kDivbNLrXdj+yjmeqFCl
bJbEzseLRWM/6P8oaXjyiTF9UBeFC5I4K4c7wVXkXIi3Xi1UPWjgkGDasoIRFo3++Oa6Ktkcg+1g
3njMgPxB5gjO9UeIUfwgNjVg1oJUM15i7J4pvkQ9aW8WhYxmN7DQ3nS2PdygMWkeMv7QVP75OUYn
22GKFQwSTxuY3Y36pIhfeDjF9TVA056v5UGL4x7BY/PwTB9YXhXHmBbpRtGayLLNVMvrtsOijU+m
2v9O/Q0xq/St/df5RjH9oldN1nEh5NRAh8fCIr32fiCYYESGOVl8CXeZg9n+/1n7LxkrC58Tt+TF
bBQycEdJAAg5RUtL/8ry/bTA69yiGL1XKneLIF8k41vGKbGOOAUqBFIzh3WWMAdxVPPt7i/4/ucF
QYdiziAfN44pyZU7KpxSA+VH5IHoFtMwYWUv47SZs2LMFHqk1LtyUCye3kKDc7/DNbdrh1nC2TCP
De5b0a4pXGfY0iEN55vRDgw4lnIRnY8edaHtPDSLC7yv/LzrAnMWTitWp9eNYkMEWmqe1WoVOvAd
0mKHMJEI2J61MUKAPnVnXSKIUm7jQahQSGyHBpgi/uMaMC+IBhgSo2vSje+dJuEjsq+LbXtImnjN
xjSxKTyK4p6KlFByNspvy9yXATLHfnFoKJNYOM/+JsUnyyZQYLf31mIgKRtteiPe6+tQqLBiTk+a
ZZaIqhDC6mfYTsfFRePpVqoQb3wmkZY2scKJX60TD+IUCuoEbahWIFwUJNdxQiy/TCoz7+2UiZig
/zYRjyqim43wqN/W4okbmNT1hb81o6XSpmAX59buBr61ccWWGF2ZleWhwI4oJgsDru33X4UcUGu9
5JdGHfxXo3Kas2IWBzbryajNz/SPn4vG8Pk4pXY/hiufHAKB1yCyJGSWU2nFpLTqv6yv4IctsHDz
o7XqPvNz8kk6I7rJvx0TC9Ds/DK4JF3xKoL6VvukL9flPzpePN6pR2jTumPblm6foh3bPXfGlT5I
OK+pag49GHtoPPjGQn09Ke6/OgD8Kq5Ox5fwizo1JvjLhUqxy5nHcGBckCeSDzw8inSJ9+aUeFxc
GueCb2ZIdGSsgurHCv6cWT7wuXvecHtIoudqYJ2m7ePxs9R3ypvfhFHFu3I1SvxD7dH9UMkbkxZk
p/fg1QUiLxSK7/bi5zmiiobDhcLqEPruSJFW5ORf8933V06UztFk6Gzu6SP0ZVJvLYhKrtPoCl/Z
tFUXYOmEuIMC9IBl3ulu0Ab8YAm3K3XGXlhRla6iRshUyJw1ybbY8ff+dIbovgg/ix/9xT/lGKSJ
s4ZQCIVHoADZuH1aT4sXsswknEUPZCxmuI0yrMJlkHL3DTC9wJdmPda1jeuOlHpWJPh6oAWccxa2
anfazWfGPsE2XDXQ4Gu3vb38JjsDUnGwWOEl6m3O7tICq5GEOCPC5jWaPAyTqUZeHwGJwkTOZ0sb
7bQDx6tESxo9qKRXoMTtS/j9vN7MLKk46cq649QpyMrNpxz1r9NqN9PxQBaDDDoM4Gez6Cfbagvd
O3M3jxU2jepl0vJ1+ouE+GcQwc78l1t38COe0wTqVYAYpBlmk/oOqVkD4QEsjd5d3FnAOGPNPqjS
wPUNhh+SOdzlqxhmUFex+HFvAra3jAi4830oIqJia8z+81wcxX8FmU7NFbx+ofFeSrVJav0TWVk1
QpkU3p669zurAo+RH8oamNVRxykzoHciSn9cG5i/i76a1L2wwyLzo21rYArJZlpKK/2LfPo5BIl3
TBo52T86qqnJ1ylKu1HjXiLYVwru33/8OJoXrOM6PvtHcwPznJr2tQdP602X7E2HxqNA8RNMOORe
GoqezhplvJolMZ1TgKO/CqUMXEApOWP0motzYvKWsFyeI3Kk4vM/QxW30rBrmmA9eEpdqhBcUIqD
GHZN8PY+K/2mLm9eY7w6M4YR2rq5VCMElO3QacRYShGphQwywxHd5BzGOE65MtKkEoVg+nXoOvQk
ENGVukp/v+kOeQvnJfwrs/c9djTpJLlVo3cmgl8fiC+V6fAsqM/EYTkYEmQvxqeIwt5qLpoZdtZN
kh+RJlJ6Pv/juBoB+0Ho48HdHhJL51yYYfgKzPI1n+KRAM3e54U96eDbqB6i89gkuXXKnBF9O86F
xTm5vgJU16ojBgcDVm7tJKxJtPSYDN1rSLPBFpGZvX3hICrGqrcTtr2UtbpndRJ8yAFlvy7uwotx
Ok6JV7xuzqEjrckXwy7hDZGrdG9a7xtL1UTNzfpWvbCraxdsYVHMhQD0BxA7+Hmv34TxOuZy41cI
QRZLt1fbsPSYGcHlRr1MytehBY0/UBNHY0NDCi+AF4rcEF28/4YNyX0Q1cjjExS5gTBRisDCH9HB
JlC+BY4xFt4bIdlh1jKLqqxe7VmCmkdhAuGKDT0NTu09BIS4uLedD4dAAqgfNFEM2f5HlmJ7Yacp
1FrLhY05/P7/XKs8aeNpKxXZzYUkxD+42uxo6z0fnspLmXAgavUgxmGx7UKne5VvMULRtr8lemse
oWjaNR5RpM5Y/BBBChs8xbeXet1mPglIi5UiBKWjUn7ykxz2yDHPkFjT9FB4+hbNvdKJ/8pf6dYQ
wJrelmD7D8dbK0u61DoZ9nC3s2j3Y9TnaX6VweFUN55PhFGl3bIy2RiHJ2LvowVBjt1HI9/0bQRG
NaSTi1Uh5sI7YfTDuQTmaVjmHiBCraySmYtmRtoKgcNMJiLHE3Sfh2f2lo8ig22ImrJxyOfAGgT7
isTOtn68uruqJaaZpWpXytkCwyKh8NZEaUakTBSIIA3JL4FcOUDlbzNNGzs0M7RL97oE2QOnm6Ed
bCAmw9dBlbR2on2LnReOu26TTD9WjA5gBoOHk8nGhnNIooyJ0hx2AkepRK/C6/q5hV62XEBiidPo
H2+5THgiqSSq/7HQ8hI1lcmWZ5+qLMJTBWK1VoKmoJ19AQvZ5iZf62tpUeuTPL+N69QDWTaVFjGG
HJTv1Y7r0hea7CVNubYTCFpWkx6fpMk35SC5aF5fznWnN7dsQQT8pRseaRjWTCmcIhfxf55cF4LO
iRLu9HpUGNpiY976MJ4dQxnbBiOofpesfnY8YJ8NU2mP0GzwePxdpBdppwP91DAWXv6SGaNhk8cr
7yqutzcOkRlf+mo6NKPdCKA4O9D4Ac3HkBggIHTo7N8qhhRo5etb+LiLNEaTjbJFOpQERLuUXggF
ErKz4NJyigZH4UEZaOr66RMuc+rAN6jL6+mQ/p5tFQCk3cBcFk4bO68d0Eqhp9PMUAiQCJlEtz+N
m+Ge7+JnGMulkoQJCgvj5eFIx0TAqAxO4VnpWxLpw+6pY0gPoe69tQGxCntpa6pyRU5t8ccP/Q1W
m9kiu1hiOJo8CBGzhbRz/D61eB801AaLVbv4brB0n/KMb8AN6XtYb30+ZB9Xjh/AidABcMf5xaxS
o2t00TFVuma2MgKk57XmIFb+Qjd9Hote9LrexDdL9BWJBQsJRxhEzbSgsh/eRmt6IDGoM+ztksa6
bT4ZDzGDgV9mf/tfYni+MYoXN+k6pwCg2EENk1X6Z7ruw5w5pgGzdV+prE76OIpGn2WSA1P1QPG9
v/QnZhg+qRkiM7Wpq6im9glSQRChR5N98/5KshIWxFkN/l+LBhLadSpXmfl5Hxv7sITvLnn4m8CM
b3Cl6vApv2+/JwdiAHsv1oZMy/y5KUqQaVPhn7+tnOeC86L488GK4X+rW5Z74nc0GlsCePOCfzgf
Mm111dVpCbBgxFr1qvtobYPNR+0UM5aU53PZOXHpZDXMNxK280aqHxKAx0rYzIxOFnKEcpjpQz/J
qqhPBtHM8U+K6116oRilaP5sZ9pVG7VP0y7DPv1rF9dQna/R/mP8VvyGidYWpQ6gZjTi7KcySKi/
boMk1lS44bMAtEHISNlZsgW0FMieWuvU8cCyEpQsgwmQ//89qocxj506xwqB1cg/IMPMl/RZUF0C
AcDN3rhTZGL/peyE63yHrU/IhfIdzLC7uv1I3PnpHlQmFmn4qhwvyC+8SwjoVHEmRNQTXcj2wb6P
blRyJL25MCV8mkvej34UtHgXCTXw/sIRvc37+kWY87yVp8jYJXBVXmkpJOEI+WEL/yNicupUFGyg
KyYdJBet0zbPYc0dOfjv7XU83srrEsrKFPw/FugURsMN0E41O3JuznefTrCgrllLNLv9HCg/iohO
NZUa5KPEFlV7v43AAOUVOwzEY7DbrMVZ8F2y8jWysUElQzBhWa4wyqSKlS2CSAmbWuUW9N4rZRaN
S5A66+cfBKQOk4P2lD6ndodLQZrIJWmJL4khWjnxPdS++5XlBE1bK8Fc9TfHk+07dkwjPvLlzQn6
eyNstFbHFzVeU8qC8DOtuOTDkf03zEmK5ZHKbEjVXxj4JNcZIW7WrjXGBcJUyOp1gLYt72Yg01fU
v9pMjLrDmZDl9S/+fsLl/ZcygujqvaQlZCch4JTs3ZjwP4G0eIQLOr8bh38TB0FBIohg9hstWzR8
+uggnxwej3DQFAN4t5h0POTmA0vUeIrdQ90FRnKi0TV2NAZaLBR/tRn4ZYLc+QYyi/VGYK/FFAhm
ZkEa5Rq05SGrXe/asACQWSvrazxYdLL+gF5kFJGGOQm5eKg0Y1bSnogUXd2r47n3BnnSvGE7Sd9w
ZbK0cegkNz5+CbaQJ2xYRVvi8qXc3OIc5cs8k7F10oEm2unOk/GRaGdCuHq5Z7eFAgOnZu+kBMXc
D3HzsoVmNkkEe9WetxXTqOO46LYMbqahRUCDeQCSXaVozd1+yRVqK0TH7Kc3RJSVnzSl/QtMbBgE
xEwLnPaTMJVHFaMykIukDHTE6gWmY8j59U0lqVY2e6aLz5IVQS5DBXxqwggOZCKXW8UU0R6lk6Wd
rMQ1KHFmt1g0Dq0Vjm9htP+Z08WGecVWd32j7LJfDJbg107aRDoPOIkfVxlPw8txZnWowsr2Jlmc
vuFeEK4YqIays/cC4uFgvdOPOKp2W8jzgYMTqUjbvRcFTXAJu9w/Qljs9aTapqig+G8061HB+wd8
L6RxNJQEVEc1iup2lzxYR6GJQ9awHPa8fu3k2CeEI6VANyKAhg3pEhKe1yQXaQG8PgaOF3cM0J3s
wnPmpm9UVXMdtSS0nSFm0MhMkVdAEL66RxApSC/4MRDLmLKzm1hlT7GhfLgsApBEZ0a7SycN0RlN
mTcXX03Dm3gJgRVI2uGw3wrIRt5b8jrrrGi+73Xw0/Q/8W+5ae7IXM6lBTR/+DriprVllf8DcI6l
UiAObHkjeLb8Bk/GWf+8zZe1hZMa2rG//7FGT8xhST4t46liqJgZe8IfP62V2btJY2hChTCx79kV
Sg93Tw40xKDjJwGHs/eqlm7mIAYuZvwIPXgcb2YueouIsthm/IJMv+I3ZEXS8cr48ZRiJgwMzJzf
o+bvaRl36NBxehXk1n1F6rQK+H7u5+bJBdQFf2CbvaddwE5iDPrSxax61o5RPqJhicleTduxMK8H
/UFoFodYKFRXVmDOhfBqKMItEaIF3Ll1O0QQZVVn/0Zu3hdRw7b3wNzDgSI+FXDinzZEckyBZzdl
Xr9dAOHsAxYzPwFlqansxO4EaQgc0MhyT7NlKqEqYiSQYOuMC35LJBrZBvm4HKjymDQ3NJq73OEQ
JE2p9unNVUKAaZzkfaKwL2v5xbeJDoC4AeIb5oTyRIwDcURbBwjucY54ISjAob6rub6hNzca+tyn
OiBbv1lxarmA1BK7KLAmGwf9hDtn5Ew77/siovc7HV71Robcda4u65Bx/UbuUVWpLgeEeCol/GrA
WC2CPHiDhdu/68BV+CeVx2Aw9ieQ8s30XUXbdxjaRA/Ud4AYGNuyp9GvN+5XXMGLqB4Nn8ck3ltG
Viv2jAoTC4DcD/sVfCIbH1mFBGnP14PDxExM3wCk60MEynm3AELniwym/uvNysjf8M8bvihKDvsU
b6greSVrcyPbo3DTC6XlyTuj7WOck0QAiBE1bL3dEM6lrFnFx86OEce7/6ROzSTc2kjSSstMVfwE
8S6yFGXzuwP0vrJI9BID3DEIZakS2ZACv3222jG9KE2Ck0lzs/rqkeBvAcM3PT0dnRHrDsrBPEAb
kiYJUcSi8PzpzCGq2fOjezP1Rg5jWqLXmHxDYMniHaWap5CIoBeYK7EOxB2mh1UBv9bYgVaZqc3I
EUYzDYfaIAQNs1Rby1uluzEo88LiKP8FxMePsy+RgEn565q6asyLs/Fq3SmCp3c1I6LrQk09cx2X
ok7aKm28ZMSMN0n1k72KBPQpS1tyJhxod8Ckth9sGELHeY/QwKpV8/8SkcCaKBYyUTUpvk7oHYLc
lV4BLy2kSS7/E3lhxj1IXDIoaptGBb+BU3iyvCYxkN3oUuf+pqirC/bCvHbrMknsCOyfDgAuxNGz
Z/3EwoEgBIDU5HoUmHTVFfrgAjI6JxREecUQxMAviY2hW5UNIBmVF7xp9CbCFLl1VyhYo/A4Gn9g
5FgJxrdOb84ulG+gAS3FkEe874LNUVSPc84Gbwhhn8/zPR0HIPvDDy3P+cu+z6wJjetYmp6Up8R8
ywraJS/EmG+7m07EelSkkenUsKNw6avEnmP1EJfTBRtAvCr1yEfzAJlmL/y9EfiLLMRB9qOfoV7N
S5afMjsgtohZTpFMhVON+sprC2HG7zbRScWHUVvxof3vJVLgpSi7bTdo1cH+sZL27HijrMoIKZP+
YYPoCc0ydjMNnBZpUbGW80+3CDCNV6Pw3S9I8/SzQm+XmjkaOKDdxhjhGeiSt8GVAXH2Tr5l0SWz
jopZd6mJkEOVsqzjlSqiLVpjOGRQs8B+lFb3U/OS5HBZysciLtmEUtL9bITIQKkXnA7JB83zHLfO
m4HasMs2/FaXsoESVzGFBSQZPzsNvgLswxfjdrCFtFpnpFtIwLmec7eY7bysnxAzncAqmkKzRmEe
BIXkJ9IF2JRpaVttlHNjbtyrUqm+QeqPwQq9RUBnK4AHInoDe+5r80SNZYERoIaVM7HH64GELSxb
eRXJR0RH4H4nfXVDHKNKuVocW1mwsQo4O5j9oZJmorTEjdZ3AwmXd932k05xEM8DR5YM9F4fuAr8
LxDSPcv1w8BFAmUIBooU+4lBL/afuTAhECPT5SxCdecGTb1tB41fNaNB6kxfnVNKe4SPj8r3Vt8R
uRxz3q5XgmelZIT/K6zOMG447oY5bH7bitXf/GRYe+cdaQHyrLy99Ftvb7LRDhYjMqUXfHMM7aMi
7cyg9Eum3XgGgfTsYVgZ+RjonAn9jgORb9zTA7SiVLtZ+1yf422TT+PiUoq47oq42nK9vCTnMMnn
4ykOVvSMOQRxlNkNQuQGM9fPfRHMsvR5Y1jC0hahSEWLaBF5FvcXsLHif2NwAmwTNiLUsBLZOZ7u
F5WNlGVIJDoExzvx3v3THQ93HYOctP5ZJ4mZzs9XEI1L/GFW1OSgLtkL8E5xpF6WQhb6DBozKMD0
630LpZ1a4V6hoyp2DUp0fSRs5J/mgDD7sfj/6C+bbANz3DFF4cqXx45Jgf2Je6KTs5IOqzkLTIKt
xCm7bE3Z0A+tpIKuQbeIduaYbrJGLRJGBpr0fKVlj71KDDx05nygFZQq5pUu8p92H8/stKrYGqLw
Cu+3bZMgC3emdZM8+BSprFu/ozYXfRft3rbdSnhnjWl7RtghOEQIDDO6yhtZEm1FNCRV9GFEEiiv
bA9hr9fbDlTmDigsIWZYZYeflCvDqi2DuEtCQH+BDBofkS4h7HcnVlFXrr2X8fFHKkuy31v1fRie
IEK3SFG0hIdbOZmdArAS1yD9+vK+thXo6q+/jeHze35W39wrFDIsTleWmppQzjyyYx3K0gOvQbhG
iMN2BfzkQi1W+U/BncaSUZrSZXOFJ1zlfxutceGWH3tJmzV+iE8GnFapRKNpkK/u/0rt0TSFc/Sx
hp+3YRuVfbRnJm883dnm3FU85/2DGlB1H8Uyju+WeBgeIPtigR9FNlJTgF/mZ8sK8u+Je3IJuMAl
4xlIde8tDEf7+X5bNA8gyRV7fl1Ff5wLG+bkoRuEwyXMPr0HQuIG8RLuKfcBE2SsnGF19NRc0e6G
qW2fhXiD4zAz4IW6LN8mk0sZjj1IFMwaA83Lcr5KodE74wneIaD20t9KkL0rmMdHEJM+JBkVI8Hc
nainX4S2yHoMiiIObdNT6F6mXV4EsrrJA25P8oehVDhR6jwoRmSntfvQO9Po1FJ72wLokktldQj3
rZtHLsjD/W2aeOG9XKqR/sTv1PDlUJ4gIqruWBJb395mp/OKwIxJWctRQEsO6wbuLSakWCNbKtpC
Gp+ieFlAwYx82uteqCYdEqJTlJ2ZnFNmCLnWWdbRP+T9416Qj+3K2JZ14RXxgaszCOAWHClUwXBs
T4yrg2WBr2I/iQE28a9wiIqziZ/E0pfKCxzgYr9R9o+eMetgUSAFw86mqtxJAIxfJvIfqluCntrA
U3+tR5DVNzFLlzE6zxEmDhF1yNQbRQDGTAcR0O4LF9h5H/NM8o5eUEckjkljdDURbv3DK1JBj5Oa
x5F+va7d1/AKejduNyoeeWylGehJEmgPfgwsY4p4nkidrt/MtOmLvnU1SbbqeUL7O4RkkRFKyRcN
JERm7dvfDqOF0/1PrIm7pRm+whpDUeaz80MDIB1v13NzIk/MhuhhSX/pO3xSz53BtyOlOJGT7nk1
3MZuOJZH7luG3cQahDa8s7s32t/Znh7TkTcDfIVVgKwKgQj7/Qqz4sjZ7iSKbIzpvqRsVsRqd+sV
KpMTtnY6/H+4LqTx3i54DfO8u5zkSWI4Xvv2HKAfJCdaFN7RxfEg/zI8SSA+j9yUont5XUEDDQPf
HVp1XYBvugGZFWGW412QqQ7Zmd8i39+i8kKsCtoC5NW+WmSAKu5ZoAYX9A0QtohkzYUXHwFWkVI8
EU5fSRi2IQK0IG7142XzLxrFKdJO+qTf9U8wrWvC6ekdf4SIoc5A3JpHQKrKOSYUgyx3wlkx2+Tq
JW3+L+a2trkEcCbD6YT6ntTNTh6kaTrCSf6Fb9/+Um+m6TF2qYdKgToSEipznJAaKi9oODFmlquC
eSIB6ISM4Q3Wa0n9May6iXEKoa8V8wmTWyM5WhGocZh9TcEtvY1gPVNvWtC3i4vrlx7nE2Hs4u+n
7y2UmAWwO1SgvnYzS3YOcEunLWdgMdiL1BuCh/LpHxb7pycU2+MioroOilB0IOW3xl/dJzHKzOda
7TAgznkVJ2f/7xnsTryd/T5G2O5h0slf3pAO840HdLFYItJUxfWPw7lMULxYaNwjNYjN5X3pHsOg
/ZXsqpREDJhgDKtUtnKr9yQE403ofMn8/CFemtUVmrbAYFOnAWfV80c1u3XSFyDYKnurJRb+3Wj9
TTTSz6YmGnSumcCPBy/NN1bYUmiu8XxTcKKJDsYaYQEsPRhNhkxSQ6R3Cy47D9dov0vwc9N1+VA5
Ln7dQT3T4GIUv1fmLEeSmnefH8/HEVjUxI2PVcZaCCeFpkk6OR+OiW7+KO7JpIZ4AeVSOkvY1sa6
5wpx2UGxnOuryPexoJiIZpvk2nS/QkjLU10P2YLle+VHBw5zunLpM0gZAlg5jrxFp54dWG2awe+V
jSZ9Te8PRsK3mIhdIGpSTrtF+IeiwrxK+QCUIGvORKDwN/TqcdUC8wNe8vbv3DiPOr13PB0S3VDp
7z8KHP2rlm8ys9S5lhvftE9hs4cnBrXEWz1MMg0iO1c+D9eZ/YjmWGekUia1kIsQqeyzaBwy3JuE
9rgmcPn7XSUXHhPM+PUsvxDRLr3f4YEtwJLELOzPdA32e9bPq771slt7ucPYTFRnHkl4Me7ysZxy
MTwbo/f8DzPP2wUp5f1faMfwRWxEWH9/jJ4Ky4XraWyM6Up25ewarRgnGpQTA4wOitTqgc3W4GDf
9yYFGISldNmqTmX6EYbAZdlSk1gienGKbkGRGDOvbbd3JYrnGkBNRg3A36C0i0Ed6kv11rb3/c1N
nZpqA4yMLR5D7XenxNrH01bqz7JPYNl2CQgtJU/kW6bEuBSpFll9ghHN9868zIOx6vtFLt4CA0C2
sFQMRwTlK0FoKF1YW+c/mQy4O5AplM1QJoWJnBC0/m582tBXovooPKAyO6knI5fDbBthCmrUSQfu
zbbzBpfAcJal/3024rcbDtuujG3xL8wssjNFDRsqiw5Yv5et+QAbCRSFzUbmEvEdSGeCNmQFmYgd
/ymwpD/2KSj7/2q7KUd9WJbKPBrl33SIuqYilHaPARiKo8F7AZ5HSjctHHpVT2VG6t5Y1+2OIgnF
RFcJgp+hW5uROZp4WU2HHiF6/+EGo5qX3InflpA2fGd4dqagVT/3bDcQ+D4C+76u/NUJ1IqEOZdX
vjyRCKUUEBxtN+b346oI34qzYfqE8RcqRRqcy9e/wUGN8B/Qj7OWv/X0WdglDFy7aOxqCqu185wY
VdLq3BX0vdcZ9kN1UAZ3pP19DZIL4xsEoZAzec9xPoA2K36g7pJ0ItGl6Q4hVIAZTH2+Zndf6fiY
c0dmj8OfADggAOnEzDjD4a7NureQDP+jvSqSp8mw2pzy5iKfRjC3EdJjbfWhqAUN7H3sGxG94dne
ilqRWmj1McQYKAQdMOQD0Su0DlVsOL/ZbgF/3Ks5u1eim/5nCEOim/Y16qwb6mdrgRtVBZqQL3zF
epH6C3rzV3kHnUCebHe05olkfCIamp+05r7CsEEpvKPWLk8MiF2qAh7TxTzsvaTtFvZ5dcNNe4uB
oG9crIvCUcnH3umulWNZkNQItNK6v2sJ4TzBzWmDv/0yStwfPe8E6GWXyaZQm7HGNOXB562IOav5
onDkRXEd+q0W8iKrvQMjl0CCIVY4q5Mg6pBb/6dZaFHMYTeF2Zu0tY5WRe+QHge62H3aPYBi6cRu
jQNvk9HyEAv5v1413Cyosig6b3VfOg49XxyLMpkeGSEhRrm8dsCwVfzGSP7Ri+tvtCTOriDeVP4i
/F7Eqi5X7Ski1lOr7I4aB4njWy2zMo3DSbBUtRlaDYZ3VfMFtpmQB7NHaLVw5bPDbqb1BBJquGG9
Q2hAMWB56zwPaS3iP5MUKhfuAxWlVLd2QmSn6jwmN5lkABhk8dWU1A3b73W4k1a92My7iO5awdZG
LUcQcUsU5SLRx/55RKtBdby6CbKV/Zw9ttEyqt4e04IGBfraGMj5gWro5Zh3oT8iWQSn2SzHLhNn
onUFBHyPewUQSJiWoE3NIpWYYpBNyHyIk50WOVbceIu6HY8F2wDJyrQ+KoPQ8FTJmNwtDnFF+pad
GIq/5tmtvH6AfxiOvvtZ0LpylGmItJ18xxyIyINNvAEXBxHVveQkF1LgynWqmovRNhtjIUTY7Y1+
ASoe8LzEuuSwur2gFObifC5EU+hnkzChWFETwVND4XD0x62dCV/NmbJnWdTDbLIc6y/cgFUE4Y9Y
gMCH0hAPJ8MEkklVF98GGWZArDC78V7YqIiSYYA6jbrHIQ9kikf/t3IX31du0RPJjAR6qYg5CCpL
UutHxtEUCc8+4P/3oy3JWcDcNQL3l2mJwIKwf+aYZ8sZQN743KAlHWl/8PDQL329V6zwX9hwtpMT
XZ+J06wrcf4kHtnG5CSVHRrpREGndAuRkOp3BB18IaD8T2CMVEo2YVQoyqsgv4LglY9+G5xHXVcx
78kP4AYp2Gs98RRLARZ6XZeo9A2rApbkqIBSV2fmWKPQvhfiGw9KRR2frE4ACCHnRIZ/+uVg2tox
+YZmpSwD5W+C9ZajUmrMoxdyncMFCEaObAWsKi4vO+cpzEgBOZeJt2QaBSnVsPaeQocdfEEf5ljW
GkiEfydtDF0EdGtdnlE7wZbrqT8hvP89IWoN74dc7X5aQ1Cvicodj+BR2k+pAMGa+ZhgBvUVjiRM
T2DhR1Vpr0d2OOMomF+AjO7RaASALSDeWkB3nkO+2vFtIlmXaVKUz4GR5lLbkTI4B70TcFDjXiKT
0OjjopRoePbMkjlgSy+hhrwjp6VT8ODrA63yTVjCoHU5d2pwaFm3Tw6FWVOlbbSlA8ZEXOqNNINe
YfSt0EtYDcTzyY1+q5njZ8QhQXhNMTd+WapgZzeVqjiqAPHBd4fwu0OOvFXA/dQ624UjGCThEQua
zNCsFIT/kH2Do4U5rfOZrKnCbtLSGhVoY+qQYyGX9EDcxG5d4eI4i5NhFUtu415rWVBWee5y2+kd
uwQdxQ94jlDMvB78tSZorqfvjxH2SJ2TgoVsuH+0aTtUsWuKORSWAjcz23aTVptsTuE65k6YSfkS
X4pM29a0fzlcvXoK7yNJsxwPGXQfysRXs4nsFlNa03Ng2XuRuQnQdlBNAIZgLd0S+J9Z8JYYlAwQ
vCqNIsRm/8jLbWVleo8k8d+5LnMOKCCafAAwEUczkl3ri7n0zU6LXAi3cJ20twQiJ+ZXCtxVBVZd
h48Uk1yT/EplysJZA352yFmtLfujOBLP4NE2DpwsZRfz83VL4qf6pFnAg7wS+sQac3tZkZa7ADlo
OIsuIbqOibgNO3mx5f+FFNieh/gc7RrujB64FMusPPO8VokgiWmJqeO9l1ps2+lu75DPurE0e74F
FzbqESMF+2gvYGHYAE4Rlwp9PHBpeyRC2iBvc6heGhSSkYCINChGT3ln/pCox3f7IaBcNPldi0ic
SCvKt7Qt0vGOAA6NxttEeEr3N2LXk/8MUuG6CLTtSYXG3XAd303+LiwfQ25PO5vUqVLc3RIr2///
jl1VkhjnASt2//mcMbmxPtT6J7Q0BGn6odsKs65HfZVAp84FyUWrXYNlqAAjopIKZB7QvcqWwc3y
C72sxH5gmzfuQ5nbQy6NzVwDc/YdTsyqLDzR4S7Enhcwsvud36qez+25am8xc5fwyLrJVbPcoXYR
Os4jxM5rPvMZewMRw4D+M3u5ulsxIIvcFBOkQf/XVhaCOoXx0Igfhupn7TSOIs84SoPkO8UmGgoU
Ulkb1/vTLQO3G6F++s3dggwkL2D05pCTUfij1++/kb1Kvr5LHYun57KBGKuwkyp9wXBvCJ21wU7X
b9qT2FR3RiXmJcgJV1er0CsNfRL/yWL6TxoHfpfQ8KR73UFhVzWOd+yl9YuoYwSATykGMrsezirc
DqVKB9JGMZhlMJHcAPgURQ9NP+IVFubCopgeS3XEEPerRRu7NnaPehCdZ8vWYtQLnfNxSeqYwwHX
bxG5EEpw8oZsYdytTrFcgAx0vDwy2/XYqqLa5JAM5pnDMDuKVBykBszAKfpnPlWS9nl0blPhV7Za
pirbhZc/KuWFGkn/l9mGfK9+NO4Hwp9pji4+35qKDHM5gk63Rkz2JsI54s1+Z1V16L5HmbQsxtYL
sV2nG5vd3f25Xjb+Zz1b/1F89jZattpM41FzT9IW1WQrdfk0HVMcYSLRWVWhRSWucch7DUmTAnme
KfsIHn8WidQdHS2SVDr8+moLpTfSTKH4xZDVS/I3BWL/rdarlaHAdIhRB3Za5bFmGfws9UlCYGkN
bTPg/O+uZ0nRHbrzyaZCl/j3AkEmLMaX7wOojou+5iUc5CnxSmfA3Si21bLvoYBaQdyWivnlDiB4
Ien8Q+l1BKCrBNqO7mvf8NlobTfH66Y2WVlhuNNmmZkkcbR9LZN//993grmXdy2ni4xns5LsNsR3
yrm02hW7NgqO4ADatTVfCCC1aij+MtAeqxjGLzTga8MNhQE86p1GR59dWujk52wBef+b8ToajxRO
n7zbkg6FhQ5yi5VnNPPzrUsxp+QHSKr7hDuctLYwDc5zB57xPA0JFquU4yXPxH5u8LTvn5ZQfIai
TUkzOxUc25dofDFPcSJe3Bxb59JcygS+5BOhtiuHuyyCDZ9bK0XW+fOxO3zmSbvq3tlX3UO5aqnh
3FPeJayA
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
