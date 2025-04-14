fpga:
	vivado -mode batch -source smart_nic_dev.tcl
	rm -f vivado*
	vivado ./smart_nic_dev/smart_nic_dev.xpr &
sim:
	vivado -mode batch -source smart_nic_sim.tcl
	rm -f vivado*
	vivado ./smart_nic_sim/smart_nic_sim.xpr &
clean:
	rm -rf ./smart_nic_dev
	rm -rf ./smart_nic_sim
	rm -f vivado*
