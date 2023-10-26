// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Oct 20 22:57:03 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vpu_config_ram_sim_netlist.v
// Design      : vpu_config_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "vpu_config_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [2:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [0:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [2:0]addra;
  wire [0:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [31:0]doutb;
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
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [0:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "3" *) 
  (* C_ADDRB_WIDTH = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.3483 mW" *) 
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
  (* C_INIT_FILE = "vpu_config_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "8" *) 
  (* C_READ_DEPTH_B = "2" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
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
  (* C_WRITE_DEPTH_A = "8" *) 
  (* C_WRITE_DEPTH_B = "2" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
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
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19552)
`pragma protect data_block
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
HQ==
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
