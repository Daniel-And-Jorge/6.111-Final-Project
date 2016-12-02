// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_3,Vivado 2016.2" *)
module CharactersROM(clka, ena, addra, douta, clkb, enb, addrb, doutb);
  input clka;
  input ena;
  input [16:0]addra;
  output [0:0]douta;
  input clkb;
  input enb;
  input [16:0]addrb;
  output [0:0]doutb;
endmodule
