#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
    
editPin -pin { Clock ClockT Reset Ready TimerOut[3] TimerOut[2] TimerOut[1] \
				TimerOut[0]} -side Top -fixedPin 1 -spreadType CENTER \
		-snap TRACK -layer 4 -unit TRACK -spacing $PINSPACE -pinWidth $PINWIDTH \
		-pinDepth $PINDEPTH

editPin -pin { DataOut[7] DataOut[6] DataOut[5] DataOut[4] DataOut[3] DataOut[2] \
				DataOut[1] DataOut[0] } -side RIGHT -fixedPin 1 -spreadType CENTER \
		-snap TRACK -layer 4 -unit TRACK -spacing $PINSPACE -pinWidth $PINWIDTH \
		-pinDepth $PINDEPTH

editPin -pin {Compare Inc Dcr Track} -side LEFT -fixedPin 1 -spreadType CENTER \
        -snap TRACK -layer 4 -unit TRACK -spacing $PINSPACE -pinWidth $PINWIDTH\
        -pinDepth $PINDEPTH

editPin -pin {SAROut[7] SAROut[6] SAROut[5] SAROut[4] SAROut[3] SAROut[2] \
              SAROut[1] SAROut[0] SAROut[7] SAROut[6] SAROut[5] SAROut[4] \
			  SAROut[3] SAROut[2] SAROut[1] SAROut[0]} -side BOTTOM -fixedPin 1 \
		-spreadType CENTER -snap TRACK -layer 4 -unit TRACK -spacing $PINSPACE \
		-pinWidth $PINWIDTH -pinDepth $PINDEPTH
#/*************************************************************************#/



