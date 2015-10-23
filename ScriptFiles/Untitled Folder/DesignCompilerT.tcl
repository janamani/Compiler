#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
sh date
source -echo -verbose ../ScriptFiles/TechnologyT.tcl
source -echo -verbose ../ScriptFiles/RTLSourceListT.tcl
analyze -format $HDLFORMAT -lib WORK $HDLFILES
elaborate  $TOPLEVEL -lib WORK -update
current_design $TOPLEVEL
link
uniquify
source -echo -verbose ../ScriptFiles/ConstraintsT.tcl
set_fix_multiple_port_nets -all -buffer_constants
compile -map_effort medium
compile -incremental_mapping -map_effort high  
check_design                                
change_names -rules verilog -hier -verbose
define_name_rules CAPS -allowed "a-z A-Z 0-9" -first_restricted "a-z 0-9"                                  
change_names -rules CAPS -hier -verbose
#/*************************************************************************#/
report_net > ../ReportFiles/${TOPLEVEL}Net.rpt
report_qor > ../ReportFiles/${TOPLEVEL}Quality.rpt
report_area > ../ReportFiles/${TOPLEVEL}Area.rpt
report_cell > ../ReportFiles/${TOPLEVEL}Cell.rpt
report_port > ../ReportFiles/${TOPLEVEL}Port.rpt
report_power > ../ReportFiles/${TOPLEVEL}Power.rpt
check_design > ../ReportFiles/${TOPLEVEL}CheckDesign.rpt
report_design > ../ReportFiles/${TOPLEVEL}ReportDesign.rpt
report_clock_gating > ../ReportFiles/${TOPLEVEL}Gating.rpt
report_reference > ../ReportFiles/${TOPLEVEL}Reference.rpt
report_constraint -all_violators > ../ReportFiles/${TOPLEVEL}Violators.rpt
report_timing -nets -cap -transition > ../ReportFiles/${TOPLEVEL}Timing.rpt
#/*************************************************************************#/
write_sdc ../OutputFiles/$TOPLEVEL.sdc
write_sdf ../OutputFiles/$TOPLEVEL.sdf
write -format ddc -hierarchy -output ../OutputFiles/$TOPLEVEL.ddc
write -format verilog -hierarchy -output ../OutputFiles/${TOPLEVEL}DC.v
sh date
#/*************************************************************************#/
