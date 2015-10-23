#/*************************************************************************#/
#/           Author: Janamani Chandram Ayyangalam, IIT-Bombay              #/
#/       Contact Info: janamani.chandram@gmail.com, Ph: 09757404734        #/
#/*************************************************************************#/
#/           Parameters that you will want to set for each design          #/ 
#/-------------------------------------------------------------------------#/
export SPIPATH=/Cad/DesignK/FaradayUMC180/DigitalCore/BackEnd/lvs
export SPIFILE=$SPIPATH/fsa0a_c_generic_core.spi
export NETLIST=../OutputFiles/SARTimerVerilog.v										
export LVSFILE=../OutputFiles/SARTimerVerilog.spi
export SCSTEMP=../ReportFiles/SARTimerVerilog.spi
export SCSFILE=../OutputFiles/SARTimerVerilog.scs
export SPPLOG=../LoggerFiles/SPPT.log
export V2LVSLOG=../LoggerFiles/V2LVST.log
export V2SCSLOG=../LoggerFiles/V2SCST.log
export POWERNET=VCC
export GROUNDNET=GND
#/*************************************************************************#/
#/                Below here shouldn't need to be changed...               #/
#/-------------------------------------------------------------------------#/
v2lvs -lsp $SPIFILE -o $LVSFILE -s $SPIFILE -s0 $GROUNDNET -s1 $POWERNET -v $NETLIST -sk -log $V2LVSLOG
v2lvs -i -lsp $SPIFILE -o $SCSTEMP -s $SPIFILE -s0 $GROUNDNET -s1 $POWERNET -v $NETLIST -sk -log $V2SCSLOG
spp -convert < $SCSTEMP > $SCSFILE -log $SPPLOG	
#/*************************************************************************#/
# Modifications in Spectre Netlist to use in SCASubCkt
#	 Comment "global 0 gnd vcc" line
#    Comment "aliasGnd ( gnd 0 ) vsource type=dc dc=0" line
#    Change file Exttention from "spi" to "scs"
#	 Change vcc to vdd! in Model scs file
#    Change gnd to 0 in model scs file
#/*************************************************************************#/

