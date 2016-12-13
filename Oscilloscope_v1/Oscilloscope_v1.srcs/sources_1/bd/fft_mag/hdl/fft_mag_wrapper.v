//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Tue Dec 13 15:10:37 2016
//Host        : eecs-digital-02 running 64-bit Ubuntu 14.04.5 LTS
//Command     : generate_target fft_mag_wrapper.bd
//Design      : fft_mag_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module fft_mag_wrapper
   (clk,
    event_tlast_missing,
    frame_tdata,
    frame_tlast,
    frame_tready,
    frame_tvalid,
    magnitude_tdata,
    magnitude_tlast,
    magnitude_tuser,
    magnitude_tvalid,
    scaling);
  input clk;
  output event_tlast_missing;
  input [31:0]frame_tdata;
  input frame_tlast;
  output frame_tready;
  input frame_tvalid;
  output [23:0]magnitude_tdata;
  output magnitude_tlast;
  output [11:0]magnitude_tuser;
  output magnitude_tvalid;
  input [11:0]scaling;

  wire clk;
  wire event_tlast_missing;
  wire [31:0]frame_tdata;
  wire frame_tlast;
  wire frame_tready;
  wire frame_tvalid;
  wire [23:0]magnitude_tdata;
  wire magnitude_tlast;
  wire [11:0]magnitude_tuser;
  wire magnitude_tvalid;
  wire [11:0]scaling;

  fft_mag fft_mag_i
       (.clk(clk),
        .event_tlast_missing(event_tlast_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid),
        .magnitude_tdata(magnitude_tdata),
        .magnitude_tlast(magnitude_tlast),
        .magnitude_tuser(magnitude_tuser),
        .magnitude_tvalid(magnitude_tvalid),
        .scaling(scaling));
endmodule
