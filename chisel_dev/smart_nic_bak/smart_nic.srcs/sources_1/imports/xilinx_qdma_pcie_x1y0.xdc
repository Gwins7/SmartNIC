##-----------------------------------------------------------------------------
##
## (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##
##-----------------------------------------------------------------------------
##
## Project    : The Xilinx PCI Express DMA
## File       : xilinx_qdma_pcie_x1y0.xdc
## Version    : 5.0
##-----------------------------------------------------------------------------
#
# User Configuration
# Link Width   - x8
# Link Speed   - Gen3
# Family       - zynquplus
# Part         - xczu19eg
# Package      - ffvc1760
# Speed grade  - -2
###############################################################################
# User Time Names / User Time Groups / Time Specs
###############################################################################
##
## Free Running Clock is Required for IBERT/DRP operations.
##
#############################################################################################################

create_clock -period 10.000 -name sys_clk [get_ports sys_clk_p]
#
#############################################################################################################
set_false_path -from [get_ports sys_rst_n]
set_property PULLUP true [get_ports sys_rst_n]
#set_property IOSTANDARD LVCMOS18 [get_ports sys_rst_n]
#
#set_property LOC [get_package_pins -filter {PIN_FUNC =~ *_PERSTN0_65}] [get_ports sys_rst_n]
#set_property PACKAGE_PIN AH28 [get_ports sys_rst_n]
#
#set_property CONFIG_VOLTAGE 1.8 [current_design]
#
#############################################################################################################
#set_property LOC [get_package_pins -of_objects [get_bels [get_sites -filter {NAME =~ *COMMON*} -of_objects [get_iobanks -of_objects [get_sites GTHE4_CHANNEL_X0Y15]]]/REFCLK0P]] [get_ports sys_clk_p]
#set_property LOC [get_package_pins -of_objects [get_bels [get_sites -filter {NAME =~ *COMMON*} -of_objects [get_iobanks -of_objects [get_sites GTHE4_CHANNEL_X0Y15]]]/REFCLK0N]] [get_ports sys_clk_n]
#
#############################################################################################################
#############################################################################################################
################################### PCIe ############################################
set_property PACKAGE_PIN N10 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
#set_property PULLUP true [get_ports ivnPCIE_Rst]

set_property PACKAGE_PIN AF11 [get_ports sys_clk_n]
set_property PACKAGE_PIN AF12 [get_ports sys_clk_p]

#set_property PACKAGE_PIN AC9  [get_ports ivCPU_PCIE_RefClk_N]
#set_property PACKAGE_PIN AC10 [get_ports ivCPU_PCIE_RefClk_P]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets x16refclkin_O]
#set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN [get_nets x16refclkin_O]

set_property PACKAGE_PIN AE2 [get_ports {pci_exp_rxp[0]}]
set_property PACKAGE_PIN AE1 [get_ports {pci_exp_rxn[0]}]
set_property PACKAGE_PIN AD8 [get_ports {pci_exp_txp[0]}]
set_property PACKAGE_PIN AD7 [get_ports {pci_exp_txn[0]}]

set_property PACKAGE_PIN AF4 [get_ports {pci_exp_rxp[1]}]
set_property PACKAGE_PIN AF3 [get_ports {pci_exp_rxn[1]}]
set_property PACKAGE_PIN AE6 [get_ports {pci_exp_txp[1]}]
set_property PACKAGE_PIN AE5 [get_ports {pci_exp_txn[1]}]

set_property PACKAGE_PIN AG2 [get_ports {pci_exp_rxp[2]}]
set_property PACKAGE_PIN AG1 [get_ports {pci_exp_rxn[2]}]
set_property PACKAGE_PIN AF8 [get_ports {pci_exp_txp[2]}]
set_property PACKAGE_PIN AF7 [get_ports {pci_exp_txn[2]}]

set_property PACKAGE_PIN AH4 [get_ports {pci_exp_rxp[3]}]
set_property PACKAGE_PIN AH3 [get_ports {pci_exp_rxn[3]}]
set_property PACKAGE_PIN AG6 [get_ports {pci_exp_txp[3]}]
set_property PACKAGE_PIN AG5 [get_ports {pci_exp_txn[3]}]

set_property PACKAGE_PIN AJ2 [get_ports {pci_exp_rxp[4]}]
set_property PACKAGE_PIN AJ1 [get_ports {pci_exp_rxn[4]}]
set_property PACKAGE_PIN AH8 [get_ports {pci_exp_txp[4]}]
set_property PACKAGE_PIN AH7 [get_ports {pci_exp_txn[4]}]

