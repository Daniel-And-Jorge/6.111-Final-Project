proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  reset_param project.defaultXPMLibraries 
  open_checkpoint /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.runs/impl_1/Oscilloscope_v1.dcp
  set_property webtalk.parent_dir /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.cache/wt [current_project]
  set_property parent.project_path /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.xpr [current_project]
  set_property ip_repo_paths /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.cache/ip [current_project]
  set_property ip_output_repo /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/6.111-Final-Project/Oscilloscope_v1/Oscilloscope_v1.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  write_hwdef -file Oscilloscope_v1.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Oscilloscope_v1_opt.dcp
  report_drc -file Oscilloscope_v1_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Oscilloscope_v1_placed.dcp
  report_io -file Oscilloscope_v1_io_placed.rpt
  report_utilization -file Oscilloscope_v1_utilization_placed.rpt -pb Oscilloscope_v1_utilization_placed.pb
  report_control_sets -verbose -file Oscilloscope_v1_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Oscilloscope_v1_routed.dcp
  report_drc -file Oscilloscope_v1_drc_routed.rpt -pb Oscilloscope_v1_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Oscilloscope_v1_timing_summary_routed.rpt -rpx Oscilloscope_v1_timing_summary_routed.rpx
  report_power -file Oscilloscope_v1_power_routed.rpt -pb Oscilloscope_v1_power_summary_routed.pb -rpx Oscilloscope_v1_power_routed.rpx
  report_route_status -file Oscilloscope_v1_route_status.rpt -pb Oscilloscope_v1_route_status.pb
  report_clock_utilization -file Oscilloscope_v1_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Oscilloscope_v1.mmi }
  write_bitstream -force Oscilloscope_v1.bit 
  catch { write_sysdef -hwdef Oscilloscope_v1.hwdef -bitfile Oscilloscope_v1.bit -meminfo Oscilloscope_v1.mmi -file Oscilloscope_v1.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

