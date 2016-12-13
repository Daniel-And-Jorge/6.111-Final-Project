
################################################################
# This is a generated script based on design: fft_mag
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source fft_mag_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-3
}


# CHANGE DESIGN NAME HERE
set design_name fft_mag

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set frame [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 frame ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TLAST {1} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {0} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {4} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $frame
  set magnitude [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 magnitude ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {104000000} \
 ] $magnitude

  # Create ports
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list \
CONFIG.ASSOCIATED_BUSIF {frame:magnitude} \
CONFIG.FREQ_HZ {104000000} \
 ] $clk
  set event_tlast_missing [ create_bd_port -dir O -type intr event_tlast_missing ]
  set scaling [ create_bd_port -dir I -from 11 -to 0 -type data scaling ]

  # Create instance: axis_register_slice_2, and set properties
  set axis_register_slice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_2 ]
  set_property -dict [ list \
CONFIG.HAS_TLAST {1} \
CONFIG.HAS_TREADY {0} \
CONFIG.TUSER_WIDTH {12} \
 ] $axis_register_slice_2

  # Create instance: c_addsub_0, and set properties
  set c_addsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_0 ]
  set_property -dict [ list \
CONFIG.B_Value {00000000000000000000000000000000} \
CONFIG.Latency {0} \
CONFIG.Out_Width {32} \
 ] $c_addsub_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.B_Value.VALUE_SRC {DEFAULT} \
CONFIG.Out_Width.VALUE_SRC {DEFAULT} \
 ] $c_addsub_0

  # Create instance: cordic_0, and set properties
  set cordic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cordic:6.0 cordic_0 ]
  set_property -dict [ list \
CONFIG.Coarse_Rotation {false} \
CONFIG.Data_Format {UnsignedInteger} \
CONFIG.Functional_Selection {Square_Root} \
CONFIG.Input_Width {32} \
CONFIG.Output_Width {17} \
CONFIG.Round_Mode {Nearest_Even} \
CONFIG.cartesian_has_tlast {true} \
CONFIG.cartesian_has_tuser {true} \
CONFIG.cartesian_tuser_width {12} \
CONFIG.optimize_goal {Performance} \
CONFIG.out_tlast_behv {Pass_Cartesian_TLAST} \
 ] $cordic_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.optimize_goal.VALUE_SRC {DEFAULT} \
 ] $cordic_0

  # Create instance: mult_gen_0, and set properties
  set mult_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OptGoal {Speed} \
CONFIG.PortAWidth {16} \
CONFIG.PortBWidth {16} \
 ] $mult_gen_0

  # Create instance: mult_gen_1, and set properties
  set mult_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_1 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.PortAWidth {16} \