set_property PACKAGE_PIN AK4 [get_ports {pci_exp_rxp[5]}]
set_property PACKAGE_PIN AK3 [get_ports {pci_exp_rxn[5]}]
set_property PACKAGE_PIN AJ6 [get_ports {pci_exp_txp[5]}]
set_property PACKAGE_PIN AJ5 [get_ports {pci_exp_txn[5]}]

set_property PACKAGE_PIN AL2 [get_ports {pci_exp_rxp[6]}]
set_property PACKAGE_PIN AL1 [get_ports {pci_exp_rxn[6]}]
set_property PACKAGE_PIN AK8 [get_ports {pci_exp_txp[6]}]
set_property PACKAGE_PIN AK7 [get_ports {pci_exp_txn[6]}]

set_property PACKAGE_PIN AM4 [get_ports {pci_exp_rxp[7]}]
set_property PACKAGE_PIN AM3 [get_ports {pci_exp_rxn[7]}]
set_property PACKAGE_PIN AL6 [get_ports {pci_exp_txp[7]}]
set_property PACKAGE_PIN AL5 [get_ports {pci_exp_txn[7]}]

set_property PACKAGE_PIN AN2 [get_ports {pci_exp_rxp[8]}]
set_property PACKAGE_PIN AN1 [get_ports {pci_exp_rxn[8]}]
set_property PACKAGE_PIN AM8 [get_ports {pci_exp_txp[8]}]
set_property PACKAGE_PIN AM7 [get_ports {pci_exp_txn[8]}]

set_property PACKAGE_PIN AP4 [get_ports {pci_exp_rxp[9]}]
set_property PACKAGE_PIN AP3 [get_ports {pci_exp_rxn[9]}]
set_property PACKAGE_PIN AN6 [get_ports {pci_exp_txp[9]}]
set_property PACKAGE_PIN AN5 [get_ports {pci_exp_txn[9]}]

set_property PACKAGE_PIN AR2 [get_ports {pci_exp_rxp[10]}]
set_property PACKAGE_PIN AR1 [get_ports {pci_exp_rxn[10]}]
set_property PACKAGE_PIN AP8 [get_ports {pci_exp_txp[10]}]
set_property PACKAGE_PIN AP7 [get_ports {pci_exp_txn[10]}]

set_property PACKAGE_PIN AT4 [get_ports {pci_exp_rxp[11]}]
set_property PACKAGE_PIN AT3 [get_ports {pci_exp_rxn[11]}]
set_property PACKAGE_PIN AR6 [get_ports {pci_exp_txp[11]}]
set_property PACKAGE_PIN AR5 [get_ports {pci_exp_txn[11]}]

set_property PACKAGE_PIN AU2 [get_ports {pci_exp_rxp[12]}]
set_property PACKAGE_PIN AU1 [get_ports {pci_exp_rxn[12]}]
set_property PACKAGE_PIN AT8 [get_ports {pci_exp_txp[12]}]
set_property PACKAGE_PIN AT7 [get_ports {pci_exp_txn[12]}]

set_property PACKAGE_PIN AV4 [get_ports {pci_exp_rxp[13]}]
set_property PACKAGE_PIN AV3 [get_ports {pci_exp_rxn[13]}]
set_property PACKAGE_PIN AU6 [get_ports {pci_exp_txp[13]}]
set_property PACKAGE_PIN AU5 [get_ports {pci_exp_txn[13]}]

set_property PACKAGE_PIN AW2 [get_ports {pci_exp_rxp[14]}]
set_property PACKAGE_PIN AW1 [get_ports {pci_exp_rxn[14]}]
set_property PACKAGE_PIN AW6 [get_ports {pci_exp_txp[14]}]
set_property PACKAGE_PIN AW5 [get_ports {pci_exp_txn[14]}]

set_property PACKAGE_PIN BA2 [get_ports {pci_exp_rxp[15]}]
set_property PACKAGE_PIN BA1 [get_ports {pci_exp_rxn[15]}]
set_property PACKAGE_PIN AY4 [get_ports {pci_exp_txp[15]}]
set_property PACKAGE_PIN AY3 [get_ports {pci_exp_txn[15]}]


#
# BITFILE/BITSTREAM compress options
#
#set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]
#set_property BITSTREAM.CONFIG.BPI_SYNC_MODE Type1 [current_design]
#set_property CONFIG_MODE BPI16 [current_design]
#set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]
#
#
#
set_false_path -to [get_pins -hier {*sync_reg[0]/D}]
#




