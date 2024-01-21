// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  9 18:41:23 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ sharpen_ram_sim_netlist.v
// Design      : sharpen_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sharpen_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21552)
`pragma protect data_block
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
1P8TWhMT
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
