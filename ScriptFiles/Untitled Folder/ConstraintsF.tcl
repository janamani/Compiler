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
set  CLOCKTRAN		0.2
set  IDELAY 		0.5
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

set_load 0.1 { SAROutP[7] SAROutP[3] SAROutN[7] SAROutN[3] }
set_load 0.1 { SAROutP[6] SAROutP[2] SAROutN[6] SAROutN[2] }
set_load 0.1 { SAROutP[5] SAROutP[1] SAROutN[5] SAROutN[1] }
set_load 0.1 { SAROutP[4] SAROutP[0] SAROutN[4] SAROutN[0] }
set_load [load_of [format "%s%s%s%s%s" $LIBRARY "/" $LOADCELL "/" $LOADPIN]] {StateP}
set_load [load_of [format "%s%s%s%s%s" $LIBRARY "/" $LOADCELL "/" $LOADPIN]] {TempSAR}

set_input_delay -max $IDELAY -clock $CLOCK [remove_from_collection [all_inputs] $CLOCK]
set_output_delay $ODELAY -clock $CLOCK [all_outputs]

set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {Inc}
set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {Dcr}
set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {Compare}
set_driving_cell -library $LIBRARY -lib_cell $DRIVECELL -pin $DRIVEPIN {DataOut}
#/**************************************************************************/
