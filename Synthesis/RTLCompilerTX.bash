#!/bin/bash 

\rm -rf ../Synthesis/fv
\rm -rf ../Synthesis/rc*

rc -gui -f ../ScriptFiles/RTLCompilerTX.tcl -overwrite -logfile ../LoggerFiles/RTLCompilerTX.log \
	-cmdfile ../LoggerFiles/RTLCompilerTX.cmd


