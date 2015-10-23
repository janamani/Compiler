#!/bin/bash 

\rm -rf ../Synthesis/fv
\rm -rf ../Synthesis/rc*

rc -gui -f ../ScriptFiles/RTLCompilerI.tcl -overwrite -logfile ../LoggerFiles/RTLCompilerI.log \
	-cmdfile ../LoggerFiles/RTLCompilerI.cmd

