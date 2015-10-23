#!/bin/bash 

\rm -rf ../Synthesis/fv
\rm -rf ../Synthesis/rc*

rc -gui -f ../ScriptFiles/RTLCompilerN.tcl -overwrite -logfile ../LoggerFiles/RTLCompilerN.log \
	-cmdfile ../LoggerFiles/RTLCompilerN.cmd

