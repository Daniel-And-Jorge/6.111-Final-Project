// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Fri Dec  9 16:52:38 2016
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.srcs/sources_1/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0_sim_netlist.v
// Design      : fft_mag_mult_gen_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_1_0,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_1_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_11 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "31" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_mult_gen_1_0_mult_gen_v12_0_11
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [31:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [31:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_11_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
gD7l84kB+WAh1ATog3H36h0/cMgn9QL5jGe9p9PjvP7N+FJAVvGVlrxcgBw6dZaWDNZqNANQuRFv
ZSE8fsSCFg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YQUcxim/tlzHeVlJ7otHN7u41KO3Yg5DFb1yF4GCsbXGLtUvWNlkFjY+UPIlgYImR4Zo4dTHJQ+j
3BaUNSUOqAVzT9CfyUelv2YD2ZTfAtzIe1Mboyb3+StKnuzxnZmIhVPiZlowdW5lQ1r7BjDPOsge
ztxOfUTbvYcTUE1ABIE=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eu4MFD/NMz3pssr62VCh1XDd9mthYydX9VaOq3lWUwHi5/7e5dl2SAWHtYwTnBgGPY+jCcMycJhy
WSlkhQxVj5BsMm2aAItwXFvH2mSbjlPggtI0/+DNGQ4x8LQSFLTDYnnQbBrHlJymsS+/asMkXACD
SJ2tF8LF5tMhAlMPZZ0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rNAzbNlIFUMjdhvgzZ2FokzvR4AuFtV+1AHGDKa9QgeBsZ1e0Fom48uKbJ9iakvqUoUcKKAvRzeY
OBkbx9P7Imx0gvIgzFsgiVw23cBYWOhbhSqVb7mef9aKx8yeF8T48n7gKldUkwBHIPeqaayRI9/Q
HCZO+k2+HCjRZE6L/Gzd+IOdEVUFOg3NtWFPk2JFkfZkxs8X7Vg/xxtvH7uvp+/EbVyiMbnwDT/p
NSqOyA+rJwBJYD3xRIPTFDI83XJLCF+1i4E8hyu7Y0F9MtjKugqEHwAG+JK3jde00nzNNaeLVUQ1
OfFMZJpkk0Cg66d2cvJY/G11oPkmvTq/JZ4+5g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
apuTRT8aJu0TR7Ciy6ONiGK4AT7TUEiokS4gFf1g+kDg6PdKk9VRun4HKszIadRtahjPQo0of9uS
yvu3GS4EQo+Y+T116wnAIXnZSa8EQaEsDkziOI+rCvXv8IgaPYN8Cq0aRlASFL7IHOWNI49V0c0A
FIG/+5U7ZyNQFCVwuE4gCgK/pA6apm5kY4FGJft/EdZ5YAbR/nCTzK4P53+XsKHrtGfw+/MthFWz
tI0OtloKqc7laKZWKOVFqWq8Qmq7UL6utFODtxEQqzczH+q+Gw4rkUyOosIY+cbB67hX+GlmXXEF
jMwvUcen9t6c+wiH6rmBDcUIiuUHHz6q+jCwJQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dfDj35aI8y6zqcW/IHFxmCDw2mpyex25qQAUnsL+tIRxivv/85PqpCOrf3b7NWnwUKMrsxtw+JBY
mtlPsVxQKR1gn6VkaHwbEgwxXXxFe71Z+1nWQhfF8Nt55jGvq1joWKMrurSV7Mo+HkvHMSszXj3v
8ElD0S6sN91oml0nObejOhxzHf0ybK+sGag+CFA7aBr4k4rYglf7AzOYrPl3nNoCkyrFDQFa46/w
SXJm/os7zUHbsDI5GGUH3BU+NktHZV6GK3iyhtHTwrMgDtpGk6vKHMKULM1Gjv9g1/jp9Ao4cUhr
bCVOXM1v2e8A3564rmh3if78zTzCKamPRAB5Ig==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
VcmqakAIWctIymqee3Y4VDbl9HzSzLGmkokyb8+N2dHZsV8Ha3emvrgMsAUajqW/Bf3gG7AlbVAO
scYTnHjaceYnYhrQybqAP2Ie0RtjWER57kb3Ln9cHwsASTuJ1XBRL+zx8LJ6Sfa3FOZStNhwt6IW
CcUL6WMWt3+mtQ0Wmcjjzkp+aBWVMVWpmR0p1bmqDBChc1cgiTEonsqflYANX4+nS/gh8gFBl3/+
e/wrshVPYrBozVHIdKRX+Ne9jGzgoxGrlnWTkqB32olW8l3HeOo6/CjpnfP6AMqpL+VekEJbP9lY
/HZHw/UaI6JulVEk5pRWX1DjAfeKPCdhz21dkg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
s8BCOXqMCMU0gUsZmjEqLENgB8IYSYTN/DrojZ9EhVnkGAuvilcfk5/8eOWD48sN5E5Z0IbH4wmC
0S5gBdkAiQb9Qw0TSJQjkCDZXUrBzY4fWisyPdBSPSc4oZrgFPQiKy4ozEJCtjfMeioMlOHdjUIa
1dlW29T7rGnqv6WRuUjk6y87GRKsrk4bWB+sqInZ3D7+PMkXT3KQc1rIWXE7TAb/lZ6br8ht0RIu
0rWxZayxrk0yncF7DCQJ3hJabUU8anD8skg0qDhtdhQQZ0wkIGs8y3FyXg5O9Kimftdfu6BFiYbo
+FOEkI7Ng14yYxauuvasZu+uZ4xM+IlTBiW19Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
e8WEFdHK9qvTdiapYmFKteiC5lX/tRXvTg==
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
