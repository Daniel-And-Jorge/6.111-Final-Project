// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Fri Dec  9 16:52:09 2016
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.srcs/sources_1/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0_sim_netlist.v
// Design      : fft_mag_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_c_addsub_0_0,c_addsub_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_c_addsub_0_0
   (A,
    B,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire CE;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_9 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_9" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_c_addsub_0_0_c_addsub_v12_0_9
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [31:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_9_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A13f8tlz6UJG9JfCNcYl8NLUw8Tlctm35dCRvt/KCTpBFIuXlOawHL7sTHowWNnYPdFQNufThU2P
nq6r7CYRfg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJAsCu5zl/OMFEQsA8TK81YQdELnJEDcFa6KQ0EHWxmJrxei82pUrFKy5/0YZah/J8433WTkuMYX
n4DxKRAShIrdY1X7G4VuvTy06p94vL5LjcHyEy4fxae5eyT8gPJ2ix4XQa8NTiv0ndfGQZyw3Nh2
G2fKlAI5x3f8zwZZQY8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
wvBGFVtHjRF0sOMF1pCWFAGskoPwO7T2ijyj/eL3cj3Mn4RaSun2E2ii2aHguV5ZVFP65oRsiH5d
RuZPDUKAsxBDhHSsGkFSPIwX9KivlJTo2FZHlBDTlkfDQbn+a3fWxc1HcR9KUBo8QndFpzMmqgOV
oDGrjFRMryCx3hlDJdU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UMkVtIsRH0SCXq8LQlXc2SFapNVFtJ6lm3Wp55oPh2JHEa2eDcLuSNAMzka2zwzCEXltR/XJthW1
e74yTmf22SChtep5vBZ+ajUd7h2t8MuWnhQAMciHkyF4IkU7ju3JOoQFlih3FqDO3aUJPcamhd7Q
ccMUMAhIvZFp44NdLzl8HbXnE1qh9bi1m8qU8jMCKESUZ7pg4lNlsQjd+Goa1H9iXaLEv3OfHZuq
AS/RQip05I1DUFL5hACAmmneYHUVM5S4EEaO3aHf1jZ3r/piru3ZRDHXxDir2Y9zXiL2oDUfsV5l
w+Pp691O/rBEAjBLQdevDcp/mZn7axrfo7gedQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BizuB2M20zTA5t6lHKGfnJrucOUdZ0HEVkxiYzkxLH0WP9VZIREBo09OejVavblw0lBdoToGD/Dx
ZN2JWgxB3v9b0Oe7EvwN3oB8w0TKm0RoqDmuPV8JuY7RwxtxkHcrVvcjXuOt8j2BPe5Ix86NYRxZ
8RqRFVGNyOVCKZuaFMVHI+ktnNU/xi6ZGsd+L0PEmNWeJ+y+7ubRYuJBTcZK6n0e0Rv144/nsqdy
X+40+rhcynqZUh14Jaqxwmyc8eu2wmo21it2TUiXXzLiWf9C/rPTasxTNu6GgF2yKIv/qtG5zsH5
iEI5vhFnzG+RShh+IHFb+FdSgnifLxcvxMZyfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WBEZpdyDr9NfPjFUCp37UUdIujNIa897wZZ58/x9eMPhksqlKdy3SYhoDdl4U5n1JXPWIonhbpyY
qfWTq0gV9NaH1PiTuV9w+nrQziNvPhnHnWOzNrltlMQ+uTbMRquXZffmAQGphp7ekw56wGNMIqvn
BRmPzqHv8wZfX/RCaFbjfXAJEmAF89kl5TL3IWnE72Kb9o1cSvFtKTxyRoh9m9E0ghJdkhnRh4Pm
wU/+pIGwon3nUS1E00edVC7apMYbKm+8akp/2UT8ovmuCYJtcE90yRZZaeiFNpLq2UTmaGHp3XHC
2ziTOAA9fjUjv2jhCi5RMA2D0eDmOlHleltm9Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
baSC17mISmMjbSt+/JhdUv1NSCikEYer6g+4UAI6vpQP/5Z1nYQgXfQqDgf+TIM39OcIu2UHbzRU
v8ZqZ5oM3535zp6z30uIt2DxMwccslk1TrRtw8d1h5MRrzxlBWI8Gfm5B7Cm6UR9uubaw276EvvR
s1jPy2Gh5trM03aS5vxKUG8sT/KGwyp2K+zZTo9Qjgg9aibUF4XxkT8UY1ExRvhvt1TmpyBGx0FS
+nbVC/Xe/a8Hyd1MsybzqRmiNwcG10M9Ti4UmXu/qJ/co/dPfXu2S8JayC6o5jVoqD5KJz4rKhLB
GY8nsm9EK9cBp9NFGmD10N/swMJhK4Iv7WgDIQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
L3i5hu0rx5aKTgbJUDEANn+F3rNSNWSbw2T4qxy9Qr0Q+DIV+Xa1XQcPQGvX0eGeXQWvWQ5GGjjT
uOFxryhXQqfr8+AugZnv+0k78Zlm2s1RnnmEvhWJnjAQX27bbY5xAm0+pAV18jn6NEdx/ty4Y+rk
KJe+EqTbUvA1DDS7JhUg9BzGQzywRpWfmn3Aw9B1FpxKuc9oz4P6sbh5i+8ho+0kXKlObJTHwrSr
apcieoQlrnGinlTbSEoxO8nPXyY1SrseGOcehcT/bhWzqMpihl/rIK7b2uIURgILGjU8tFkMP/Uk
zyYfYeNNutbqKZbgkTiQzvBBxqKsLxPBqMci/w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18768)
`pragma protect data_block
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
a6hIP0TarXK9lsxMY1/N
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule
`endif
