
################################################################
# This is a generated script based on design: mpsoc
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
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source mpsoc_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu19eg-ffvc1760-2-e
   set_property BOARD_PART sugon:nf_card:part0:2.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name mpsoc

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
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

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

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_dwidth_converter:2.1\
xilinx.com:ip:axi_mmu:2.1\
xilinx.com:ip:axis_data_fifo:2.0\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:axis_dwidth_converter:1.1\
xilinx.com:ip:cmac_usplus:3.1\
xilinx.com:ip:ila:6.2\
user.org:user:mac_addr_reg:1.0\
xilinx.com:ip:proc_sys_reset:5.0\
user.org:user:rx_reset_cnt:1.0\
user.org:user:tx_padding:1.0\
xilinx.com:ip:zynq_ultra_ps_e:3.3\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set doce_axi_lite_slave [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 doce_axi_lite_slave ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {322265625} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $doce_axi_lite_slave

  set doce_axi_master [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 doce_axi_master ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {322265625} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {6} \
   CONFIG.MAX_BURST_LENGTH {256} \
   CONFIG.NUM_READ_OUTSTANDING {16} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {16} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $doce_axi_master

  set doce_axi_slave [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 doce_axi_slave ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {35} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {322265625} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $doce_axi_slave

  set doce_axis_rxd [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 doce_axis_rxd ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {322265625} \
   ] $doce_axis_rxd

  set doce_axis_txd [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 doce_axis_txd ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {322265625} \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $doce_axis_txd

  set gt_ref_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 gt_ref_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $gt_ref_clk

  set m_axi_doce_mac [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_doce_mac ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {322265625} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $m_axi_doce_mac


  # Create ports
  set doce_ip_addr [ create_bd_port -dir O -from 31 -to 0 doce_ip_addr ]
  set doce_mac_id [ create_bd_port -dir O -from 47 -to 0 doce_mac_id ]
  set gt_rxn_in [ create_bd_port -dir I -from 3 -to 0 gt_rxn_in ]
  set gt_rxp_in [ create_bd_port -dir I -from 3 -to 0 gt_rxp_in ]
  set gt_txn_out [ create_bd_port -dir O -from 3 -to 0 gt_txn_out ]
  set gt_txp_out [ create_bd_port -dir O -from 3 -to 0 gt_txp_out ]
  set gt_txusrclk [ create_bd_port -dir O -type clk gt_txusrclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {doce_axi_lite_slave:doce_axi_slave:doce_axis_rxd:doce_axis_txd:doce_axi_master:m_axi_doce_mac} \
   CONFIG.FREQ_HZ {322265625} \
 ] $gt_txusrclk
  set peripheral_reset [ create_bd_port -dir O -from 0 -to 0 -type rst peripheral_reset ]
  set stat_rx_status_0 [ create_bd_port -dir O stat_rx_status_0 ]

  # Create instance: axi_dwidth_converter_0, and set properties
  set axi_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dwidth_converter:2.1 axi_dwidth_converter_0 ]

  # Create instance: axi_ic_mmio, and set properties
  set axi_ic_mmio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_mmio ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
 ] $axi_ic_mmio

  # Create instance: axi_mmu_0, and set properties
  set axi_mmu_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_mmu:2.1 axi_mmu_0 ]
  set_property -dict [ list \
   CONFIG.ARUSER_WIDTH {16} \
   CONFIG.AWUSER_WIDTH {16} \
   CONFIG.D000_ADDR_WIDTH {30} \
   CONFIG.D000_BASE_ADDR {0x0000000540000000} \
   CONFIG.DATA_WIDTH {64} \
   CONFIG.ID_WIDTH {2} \
   CONFIG.SI_ADDR_WIDTH {40} \
 ] $axi_mmu_0

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.FIFO_MODE {2} \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.TDATA_NUM_BYTES {64} \
 ] $axis_data_fifo_0

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_1 ]
  set_property -dict [ list \
   CONFIG.FIFO_MODE {1} \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.TDATA_NUM_BYTES {64} \
 ] $axis_data_fifo_1

  # Create instance: cmac_const_0, and set properties
  set cmac_const_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 cmac_const_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $cmac_const_0

  # Create instance: cmac_const_1, and set properties
  set cmac_const_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 cmac_const_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $cmac_const_1

  # Create instance: cmac_const_gt_loopback_in, and set properties
  set cmac_const_gt_loopback_in [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 cmac_const_gt_loopback_in ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {12} \
 ] $cmac_const_gt_loopback_in

  # Create instance: cmac_to_doce, and set properties
  set cmac_to_doce [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 cmac_to_doce ]
  set_property -dict [ list \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {8} \
   CONFIG.S_TDATA_NUM_BYTES {64} \
 ] $cmac_to_doce

  # Create instance: cmac_usplus_0, and set properties
  set cmac_usplus_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cmac_usplus:3.1 cmac_usplus_0 ]
  set_property -dict [ list \
   CONFIG.CMAC_CAUI4_MODE {1} \
   CONFIG.CMAC_CORE_SELECT {CMACE4_X0Y1} \
   CONFIG.ENABLE_AXI_INTERFACE {0} \
   CONFIG.GT_GROUP_SELECT {X0Y12~X0Y15} \
   CONFIG.GT_REF_CLK_FREQ {156.25} \
   CONFIG.INCLUDE_STATISTICS_COUNTERS {0} \
   CONFIG.LANE10_GT_LOC {NA} \
   CONFIG.LANE1_GT_LOC {X0Y12} \
   CONFIG.LANE2_GT_LOC {X0Y13} \
   CONFIG.LANE3_GT_LOC {X0Y14} \
   CONFIG.LANE4_GT_LOC {X0Y15} \
   CONFIG.NUM_LANES {4x25} \
   CONFIG.RX_FLOW_CONTROL {0} \
   CONFIG.RX_FRAME_CRC_CHECKING {Enable FCS Stripping} \
   CONFIG.TX_FLOW_CONTROL {0} \
   CONFIG.TX_FRAME_CRC_CHECKING {Enable FCS Insertion} \
   CONFIG.USER_INTERFACE {AXIS} \
 ] $cmac_usplus_0

  # Create instance: doce_to_cmac, and set properties
  set doce_to_cmac [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 doce_to_cmac ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {64} \
 ] $doce_to_cmac

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {2} \
   CONFIG.C_ADV_TRIGGER {true} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_EN_STRG_QUAL {1} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {64} \
   CONFIG.C_PROBE0_MU_CNT {2} \
   CONFIG.C_PROBE0_WIDTH {512} \
   CONFIG.C_PROBE12_WIDTH {6} \
   CONFIG.C_PROBE13_WIDTH {14} \
   CONFIG.C_PROBE1_WIDTH {64} \
   CONFIG.C_PROBE27_WIDTH {20} \
   CONFIG.C_PROBE28_WIDTH {20} \
   CONFIG.C_PROBE29_WIDTH {3} \
   CONFIG.C_PROBE44_MU_CNT {2} \
   CONFIG.C_PROBE45_MU_CNT {2} \
   CONFIG.C_PROBE46_MU_CNT {2} \
   CONFIG.C_PROBE47_MU_CNT {2} \
   CONFIG.C_PROBE48_MU_CNT {2} \
   CONFIG.C_PROBE49_MU_CNT {2} \
   CONFIG.C_PROBE50_MU_CNT {2} \
   CONFIG.C_PROBE51_MU_CNT {2} \
   CONFIG.C_PROBE52_MU_CNT {2} \
   CONFIG.C_PROBE53_MU_CNT {2} \
   CONFIG.C_PROBE54_MU_CNT {2} \
   CONFIG.C_PROBE55_MU_CNT {2} \
   CONFIG.C_PROBE56_MU_CNT {2} \
   CONFIG.C_PROBE57_MU_CNT {2} \
   CONFIG.C_PROBE58_MU_CNT {2} \
   CONFIG.C_PROBE58_WIDTH {3} \
   CONFIG.C_PROBE59_MU_CNT {2} \
   CONFIG.C_PROBE59_WIDTH {2} \
   CONFIG.C_PROBE60_MU_CNT {2} \
   CONFIG.C_PROBE60_WIDTH {2} \
   CONFIG.C_PROBE61_MU_CNT {2} \
   CONFIG.C_PROBE61_WIDTH {2} \
   CONFIG.C_PROBE62_MU_CNT {2} \
   CONFIG.C_PROBE62_WIDTH {2} \
   CONFIG.C_PROBE63_MU_CNT {2} \
   CONFIG.C_PROBE63_WIDTH {2} \
   CONFIG.C_PROBE64_MU_CNT {2} \
   CONFIG.C_PROBE65_MU_CNT {2} \
   CONFIG.C_PROBE66_MU_CNT {2} \
   CONFIG.C_PROBE67_MU_CNT {2} \
   CONFIG.C_PROBE68_MU_CNT {2} \
   CONFIG.C_PROBE69_MU_CNT {2} \
   CONFIG.C_PROBE6_WIDTH {512} \
   CONFIG.C_PROBE70_MU_CNT {2} \
   CONFIG.C_PROBE71_MU_CNT {2} \
   CONFIG.C_PROBE72_MU_CNT {2} \
   CONFIG.C_PROBE73_MU_CNT {2} \
   CONFIG.C_PROBE74_MU_CNT {2} \
   CONFIG.C_PROBE75_MU_CNT {2} \
   CONFIG.C_PROBE76_MU_CNT {2} \
   CONFIG.C_PROBE77_MU_CNT {2} \
   CONFIG.C_PROBE78_MU_CNT {2} \
   CONFIG.C_PROBE79_MU_CNT {2} \
   CONFIG.C_PROBE7_WIDTH {64} \
   CONFIG.C_PROBE80_MU_CNT {2} \
   CONFIG.C_PROBE81_MU_CNT {2} \
   CONFIG.C_PROBE82_MU_CNT {2} \
   CONFIG.C_PROBE83_MU_CNT {2} \
   CONFIG.C_PROBE84_MU_CNT {2} \
   CONFIG.C_PROBE85_MU_CNT {2} \
   CONFIG.C_PROBE86_MU_CNT {2} \
   CONFIG.C_PROBE87_MU_CNT {2} \
   CONFIG.C_PROBE88_MU_CNT {2} \
   CONFIG.C_PROBE89_MU_CNT {2} \
   CONFIG.C_PROBE90_MU_CNT {2} \
   CONFIG.C_PROBE91_MU_CNT {2} \
   CONFIG.C_PROBE92_MU_CNT {2} \
   CONFIG.C_PROBE93_MU_CNT {2} \
   CONFIG.C_PROBE94_MU_CNT {2} \
   CONFIG.C_PROBE95_MU_CNT {2} \
   CONFIG.C_PROBE96_MU_CNT {2} \
   CONFIG.C_PROBE97_MU_CNT {2} \
   CONFIG.C_PROBE98_MU_CNT {2} \
   CONFIG.C_PROBE99_MU_CNT {2} \
 ] $ila_0

  # Create instance: ila_1, and set properties
  set ila_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_1 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {2} \
   CONFIG.C_ADV_TRIGGER {true} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_EN_STRG_QUAL {1} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {64} \
   CONFIG.C_PROBE0_MU_CNT {2} \
   CONFIG.C_PROBE0_WIDTH {2} \
   CONFIG.C_PROBE10_MU_CNT {2} \
   CONFIG.C_PROBE10_WIDTH {2} \
   CONFIG.C_PROBE11_MU_CNT {2} \
   CONFIG.C_PROBE11_WIDTH {2} \
   CONFIG.C_PROBE12_MU_CNT {2} \
   CONFIG.C_PROBE12_WIDTH {2} \
   CONFIG.C_PROBE13_MU_CNT {2} \
   CONFIG.C_PROBE13_WIDTH {2} \
   CONFIG.C_PROBE14_MU_CNT {2} \
   CONFIG.C_PROBE14_WIDTH {2} \
   CONFIG.C_PROBE15_MU_CNT {2} \
   CONFIG.C_PROBE15_WIDTH {5} \
   CONFIG.C_PROBE16_MU_CNT {2} \
   CONFIG.C_PROBE17_MU_CNT {2} \
   CONFIG.C_PROBE18_MU_CNT {2} \
   CONFIG.C_PROBE19_MU_CNT {2} \
   CONFIG.C_PROBE1_MU_CNT {2} \
   CONFIG.C_PROBE1_WIDTH {2} \
   CONFIG.C_PROBE20_MU_CNT {2} \
   CONFIG.C_PROBE21_MU_CNT {2} \
   CONFIG.C_PROBE22_MU_CNT {2} \
   CONFIG.C_PROBE23_MU_CNT {2} \
   CONFIG.C_PROBE24_MU_CNT {2} \
   CONFIG.C_PROBE25_MU_CNT {2} \
   CONFIG.C_PROBE26_MU_CNT {2} \
   CONFIG.C_PROBE27_MU_CNT {2} \
   CONFIG.C_PROBE28_MU_CNT {2} \
   CONFIG.C_PROBE29_MU_CNT {2} \
   CONFIG.C_PROBE2_MU_CNT {2} \
   CONFIG.C_PROBE2_WIDTH {2} \
   CONFIG.C_PROBE30_MU_CNT {2} \
   CONFIG.C_PROBE31_MU_CNT {2} \
   CONFIG.C_PROBE32_MU_CNT {2} \
   CONFIG.C_PROBE33_MU_CNT {2} \
   CONFIG.C_PROBE34_MU_CNT {2} \
   CONFIG.C_PROBE35_MU_CNT {2} \
   CONFIG.C_PROBE36_MU_CNT {2} \
   CONFIG.C_PROBE37_MU_CNT {2} \
   CONFIG.C_PROBE38_MU_CNT {2} \
   CONFIG.C_PROBE39_MU_CNT {2} \
   CONFIG.C_PROBE39_WIDTH {20} \
   CONFIG.C_PROBE3_MU_CNT {2} \
   CONFIG.C_PROBE3_WIDTH {2} \
   CONFIG.C_PROBE40_MU_CNT {2} \
   CONFIG.C_PROBE40_WIDTH {20} \
   CONFIG.C_PROBE41_MU_CNT {2} \
   CONFIG.C_PROBE41_WIDTH {20} \
   CONFIG.C_PROBE42_MU_CNT {2} \
   CONFIG.C_PROBE43_MU_CNT {2} \
   CONFIG.C_PROBE44_MU_CNT {2} \
   CONFIG.C_PROBE45_MU_CNT {2} \
   CONFIG.C_PROBE46_MU_CNT {2} \
   CONFIG.C_PROBE47_MU_CNT {2} \
   CONFIG.C_PROBE47_WIDTH {3} \
   CONFIG.C_PROBE48_MU_CNT {2} \
   CONFIG.C_PROBE48_WIDTH {20} \
   CONFIG.C_PROBE49_MU_CNT {2} \
   CONFIG.C_PROBE49_WIDTH {5} \
   CONFIG.C_PROBE4_MU_CNT {2} \
   CONFIG.C_PROBE4_WIDTH {2} \
   CONFIG.C_PROBE50_MU_CNT {2} \
   CONFIG.C_PROBE50_WIDTH {5} \
   CONFIG.C_PROBE51_MU_CNT {2} \
   CONFIG.C_PROBE51_WIDTH {5} \
   CONFIG.C_PROBE52_MU_CNT {2} \
   CONFIG.C_PROBE52_WIDTH {5} \
   CONFIG.C_PROBE53_MU_CNT {2} \
   CONFIG.C_PROBE53_WIDTH {5} \
   CONFIG.C_PROBE54_MU_CNT {2} \
   CONFIG.C_PROBE54_WIDTH {5} \
   CONFIG.C_PROBE55_MU_CNT {2} \
   CONFIG.C_PROBE55_WIDTH {5} \
   CONFIG.C_PROBE56_MU_CNT {2} \
   CONFIG.C_PROBE56_WIDTH {5} \
   CONFIG.C_PROBE57_MU_CNT {2} \
   CONFIG.C_PROBE57_WIDTH {5} \
   CONFIG.C_PROBE58_MU_CNT {2} \
   CONFIG.C_PROBE58_WIDTH {5} \
   CONFIG.C_PROBE59_MU_CNT {2} \
   CONFIG.C_PROBE59_WIDTH {5} \
   CONFIG.C_PROBE5_MU_CNT {2} \
   CONFIG.C_PROBE5_WIDTH {2} \
   CONFIG.C_PROBE60_MU_CNT {2} \
   CONFIG.C_PROBE60_WIDTH {5} \
   CONFIG.C_PROBE61_MU_CNT {2} \
   CONFIG.C_PROBE61_WIDTH {5} \
   CONFIG.C_PROBE62_MU_CNT {2} \
   CONFIG.C_PROBE62_WIDTH {5} \
   CONFIG.C_PROBE63_MU_CNT {2} \
   CONFIG.C_PROBE63_WIDTH {5} \
   CONFIG.C_PROBE6_MU_CNT {2} \
   CONFIG.C_PROBE6_WIDTH {2} \
   CONFIG.C_PROBE7_MU_CNT {2} \
   CONFIG.C_PROBE7_WIDTH {2} \
   CONFIG.C_PROBE8_MU_CNT {2} \
   CONFIG.C_PROBE8_WIDTH {2} \
   CONFIG.C_PROBE9_MU_CNT {2} \
   CONFIG.C_PROBE9_WIDTH {2} \
 ] $ila_1

  # Create instance: ila_2, and set properties
  set ila_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_2 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {2} \
   CONFIG.C_ADV_TRIGGER {true} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_EN_STRG_QUAL {1} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {18} \
   CONFIG.C_PROBE0_MU_CNT {2} \
   CONFIG.C_PROBE0_WIDTH {5} \
   CONFIG.C_PROBE10_MU_CNT {2} \
   CONFIG.C_PROBE10_WIDTH {7} \
   CONFIG.C_PROBE11_MU_CNT {2} \
   CONFIG.C_PROBE11_WIDTH {14} \
   CONFIG.C_PROBE12_MU_CNT {2} \
   CONFIG.C_PROBE13_MU_CNT {2} \
   CONFIG.C_PROBE13_WIDTH {3} \
   CONFIG.C_PROBE14_MU_CNT {2} \
   CONFIG.C_PROBE15_MU_CNT {2} \
   CONFIG.C_PROBE15_WIDTH {3} \
   CONFIG.C_PROBE16_MU_CNT {2} \
   CONFIG.C_PROBE17_MU_CNT {2} \
   CONFIG.C_PROBE1_MU_CNT {2} \
   CONFIG.C_PROBE1_WIDTH {5} \
   CONFIG.C_PROBE2_MU_CNT {2} \
   CONFIG.C_PROBE2_WIDTH {5} \
   CONFIG.C_PROBE3_MU_CNT {2} \
   CONFIG.C_PROBE3_WIDTH {5} \
   CONFIG.C_PROBE4_MU_CNT {2} \
   CONFIG.C_PROBE5_MU_CNT {2} \
   CONFIG.C_PROBE6_MU_CNT {2} \
   CONFIG.C_PROBE6_WIDTH {3} \
   CONFIG.C_PROBE7_MU_CNT {2} \
   CONFIG.C_PROBE7_WIDTH {20} \
   CONFIG.C_PROBE8_MU_CNT {2} \
   CONFIG.C_PROBE8_WIDTH {3} \
   CONFIG.C_PROBE9_MU_CNT {2} \
 ] $ila_2

  # Create instance: ila_3, and set properties
  set ila_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_3 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {2} \
   CONFIG.C_ADV_TRIGGER {true} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_EN_STRG_QUAL {1} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {18} \
   CONFIG.C_PROBE0_MU_CNT {2} \
   CONFIG.C_PROBE10_MU_CNT {2} \
   CONFIG.C_PROBE11_MU_CNT {2} \
   CONFIG.C_PROBE11_WIDTH {6} \
   CONFIG.C_PROBE12_MU_CNT {2} \
   CONFIG.C_PROBE12_WIDTH {128} \
   CONFIG.C_PROBE13_MU_CNT {2} \
   CONFIG.C_PROBE13_WIDTH {2} \
   CONFIG.C_PROBE14_MU_CNT {2} \
   CONFIG.C_PROBE15_MU_CNT {2} \
   CONFIG.C_PROBE16_MU_CNT {2} \
   CONFIG.C_PROBE17_MU_CNT {2} \
   CONFIG.C_PROBE17_WIDTH {4} \
   CONFIG.C_PROBE18_MU_CNT {2} \
   CONFIG.C_PROBE19_MU_CNT {2} \
   CONFIG.C_PROBE1_MU_CNT {2} \
   CONFIG.C_PROBE1_WIDTH {6} \
   CONFIG.C_PROBE20_MU_CNT {2} \
   CONFIG.C_PROBE21_MU_CNT {2} \
   CONFIG.C_PROBE22_MU_CNT {2} \
   CONFIG.C_PROBE23_MU_CNT {2} \
   CONFIG.C_PROBE24_MU_CNT {2} \
   CONFIG.C_PROBE25_MU_CNT {2} \
   CONFIG.C_PROBE26_MU_CNT {2} \
   CONFIG.C_PROBE27_MU_CNT {2} \
   CONFIG.C_PROBE28_MU_CNT {2} \
   CONFIG.C_PROBE29_MU_CNT {2} \
   CONFIG.C_PROBE2_MU_CNT {2} \
   CONFIG.C_PROBE2_WIDTH {49} \
   CONFIG.C_PROBE30_MU_CNT {2} \
   CONFIG.C_PROBE31_MU_CNT {2} \
   CONFIG.C_PROBE32_MU_CNT {2} \
   CONFIG.C_PROBE33_MU_CNT {2} \
   CONFIG.C_PROBE34_MU_CNT {2} \
   CONFIG.C_PROBE35_MU_CNT {2} \
   CONFIG.C_PROBE36_MU_CNT {2} \
   CONFIG.C_PROBE37_MU_CNT {2} \
   CONFIG.C_PROBE38_MU_CNT {2} \
   CONFIG.C_PROBE39_MU_CNT {2} \
   CONFIG.C_PROBE3_MU_CNT {2} \
   CONFIG.C_PROBE3_WIDTH {8} \
   CONFIG.C_PROBE40_MU_CNT {2} \
   CONFIG.C_PROBE41_MU_CNT {2} \
   CONFIG.C_PROBE42_MU_CNT {2} \
   CONFIG.C_PROBE43_MU_CNT {2} \
   CONFIG.C_PROBE4_MU_CNT {2} \
   CONFIG.C_PROBE4_WIDTH {3} \
   CONFIG.C_PROBE5_MU_CNT {2} \
   CONFIG.C_PROBE5_WIDTH {2} \
   CONFIG.C_PROBE6_MU_CNT {2} \
   CONFIG.C_PROBE7_MU_CNT {2} \
   CONFIG.C_PROBE7_WIDTH {4} \
   CONFIG.C_PROBE8_MU_CNT {2} \
   CONFIG.C_PROBE8_WIDTH {3} \
   CONFIG.C_PROBE9_MU_CNT {2} \
 ] $ila_3

  # Create instance: ila_4, and set properties
  set ila_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_4 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {2} \
   CONFIG.C_ADV_TRIGGER {true} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_EN_STRG_QUAL {1} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {18} \
   CONFIG.C_PROBE0_MU_CNT {2} \
   CONFIG.C_PROBE0_WIDTH {16} \
   CONFIG.C_PROBE10_MU_CNT {2} \
   CONFIG.C_PROBE11_MU_CNT {2} \
   CONFIG.C_PROBE11_WIDTH {16} \
   CONFIG.C_PROBE12_MU_CNT {2} \
   CONFIG.C_PROBE12_WIDTH {128} \
   CONFIG.C_PROBE13_MU_CNT {2} \
   CONFIG.C_PROBE13_WIDTH {2} \
   CONFIG.C_PROBE14_MU_CNT {2} \
   CONFIG.C_PROBE15_MU_CNT {2} \
   CONFIG.C_PROBE16_MU_CNT {2} \
   CONFIG.C_PROBE17_MU_CNT {2} \
   CONFIG.C_PROBE17_WIDTH {4} \
   CONFIG.C_PROBE1_MU_CNT {2} \
   CONFIG.C_PROBE1_WIDTH {40} \
   CONFIG.C_PROBE2_MU_CNT {2} \
   CONFIG.C_PROBE2_WIDTH {8} \
   CONFIG.C_PROBE3_MU_CNT {2} \
   CONFIG.C_PROBE3_WIDTH {3} \
   CONFIG.C_PROBE4_MU_CNT {2} \
   CONFIG.C_PROBE4_WIDTH {2} \
   CONFIG.C_PROBE5_MU_CNT {2} \
   CONFIG.C_PROBE6_MU_CNT {2} \
   CONFIG.C_PROBE6_WIDTH {4} \
   CONFIG.C_PROBE7_MU_CNT {2} \
   CONFIG.C_PROBE7_WIDTH {3} \
   CONFIG.C_PROBE8_MU_CNT {2} \
   CONFIG.C_PROBE9_MU_CNT {2} \
   CONFIG.C_PROBE9_WIDTH {16} \
 ] $ila_4

  # Create instance: mac_addr_reg_0, and set properties
  set mac_addr_reg_0 [ create_bd_cell -type ip -vlnv user.org:user:mac_addr_reg:1.0 mac_addr_reg_0 ]

  # Create instance: maxi_ic_doce, and set properties
  set maxi_ic_doce [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 maxi_ic_doce ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
   CONFIG.S00_HAS_DATA_FIFO {1} \
 ] $maxi_ic_doce

  # Create instance: pl_clk_sys_reset, and set properties
  set pl_clk_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 pl_clk_sys_reset ]

  # Create instance: rx_reset, and set properties
  set rx_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rx_reset ]

  # Create instance: rx_reset_cnt_0, and set properties
  set rx_reset_cnt_0 [ create_bd_cell -type ip -vlnv user.org:user:rx_reset_cnt:1.0 rx_reset_cnt_0 ]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /rx_reset_cnt_0/gtwiz_rx_reset]

  # Create instance: saxi_ic_doce, and set properties
  set saxi_ic_doce [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 saxi_ic_doce ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
   CONFIG.S00_HAS_DATA_FIFO {1} \
 ] $saxi_ic_doce

  # Create instance: tx_padding_0, and set properties
  set tx_padding_0 [ create_bd_cell -type ip -vlnv user.org:user:tx_padding:1.0 tx_padding_0 ]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /tx_padding_0/reset]

  # Create instance: tx_reset, and set properties
  set tx_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 tx_reset ]

  # Create instance: zynq_mpsoc, and set properties
  set zynq_mpsoc [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_mpsoc ]
  set_property -dict [ list \
   CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS33} \
   CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS33} \
   CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS33} \
   CONFIG.PSU_DDR_RAM_HIGHADDR {0x3FFFFFFFF} \
   CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x800000000} \
   CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
   CONFIG.PSU_DYNAMIC_DDR_CONFIG_EN {0} \
   CONFIG.PSU_MIO_0_DIRECTION {out} \
   CONFIG.PSU_MIO_0_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_0_POLARITY {Default} \
   CONFIG.PSU_MIO_10_DIRECTION {inout} \
   CONFIG.PSU_MIO_10_POLARITY {Default} \
   CONFIG.PSU_MIO_11_DIRECTION {inout} \
   CONFIG.PSU_MIO_11_POLARITY {Default} \
   CONFIG.PSU_MIO_12_DIRECTION {out} \
   CONFIG.PSU_MIO_12_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_12_POLARITY {Default} \
   CONFIG.PSU_MIO_13_DIRECTION {inout} \
   CONFIG.PSU_MIO_13_POLARITY {Default} \
   CONFIG.PSU_MIO_14_DIRECTION {inout} \
   CONFIG.PSU_MIO_14_POLARITY {Default} \
   CONFIG.PSU_MIO_15_DIRECTION {inout} \
   CONFIG.PSU_MIO_15_POLARITY {Default} \
   CONFIG.PSU_MIO_16_DIRECTION {inout} \
   CONFIG.PSU_MIO_16_POLARITY {Default} \
   CONFIG.PSU_MIO_1_DIRECTION {inout} \
   CONFIG.PSU_MIO_1_POLARITY {Default} \
   CONFIG.PSU_MIO_21_DIRECTION {inout} \
   CONFIG.PSU_MIO_21_POLARITY {Default} \
   CONFIG.PSU_MIO_22_DIRECTION {out} \
   CONFIG.PSU_MIO_22_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_22_POLARITY {Default} \
   CONFIG.PSU_MIO_26_DIRECTION {out} \
   CONFIG.PSU_MIO_26_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_26_POLARITY {Default} \
   CONFIG.PSU_MIO_27_DIRECTION {out} \
   CONFIG.PSU_MIO_27_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_27_POLARITY {Default} \
   CONFIG.PSU_MIO_28_DIRECTION {out} \
   CONFIG.PSU_MIO_28_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_28_POLARITY {Default} \
   CONFIG.PSU_MIO_29_DIRECTION {out} \
   CONFIG.PSU_MIO_29_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_29_POLARITY {Default} \
   CONFIG.PSU_MIO_2_DIRECTION {inout} \
   CONFIG.PSU_MIO_2_POLARITY {Default} \
   CONFIG.PSU_MIO_30_DIRECTION {out} \
   CONFIG.PSU_MIO_30_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_30_POLARITY {Default} \
   CONFIG.PSU_MIO_31_DIRECTION {out} \
   CONFIG.PSU_MIO_31_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_31_POLARITY {Default} \
   CONFIG.PSU_MIO_32_DIRECTION {in} \
   CONFIG.PSU_MIO_32_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_32_POLARITY {Default} \
   CONFIG.PSU_MIO_32_SLEW {fast} \
   CONFIG.PSU_MIO_33_DIRECTION {in} \
   CONFIG.PSU_MIO_33_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_33_POLARITY {Default} \
   CONFIG.PSU_MIO_33_SLEW {fast} \
   CONFIG.PSU_MIO_34_DIRECTION {in} \
   CONFIG.PSU_MIO_34_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_34_POLARITY {Default} \
   CONFIG.PSU_MIO_34_SLEW {fast} \
   CONFIG.PSU_MIO_35_DIRECTION {in} \
   CONFIG.PSU_MIO_35_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_35_POLARITY {Default} \
   CONFIG.PSU_MIO_35_SLEW {fast} \
   CONFIG.PSU_MIO_36_DIRECTION {in} \
   CONFIG.PSU_MIO_36_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_36_POLARITY {Default} \
   CONFIG.PSU_MIO_36_SLEW {fast} \
   CONFIG.PSU_MIO_37_DIRECTION {in} \
   CONFIG.PSU_MIO_37_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_37_POLARITY {Default} \
   CONFIG.PSU_MIO_37_SLEW {fast} \
   CONFIG.PSU_MIO_3_DIRECTION {inout} \
   CONFIG.PSU_MIO_3_POLARITY {Default} \
   CONFIG.PSU_MIO_46_DIRECTION {in} \
   CONFIG.PSU_MIO_46_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_46_POLARITY {Default} \
   CONFIG.PSU_MIO_46_SLEW {fast} \
   CONFIG.PSU_MIO_47_DIRECTION {out} \
   CONFIG.PSU_MIO_47_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_47_POLARITY {Default} \
   CONFIG.PSU_MIO_4_DIRECTION {inout} \
   CONFIG.PSU_MIO_4_POLARITY {Default} \
   CONFIG.PSU_MIO_5_DIRECTION {out} \
   CONFIG.PSU_MIO_5_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_5_POLARITY {Default} \
   CONFIG.PSU_MIO_76_DIRECTION {out} \
   CONFIG.PSU_MIO_76_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_76_POLARITY {Default} \
   CONFIG.PSU_MIO_77_DIRECTION {inout} \
   CONFIG.PSU_MIO_77_POLARITY {Default} \
   CONFIG.PSU_MIO_7_DIRECTION {out} \
   CONFIG.PSU_MIO_7_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_7_POLARITY {Default} \
   CONFIG.PSU_MIO_8_DIRECTION {inout} \
   CONFIG.PSU_MIO_8_POLARITY {Default} \
   CONFIG.PSU_MIO_9_DIRECTION {inout} \
   CONFIG.PSU_MIO_9_POLARITY {Default} \
   CONFIG.PSU_MIO_TREE_PERIPHERALS {Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash##Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#SD 0#SD 0#SD 0#SD 0#####SD 0#SD 0####Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#Gem 0#########UART 0#UART 0#############################MDIO 0#MDIO 0} \
   CONFIG.PSU_MIO_TREE_SIGNALS {sclk_out#miso_mo1#mo2#mo3#mosi_mi0#n_ss_out##n_ss_out_upper#mo_upper[0]#mo_upper[1]#mo_upper[2]#mo_upper[3]#sclk_out_upper#sdio0_data_out[0]#sdio0_data_out[1]#sdio0_data_out[2]#sdio0_data_out[3]#####sdio0_cmd_out#sdio0_clk_out####rgmii_tx_clk#rgmii_txd[0]#rgmii_txd[1]#rgmii_txd[2]#rgmii_txd[3]#rgmii_tx_ctl#rgmii_rx_clk#rgmii_rxd[0]#rgmii_rxd[1]#rgmii_rxd[2]#rgmii_rxd[3]#rgmii_rx_ctl#########rxd#txd#############################gem0_mdc#gem0_mdio_out} \
   CONFIG.PSU_SD0_INTERNAL_BUS_WIDTH {4} \
   CONFIG.PSU__ACT_DDR_FREQ_MHZ {800.000000} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1325.000000} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {53} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__APLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {400.000000} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {1067} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {600.000000} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {48} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__DPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {63} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {10} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {600.000000} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__ACT_FREQMHZ {600.000000} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {525.000000} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {42} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {500.000000} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {50.000000} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {30} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {500.000000} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {1500.000000} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__ACT_FREQMHZ {125.000000} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__ACT_FREQMHZ {125.000000} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {60} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__IOPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {500.000000} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {187.500000} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {125.000000} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {10} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__ACT_FREQMHZ {300.000000} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {40} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__RPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__ACT_FREQMHZ {200.000000} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {50.000000} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {15} \
   CONFIG.PSU__DDRC__CL {11} \
   CONFIG.PSU__DDRC__COMPONENTS {UDIMM} \
   CONFIG.PSU__DDRC__CWL {11} \
   CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits} \
   CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {1} \
   CONFIG.PSU__DDRC__RANK_ADDR_COUNT {1} \
   CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16} \
   CONFIG.PSU__DDRC__SB_TARGET {15-15-15} \
   CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2133P} \
   CONFIG.PSU__DDRC__T_FAW {21} \
   CONFIG.PSU__DDRC__T_RAS_MIN {33} \
   CONFIG.PSU__DDRC__T_RC {46.5} \
   CONFIG.PSU__DDRC__T_RCD {15} \
   CONFIG.PSU__DDRC__T_RP {15} \
   CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {1} \
   CONFIG.PSU__DDR__INTERFACE__FREQMHZ {533.500} \
   CONFIG.PSU__DLL__ISUSED {1} \
   CONFIG.PSU__ENET0__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET0__GRP_MDIO__ENABLE {1} \
   CONFIG.PSU__ENET0__GRP_MDIO__IO {MIO 76 .. 77} \
   CONFIG.PSU__ENET0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__ENET0__PERIPHERAL__IO {MIO 26 .. 37} \
   CONFIG.PSU__ENET0__PTP__ENABLE {0} \
   CONFIG.PSU__ENET0__TSU__ENABLE {0} \
   CONFIG.PSU__ENET1__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET1__GRP_MDIO__ENABLE {0} \
   CONFIG.PSU__ENET1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__ENET1__PERIPHERAL__IO {GT Lane1} \
   CONFIG.PSU__ENET1__PTP__ENABLE {0} \
   CONFIG.PSU__ENET1__TSU__ENABLE {0} \
   CONFIG.PSU__EXPAND__LOWER_LPS_SLAVES {1} \
   CONFIG.PSU__FPGA_PL1_ENABLE {1} \
   CONFIG.PSU__FPGA_PL2_ENABLE {1} \
   CONFIG.PSU__GEM0_COHERENCY {0} \
   CONFIG.PSU__GEM0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM1_COHERENCY {0} \
   CONFIG.PSU__GEM1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM1__REF_CLK_FREQ {125} \
   CONFIG.PSU__GEM1__REF_CLK_SEL {Ref Clk1} \
   CONFIG.PSU__GEM__TSU__ENABLE {0} \
   CONFIG.PSU__HIGH_ADDRESS__ENABLE {1} \
   CONFIG.PSU__MAXIGP1__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP2__DATA_WIDTH {32} \
   CONFIG.PSU__OVERRIDE__BASIC_CLOCK {0} \
   CONFIG.PSU__PL_CLK1_BUF {TRUE} \
   CONFIG.PSU__PL_CLK2_BUF {TRUE} \
   CONFIG.PSU__PROTECTION__MASTERS {USB1:NonSecure;0|USB0:NonSecure;0|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;0|S_AXI_HP3_FPD:NA;0|S_AXI_HP2_FPD:NA;0|S_AXI_HP1_FPD:NA;0|S_AXI_HP0_FPD:NA;1|S_AXI_ACP:NA;0|S_AXI_ACE:NA;0|SD1:NonSecure;0|SD0:NonSecure;1|SATA1:NonSecure;0|SATA0:NonSecure;0|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;1|PMU:NA;1|PCIe:NonSecure;0|NAND:NonSecure;0|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;0|GEM2:NonSecure;0|GEM1:NonSecure;1|GEM0:NonSecure;1|FDMA:NonSecure;1|DP:NonSecure;0|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1} \
   CONFIG.PSU__PROTECTION__SLAVES { \
     LPD;USB3_1_XHCI;FE300000;FE3FFFFF;0|LPD;USB3_1;FF9E0000;FF9EFFFF;0|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;0|LPD;USB3_0;FF9D0000;FF9DFFFF;0|LPD;UART1;FF010000;FF01FFFF;0|LPD;UART0;FF000000;FF00FFFF;1|LPD;TTC3;FF140000;FF14FFFF;0|LPD;TTC2;FF130000;FF13FFFF;0|LPD;TTC1;FF120000;FF12FFFF;0|LPD;TTC0;FF110000;FF11FFFF;0|FPD;SWDT1;FD4D0000;FD4DFFFF;0|LPD;SWDT0;FF150000;FF15FFFF;0|LPD;SPI1;FF050000;FF05FFFF;0|LPD;SPI0;FF040000;FF04FFFF;0|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;0|LPD;SD0;FF160000;FF16FFFF;1|FPD;SATA;FD0C0000;FD0CFFFF;0|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;1|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;0|FPD;PCIE_LOW;E0000000;EFFFFFFF;0|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;0|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;0|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;0|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;0|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;0|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;0|LPD;I2C0;FF020000;FF02FFFF;0|FPD;GPU;FD4B0000;FD4BFFFF;1|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;0|LPD;GEM2;FF0D0000;FF0DFFFF;0|LPD;GEM1;FF0C0000;FF0CFFFF;1|LPD;GEM0;FF0B0000;FF0BFFFF;1|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display Port;FD4A0000;FD4AFFFF;0|FPD;DPDMA;FD4C0000;FD4CFFFF;0|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;B7FFFFFFF;1|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;1|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;0|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1 \
   } \
   CONFIG.PSU__PSS_REF_CLK__FREQMHZ {50} \
   CONFIG.PSU__QSPI_COHERENCY {0} \
   CONFIG.PSU__QSPI_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {0} \
   CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
   CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__QSPI__PERIPHERAL__IO {MIO 0 .. 12} \
   CONFIG.PSU__QSPI__PERIPHERAL__MODE {Dual Parallel} \
   CONFIG.PSU__SAXIGP2__DATA_WIDTH {128} \
   CONFIG.PSU__SD0_COHERENCY {0} \
   CONFIG.PSU__SD0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__SD0__DATA_TRANSFER_MODE {4Bit} \
   CONFIG.PSU__SD0__GRP_CD__ENABLE {0} \
   CONFIG.PSU__SD0__GRP_POW__ENABLE {0} \
   CONFIG.PSU__SD0__GRP_WP__ENABLE {0} \
   CONFIG.PSU__SD0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SD0__PERIPHERAL__IO {MIO 13 .. 16 21 22} \
   CONFIG.PSU__SD0__RESET__ENABLE {0} \
   CONFIG.PSU__SD0__SLOT_TYPE {SD 2.0} \
   CONFIG.PSU__TSU__BUFG_PORT_PAIR {0} \
   CONFIG.PSU__UART0__BAUD_RATE {115200} \
   CONFIG.PSU__UART0__MODEM__ENABLE {0} \
   CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__UART0__PERIPHERAL__IO {MIO 46 .. 47} \
   CONFIG.PSU__USE__IRQ0 {1} \
   CONFIG.PSU__USE__M_AXI_GP0 {0} \
   CONFIG.PSU__USE__M_AXI_GP1 {1} \
   CONFIG.PSU__USE__M_AXI_GP2 {1} \
   CONFIG.PSU__USE__S_AXI_GP2 {1} \
   CONFIG.SUBPRESET1 {Custom} \
 ] $zynq_mpsoc

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_0_1 [get_bd_intf_ports doce_axi_master] [get_bd_intf_pins maxi_ic_doce/S00_AXI]
  connect_bd_intf_net -intf_net S_AXIS_0_1 [get_bd_intf_ports doce_axis_txd] [get_bd_intf_pins doce_to_cmac/S_AXIS]
  connect_bd_intf_net -intf_net axi_dwidth_converter_0_M_AXI [get_bd_intf_ports doce_axi_slave] [get_bd_intf_pins axi_dwidth_converter_0/M_AXI]
  connect_bd_intf_net -intf_net axi_ic_mmio_M00_AXI [get_bd_intf_ports doce_axi_lite_slave] [get_bd_intf_pins axi_ic_mmio/M00_AXI]
  connect_bd_intf_net -intf_net axi_mmu_0_M_AXI [get_bd_intf_pins axi_dwidth_converter_0/S_AXI] [get_bd_intf_pins axi_mmu_0/M_AXI]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins tx_padding_0/deoi_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_pins axis_data_fifo_1/M_AXIS] [get_bd_intf_pins cmac_to_doce/S_AXIS]
  connect_bd_intf_net -intf_net cmac_to_doce_M_AXIS [get_bd_intf_ports doce_axis_rxd] [get_bd_intf_pins cmac_to_doce/M_AXIS]
  connect_bd_intf_net -intf_net doce_to_cmac_M_AXIS [get_bd_intf_pins axis_data_fifo_0/S_AXIS] [get_bd_intf_pins doce_to_cmac/M_AXIS]
  connect_bd_intf_net -intf_net gt_ref_clk_0_1 [get_bd_intf_ports gt_ref_clk] [get_bd_intf_pins cmac_usplus_0/gt_ref_clk]
  connect_bd_intf_net -intf_net m_axi_doce_mac_1 [get_bd_intf_ports m_axi_doce_mac] [get_bd_intf_pins mac_addr_reg_0/s_axi_lite]
  connect_bd_intf_net -intf_net maxi_ic_doce_M00_AXI [get_bd_intf_pins maxi_ic_doce/M00_AXI] [get_bd_intf_pins zynq_mpsoc/S_AXI_HP0_FPD]
  connect_bd_intf_net -intf_net saxi_ic_doce_M00_AXI [get_bd_intf_pins axi_mmu_0/S_AXI] [get_bd_intf_pins saxi_ic_doce/M00_AXI]
  connect_bd_intf_net -intf_net zynq_mpsoc_M_AXI_HPM0_LPD [get_bd_intf_pins axi_ic_mmio/S00_AXI] [get_bd_intf_pins zynq_mpsoc/M_AXI_HPM0_LPD]
  connect_bd_intf_net -intf_net zynq_mpsoc_M_AXI_HPM1_FPD [get_bd_intf_pins saxi_ic_doce/S00_AXI] [get_bd_intf_pins zynq_mpsoc/M_AXI_HPM1_FPD]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_ic_mmio/ARESETN] [get_bd_pins maxi_ic_doce/ARESETN] [get_bd_pins pl_clk_sys_reset/peripheral_aresetn]
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins axi_dwidth_converter_0/s_axi_aresetn] [get_bd_pins axi_ic_mmio/M00_ARESETN] [get_bd_pins axi_mmu_0/aresetn] [get_bd_pins maxi_ic_doce/S00_ARESETN] [get_bd_pins saxi_ic_doce/M00_ARESETN] [get_bd_pins tx_reset/interconnect_aresetn]
  connect_bd_net -net M00_AXI_awready_1 [get_bd_pins maxi_ic_doce/M00_AXI_awready] [get_bd_pins zynq_mpsoc/saxigp2_awready]
  connect_bd_net -net Net [get_bd_pins ila_3/probe0] [get_bd_pins zynq_mpsoc/saxigp2_aruser]
  connect_bd_net -net axi_ic_if_reset [get_bd_pins cmac_usplus_0/core_drp_reset] [get_bd_pins cmac_usplus_0/core_rx_reset] [get_bd_pins cmac_usplus_0/core_tx_reset] [get_bd_pins cmac_usplus_0/gtwiz_reset_tx_datapath] [get_bd_pins cmac_usplus_0/sys_reset] [get_bd_pins pl_clk_sys_reset/peripheral_reset]
  connect_bd_net -net axis_data_fifo_1_s_axis_tready [get_bd_pins axis_data_fifo_1/s_axis_tready] [get_bd_pins ila_0/probe9]
  connect_bd_net -net cmac_usplus_0_gt_txn_out [get_bd_ports gt_txn_out] [get_bd_pins cmac_usplus_0/gt_txn_out]
  connect_bd_net -net cmac_usplus_0_gt_txp_out [get_bd_ports gt_txp_out] [get_bd_pins cmac_usplus_0/gt_txp_out]
  connect_bd_net -net cmac_usplus_0_gt_txusrclk2 [get_bd_ports gt_txusrclk] [get_bd_pins axi_dwidth_converter_0/s_axi_aclk] [get_bd_pins axi_ic_mmio/M00_ACLK] [get_bd_pins axi_mmu_0/aclk] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins cmac_to_doce/aclk] [get_bd_pins cmac_usplus_0/gt_txusrclk2] [get_bd_pins cmac_usplus_0/rx_clk] [get_bd_pins doce_to_cmac/aclk] [get_bd_pins ila_0/clk] [get_bd_pins ila_1/clk] [get_bd_pins ila_2/clk] [get_bd_pins mac_addr_reg_0/axi_lite_aclk] [get_bd_pins maxi_ic_doce/S00_ACLK] [get_bd_pins rx_reset/slowest_sync_clk] [get_bd_pins rx_reset_cnt_0/clk] [get_bd_pins saxi_ic_doce/ACLK] [get_bd_pins saxi_ic_doce/M00_ACLK] [get_bd_pins tx_padding_0/aclk] [get_bd_pins tx_reset/slowest_sync_clk]
  connect_bd_net -net cmac_usplus_0_rx_axis_tdata [get_bd_pins axis_data_fifo_1/s_axis_tdata] [get_bd_pins cmac_usplus_0/rx_axis_tdata] [get_bd_pins ila_0/probe6]
  connect_bd_net -net cmac_usplus_0_rx_axis_tkeep [get_bd_pins axis_data_fifo_1/s_axis_tkeep] [get_bd_pins cmac_usplus_0/rx_axis_tkeep] [get_bd_pins ila_0/probe7]
  connect_bd_net -net cmac_usplus_0_rx_axis_tlast [get_bd_pins axis_data_fifo_1/s_axis_tlast] [get_bd_pins cmac_usplus_0/rx_axis_tlast] [get_bd_pins ila_0/probe8]
  connect_bd_net -net cmac_usplus_0_rx_axis_tvalid [get_bd_pins axis_data_fifo_1/s_axis_tvalid] [get_bd_pins cmac_usplus_0/rx_axis_tvalid] [get_bd_pins ila_0/probe10]
  connect_bd_net -net cmac_usplus_0_stat_rx_aligned [get_bd_pins cmac_usplus_0/stat_rx_aligned] [get_bd_pins ila_0/probe22]
  connect_bd_net -net cmac_usplus_0_stat_rx_aligned_err [get_bd_pins cmac_usplus_0/stat_rx_aligned_err] [get_bd_pins ila_0/probe23]
  connect_bd_net -net cmac_usplus_0_stat_rx_bad_fcs [get_bd_pins cmac_usplus_0/stat_rx_bad_fcs] [get_bd_pins ila_0/probe29]
  connect_bd_net -net cmac_usplus_0_stat_rx_bad_preamble [get_bd_pins cmac_usplus_0/stat_rx_bad_preamble] [get_bd_pins ila_0/probe24]
  connect_bd_net -net cmac_usplus_0_stat_rx_bad_sfd [get_bd_pins cmac_usplus_0/stat_rx_bad_sfd] [get_bd_pins ila_0/probe31]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_0 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_0] [get_bd_pins ila_0/probe38]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_1 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_1] [get_bd_pins ila_0/probe39]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_2 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_2] [get_bd_pins ila_0/probe40]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_3 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_3] [get_bd_pins ila_0/probe41]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_4 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_4] [get_bd_pins ila_0/probe42]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_5 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_5] [get_bd_pins ila_0/probe43]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_6 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_6] [get_bd_pins ila_0/probe44]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_7 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_7] [get_bd_pins ila_0/probe45]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_8 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_8] [get_bd_pins ila_0/probe30]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_9 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_9] [get_bd_pins ila_0/probe46]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_10 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_10] [get_bd_pins ila_0/probe47]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_11 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_11] [get_bd_pins ila_0/probe48]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_12 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_12] [get_bd_pins ila_0/probe49]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_13 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_13] [get_bd_pins ila_0/probe50]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_14 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_14] [get_bd_pins ila_0/probe51]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_15 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_15] [get_bd_pins ila_0/probe52]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_16 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_16] [get_bd_pins ila_0/probe53]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_17 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_17] [get_bd_pins ila_0/probe54]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_18 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_18] [get_bd_pins ila_0/probe55]
  connect_bd_net -net cmac_usplus_0_stat_rx_bip_err_19 [get_bd_pins cmac_usplus_0/stat_rx_bip_err_19] [get_bd_pins ila_0/probe56]
  connect_bd_net -net cmac_usplus_0_stat_rx_block_lock [get_bd_pins cmac_usplus_0/stat_rx_block_lock] [get_bd_pins ila_0/probe28]
  connect_bd_net -net cmac_usplus_0_stat_rx_broadcast [get_bd_pins cmac_usplus_0/stat_rx_broadcast] [get_bd_pins ila_0/probe57]
  connect_bd_net -net cmac_usplus_0_stat_rx_fragment [get_bd_pins cmac_usplus_0/stat_rx_fragment] [get_bd_pins ila_0/probe58]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_0 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_0] [get_bd_pins ila_0/probe59]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_1 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_1] [get_bd_pins ila_0/probe60]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_2 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_2] [get_bd_pins ila_0/probe61]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_3 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_3] [get_bd_pins ila_0/probe62]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_4 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_4] [get_bd_pins ila_0/probe63]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_5 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_5] [get_bd_pins ila_1/probe0]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_6 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_6] [get_bd_pins ila_1/probe1]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_7 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_7] [get_bd_pins ila_1/probe2]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_8 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_8] [get_bd_pins ila_1/probe3]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_9 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_9] [get_bd_pins ila_1/probe4]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_10 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_10] [get_bd_pins ila_1/probe5]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_11 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_11] [get_bd_pins ila_1/probe6]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_12 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_12] [get_bd_pins ila_1/probe7]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_13 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_13] [get_bd_pins ila_1/probe8]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_14 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_14] [get_bd_pins ila_1/probe9]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_15 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_15] [get_bd_pins ila_1/probe10]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_16 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_16] [get_bd_pins ila_1/probe11]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_17 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_17] [get_bd_pins ila_1/probe12]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_18 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_18] [get_bd_pins ila_1/probe13]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_19 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_19] [get_bd_pins ila_1/probe14]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_0 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_0] [get_bd_pins ila_1/probe16]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_1 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_1] [get_bd_pins ila_1/probe17]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_2 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_2] [get_bd_pins ila_1/probe18]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_3 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_3] [get_bd_pins ila_1/probe19]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_4 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_4] [get_bd_pins ila_1/probe20]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_5 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_5] [get_bd_pins ila_1/probe21]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_6 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_6] [get_bd_pins ila_1/probe22]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_7 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_7] [get_bd_pins ila_1/probe23]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_8 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_8] [get_bd_pins ila_1/probe24]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_9 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_9] [get_bd_pins ila_1/probe25]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_10 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_10] [get_bd_pins ila_1/probe26]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_11 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_11] [get_bd_pins ila_1/probe27]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_12 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_12] [get_bd_pins ila_1/probe28]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_13 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_13] [get_bd_pins ila_1/probe29]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_14 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_14] [get_bd_pins ila_1/probe30]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_15 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_15] [get_bd_pins ila_1/probe31]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_16 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_16] [get_bd_pins ila_1/probe32]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_17 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_17] [get_bd_pins ila_1/probe33]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_18 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_18] [get_bd_pins ila_1/probe34]
  connect_bd_net -net cmac_usplus_0_stat_rx_framing_err_valid_19 [get_bd_pins cmac_usplus_0/stat_rx_framing_err_valid_19] [get_bd_pins ila_1/probe35]
  connect_bd_net -net cmac_usplus_0_stat_rx_got_signal_os [get_bd_pins cmac_usplus_0/stat_rx_got_signal_os] [get_bd_pins ila_1/probe36]
  connect_bd_net -net cmac_usplus_0_stat_rx_hi_ber [get_bd_pins cmac_usplus_0/stat_rx_hi_ber] [get_bd_pins ila_0/probe32]
  connect_bd_net -net cmac_usplus_0_stat_rx_inrangeerr [get_bd_pins cmac_usplus_0/stat_rx_inrangeerr] [get_bd_pins ila_1/probe37]
  connect_bd_net -net cmac_usplus_0_stat_rx_internal_local_fault [get_bd_pins cmac_usplus_0/stat_rx_internal_local_fault] [get_bd_pins ila_1/probe38]
  connect_bd_net -net cmac_usplus_0_stat_rx_jabber [get_bd_pins cmac_usplus_0/stat_rx_jabber] [get_bd_pins ila_1/probe42]
  connect_bd_net -net cmac_usplus_0_stat_rx_local_fault [get_bd_pins cmac_usplus_0/stat_rx_local_fault] [get_bd_pins ila_0/probe26]
  connect_bd_net -net cmac_usplus_0_stat_rx_mf_err [get_bd_pins cmac_usplus_0/stat_rx_mf_err] [get_bd_pins ila_1/probe39]
  connect_bd_net -net cmac_usplus_0_stat_rx_mf_len_err [get_bd_pins cmac_usplus_0/stat_rx_mf_len_err] [get_bd_pins ila_1/probe40]
  connect_bd_net -net cmac_usplus_0_stat_rx_mf_repeat_err [get_bd_pins cmac_usplus_0/stat_rx_mf_repeat_err] [get_bd_pins ila_1/probe41]
  connect_bd_net -net cmac_usplus_0_stat_rx_misaligned [get_bd_pins cmac_usplus_0/stat_rx_misaligned] [get_bd_pins ila_0/probe25]
  connect_bd_net -net cmac_usplus_0_stat_rx_multicast [get_bd_pins cmac_usplus_0/stat_rx_multicast] [get_bd_pins ila_1/probe43]
  connect_bd_net -net cmac_usplus_0_stat_rx_oversize [get_bd_pins cmac_usplus_0/stat_rx_oversize] [get_bd_pins ila_1/probe44]
  connect_bd_net -net cmac_usplus_0_stat_rx_packet_64_bytes [get_bd_pins cmac_usplus_0/stat_rx_packet_64_bytes] [get_bd_pins ila_1/probe45]
  connect_bd_net -net cmac_usplus_0_stat_rx_packet_bad_fcs [get_bd_pins cmac_usplus_0/stat_rx_packet_bad_fcs] [get_bd_pins ila_1/probe46]
  connect_bd_net -net cmac_usplus_0_stat_rx_packet_small [get_bd_pins cmac_usplus_0/stat_rx_packet_small] [get_bd_pins ila_1/probe47]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_demuxed [get_bd_pins cmac_usplus_0/stat_rx_pcsl_demuxed] [get_bd_pins ila_1/probe48]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_0 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_0] [get_bd_pins ila_1/probe49]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_1 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_1] [get_bd_pins ila_1/probe50]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_2 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_2] [get_bd_pins ila_1/probe51]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_3 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_3] [get_bd_pins ila_1/probe52]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_4 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_4] [get_bd_pins ila_1/probe53]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_5 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_5] [get_bd_pins ila_1/probe54]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_6 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_6] [get_bd_pins ila_1/probe55]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_7 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_7] [get_bd_pins ila_1/probe56]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_8 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_8] [get_bd_pins ila_1/probe57]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_9 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_9] [get_bd_pins ila_1/probe58]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_10 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_10] [get_bd_pins ila_1/probe59]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_11 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_11] [get_bd_pins ila_1/probe60]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_12 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_12] [get_bd_pins ila_1/probe61]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_13 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_13] [get_bd_pins ila_1/probe62]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_14 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_14] [get_bd_pins ila_1/probe63]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_15 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_15] [get_bd_pins ila_1/probe15]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_16 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_16] [get_bd_pins ila_2/probe0]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_17 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_17] [get_bd_pins ila_2/probe1]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_18 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_18] [get_bd_pins ila_2/probe2]
  connect_bd_net -net cmac_usplus_0_stat_rx_pcsl_number_19 [get_bd_pins cmac_usplus_0/stat_rx_pcsl_number_19] [get_bd_pins ila_2/probe3]
  connect_bd_net -net cmac_usplus_0_stat_rx_received_local_fault [get_bd_pins cmac_usplus_0/stat_rx_received_local_fault] [get_bd_pins ila_2/probe4]
  connect_bd_net -net cmac_usplus_0_stat_rx_remote_fault [get_bd_pins cmac_usplus_0/stat_rx_remote_fault] [get_bd_pins ila_2/probe5]
  connect_bd_net -net cmac_usplus_0_stat_rx_status [get_bd_ports stat_rx_status_0] [get_bd_pins cmac_usplus_0/stat_rx_status] [get_bd_pins ila_0/probe5] [get_bd_pins rx_reset_cnt_0/rx_status]
  connect_bd_net -net cmac_usplus_0_stat_rx_stomped_fcs [get_bd_pins cmac_usplus_0/stat_rx_stomped_fcs] [get_bd_pins ila_2/probe6]
  connect_bd_net -net cmac_usplus_0_stat_rx_synced [get_bd_pins cmac_usplus_0/stat_rx_synced] [get_bd_pins ila_0/probe27]
  connect_bd_net -net cmac_usplus_0_stat_rx_synced_err [get_bd_pins cmac_usplus_0/stat_rx_synced_err] [get_bd_pins ila_2/probe7]
  connect_bd_net -net cmac_usplus_0_stat_rx_test_pattern_mismatch [get_bd_pins cmac_usplus_0/stat_rx_test_pattern_mismatch] [get_bd_pins ila_2/probe8]
  connect_bd_net -net cmac_usplus_0_stat_rx_toolong [get_bd_pins cmac_usplus_0/stat_rx_toolong] [get_bd_pins ila_2/probe9]
  connect_bd_net -net cmac_usplus_0_stat_rx_total_bytes [get_bd_pins cmac_usplus_0/stat_rx_total_bytes] [get_bd_pins ila_2/probe10]
  connect_bd_net -net cmac_usplus_0_stat_rx_total_good_bytes [get_bd_pins cmac_usplus_0/stat_rx_total_good_bytes] [get_bd_pins ila_2/probe11]
  connect_bd_net -net cmac_usplus_0_stat_rx_total_good_packets [get_bd_pins cmac_usplus_0/stat_rx_total_good_packets] [get_bd_pins ila_2/probe12]
  connect_bd_net -net cmac_usplus_0_stat_rx_total_packets [get_bd_pins cmac_usplus_0/stat_rx_total_packets] [get_bd_pins ila_2/probe13]
  connect_bd_net -net cmac_usplus_0_stat_rx_truncated [get_bd_pins cmac_usplus_0/stat_rx_truncated] [get_bd_pins ila_2/probe14]
  connect_bd_net -net cmac_usplus_0_stat_rx_undersize [get_bd_pins cmac_usplus_0/stat_rx_undersize] [get_bd_pins ila_2/probe15]
  connect_bd_net -net cmac_usplus_0_stat_rx_unicast [get_bd_pins cmac_usplus_0/stat_rx_unicast] [get_bd_pins ila_2/probe16]
  connect_bd_net -net cmac_usplus_0_stat_rx_vlan [get_bd_pins cmac_usplus_0/stat_rx_vlan] [get_bd_pins ila_2/probe17]
  connect_bd_net -net cmac_usplus_0_stat_tx_bad_fcs [get_bd_pins cmac_usplus_0/stat_tx_bad_fcs] [get_bd_pins ila_0/probe16]
  connect_bd_net -net cmac_usplus_0_stat_tx_broadcast [get_bd_pins cmac_usplus_0/stat_tx_broadcast] [get_bd_pins ila_0/probe17]
  connect_bd_net -net cmac_usplus_0_stat_tx_frame_error [get_bd_pins cmac_usplus_0/stat_tx_frame_error] [get_bd_pins ila_0/probe18]
  connect_bd_net -net cmac_usplus_0_stat_tx_local_fault [get_bd_pins cmac_usplus_0/stat_tx_local_fault] [get_bd_pins ila_0/probe19]
  connect_bd_net -net cmac_usplus_0_stat_tx_multicast [get_bd_pins cmac_usplus_0/stat_tx_multicast] [get_bd_pins ila_0/probe20]
  connect_bd_net -net cmac_usplus_0_stat_tx_packet_64_bytes [get_bd_pins cmac_usplus_0/stat_tx_packet_64_bytes] [get_bd_pins ila_0/probe21]
  connect_bd_net -net cmac_usplus_0_stat_tx_packet_large [get_bd_pins cmac_usplus_0/stat_tx_packet_large] [get_bd_pins ila_0/probe33]
  connect_bd_net -net cmac_usplus_0_stat_tx_packet_small [get_bd_pins cmac_usplus_0/stat_tx_packet_small] [get_bd_pins ila_0/probe11]
  connect_bd_net -net cmac_usplus_0_stat_tx_total_bytes [get_bd_pins cmac_usplus_0/stat_tx_total_bytes] [get_bd_pins ila_0/probe12]
  connect_bd_net -net cmac_usplus_0_stat_tx_total_good_bytes [get_bd_pins cmac_usplus_0/stat_tx_total_good_bytes] [get_bd_pins ila_0/probe13]
  connect_bd_net -net cmac_usplus_0_stat_tx_total_good_packets [get_bd_pins cmac_usplus_0/stat_tx_total_good_packets] [get_bd_pins ila_0/probe14]
  connect_bd_net -net cmac_usplus_0_stat_tx_total_packets [get_bd_pins cmac_usplus_0/stat_tx_total_packets] [get_bd_pins ila_0/probe15]
  connect_bd_net -net cmac_usplus_0_stat_tx_unicast [get_bd_pins cmac_usplus_0/stat_tx_unicast] [get_bd_pins ila_0/probe34]
  connect_bd_net -net cmac_usplus_0_stat_tx_vlan [get_bd_pins cmac_usplus_0/stat_tx_vlan] [get_bd_pins ila_0/probe35]
  connect_bd_net -net cmac_usplus_0_tx_axis_tready [get_bd_pins cmac_usplus_0/tx_axis_tready] [get_bd_pins ila_0/probe4] [get_bd_pins tx_padding_0/eth_axis_tready]
  connect_bd_net -net cmac_usplus_0_tx_ovfout [get_bd_pins cmac_usplus_0/tx_ovfout] [get_bd_pins ila_0/probe36]
  connect_bd_net -net cmac_usplus_0_tx_unfout [get_bd_pins cmac_usplus_0/tx_unfout] [get_bd_pins ila_0/probe37]
  connect_bd_net -net cmac_usplus_0_usr_rx_reset [get_bd_pins cmac_usplus_0/usr_rx_reset] [get_bd_pins tx_reset/ext_reset_in]
  connect_bd_net -net const_0_dout [get_bd_pins cmac_const_0/dout] [get_bd_pins cmac_usplus_0/ctl_rx_force_resync] [get_bd_pins cmac_usplus_0/ctl_rx_test_pattern] [get_bd_pins cmac_usplus_0/ctl_tx_send_idle] [get_bd_pins cmac_usplus_0/ctl_tx_send_lfi] [get_bd_pins cmac_usplus_0/ctl_tx_send_rfi] [get_bd_pins cmac_usplus_0/ctl_tx_test_pattern]
  connect_bd_net -net const_1_dout [get_bd_pins cmac_const_1/dout] [get_bd_pins cmac_usplus_0/ctl_rx_enable] [get_bd_pins cmac_usplus_0/ctl_tx_enable]
  connect_bd_net -net const_gt_loopback_in_dout [get_bd_pins cmac_const_gt_loopback_in/dout] [get_bd_pins cmac_usplus_0/gt_loopback_in]
  connect_bd_net -net doce_ic_reset_interconnect_aresetn [get_bd_pins axi_ic_mmio/S00_ARESETN] [get_bd_pins maxi_ic_doce/M00_ARESETN] [get_bd_pins pl_clk_sys_reset/interconnect_aresetn] [get_bd_pins saxi_ic_doce/S00_ARESETN]
  connect_bd_net -net doce_ic_reset_peripheral_reset [get_bd_pins rx_reset/peripheral_reset] [get_bd_pins rx_reset_cnt_0/reset]
  connect_bd_net -net gt_rxn_in_1 [get_bd_ports gt_rxn_in] [get_bd_pins cmac_usplus_0/gt_rxn_in]
  connect_bd_net -net gt_rxp_in_1 [get_bd_ports gt_rxp_in] [get_bd_pins cmac_usplus_0/gt_rxp_in]
  connect_bd_net -net mac_addr_reg_0_doce_ip_addr [get_bd_ports doce_ip_addr] [get_bd_pins mac_addr_reg_0/doce_ip_addr]
  connect_bd_net -net mac_addr_reg_0_doce_mac_id [get_bd_ports doce_mac_id] [get_bd_pins mac_addr_reg_0/doce_mac_id]
  connect_bd_net -net maxi_ic_doce_M00_AXI_araddr [get_bd_pins ila_3/probe2] [get_bd_pins maxi_ic_doce/M00_AXI_araddr] [get_bd_pins zynq_mpsoc/saxigp2_araddr]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arburst [get_bd_pins ila_3/probe5] [get_bd_pins maxi_ic_doce/M00_AXI_arburst] [get_bd_pins zynq_mpsoc/saxigp2_arburst]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arcache [get_bd_pins ila_3/probe7] [get_bd_pins maxi_ic_doce/M00_AXI_arcache] [get_bd_pins zynq_mpsoc/saxigp2_arcache]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arid [get_bd_pins ila_3/probe1] [get_bd_pins maxi_ic_doce/M00_AXI_arid] [get_bd_pins zynq_mpsoc/saxigp2_arid]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arlen [get_bd_pins ila_3/probe3] [get_bd_pins maxi_ic_doce/M00_AXI_arlen] [get_bd_pins zynq_mpsoc/saxigp2_arlen]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arlock [get_bd_pins ila_3/probe6] [get_bd_pins maxi_ic_doce/M00_AXI_arlock] [get_bd_pins zynq_mpsoc/saxigp2_arlock]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arprot [get_bd_pins ila_3/probe8] [get_bd_pins maxi_ic_doce/M00_AXI_arprot] [get_bd_pins zynq_mpsoc/saxigp2_arprot]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arqos [get_bd_pins ila_3/probe17] [get_bd_pins maxi_ic_doce/M00_AXI_arqos] [get_bd_pins zynq_mpsoc/saxigp2_arqos]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arsize [get_bd_pins ila_3/probe4] [get_bd_pins maxi_ic_doce/M00_AXI_arsize] [get_bd_pins zynq_mpsoc/saxigp2_arsize]
  connect_bd_net -net maxi_ic_doce_M00_AXI_arvalid [get_bd_pins ila_3/probe9] [get_bd_pins maxi_ic_doce/M00_AXI_arvalid] [get_bd_pins zynq_mpsoc/saxigp2_arvalid]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awaddr [get_bd_pins maxi_ic_doce/M00_AXI_awaddr] [get_bd_pins zynq_mpsoc/saxigp2_awaddr]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awburst [get_bd_pins maxi_ic_doce/M00_AXI_awburst] [get_bd_pins zynq_mpsoc/saxigp2_awburst]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awcache [get_bd_pins maxi_ic_doce/M00_AXI_awcache] [get_bd_pins zynq_mpsoc/saxigp2_awcache]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awid [get_bd_pins maxi_ic_doce/M00_AXI_awid] [get_bd_pins zynq_mpsoc/saxigp2_awid]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awlen [get_bd_pins maxi_ic_doce/M00_AXI_awlen] [get_bd_pins zynq_mpsoc/saxigp2_awlen]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awlock [get_bd_pins maxi_ic_doce/M00_AXI_awlock] [get_bd_pins zynq_mpsoc/saxigp2_awlock]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awprot [get_bd_pins maxi_ic_doce/M00_AXI_awprot] [get_bd_pins zynq_mpsoc/saxigp2_awprot]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awqos [get_bd_pins maxi_ic_doce/M00_AXI_awqos] [get_bd_pins zynq_mpsoc/saxigp2_awqos]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awsize [get_bd_pins maxi_ic_doce/M00_AXI_awsize] [get_bd_pins zynq_mpsoc/saxigp2_awsize]
  connect_bd_net -net maxi_ic_doce_M00_AXI_awvalid [get_bd_pins maxi_ic_doce/M00_AXI_awvalid] [get_bd_pins zynq_mpsoc/saxigp2_awvalid]
  connect_bd_net -net maxi_ic_doce_M00_AXI_bready [get_bd_pins maxi_ic_doce/M00_AXI_bready] [get_bd_pins zynq_mpsoc/saxigp2_bready]
  connect_bd_net -net maxi_ic_doce_M00_AXI_rready [get_bd_pins ila_3/probe16] [get_bd_pins maxi_ic_doce/M00_AXI_rready] [get_bd_pins zynq_mpsoc/saxigp2_rready]
  connect_bd_net -net maxi_ic_doce_M00_AXI_wdata [get_bd_pins maxi_ic_doce/M00_AXI_wdata] [get_bd_pins zynq_mpsoc/saxigp2_wdata]
  connect_bd_net -net maxi_ic_doce_M00_AXI_wlast [get_bd_pins maxi_ic_doce/M00_AXI_wlast] [get_bd_pins zynq_mpsoc/saxigp2_wlast]
  connect_bd_net -net maxi_ic_doce_M00_AXI_wstrb [get_bd_pins maxi_ic_doce/M00_AXI_wstrb] [get_bd_pins zynq_mpsoc/saxigp2_wstrb]
  connect_bd_net -net maxi_ic_doce_M00_AXI_wvalid [get_bd_pins maxi_ic_doce/M00_AXI_wvalid] [get_bd_pins zynq_mpsoc/saxigp2_wvalid]
  connect_bd_net -net pl_clk2_out [get_bd_pins axi_ic_mmio/ACLK] [get_bd_pins axi_ic_mmio/S00_ACLK] [get_bd_pins cmac_usplus_0/drp_clk] [get_bd_pins cmac_usplus_0/init_clk] [get_bd_pins ila_3/clk] [get_bd_pins ila_4/clk] [get_bd_pins maxi_ic_doce/ACLK] [get_bd_pins maxi_ic_doce/M00_ACLK] [get_bd_pins pl_clk_sys_reset/slowest_sync_clk] [get_bd_pins saxi_ic_doce/S00_ACLK] [get_bd_pins zynq_mpsoc/maxihpm0_lpd_aclk] [get_bd_pins zynq_mpsoc/maxihpm1_fpd_aclk] [get_bd_pins zynq_mpsoc/pl_clk2] [get_bd_pins zynq_mpsoc/saxihp0_fpd_aclk]
  connect_bd_net -net pl_resetn0 [get_bd_pins pl_clk_sys_reset/ext_reset_in] [get_bd_pins rx_reset/ext_reset_in] [get_bd_pins zynq_mpsoc/pl_resetn0]
  connect_bd_net -net rx_reset_cnt_0_gtwiz_rx_reset [get_bd_pins cmac_usplus_0/gtwiz_reset_rx_datapath] [get_bd_pins rx_reset_cnt_0/gtwiz_rx_reset]
  connect_bd_net -net saxi_ic_doce_S00_AXI_arready [get_bd_pins ila_4/probe10] [get_bd_pins saxi_ic_doce/S00_AXI_arready] [get_bd_pins zynq_mpsoc/maxigp1_arready]
  connect_bd_net -net saxi_ic_doce_S00_AXI_awready [get_bd_pins saxi_ic_doce/S00_AXI_awready] [get_bd_pins zynq_mpsoc/maxigp1_awready]
  connect_bd_net -net saxi_ic_doce_S00_AXI_bid [get_bd_pins saxi_ic_doce/S00_AXI_bid] [get_bd_pins zynq_mpsoc/maxigp1_bid]
  connect_bd_net -net saxi_ic_doce_S00_AXI_bresp [get_bd_pins saxi_ic_doce/S00_AXI_bresp] [get_bd_pins zynq_mpsoc/maxigp1_bresp]
  connect_bd_net -net saxi_ic_doce_S00_AXI_bvalid [get_bd_pins saxi_ic_doce/S00_AXI_bvalid] [get_bd_pins zynq_mpsoc/maxigp1_bvalid]
  connect_bd_net -net saxi_ic_doce_S00_AXI_rdata [get_bd_pins ila_4/probe12] [get_bd_pins saxi_ic_doce/S00_AXI_rdata] [get_bd_pins zynq_mpsoc/maxigp1_rdata]
  connect_bd_net -net saxi_ic_doce_S00_AXI_rid [get_bd_pins ila_4/probe11] [get_bd_pins saxi_ic_doce/S00_AXI_rid] [get_bd_pins zynq_mpsoc/maxigp1_rid]
  connect_bd_net -net saxi_ic_doce_S00_AXI_rlast [get_bd_pins ila_4/probe14] [get_bd_pins saxi_ic_doce/S00_AXI_rlast] [get_bd_pins zynq_mpsoc/maxigp1_rlast]
  connect_bd_net -net saxi_ic_doce_S00_AXI_rresp [get_bd_pins ila_4/probe13] [get_bd_pins saxi_ic_doce/S00_AXI_rresp] [get_bd_pins zynq_mpsoc/maxigp1_rresp]
  connect_bd_net -net saxi_ic_doce_S00_AXI_rvalid [get_bd_pins ila_4/probe15] [get_bd_pins saxi_ic_doce/S00_AXI_rvalid] [get_bd_pins zynq_mpsoc/maxigp1_rvalid]
  connect_bd_net -net saxi_ic_doce_S00_AXI_wready [get_bd_pins saxi_ic_doce/S00_AXI_wready] [get_bd_pins zynq_mpsoc/maxigp1_wready]
  connect_bd_net -net tx_padding_0_eth_axis_tdata [get_bd_pins cmac_usplus_0/tx_axis_tdata] [get_bd_pins ila_0/probe0] [get_bd_pins tx_padding_0/eth_axis_tdata]
  connect_bd_net -net tx_padding_0_eth_axis_tkeep [get_bd_pins cmac_usplus_0/tx_axis_tkeep] [get_bd_pins ila_0/probe1] [get_bd_pins tx_padding_0/eth_axis_tkeep]
  connect_bd_net -net tx_padding_0_eth_axis_tlast [get_bd_pins cmac_usplus_0/tx_axis_tlast] [get_bd_pins ila_0/probe2] [get_bd_pins tx_padding_0/eth_axis_tlast]
  connect_bd_net -net tx_padding_0_eth_axis_tuser [get_bd_pins cmac_usplus_0/tx_axis_tuser] [get_bd_pins tx_padding_0/eth_axis_tuser]
  connect_bd_net -net tx_padding_0_eth_axis_tvalid [get_bd_pins cmac_usplus_0/tx_axis_tvalid] [get_bd_pins ila_0/probe3] [get_bd_pins tx_padding_0/eth_axis_tvalid]
  connect_bd_net -net tx_reset_peripheral_aresetn [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins cmac_to_doce/aresetn] [get_bd_pins doce_to_cmac/aresetn] [get_bd_pins mac_addr_reg_0/axi_lite_aresetn] [get_bd_pins saxi_ic_doce/ARESETN] [get_bd_pins tx_reset/peripheral_aresetn]
  connect_bd_net -net tx_reset_peripheral_reset [get_bd_ports peripheral_reset] [get_bd_pins tx_padding_0/reset] [get_bd_pins tx_reset/peripheral_reset]
  connect_bd_net -net zynq_mpsoc_maxigp1_araddr [get_bd_pins ila_4/probe1] [get_bd_pins saxi_ic_doce/S00_AXI_araddr] [get_bd_pins zynq_mpsoc/maxigp1_araddr]
  connect_bd_net -net zynq_mpsoc_maxigp1_arburst [get_bd_pins ila_4/probe4] [get_bd_pins saxi_ic_doce/S00_AXI_arburst] [get_bd_pins zynq_mpsoc/maxigp1_arburst]
  connect_bd_net -net zynq_mpsoc_maxigp1_arcache [get_bd_pins ila_4/probe6] [get_bd_pins saxi_ic_doce/S00_AXI_arcache] [get_bd_pins zynq_mpsoc/maxigp1_arcache]
  connect_bd_net -net zynq_mpsoc_maxigp1_arid [get_bd_pins ila_4/probe0] [get_bd_pins saxi_ic_doce/S00_AXI_arid] [get_bd_pins zynq_mpsoc/maxigp1_arid]
  connect_bd_net -net zynq_mpsoc_maxigp1_arlen [get_bd_pins ila_4/probe2] [get_bd_pins saxi_ic_doce/S00_AXI_arlen] [get_bd_pins zynq_mpsoc/maxigp1_arlen]
  connect_bd_net -net zynq_mpsoc_maxigp1_arlock [get_bd_pins ila_4/probe5] [get_bd_pins saxi_ic_doce/S00_AXI_arlock] [get_bd_pins zynq_mpsoc/maxigp1_arlock]
  connect_bd_net -net zynq_mpsoc_maxigp1_arprot [get_bd_pins ila_4/probe7] [get_bd_pins saxi_ic_doce/S00_AXI_arprot] [get_bd_pins zynq_mpsoc/maxigp1_arprot]
  connect_bd_net -net zynq_mpsoc_maxigp1_arqos [get_bd_pins ila_4/probe17] [get_bd_pins saxi_ic_doce/S00_AXI_arqos] [get_bd_pins zynq_mpsoc/maxigp1_arqos]
  connect_bd_net -net zynq_mpsoc_maxigp1_arsize [get_bd_pins ila_4/probe3] [get_bd_pins saxi_ic_doce/S00_AXI_arsize] [get_bd_pins zynq_mpsoc/maxigp1_arsize]
  connect_bd_net -net zynq_mpsoc_maxigp1_aruser [get_bd_pins ila_4/probe9] [get_bd_pins saxi_ic_doce/S00_AXI_aruser] [get_bd_pins zynq_mpsoc/maxigp1_aruser]
  connect_bd_net -net zynq_mpsoc_maxigp1_arvalid [get_bd_pins ila_4/probe8] [get_bd_pins saxi_ic_doce/S00_AXI_arvalid] [get_bd_pins zynq_mpsoc/maxigp1_arvalid]
  connect_bd_net -net zynq_mpsoc_maxigp1_awaddr [get_bd_pins saxi_ic_doce/S00_AXI_awaddr] [get_bd_pins zynq_mpsoc/maxigp1_awaddr]
  connect_bd_net -net zynq_mpsoc_maxigp1_awburst [get_bd_pins saxi_ic_doce/S00_AXI_awburst] [get_bd_pins zynq_mpsoc/maxigp1_awburst]
  connect_bd_net -net zynq_mpsoc_maxigp1_awcache [get_bd_pins saxi_ic_doce/S00_AXI_awcache] [get_bd_pins zynq_mpsoc/maxigp1_awcache]
  connect_bd_net -net zynq_mpsoc_maxigp1_awid [get_bd_pins saxi_ic_doce/S00_AXI_awid] [get_bd_pins zynq_mpsoc/maxigp1_awid]
  connect_bd_net -net zynq_mpsoc_maxigp1_awlen [get_bd_pins saxi_ic_doce/S00_AXI_awlen] [get_bd_pins zynq_mpsoc/maxigp1_awlen]
  connect_bd_net -net zynq_mpsoc_maxigp1_awlock [get_bd_pins saxi_ic_doce/S00_AXI_awlock] [get_bd_pins zynq_mpsoc/maxigp1_awlock]
  connect_bd_net -net zynq_mpsoc_maxigp1_awprot [get_bd_pins saxi_ic_doce/S00_AXI_awprot] [get_bd_pins zynq_mpsoc/maxigp1_awprot]
  connect_bd_net -net zynq_mpsoc_maxigp1_awqos [get_bd_pins saxi_ic_doce/S00_AXI_awqos] [get_bd_pins zynq_mpsoc/maxigp1_awqos]
  connect_bd_net -net zynq_mpsoc_maxigp1_awsize [get_bd_pins saxi_ic_doce/S00_AXI_awsize] [get_bd_pins zynq_mpsoc/maxigp1_awsize]
  connect_bd_net -net zynq_mpsoc_maxigp1_awuser [get_bd_pins saxi_ic_doce/S00_AXI_awuser] [get_bd_pins zynq_mpsoc/maxigp1_awuser]
  connect_bd_net -net zynq_mpsoc_maxigp1_awvalid [get_bd_pins saxi_ic_doce/S00_AXI_awvalid] [get_bd_pins zynq_mpsoc/maxigp1_awvalid]
  connect_bd_net -net zynq_mpsoc_maxigp1_bready [get_bd_pins saxi_ic_doce/S00_AXI_bready] [get_bd_pins zynq_mpsoc/maxigp1_bready]
  connect_bd_net -net zynq_mpsoc_maxigp1_rready [get_bd_pins ila_4/probe16] [get_bd_pins saxi_ic_doce/S00_AXI_rready] [get_bd_pins zynq_mpsoc/maxigp1_rready]
  connect_bd_net -net zynq_mpsoc_maxigp1_wdata [get_bd_pins saxi_ic_doce/S00_AXI_wdata] [get_bd_pins zynq_mpsoc/maxigp1_wdata]
  connect_bd_net -net zynq_mpsoc_maxigp1_wlast [get_bd_pins saxi_ic_doce/S00_AXI_wlast] [get_bd_pins zynq_mpsoc/maxigp1_wlast]
  connect_bd_net -net zynq_mpsoc_maxigp1_wstrb [get_bd_pins saxi_ic_doce/S00_AXI_wstrb] [get_bd_pins zynq_mpsoc/maxigp1_wstrb]
  connect_bd_net -net zynq_mpsoc_maxigp1_wvalid [get_bd_pins saxi_ic_doce/S00_AXI_wvalid] [get_bd_pins zynq_mpsoc/maxigp1_wvalid]
  connect_bd_net -net zynq_mpsoc_saxigp2_arready [get_bd_pins ila_3/probe10] [get_bd_pins maxi_ic_doce/M00_AXI_arready] [get_bd_pins zynq_mpsoc/saxigp2_arready]
  connect_bd_net -net zynq_mpsoc_saxigp2_bid [get_bd_pins maxi_ic_doce/M00_AXI_bid] [get_bd_pins zynq_mpsoc/saxigp2_bid]
  connect_bd_net -net zynq_mpsoc_saxigp2_bresp [get_bd_pins maxi_ic_doce/M00_AXI_bresp] [get_bd_pins zynq_mpsoc/saxigp2_bresp]
  connect_bd_net -net zynq_mpsoc_saxigp2_bvalid [get_bd_pins maxi_ic_doce/M00_AXI_bvalid] [get_bd_pins zynq_mpsoc/saxigp2_bvalid]
  connect_bd_net -net zynq_mpsoc_saxigp2_rdata [get_bd_pins ila_3/probe12] [get_bd_pins maxi_ic_doce/M00_AXI_rdata] [get_bd_pins zynq_mpsoc/saxigp2_rdata]
  connect_bd_net -net zynq_mpsoc_saxigp2_rid [get_bd_pins ila_3/probe11] [get_bd_pins maxi_ic_doce/M00_AXI_rid] [get_bd_pins zynq_mpsoc/saxigp2_rid]
  connect_bd_net -net zynq_mpsoc_saxigp2_rlast [get_bd_pins ila_3/probe14] [get_bd_pins maxi_ic_doce/M00_AXI_rlast] [get_bd_pins zynq_mpsoc/saxigp2_rlast]
  connect_bd_net -net zynq_mpsoc_saxigp2_rresp [get_bd_pins ila_3/probe13] [get_bd_pins maxi_ic_doce/M00_AXI_rresp] [get_bd_pins zynq_mpsoc/saxigp2_rresp]
  connect_bd_net -net zynq_mpsoc_saxigp2_rvalid [get_bd_pins ila_3/probe15] [get_bd_pins maxi_ic_doce/M00_AXI_rvalid] [get_bd_pins zynq_mpsoc/saxigp2_rvalid]
  connect_bd_net -net zynq_mpsoc_saxigp2_wready [get_bd_pins maxi_ic_doce/M00_AXI_wready] [get_bd_pins zynq_mpsoc/saxigp2_wready]

  # Create address segments
  assign_bd_address -offset 0x80000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces zynq_mpsoc/Data] [get_bd_addr_segs doce_axi_lite_slave/Reg] -force
  assign_bd_address -offset 0x000540000000 -range 0x40000000 -target_address_space [get_bd_addr_spaces zynq_mpsoc/Data] [get_bd_addr_segs doce_axi_slave/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces m_axi_doce_mac] [get_bd_addr_segs mac_addr_reg_0/s_axi_lite/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x40000000 -target_address_space [get_bd_addr_spaces doce_axi_master] [get_bd_addr_segs zynq_mpsoc/SAXIGP2/HP0_DDR_LOW] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


