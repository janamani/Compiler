#!/bin/bash 

\rm -rf ../WorkLibrary/Synthesis

\design_vision -f ../ScriptFiles/DesignCompiler.tcl | tee ../LoggerFiles/DesignCompiler.log

\rm -rf ~/synopsys_cache_G-2012.06
