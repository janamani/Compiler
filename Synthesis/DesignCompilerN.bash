#!/bin/bash 

\rm -rf ../WorkLibrary/Synthesis

\design_vision -f ../ScriptFiles/DesignCompilerN.tcl | tee ../LoggerFiles/DesignCompilerN.log

\rm -rf ~/synopsys_cache_G-2012.06
