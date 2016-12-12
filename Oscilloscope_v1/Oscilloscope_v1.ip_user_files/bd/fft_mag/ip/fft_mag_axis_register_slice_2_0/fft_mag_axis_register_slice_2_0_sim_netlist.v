// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Sun Dec 11 21:36:01 2016
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.srcs/sources_1/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/fft_mag_axis_register_slice_2_0_sim_netlist.v
// Design      : fft_mag_axis_register_slice_2_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_axis_register_slice_2_0,axis_register_slice_v1_1_9_axis_register_slice,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_register_slice_v1_1_9_axis_register_slice,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_axis_register_slice_2_0
   (aclk,
    aresetn,
    s_axis_tvalid,
    s_axis_tdata,
    s_axis_tlast,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tdata,
    m_axis_tlast,
    m_axis_tuser);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [31:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input [11:0]s_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [31:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) output [11:0]m_axis_tuser;

  wire aclk;
  wire aresetn;
  wire [31:0]m_axis_tdata;
  wire m_axis_tlast;
  wire [11:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire [11:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire NLW_inst_s_axis_tready_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [3:0]NLW_inst_m_axis_tkeep_UNCONNECTED;
  wire [3:0]NLW_inst_m_axis_tstrb_UNCONNECTED;

  (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010010010" *) 
  (* C_AXIS_TDATA_WIDTH = "32" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "12" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_REG_CONFIG = "1" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* G_INDX_SS_TDATA = "1" *) 
  (* G_INDX_SS_TDEST = "6" *) 
  (* G_INDX_SS_TID = "5" *) 
  (* G_INDX_SS_TKEEP = "3" *) 
  (* G_INDX_SS_TLAST = "4" *) 
  (* G_INDX_SS_TREADY = "0" *) 
  (* G_INDX_SS_TSTRB = "2" *) 
  (* G_INDX_SS_TUSER = "7" *) 
  (* G_MASK_SS_TDATA = "2" *) 
  (* G_MASK_SS_TDEST = "64" *) 
  (* G_MASK_SS_TID = "32" *) 
  (* G_MASK_SS_TKEEP = "8" *) 
  (* G_MASK_SS_TLAST = "16" *) 
  (* G_MASK_SS_TREADY = "1" *) 
  (* G_MASK_SS_TSTRB = "4" *) 
  (* G_MASK_SS_TUSER = "128" *) 
  (* G_TASK_SEVERITY_ERR = "2" *) 
  (* G_TASK_SEVERITY_INFO = "0" *) 
  (* G_TASK_SEVERITY_WARNING = "1" *) 
  (* P_TPAYLOAD_WIDTH = "45" *) 
  fft_mag_axis_register_slice_2_0_axis_register_slice_v1_1_9_axis_register_slice inst
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_inst_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(1'b1),
        .m_axis_tstrb(NLW_inst_m_axis_tstrb_UNCONNECTED[3:0]),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(NLW_inst_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb({1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010010010" *) (* C_AXIS_TDATA_WIDTH = "32" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TUSER_WIDTH = "12" *) (* C_FAMILY = "artix7" *) 
(* C_REG_CONFIG = "1" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* G_INDX_SS_TDATA = "1" *) 
(* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TID = "5" *) (* G_INDX_SS_TKEEP = "3" *) 
(* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TREADY = "0" *) (* G_INDX_SS_TSTRB = "2" *) 
(* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TDATA = "2" *) (* G_MASK_SS_TDEST = "64" *) 
(* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TKEEP = "8" *) (* G_MASK_SS_TLAST = "16" *) 
(* G_MASK_SS_TREADY = "1" *) (* G_MASK_SS_TSTRB = "4" *) (* G_MASK_SS_TUSER = "128" *) 
(* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_INFO = "0" *) (* G_TASK_SEVERITY_WARNING = "1" *) 
(* ORIG_REF_NAME = "axis_register_slice_v1_1_9_axis_register_slice" *) (* P_TPAYLOAD_WIDTH = "45" *) 
module fft_mag_axis_register_slice_2_0_axis_register_slice_v1_1_9_axis_register_slice
   (aclk,
    aresetn,
    aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser);
  input aclk;
  input aresetn;
  input aclken;
  input s_axis_tvalid;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tstrb;
  input [3:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [11:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tstrb;
  output [3:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [11:0]m_axis_tuser;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aclken;
  wire [31:0]m_axis_tdata;
  wire m_axis_tlast;
  wire [11:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire [11:0]s_axis_tuser;
  wire s_axis_tvalid;

  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[3] = \<const1> ;
  assign m_axis_tkeep[2] = \<const1> ;
  assign m_axis_tkeep[1] = \<const1> ;
  assign m_axis_tkeep[0] = \<const1> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign s_axis_tready = \<const1> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  fft_mag_axis_register_slice_2_0_axis_register_slice_v1_1_9_axisc_register_slice axisc_register_slice_0
       (.D({s_axis_tuser,s_axis_tlast,s_axis_tdata}),
        .Q({m_axis_tuser,m_axis_tlast,m_axis_tdata}),
        .aclk(aclk),
        .aclken(aclken),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "axis_register_slice_v1_1_9_axisc_register_slice" *) 
module fft_mag_axis_register_slice_2_0_axis_register_slice_v1_1_9_axisc_register_slice
   (Q,
    m_axis_tvalid,
    aclken,
    D,
    aclk,
    s_axis_tvalid);
  output [44:0]Q;
  output m_axis_tvalid;
  input aclken;
  input [44:0]D;
  input aclk;
  input s_axis_tvalid;

  wire [44:0]D;
  wire [44:0]Q;
  wire aclk;
  wire aclken;
  wire m_axis_tvalid;
  wire s_axis_tvalid;

  FDRE \NO_READY.m_valid_r_reg 
       (.C(aclk),
        .CE(aclken),
        .D(s_axis_tvalid),
        .Q(m_axis_tvalid),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[10] 
       (.C(aclk),
        .CE(aclken),
        .D(D[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[11] 
       (.C(aclk),
        .CE(aclken),
        .D(D[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[12] 
       (.C(aclk),
        .CE(aclken),
        .D(D[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[13] 
       (.C(aclk),
        .CE(aclken),
        .D(D[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[14] 
       (.C(aclk),
        .CE(aclken),
        .D(D[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[15] 
       (.C(aclk),
        .CE(aclken),
        .D(D[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[16] 
       (.C(aclk),
        .CE(aclken),
        .D(D[16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[17] 
       (.C(aclk),
        .CE(aclken),
        .D(D[17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[18] 
       (.C(aclk),
        .CE(aclken),
        .D(D[18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[19] 
       (.C(aclk),
        .CE(aclken),
        .D(D[19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[1] 
       (.C(aclk),
        .CE(aclken),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[20] 
       (.C(aclk),
        .CE(aclken),
        .D(D[20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[21] 
       (.C(aclk),
        .CE(aclken),
        .D(D[21]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[22] 
       (.C(aclk),
        .CE(aclken),
        .D(D[22]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[23] 
       (.C(aclk),
        .CE(aclken),
        .D(D[23]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[24] 
       (.C(aclk),
        .CE(aclken),
        .D(D[24]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[25] 
       (.C(aclk),
        .CE(aclken),
        .D(D[25]),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[26] 
       (.C(aclk),
        .CE(aclken),
        .D(D[26]),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[27] 
       (.C(aclk),
        .CE(aclken),
        .D(D[27]),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[28] 
       (.C(aclk),
        .CE(aclken),
        .D(D[28]),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[29] 
       (.C(aclk),
        .CE(aclken),
        .D(D[29]),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[2] 
       (.C(aclk),
        .CE(aclken),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[30] 
       (.C(aclk),
        .CE(aclken),
        .D(D[30]),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[31] 
       (.C(aclk),
        .CE(aclken),
        .D(D[31]),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[32] 
       (.C(aclk),
        .CE(aclken),
        .D(D[32]),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[33] 
       (.C(aclk),
        .CE(aclken),
        .D(D[33]),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[34] 
       (.C(aclk),
        .CE(aclken),
        .D(D[34]),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[35] 
       (.C(aclk),
        .CE(aclken),
        .D(D[35]),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[36] 
       (.C(aclk),
        .CE(aclken),
        .D(D[36]),
        .Q(Q[36]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[37] 
       (.C(aclk),
        .CE(aclken),
        .D(D[37]),
        .Q(Q[37]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[38] 
       (.C(aclk),
        .CE(aclken),
        .D(D[38]),
        .Q(Q[38]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[39] 
       (.C(aclk),
        .CE(aclken),
        .D(D[39]),
        .Q(Q[39]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[3] 
       (.C(aclk),
        .CE(aclken),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[40] 
       (.C(aclk),
        .CE(aclken),
        .D(D[40]),
        .Q(Q[40]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[41] 
       (.C(aclk),
        .CE(aclken),
        .D(D[41]),
        .Q(Q[41]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[42] 
       (.C(aclk),
        .CE(aclken),
        .D(D[42]),
        .Q(Q[42]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[43] 
       (.C(aclk),
        .CE(aclken),
        .D(D[43]),
        .Q(Q[43]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[44] 
       (.C(aclk),
        .CE(aclken),
        .D(D[44]),
        .Q(Q[44]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[4] 
       (.C(aclk),
        .CE(aclken),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[5] 
       (.C(aclk),
        .CE(aclken),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[6] 
       (.C(aclk),
        .CE(aclken),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[7] 
       (.C(aclk),
        .CE(aclken),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[8] 
       (.C(aclk),
        .CE(aclken),
        .D(D[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \NO_READY.storage_data1_reg[9] 
       (.C(aclk),
        .CE(aclken),
        .D(D[9]),
        .Q(Q[9]),
        .R(1'b0));
endmodule
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
