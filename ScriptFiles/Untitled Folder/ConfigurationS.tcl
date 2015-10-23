#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/           Parameters that you will want to set for each design          #/ 
#/-------------------------------------------------------------------------#/
set  LIBPATH /Cad/DesignK/FaradayUMC180/DigitalCore 
set  TLFB $LIBPATH/FrontEnd/synopsys/fsa0a_c_generic_core_ff1p98vm40c.lib
set  TLFW $LIBPATH/FrontEnd/synopsys/fsa0a_c_generic_core_ss1p62v125c.lib
set  TLFT $LIBPATH/FrontEnd/synopsys/fsa0a_c_generic_core_tt1p8v25c.lib
set  LEFA $LIBPATH/BackEnd/lef/header6_V55.lef
set  LEFB $LIBPATH/BackEnd/lef/fsa0a_c_generic_core.lef
set  NETLIST ../OutputFiles/SARSLOWDC.v
set  TIMINGCON ../OutputFiles/SARSLOW.sdc
set  TOPLEVEL SARSLOW
set  POWERNET VCC
set  GROUNDNET GND
#/*************************************************************************#/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
set  rda_Input(ui_topcell) "$TOPLEVEL"
set  rda_Input(ui_netlist) "$NETLIST"
set  rda_Input(ui_timingcon_file) "$TIMINGCON"
set  rda_Input(ui_leffile) "$LEFA $LEFB"
set  rda_Input(ui_timelib,min) "$TLFB"
set  rda_Input(ui_timelib,max) "$TLFW"
set  rda_Input(ui_timelib) "$TLFT"
set  rda_Input(ui_pwrnet) "$POWERNET"
set  rda_Input(ui_gndnet) "$GROUNDNET"
set  rda_Input(ui_row_height) "5.04"
#/*************************************************************************#/
set  rda_Input(ui_netlisttype) {Verilog}
set  rda_Input(ui_settop) {1}
set  rda_Input(ui_core_cntl) {aspect}
set  rda_Input(ui_isOrigCenter) {0}
set  rda_Input(ui_delay_limit) {1000}
set  rda_Input(ui_net_delay) {1000.0ps}
set  rda_Input(ui_net_load) {0.5pf}
set  rda_Input(ui_in_tran_delay) {120.0ps}
set  rda_Input(ui_defcap_scale) {1.0}
set  rda_Input(ui_detcap_scale) {1.0}
set  rda_Input(ui_xcap_scale) {1.0}
set  rda_Input(ui_detres_scale) {1.0}
set  rda_Input(ui_defres_scale) {1.0}
set  rda_Input(ui_res_scale) {1.0}
set  rda_Input(ui_shr_scale) {1.0}
set  rda_Input(ui_rel_c_thresh) {0.03}
set  rda_Input(ui_tot_c_thresh) {5.0}
set  rda_Input(ui_cpl_c_thresh) {3.0}
set  rda_Input(ui_time_unit) {none}
set  rda_Input(ui_isVerticalRow) {0}
set  rda_Input(flip_first) {1}
set  rda_Input(double_back) {1}
set  rda_Input(assign_buffer) {1}
set  rda_Input(use_io_row_flow) {0}
set  rda_Input(ui_isHorTrackHalfPitch) {0}
set  rda_Input(ui_isVerTrackHalfPitch) {1}
set  rda_Input(ui_ioOri) {R0}
set  rda_Input(import_mode) {-treatUndefinedCellAsBbox 0 -keepEmptyModule 1}
#/*************************************************************************#/
