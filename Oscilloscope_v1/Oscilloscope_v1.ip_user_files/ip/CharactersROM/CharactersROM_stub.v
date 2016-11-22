// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Sun Nov 20 21:03:27 2016
// Host        : eecs-digital-02 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.runs/CharactersROM_synth_1/CharactersROM_stub.v
// Design      : CharactersROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_3,Vivado 2016.2" *)
module CharactersROM(clka, ena, addra, douta, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,addra[16:0],douta[0:0],clkb,enb,addrb[16:0],doutb[0:0]" */;
  input clka;
  input ena;
  input [16:0]addra;
  output [0:0]douta;
  input clkb;
  input enb;
  input [16:0]addrb;
  output [0:0]doutb;
endmodule