CONFIG.PortBWidth {16} \
CONFIG.Use_Custom_Output_Width {false} \
 ] $mult_gen_1

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.0 xfft_0 ]
  set_property -dict [ list \
CONFIG.butterfly_type {use_xtremedsp_slices} \
CONFIG.complex_mult_type {use_mults_resources} \
CONFIG.implementation_options {pipelined_streaming_io} \
CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {4} \
CONFIG.phase_factor_width {16} \
CONFIG.rounding_modes {convergent_rounding} \
CONFIG.scaling_options {scaled} \
CONFIG.target_clock_frequency {104} \
CONFIG.transform_length {2048} \
CONFIG.xk_index {true} \
 ] $xfft_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {1} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_2

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {32} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DIN_WIDTH {32} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_1

  # Create interface connections
  connect_bd_intf_net -intf_net S_AXIS_DATA_1 [get_bd_intf_ports frame] [get_bd_intf_pins xfft_0/S_AXIS_DATA]
  connect_bd_intf_net -intf_net cordic_0_M_AXIS_DOUT [get_bd_intf_ports magnitude] [get_bd_intf_pins cordic_0/M_AXIS_DOUT]
  connect_bd_intf_net -intf_net xfft_0_M_AXIS_DATA [get_bd_intf_pins axis_register_slice_2/S_AXIS] [get_bd_intf_pins xfft_0/M_AXIS_DATA]

  # Create port connections
  connect_bd_net -net axis_register_slice_2_m_axis_tlast [get_bd_pins axis_register_slice_2/m_axis_tlast] [get_bd_pins cordic_0/s_axis_cartesian_tlast]
  connect_bd_net -net axis_register_slice_2_m_axis_tuser [get_bd_pins axis_register_slice_2/m_axis_tuser] [get_bd_pins cordic_0/s_axis_cartesian_tuser]
  connect_bd_net -net axis_register_slice_2_m_axis_tvalid [get_bd_pins axis_register_slice_2/m_axis_tvalid] [get_bd_pins cordic_0/s_axis_cartesian_tvalid]
  connect_bd_net -net c_addsub_0_S [get_bd_pins c_addsub_0/S] [get_bd_pins cordic_0/s_axis_cartesian_tdata]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins axis_register_slice_2/aclk] [get_bd_pins cordic_0/aclk] [get_bd_pins mult_gen_0/CLK] [get_bd_pins mult_gen_1/CLK] [get_bd_pins xfft_0/aclk]
  connect_bd_net -net mult_gen_0_P [get_bd_pins c_addsub_0/A] [get_bd_pins mult_gen_0/P]
  connect_bd_net -net mult_gen_1_P [get_bd_pins c_addsub_0/B] [get_bd_pins mult_gen_1/P]
  connect_bd_net -net scaling_1 [get_bd_ports scaling] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net xfft_0_event_tlast_missing [get_bd_ports event_tlast_missing] [get_bd_pins xfft_0/event_tlast_missing]
  connect_bd_net -net xfft_0_m_axis_data_tdata [get_bd_pins xfft_0/m_axis_data_tdata] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xfft_0/s_axis_config_tdata] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axis_register_slice_2/aresetn] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xfft_0/m_axis_data_tready] [get_bd_pins xfft_0/s_axis_config_tvalid] [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins mult_gen_0/A] [get_bd_pins mult_gen_0/B] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins mult_gen_1/A] [get_bd_pins mult_gen_1/B] [get_bd_pins xlslice_1/Dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port frame -pg 1 -y 290 -defaultsOSRD
preplace port event_tlast_missing -pg 1 -y 20 -defaultsOSRD
preplace port clk -pg 1 -y 490 -defaultsOSRD
preplace port magnitude -pg 1 -y 290 -defaultsOSRD
preplace portBus scaling -pg 1 -y 390 -defaultsOSRD
preplace inst xlslice_0 -pg 1 -lvl 4 -y 40 -defaultsOSRD
preplace inst xlslice_1 -pg 1 -lvl 4 -y 130 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 3 -y 520 -defaultsOSRD
preplace inst xlconstant_1 -pg 1 -lvl 1 -y 440 -defaultsOSRD
preplace inst xlconstant_2 -pg 1 -lvl 1 -y 340 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 2 -y 390 -defaultsOSRD
preplace inst mult_gen_0 -pg 1 -lvl 5 -y 80 -defaultsOSRD
preplace inst c_addsub_0 -pg 1 -lvl 6 -y 210 -defaultsOSRD
preplace inst xfft_0 -pg 1 -lvl 3 -y 330 -defaultsOSRD
preplace inst mult_gen_1 -pg 1 -lvl 5 -y 210 -defaultsOSRD
preplace inst cordic_0 -pg 1 -lvl 7 -y 290 -defaultsOSRD
preplace inst axis_register_slice_2 -pg 1 -lvl 4 -y 270 -defaultsOSRD
preplace netloc xlconstant_1_dout 1 1 3 160 320 380 460 810
preplace netloc mult_gen_1_P 1 5 1 N
preplace netloc xlconstant_2_dout 1 1 1 NJ
preplace netloc xlslice_1_Dout 1 4 1 1100
preplace netloc scaling_1 1 0 2 NJ 390 NJ
preplace netloc S_AXIS_DATA_1 1 0 3 NJ 290 NJ 290 NJ
preplace netloc xfft_0_M_AXIS_DATA 1 3 1 N
preplace netloc xlconcat_0_dout 1 2 1 370
preplace netloc xlconstant_0_dout 1 3 1 NJ
preplace netloc clk_1 1 0 7 NJ 490 NJ 470 390 470 830 350 1140 340 NJ 340 NJ
preplace netloc xfft_0_m_axis_data_tdata 1 3 1 810
preplace netloc xfft_0_event_tlast_missing 1 3 5 NJ 180 NJ 10 NJ 10 NJ 10 NJ
preplace netloc mult_gen_0_P 1 5 1 1300
preplace netloc axis_register_slice_2_m_axis_tlast 1 4 3 N 280 NJ 280 NJ
preplace netloc axis_register_slice_2_m_axis_tvalid 1 4 3 1110 0 NJ 0 NJ
preplace netloc cordic_0_M_AXIS_DOUT 1 7 1 NJ
preplace netloc axis_register_slice_2_m_axis_tuser 1 4 3 N 300 NJ 300 NJ
preplace netloc c_addsub_0_S 1 6 1 1480
preplace netloc xlslice_0_Dout 1 4 1 1130
levelinfo -pg 1 0 90 270 600 970 1220 1390 1680 1890 -top -10 -bot 570
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


