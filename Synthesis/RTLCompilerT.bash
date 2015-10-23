#!/bin/bash 

\rm -rf ../Synthesis/fv
\rm -rf ../Synthesis/rc*

rc -gui -f ../ScriptFiles/RTLCompilerT.tcl -overwrite -logfile ../LoggerFiles/RTLCompilerT.log \
	-cmdfile ../LoggerFiles/RTLCompilerT.cmd


