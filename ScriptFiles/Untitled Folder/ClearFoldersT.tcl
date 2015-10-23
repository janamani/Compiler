#/**************************************************************************/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              */
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        */
#/**************************************************************************/
#/           Parameters that you will want to set for each design          #/ 
#/-------------------------------------------------------------------------#/
export TOPLEVEL=SARFAST
export BACKUPFOLDER=../BackupFilesSF/
#/**************************************************************************/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
\rm -rf ../SynthesisSF/default.svf
\rm -rf ../WorkLibrarySF/Synthesis
\rm -rf ../LoggerFilesSF/DesignCompilerSF.log
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Net.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Port.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Area.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Cell.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Power.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Design.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Gating.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Timing.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Quality.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Reference.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Violators.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_CheckDesign.rpt
\cp -rf ../OutputFilesSF/${TOPLEVEL}.sdc $BACKUPFOLDER
\cp -rf ../OutputFilesSF/${TOPLEVEL}.ddc $BACKUPFOLDER
\cp -rf ../OutputFilesSF/${TOPLEVEL}.sdf $BACKUPFOLDER
\cp -rf ../OutputFilesSF/${TOPLEVEL}DC.v $BACKUPFOLDER
#/**************************************************************************/
\rm -rf ../SimulationSF/vsim.wlf
\rm -rf ../SimulationSF/transcript
\rm -rf ../WorkLibrarySF/Simulation
\cp -rf ../OutputFilesSF/${TOPLEVEL}.vcd $BACKUPFOLDER
#/**************************************************************************/
\rm -rf ../PlaceRouteSF/cts.rguide
\rm -rf ../PlaceRouteSF/encounter.cmd
\rm -rf ../PlaceRouteSF/encounter.log
\rm -rf ../PlaceRouteSF/${TOPLEVEL}.ctsrpt
\rm -rf ../PlaceRouteSF/${TOPLEVEL}.cts_trace
\rm -rf ../LoggerFilesSF/PlacenRoute.log
\rm -rf ../LoggerFilesSF/PlacenRoute.log.cmdlog
\rm -rf ../ReportFilesSF/${TOPLEVEL}.ctsrpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Power.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Summary.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Geometry.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_GateCount.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_ClockTree.rpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_Connectivity.rpt
\rm -rf ../OutputFilesSF/${TOPLEVEL}.fp
\rm -rf ../OutputFilesSF/${TOPLEVEL}.fp.spr
\rm -rf ../OutputFilesSF/${TOPLEVEL}.ctstch
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Final.def
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Final.enc
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Final.lib
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Final.sdf
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Final.spef
\rm -rf ../OutputFilesSF/${TOPLEVEL}_PostCTS.enc
\rm -rf ../OutputFilesSF/${TOPLEVEL}_PowerPlan.enc
\rm -rf ../OutputFilesSF/${TOPLEVEL}_FloorPlan.enc
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Placement.enc
\rm -rf ../PlaceRouteSF/timingReports
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Final
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Timing
\rm -rf ../ReportFilesSF/${TOPLEVEL}_PreCTSOpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_PostCTSOpt
\rm -rf ../ReportFilesSF/${TOPLEVEL}_postRouteOpt
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Final.enc.dat
\rm -rf ../OutputFilesSF/${TOPLEVEL}_PostCTS.enc.dat
\rm -rf ../OutputFilesSF/${TOPLEVEL}_PowerPlan.enc.dat
\rm -rf ../OutputFilesSF/${TOPLEVEL}_FloorPlan.enc.dat
\rm -rf ../OutputFilesSF/${TOPLEVEL}_Placement.enc.dat
\cp -rf ../OutputFilesSF/${TOPLEVEL}.v $BACKUPFOLDER
\cp -rf ../OutputFilesSF/${TOPLEVEL}.gds $BACKUPFOLDER
#/**************************************************************************/
\rm -rf ../LoggerFilesSF/SPP.log
\rm -rf ../LoggerFilesSF/V2LVS.log
\rm -rf ../LoggerFilesSF/V2SCS.log
\rm -rf ../NetlistConvSF/SPP.map
\rm -rf ../NetlistConvSF/v2lvs.log
\cp -rf ../OutputFilesSF/${TOPLEVEL}.scs $BACKUPFOLDER
\cp -rf ../OutputFilesSF/${TOPLEVEL}.spi $BACKUPFOLDER
#/**************************************************************************/
\rm -rf ../*~
\rm -rf ../LoggerFilesSF/*~
\rm -rf ../SynthesisSF/*~
\rm -rf ../PowerPlanSF/*~
\rm -rf ../SimulationSF/*~
\rm -rf ../NetlistConvSF/*~
\rm -rf ../OutputFilesSF/*~
\rm -rf ../ReportFilesSF/*~
\rm -rf ../ScriptFilesSF/*~
\rm -rf ../SourceFilesSF/*~
\rm -rf ../BackupFilesSF/*~
#/**************************************************************************/
