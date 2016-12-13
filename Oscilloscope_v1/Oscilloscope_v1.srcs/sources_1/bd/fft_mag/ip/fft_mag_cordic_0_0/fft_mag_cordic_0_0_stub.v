// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Fri Dec  9 16:52:21 2016
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.srcs/sources_1/bd/fft_mag/ip/fft_mag_cordic_0_0/fft_mag_cordic_0_0_stub.v
// Design      : fft_mag_cordic_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0_10,Vivado 2016.2" *)
module fft_mag_cordic_0_0(aclk, s_axis_cartesian_tvalid, s_axis_cartesian_tuser, s_axis_cartesian_tlast, s_axis_cartesian_tdata, m_axis_dout_tvalid, m_axis_dout_tuser, m_axis_dout_tlast, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_cartesian_tvalid,s_axis_cartesian_tuser[11:0],s_axis_cartesian_tlast,s_axis_cartesian_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tuser[11:0],m_axis_dout_tlast,m_axis_dout_tdata[23:0]" */;
  input aclk;
  input s_axis_cartesian_tvalid;
  input [11:0]s_axis_cartesian_tuser;
  input s_axis_cartesian_tlast;
  input [31:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  output [11:0]m_axis_dout_tuser;
  output m_axis_dout_tlast;
  output [23:0]m_axis_dout_tdata;
endmodule
