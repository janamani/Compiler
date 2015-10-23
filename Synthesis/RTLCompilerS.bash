#!/bin/bash 

\rm -rf ../Synthesis/fv
\rm -rf ../Synthesis/rc*

rc -gui -f ../ScriptFiles/RTLCompilerS.tcl -overwrite -logfile ../LoggerFiles/RTLCompilerS.log \
	-cmdfile ../LoggerFiles/RTLCompilerS.cmd


