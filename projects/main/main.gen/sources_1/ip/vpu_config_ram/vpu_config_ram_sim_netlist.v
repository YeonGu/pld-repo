// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Oct 20 22:57:03 2023
// Host        : Kasaki352 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Xilinx/PLD/pld-repo/projects/main/main.gen/sources_1/ip/vpu_config_ram/vpu_config_ram_sim_netlist.v
// Design      : vpu_config_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "vpu_config_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module vpu_config_ram
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
  vpu_config_ram_blk_mem_gen_v8_4_5 U0
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
EA==
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
