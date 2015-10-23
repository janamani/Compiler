#/**************************************************************************/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              */
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        */
#/**************************************************************************/
#/           Parameters that you will want to set for each design          #/ 
#/-------------------------------------------------------------------------#/
export TOPLEVEL=SARImprVerilog
export BACKUPFOLDER=../BackupFiles/
#/**************************************************************************/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
\rm -rf ../LoggerFilesSF/*.*
\rm -rf ../ReportFilesSF/${TOPLEVEL}.*
\rm -rf ../Synthesis/fv
#/**************************************************************************/
