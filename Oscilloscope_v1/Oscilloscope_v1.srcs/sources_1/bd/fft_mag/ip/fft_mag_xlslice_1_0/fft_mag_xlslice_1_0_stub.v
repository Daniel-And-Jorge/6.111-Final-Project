// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Fri Dec  9 16:53:06 2016
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.srcs/sources_1/bd/fft_mag/ip/fft_mag_xlslice_1_0/fft_mag_xlslice_1_0_stub.v
// Design      : fft_mag_xlslice_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlslice,Vivado 2016.2" *)
module fft_mag_xlslice_1_0(Din, Dout)
/* synthesis syn_black_box black_box_pad_pin="Din[31:0],Dout[15:0]" */;
  input [31:0]Din;
  output [15:0]Dout;
endmodule
