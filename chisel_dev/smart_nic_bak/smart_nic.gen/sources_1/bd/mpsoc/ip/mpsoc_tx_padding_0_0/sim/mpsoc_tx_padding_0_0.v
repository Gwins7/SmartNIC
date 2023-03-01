// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:tx_padding:1.0
// IP Revision: 3

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module mpsoc_tx_padding_0_0 (
  aclk,
  reset,
  deoi_axis_tdata,
  deoi_axis_tvalid,
  deoi_axis_tlast,
  deoi_axis_tkeep,
  deoi_axis_tready,
  eth_axis_tdata,
  eth_axis_tvalid,
  eth_axis_tlast,
  eth_axis_tkeep,
  eth_axis_tuser,
  eth_axis_tready
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF deoi_axis:eth_axis, ASSOCIATED_RESET reset, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN mpsoc_cmac_usplus_0_0_gt_txusrclk2, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
input wire reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 deoi_axis TDATA" *)
input wire [511 : 0] deoi_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 deoi_axis TVALID" *)
input wire deoi_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 deoi_axis TLAST" *)
input wire deoi_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 deoi_axis TKEEP" *)
input wire [63 : 0] deoi_axis_tkeep;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME deoi_axis, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN mpsoc_cmac_usplus_0_0_gt_txusrclk2, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 deoi_axis TREADY" *)
output wire deoi_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 eth_axis TDATA" *)
output wire [511 : 0] eth_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 eth_axis TVALID" *)
output wire eth_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 eth_axis TLAST" *)
output wire eth_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 eth_axis TKEEP" *)
output wire [63 : 0] eth_axis_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 eth_axis TUSER" *)
output wire eth_axis_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME eth_axis, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN mpsoc_cmac_usplus_0_0_gt_txusrclk2, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 eth_axis TREADY" *)
input wire eth_axis_tready;

  tx_interface inst (
    .aclk(aclk),
    .reset(reset),
    .deoi_axis_tdata(deoi_axis_tdata),
    .deoi_axis_tvalid(deoi_axis_tvalid),
    .deoi_axis_tlast(deoi_axis_tlast),
    .deoi_axis_tkeep(deoi_axis_tkeep),
    .deoi_axis_tready(deoi_axis_tready),
    .eth_axis_tdata(eth_axis_tdata),
    .eth_axis_tvalid(eth_axis_tvalid),
    .eth_axis_tlast(eth_axis_tlast),
    .eth_axis_tkeep(eth_axis_tkeep),
    .eth_axis_tuser(eth_axis_tuser),
    .eth_axis_tready(eth_axis_tready)
  );
endmodule
