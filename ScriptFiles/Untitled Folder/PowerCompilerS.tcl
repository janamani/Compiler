#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/           Parameters that you will want to set for each design          #/ 
#/-------------------------------------------------------------------------#/
set TOPLEVEL SARSLOW
set TOPLEVELTEST SARSLOWT
set TESTBENCH ../SourceFiles/SARSLOWT.v
set ENDTIME 1000
#/*************************************************************************#/
source ../OutputFiles/$TOPLEVEL.dat
setExtractRCMode -detail -assumeMetFill -noReduce
extractRC
read_activity_file ../OutputFiles/$TOPLEVEL.vcd -vcd_block $TOPLEVEL \
                   -format VCD -vcd_scope $TOPLEVELTEST -start 0 -end $ENDTIME
propagate_activity
report_power -outfile ../ReportFiles/${TOPLEVEL}Power.vcdrpt
eport_power -instances {*} -outfile ../ReportFiles/${TOPLEVEL}InstPower.vcdrpt
#/*************************************************************************#/
    
    
    
