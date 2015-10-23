#!/bin/bash 

\rm -rf ../WorkLibrary/Synthesis

\design_vision -f ../ScriptFiles/DesignCompilerS.tcl | tee ../LoggerFiles/DesignCompilerS.log

\rm -rf ~/synopsys_cache_G-2012.06


