#!/bin/bash 

\rm -rf ../Synthesis/fv
\rm -rf ../Synthesis/rc*

rc -gui -f ../ScriptFiles/RTLCompilerF.tcl -overwrite -logfile ../LoggerFiles/RTLCompilerF.log \
	-cmdfile ../LoggerFiles/RTLCompilerF.cmd

