# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.cache/wt [current_project]
set_property parent.project_path /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
add_files -quiet /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp]
read_verilog -library xil_defaultlib {
  /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.srcs/sources_1/imports/hdl/xvga.v
  /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.srcs/sources_1/imports/hdl/XADCdemo.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.srcs/constrs_1/imports/tmp/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/d/d/ddr/6.111/6.111-Final-Project/project_xvga_disp/project_xvga_disp.srcs/constrs_1/imports/tmp/Nexys4DDR_Master.xdc]


synth_design -top XADCdemo -part xc7a100tcsg324-3


write_checkpoint -force -noxdef XADCdemo.dcp

catch { report_utilization -file XADCdemo_utilization_synth.rpt -pb XADCdemo_utilization_synth.pb }
