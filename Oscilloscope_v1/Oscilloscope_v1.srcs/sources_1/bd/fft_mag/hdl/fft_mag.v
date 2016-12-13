//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Tue Dec 13 15:10:37 2016
//Host        : eecs-digital-02 running 64-bit Ubuntu 14.04.5 LTS
//Command     : generate_target fft_mag.bd
//Design      : fft_mag
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "fft_mag,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fft_mag,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "fft_mag.hwdef" *) 
module fft_mag
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

  wire [31:0]S_AXIS_DATA_1_TDATA;
  wire S_AXIS_DATA_1_TLAST;
  wire S_AXIS_DATA_1_TREADY;
  wire S_AXIS_DATA_1_TVALID;
  wire axis_register_slice_2_m_axis_tlast;
  wire [11:0]axis_register_slice_2_m_axis_tuser;
  wire axis_register_slice_2_m_axis_tvalid;
  wire [31:0]c_addsub_0_S;
  wire clk_1;
  wire [23:0]cordic_0_M_AXIS_DOUT_TDATA;
  wire cordic_0_M_AXIS_DOUT_TLAST;
  wire [11:0]cordic_0_M_AXIS_DOUT_TUSER;
  wire cordic_0_M_AXIS_DOUT_TVALID;
  wire [31:0]mult_gen_0_P;
  wire [31:0]mult_gen_1_P;
  wire [11:0]scaling_1;
  wire xfft_0_M_AXIS_DATA_TLAST;
  wire [15:0]xfft_0_M_AXIS_DATA_TUSER;
  wire xfft_0_M_AXIS_DATA_TVALID;
  wire xfft_0_event_tlast_missing;
  wire [31:0]xfft_0_m_axis_data_tdata;
  wire [15:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [2:0]xlconstant_2_dout;
  wire [15:0]xlslice_0_Dout;
  wire [15:0]xlslice_1_Dout;

  assign S_AXIS_DATA_1_TDATA = frame_tdata[31:0];
  assign S_AXIS_DATA_1_TLAST = frame_tlast;
  assign S_AXIS_DATA_1_TVALID = frame_tvalid;
  assign clk_1 = clk;
  assign event_tlast_missing = xfft_0_event_tlast_missing;
  assign frame_tready = S_AXIS_DATA_1_TREADY;
  assign magnitude_tdata[23:0] = cordic_0_M_AXIS_DOUT_TDATA;
  assign magnitude_tlast = cordic_0_M_AXIS_DOUT_TLAST;
  assign magnitude_tuser[11:0] = cordic_0_M_AXIS_DOUT_TUSER;
  assign magnitude_tvalid = cordic_0_M_AXIS_DOUT_TVALID;
  assign scaling_1 = scaling[11:0];
  fft_mag_axis_register_slice_2_0 axis_register_slice_2
       (.aclk(clk_1),
        .aresetn(xlconstant_0_dout),
        .m_axis_tlast(axis_register_slice_2_m_axis_tlast),
        .m_axis_tuser(axis_register_slice_2_m_axis_tuser),
        .m_axis_tvalid(axis_register_slice_2_m_axis_tvalid),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(xfft_0_M_AXIS_DATA_TLAST),
        .s_axis_tuser(xfft_0_M_AXIS_DATA_TUSER[11:0]),
        .s_axis_tvalid(xfft_0_M_AXIS_DATA_TVALID));
  fft_mag_c_addsub_0_0 c_addsub_0
       (.A(mult_gen_0_P),
        .B(mult_gen_1_P),
        .CE(1'b1),
        .S(c_addsub_0_S));
  fft_mag_cordic_0_0 cordic_0
       (.aclk(clk_1),
        .m_axis_dout_tdata(cordic_0_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tlast(cordic_0_M_AXIS_DOUT_TLAST),
        .m_axis_dout_tuser(cordic_0_M_AXIS_DOUT_TUSER),
        .m_axis_dout_tvalid(cordic_0_M_AXIS_DOUT_TVALID),
        .s_axis_cartesian_tdata(c_addsub_0_S),
        .s_axis_cartesian_tlast(axis_register_slice_2_m_axis_tlast),
        .s_axis_cartesian_tuser(axis_register_slice_2_m_axis_tuser),
        .s_axis_cartesian_tvalid(axis_register_slice_2_m_axis_tvalid));
  fft_mag_mult_gen_0_0 mult_gen_0
       (.A(xlslice_0_Dout),
        .B(xlslice_0_Dout),
        .CLK(clk_1),
        .P(mult_gen_0_P));
  fft_mag_mult_gen_1_0 mult_gen_1
       (.A(xlslice_1_Dout),
        .B(xlslice_1_Dout),
        .CLK(clk_1),
        .P(mult_gen_1_P));
  fft_mag_xfft_0_0 xfft_0
       (.aclk(clk_1),
        .event_tlast_missing(xfft_0_event_tlast_missing),
        .m_axis_data_tdata(xfft_0_m_axis_data_tdata),
        .m_axis_data_tlast(xfft_0_M_AXIS_DATA_TLAST),
        .m_axis_data_tready(xlconstant_1_dout),
        .m_axis_data_tuser(xfft_0_M_AXIS_DATA_TUSER),
        .m_axis_data_tvalid(xfft_0_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(xlconcat_0_dout),
        .s_axis_config_tvalid(xlconstant_1_dout),
        .s_axis_data_tdata(S_AXIS_DATA_1_TDATA),
        .s_axis_data_tlast(S_AXIS_DATA_1_TLAST),
        .s_axis_data_tready(S_AXIS_DATA_1_TREADY),
        .s_axis_data_tvalid(S_AXIS_DATA_1_TVALID));
  fft_mag_xlconcat_0_0 xlconcat_0
       (.In0(xlconstant_2_dout),
        .In1(scaling_1),
        .In2(xlconstant_1_dout),
        .dout(xlconcat_0_dout));
  fft_mag_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  fft_mag_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  fft_mag_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
  fft_mag_xlslice_0_0 xlslice_0
       (.Din(xfft_0_m_axis_data_tdata),
        .Dout(xlslice_0_Dout));
  fft_mag_xlslice_1_0 xlslice_1
       (.Din(xfft_0_m_axis_data_tdata),
        .Dout(xlslice_1_Dout));
endmodule
