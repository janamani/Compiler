#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/           Parameters that you will want to set for each design          #/ 
#/-------------------------------------------------------------------------#/
set  PERIOD 		1.0
set  CLOCK			ClockT
set  RESET			Reset
set  CUNCHOLD		0.1
set  CUNCSETUP		0.1
set  CLATENCYR  	0.1
set  CLATENCYF  	0.1
set  CLOCKTRAN		0.1
set  IDELAY 		0.1
set  ODELAY			0.1
set  LIBRARY		fsa0a_c_generic_core_ss1p62v125c
set  LOADCELL		BUF4
set  LOADPIN		I
set  DRIVECELL		BUF1
set  DRIVEPIN		O
#/*************************************************************************#/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
set_dont_touch_network $RESET

create_clock $CLOCK -period $PERIOD 
set_fix_hold $CLOCK
set_dont_touch_network $CLOCK
set_clock_transition $CLOCKTRAN $CLOCK
set_clock_latency $CLATENCYR -rise $CLOCK
set_clock_latency $CLATENCYF -fall $CLOCK
set_clock_uncertainty -hold $CUNCHOLD $CLOCK
set_clock_uncertainty -setup $CUNCSETUP $CLOCK

set_load [load_of [format "%s%s%s%s%s" $LIBRARY "/" $LOADCELL "/" $LOADPIN]] {Track}
set_load [load_of [format "%s%s%s%s%s" $LIBRARY "/" $LOADCELL "/" $LOADPIN]] {Ready}
set_load [load_of [format "%s%s%s%s%s" $LIBRARY "/" $LOADCELL "/" $LOADPIN]] {DataOut}
set_load [load_of [format "%s%s%s%s%s" $LIBRARY "/" $LOADCELL "/" $LOADPIN]] {TimerOut}

set_input_delay -max $IDELAY -clock $CLOCK [remove_from_collection [all_inputs] $CLOCK]
set_output_delay $ODELAY -clock $CLOCK [all_outputs]

set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {Inc}
set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {Dcr}
set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {StateP}
set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {TempSAR}
#/**************************************************************************/
