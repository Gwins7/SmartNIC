@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Feb 20 13:29:41 +0800 2023
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 5c5097da354f441e87bae288253208f1 --incr --debug typical --relax --mt 2 -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_3 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot smartnic_sim_behav xil_defaultlib.smartnic_sim xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto 5c5097da354f441e87bae288253208f1 --incr --debug typical --relax --mt 2 -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_3 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot smartnic_sim_behav xil_defaultlib.smartnic_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
