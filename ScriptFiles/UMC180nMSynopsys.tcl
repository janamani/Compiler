#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/         Here you can describe default libraries & Path Settings         #/
#/-------------------------------------------------------------------------#/
set  designer "Janamani Chandram Ayyangalam"
set  company  "Indian Institutre of Technology - Bombay"
set  LIBPATH /Cad/DesignK/FaradayUMC180/DigitalCore/FrontEnd/synopsys/
set  search_path [list . ${LIBPATH} ]
set  search_path [concat $search_path ../SourceFiles ../OutputFiles ]
set  alib_library_analysis_path ${LIBPATH}
set  symbol_library [list fsa0a_c_generic_core.sdb]
set  target_library [list fsa0a_c_generic_core_ss1p62v125c.db]
set  synthetic_library [list dw_foundation.sldb]
set  link_library [concat  [list  "*"] $target_library $synthetic_library]
set  sh_command_log_file "../LoggerFiles/DesignCompilerF.log"
define_design_lib WORK -path ../WorkLibrary/Synthesis
set  verilogout_show_unconnected_pins "true"
set  hdlin_check_no_latch "true"
#/**************************************************************************/
