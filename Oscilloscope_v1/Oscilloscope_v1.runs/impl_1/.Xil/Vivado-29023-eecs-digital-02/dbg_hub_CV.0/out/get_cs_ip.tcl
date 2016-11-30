#
#Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
#
set_param xicom.use_bs_reader 1
set_param project.singleFileAddWarning.threshold 0
set_param chipscope.flow 0
set part xc7a100tcsg324-3
set ip_vlnv xilinx.com:ip:xsdbm:1.1
set ip_module_name dbg_hub_CV
set params {{{PARAM_VALUE.C_CLK_INPUT_FREQ_HZ} {300000000} {PARAM_VALUE.C_ENABLE_CLK_DIVIDER} {false} {PARAM_VALUE.C_USER_SCAN_CHAIN} {1} {PARAM_VALUE.C_USE_EXT_BSCAN} {0} {PARAM_VALUE.C_XSDB_NUM_SLAVES} {1}}}
set output_xci /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.runs/impl_1/.Xil/Vivado-29023-eecs-digital-02/dbg_hub_CV.0/out/result.xci
set output_dcp /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.runs/impl_1/.Xil/Vivado-29023-eecs-digital-02/dbg_hub_CV.0/out/result.dcp
set output_dir /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.runs/impl_1/.Xil/Vivado-29023-eecs-digital-02/dbg_hub_CV.0/out
set ip_repo_paths /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.cache/ip
set ip_output_repo /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.cache/ip
set ip_cache_permissions {read write}

set oopbus_ip_repo_paths [get_param chipscope.oopbus_ip_repo_paths]

set synth_opts {}
set xdc_files {}
source {/var/local/xilinx-local/Vivado/2016.2/scripts/ip/ipxchipscope.tcl}

set failed [catch {ipx::chipscope::gen_and_synth_ip $part $ip_vlnv $ip_module_name $params $output_xci $output_dcp $output_dir $ip_repo_paths $ip_output_repo $ip_cache_permissions $oopbus_ip_repo_paths $synth_opts $xdc_files} errMessage]

if { $failed } {
  puts "Caught exception:"
  puts "$errMessage"
  exit 1
}
