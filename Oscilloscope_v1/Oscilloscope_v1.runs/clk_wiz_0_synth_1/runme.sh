#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/var/local/xilinx-local/SDK/2016.2/bin:/var/local/xilinx-local/Vivado/2016.2/ids_lite/ISE/bin/lin64:/var/local/xilinx-local/Vivado/2016.2/bin
else
  PATH=/var/local/xilinx-local/SDK/2016.2/bin:/var/local/xilinx-local/Vivado/2016.2/ids_lite/ISE/bin/lin64:/var/local/xilinx-local/Vivado/2016.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/var/local/xilinx-local/Vivado/2016.2/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/var/local/xilinx-local/Vivado/2016.2/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.runs/clk_wiz_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log clk_wiz_0.vds -m64 -mode batch -messageDb vivado.pb -notrace -source clk_wiz_0.tcl
