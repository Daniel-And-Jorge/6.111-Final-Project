// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Fri Dec  9 16:52:18 2016
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.srcs/sources_1/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_sim_netlist.v
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_0_0
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_11 U0
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
module fft_mag_mult_gen_0_0_mult_gen_v12_0_11
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_11_viv i_mult
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
KRQfclLb+A7kHS42jf5QFlz+Z8Du4jObsUHwnEDfwe4/zM0mhRRrWLQGlno9OkZ0xYAtr5w7epQA
qfunjr/4k+jnVV5zVKz8w3b1ALZHo+k5nx4484wNTHHefjrct8RbPuIng7FLM0ry0IP1pxTqM1VL
dltWGWAaELr2yUxFs3YTbNHif+Xm9oiTBoaBHacpmHo5dtwQdXSoFhZ7JpKTL+zNUK1x6J7gPtuw
0CekAM/6ZHcwOGL4FoBBK4HpGyH5M2oqDOstgPYqdeyaOqES8IYU7ZfB8L7WaOXu2N+2x+c9c3+u
nPl89I8HHjYaUQGB5hE1CXF+JC4IIGPcCnFkNQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
Q5oUMNrjSTntOBMKpdXXS4K0DxInHbhLWSOh+MBW3T0yiiZNhVqUQ+Gn1xk043mp/JvspmHqpD+U
9JPEMYh3DQZ1hyLVkV4vKeJySfqeH3snQdKh/TVpqGH+nZdYodNWs9HJttjIO8T3i6rdQuepLUWV
JPY1mIaTB0IO7yOMfcVMCuDnbjI27aAa2Cy/o3vKTumWvgOmWiun4wY4kzQt9JK78Z1USqlSiHaW
fE9uRUdA7ytip5+cvVG8I2yF9cbQY+eIYboyqqsdlxace8OhuOF4HC29yUJ1idiL2D3J5Krroi3l
ZNeu2AgzK8HvxkCLMi7VSZewxOVjC7z3ZxdGOg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
uxxiH9yurJz9U+ICfd6L94N2THHORCNHwQ==
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
