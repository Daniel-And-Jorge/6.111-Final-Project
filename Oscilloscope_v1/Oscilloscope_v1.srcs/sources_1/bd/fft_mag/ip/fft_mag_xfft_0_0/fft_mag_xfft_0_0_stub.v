// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Tue Dec 13 15:15:18 2016
// Host        : eecs-digital-02 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.srcs/sources_1/bd/fft_mag/ip/fft_mag_xfft_0_0/fft_mag_xfft_0_0_stub.v
// Design      : fft_mag_xfft_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xfft_v9_0_10,Vivado 2016.2" *)
module fft_mag_xfft_0_0(aclk, s_axis_config_tdata, s_axis_config_tvalid, s_axis_config_tready, s_axis_data_tdata, s_axis_data_tvalid, s_axis_data_tready, s_axis_data_tlast, m_axis_data_tdata, m_axis_data_tuser, m_axis_data_tvalid, m_axis_data_tready, m_axis_data_tlast, event_frame_started, event_tlast_unexpected, event_tlast_missing, event_status_channel_halt, event_data_in_channel_halt, event_data_out_channel_halt)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_config_tdata[15:0],s_axis_config_tvalid,s_axis_config_tready,s_axis_data_tdata[31:0],s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tlast,m_axis_data_tdata[31:0],m_axis_data_tuser[15:0],m_axis_data_tvalid,m_axis_data_tready,m_axis_data_tlast,event_frame_started,event_tlast_unexpected,event_tlast_missing,event_status_channel_halt,event_data_in_channel_halt,event_data_out_channel_halt" */;
  input aclk;
  input [15:0]s_axis_config_tdata;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [31:0]s_axis_data_tdata;
  input s_axis_data_tvalid;
  output s_axis_data_tready;
  input s_axis_data_tlast;
  output [31:0]m_axis_data_tdata;
  output [15:0]m_axis_data_tuser;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output m_axis_data_tlast;
  output event_frame_started;
  output event_tlast_unexpected;
  output event_tlast_missing;
  output event_status_channel_halt;
  output event_data_in_channel_halt;
  output event_data_out_channel_halt;
endmodule
