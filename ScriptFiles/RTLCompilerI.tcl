#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
date
source -verbose ../ScriptFiles/UMC180nMCadence.tcl
source -verbose ../ScriptFiles/RTLSourceListI.tcl									
set_attribute lib_search_path $LIBPATH
set_attribute library $LIBRARY
read_hdl $HDLFORMATRC -top $TOPLEVEL $HDLFILES
elaborate -parameter $PARAMETER $TOPLEVEL
check_design -all > ../ReportFiles/$TOPLEVEL.precheck
read_sdc ../SourceFiles/$TOPLEVEL.sdc
synthesize -to_mapped -effort high 
synthesize -incremental
change_names -verilog -restricted "n_" -replace_str "N" \
				 -log_changes ../ReportFiles/$TOPLEVEL.names
write_hdl -mapped > ../OutputFiles/$TOPLEVEL.v
report qor > ../ReportFiles/$TOPLEVEL.qor
report area > ../ReportFiles/$TOPLEVEL.area
report power > ../ReportFiles/$TOPLEVEL.power
report timing > ../ReportFiles/$TOPLEVEL.timing
report messages > ../ReportFiles/$TOPLEVEL.messages
check_design -all > ../ReportFiles/$TOPLEVEL.postcheck
#/*************************************************************************#/
