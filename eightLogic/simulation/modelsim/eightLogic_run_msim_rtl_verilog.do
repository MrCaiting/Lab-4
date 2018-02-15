transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/Synchronizers.sv}
vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/Router.sv}
vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/Reg_8.sv}
vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/HexDriver.sv}
vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/Control.sv}
vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/compute.sv}
vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/Register_unit.sv}
vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/eightLogic.sv}

vlog -sv -work work +incdir+E:/Lab-4/eightLogic {E:/Lab-4/eightLogic/testbench_8.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
