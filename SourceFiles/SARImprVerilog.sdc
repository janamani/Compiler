#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/           Parameters that you will want to set for each design          #/ 
#/-------------------------------------------------------------------------#/
set  PERIOD 		5.0
set  CLOCK			Clock
set  RESET			Reset
set  CUNCHOLD		0.1
set  CUNCSETUP		0.1
set  CLATENCYR  	0.1
set  CLATENCYF  	0.1
set  CLOCKTRAN		0.1
set  IDELAY 		0.5
set  ODELAY			0.5
set  LIBRARY		fsa0a_c_generic_core_ss1p62v125c
set  BUFREPLACE	BUF4
set  DRIVECELL		BUF1
set  DRIVEPIN		O
#/*************************************************************************#/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
create_clock $CLOCK -period $PERIOD
set_dont_touch_network $CLOCK
set_clock_transition $CLOCKTRAN $CLOCK
set_clock_latency $CLATENCYR -rise $CLOCK
set_clock_latency $CLATENCYF -fall $CLOCK
set_clock_uncertainty -hold $CUNCHOLD $CLOCK
set_clock_uncertainty -setup $CUNCSETUP $CLOCK

set_load -pin_load 0.010 {ResetP ResetN}
set_load -pin_load 0.030 {ClockCmp ClockTck}

set_load -pin_load 0.010 {Ready}
set_load -pin_load 0.010 {DataOut[0]}
set_load -pin_load 0.010 {DataOut[1]}
set_load -pin_load 0.010 {DataOut[2]}
set_load -pin_load 0.010 {DataOut[3]}
set_load -pin_load 0.010 {DataOut[4]}
set_load -pin_load 0.010 {DataOut[5]}
set_load -pin_load 0.010 {DataOut[6]}
set_load -pin_load 0.010 {DataOut[7]}

set_load -pin_load 0.025 {SAROutG}
set_load -pin_load 0.025 {SAROut[0]}
set_load -pin_load 0.030 {SAROut[1]}
set_load -pin_load 0.050 {SAROut[2]}
set_load -pin_load 0.070 {SAROut[3]}
set_load -pin_load 0.130 {SAROut[4]}
set_load -pin_load 0.250 {SAROut[5]}
set_load -pin_load 0.450 {SAROut[6]}
set_load -pin_load 0.880 {SAROut[7]}

set_input_delay -max $IDELAY -clock $CLOCK [remove_from_collection [all_inputs] $CLOCK]
set_output_delay $ODELAY -clock $CLOCK [all_outputs]

set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {Reset}
set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {Compare}