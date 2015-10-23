#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
source ../ScriptFilesSF/FrameworkSF.tcl
loadConfig ../ScriptFilesSF/ConfigurationSF.tcl 0
commitConfig
#/*************************************************************************#/
setDrawView fplan
floorPlan -r $ASPECT $PERCENT $COREGAP $COREGAP $COREGAP $COREGAP
fit
saveFPlan  ../OutputFilesSF/${TOPLEVEL}.fp
saveDesign ../OutputFilesSF/${TOPLEVEL}_FloorPlan.enc
#/*************************************************************************#/
addRing -spacing_bottom $PSPACE -spacing_top $PSPACE -spacing_right $PSPACE \
	-spacing_left $PSPACE -width_left $PWIDTH -width_bottom $PWIDTH \
	-width_top $PWIDTH -width_right $PWIDTH -layer_bottom $METALFIVE \
	-layer_top $METALFIVE -layer_right $METALSIX -around core \
	-layer_left $METALSIX -nets "${GROUNDNET} ${POWERNET}" -center 1 
setAddStripeOption -remove_floating_stripe_over_block 0
addStripe -layer $METALSIX -nets "${GROUNDNET} ${POWERNET}" -width $SWIDTH \
	  -snap_wire_center_to_grid Grid -set_to_set_distance $SDISTANCE \
	  -xleft_offset $SOFFSET -spacing $SSPACE
fixMinCutVia
sroute -allowJogging 1
saveDesign ../OutputFilesSF/${TOPLEVEL}_PowerPlan.enc
#/*************************************************************************#/
source ../ScriptFilesSF/PinPlacementSF.tcl
setPlaceMode -placeIoPins true -timingDriven true -wireLenOptEffort high
placeDesign -inPlaceOpt -prePlaceOpt
setDrawView place
trialRoute -highEffort
setOptMode -verbose true -fixDRC true -effort high -congOpt true
optDesign -preCTS -outDir ../ReportFilesSF/${TOPLEVEL}_PreCTSOpt
saveDesign ../OutputFilesSF/${TOPLEVEL}_Placement.enc
#/*************************************************************************#/
createClockTreeSpec -file ../OutputFilesSF/$TOPLEVEL.ctstch
setCTSMode -fixLeafInst true -moveGate true -optAddBuffer true
specifyClockTree -file ../OutputFilesSF/$TOPLEVEL.ctstch
ckSynthesis -forceReconvergent -rguide cts.rguide -fix_added_buffers \
            -report ../ReportFilesSF/$TOPLEVEL.ctsrpt   
trialRoute -highEffort -guide cts.rguide
reportClockTree -report ../ReportFilesSF/${TOPLEVEL}_ClockTree.rpt
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0 
setOptMode -effort high
setOptMode -yieldEffort none 
setOptMode -maxDensity 0.99
setOptMode -drcMargin 0.0
setExtractRCMode -engine detail -reduce 0.0 
optDesign -postCTS -hold -outDir ../ReportFilesSF/${TOPLEVEL}_PostCTSOpt
saveDesign ../OutputFilesSF/${TOPLEVEL}_PostCTS.enc
#/*************************************************************************#/
setNanoRouteMode -drouteUseMultiCutViaEffort high
setNanoRouteMode -droutePostRouteSwapVia multiCut
globalDetailRoute 
globalNetConnect $POWERNET -all -type tiehi
globalNetConnect $POWERNET -all -type net -net VCC
globalNetConnect $GROUNDNET -all -type tielo
globalNetConnect $GROUNDNET -all -type net -net GND
addFiller -cell $FILLERCELLS -prefix ${TOPLEVEL}FILL -util 0.9
optDesign -postRoute -hold -outDir ../ReportFilesSF/${TOPLEVEL}_postRouteOpt
saveDesign ../OutputFilesSF/${TOPLEVEL}_Final.enc
#/*************************************************************************#/
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.5
defOut -floorplan -netlist -routing ../OutputFilesSF/${TOPLEVEL}_Final.def
rcOut -spef ../OutputFilesSF/${TOPLEVEL}_Final.spef
saveNetlist -flat ../OutputFilesSF/${TOPLEVEL}.v
do_extract_model ../OutputFilesSF/${TOPLEVEL}_Final.lib
delayCal -idealclock -sdf ../OutputFilesSF/${TOPLEVEL}_Final.sdf
saveModel -cts -sdf -spef -dir ../OutputFilesSF/${TOPLEVEL}_Final
writeTimingCon -pt -sdc -dir ../OutputFilesSF/${TOPLEVEL}_Timing
streamOut ../OutputFilesSF/${TOPLEVEL}.gds -mapFile $GDSMAPFILE -mode ALL
#/*************************************************************************#/
report_power -outfile ../ReportFilesSF/${TOPLEVEL}_Power.rpt
reportGateCount -outfile ../ReportFilesSF/${TOPLEVEL}_GateCount.rpt
summaryReport -nohtml -outfile ../ReportFilesSF/${TOPLEVEL}_Summary.rpt
verifyGeometry -sameCellViols -report ../ReportFilesSF/${TOPLEVEL}_Geometry.rpt
verifyConnectivity -type all -report ../ReportFilesSF/${TOPLEVEL}_Connectivity.rpt
#/*************************************************************************#/
