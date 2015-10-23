#/**************************************************************************/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              */
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        */
#/**************************************************************************/
set LIBRARY /Cad/DesignK/FaradayUMC180/DigitalCore/FrontEnd/verilog/
set SIMFILE $LIBRARY/fsa0a_c_generic_core_30.lib.src
set TOPLEVEL TIMER
set TOPLEVELTEST  TIMERT
set TESTBENCH ../SourceFiles/TIMERT.v
set SOURCEFILE ../OutputFiles/${TOPLEVEL}DC.v
set STOPTIME 800ns
set TIMESTEP 1ns 
#/**************************************************************************/
vlib ../WorkLibrary/Simulation
vlog -work ../WorkLibrary/Simulation -v $SIMFILE $SOURCEFILE
vlog -work ../WorkLibrary/Simulation -v $SIMFILE $TESTBENCH
vsim -lib ../WorkLibrary/Simulation -t $TIMESTEP $TOPLEVELTEST
vcd file ../OutputFiles/$TOPLEVEL.vcd
vcd add -r *
quietly WaveActivateNextPane {} 0
add wave -format Logic /$TOPLEVELTEST/*
#/ add wave -format logic /$T/#/
run $STOPTIME
vcd checkpoint
#/**************************************************************************/
