// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:24 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/sharpen_ram/sharpen_ram_sim_netlist.v
// Design      : sharpen_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sharpen_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module sharpen_ram
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]doutb;
  wire ena;
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
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.01735 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
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
  (* C_INIT_FILE = "sharpen_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  sharpen_ram_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[15:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21504)
`pragma protect data_block
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
WTHEeLRgKvuXjMcUtCEQ
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
