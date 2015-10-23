#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
date
source -verbose ../ScriptFiles/UMC180nMCadence.tcl
set HDLFILES [list ./Timer.v]
set HDLFORMATRC -v2001
set HDLFORMATDC verilog
set TOPLEVEL SARTimerVerilog
set PARAMETER [list 4]							
set_attribute lib_search_path $LIBPATH
set_attribute library $LIBRARY
read_hdl $HDLFORMATRC -top $TOPLEVEL $HDLFILES
elaborate -parameter $PARAMETER $TOPLEVEL
read_sdc ./Timer.sdc
synthesize -to_mapped -effort high 
synthesize -incremental
change_names -verilog -restricted "n_" -replace_str "N" \
				 -log_changes ../ReportFiles/$TOPLEVEL.names
write_hdl -mapped > ./$TOPLEVEL.v
#/*************************************************************************#/
