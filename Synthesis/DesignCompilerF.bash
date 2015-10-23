#!/bin/bash 

\rm -rf ../WorkLibrary/Synthesis

\design_vision -f ../ScriptFiles/DesignCompilerF.tcl | tee ../LoggerFiles/DesignCompilerF.log

\rm -rf ~/synopsys_cache_G-2012.06
