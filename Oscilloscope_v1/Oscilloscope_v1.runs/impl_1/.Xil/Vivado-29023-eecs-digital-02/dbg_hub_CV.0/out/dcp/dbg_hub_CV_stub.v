// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xsdbm_v1_1_3_xsdbm,Vivado 2016.2" *)
module dbg_hub_CV(sl_iport0_o, sl_oport0_i, clk);
  output [36:0]sl_iport0_o;
  input [16:0]sl_oport0_i;
  input clk;
endmodule
