// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Thu Nov  3 14:25:32 2016
// Host        : eecs-digital-13 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xadc/proj/XADC_Demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_in1, clk_out1, clk_out2, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,clk_out2,reset,locked" */;
  input clk_in1;
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
endmodule
