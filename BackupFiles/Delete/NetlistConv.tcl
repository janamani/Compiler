v2lvs -i -lsp /Cad/DesignK/FaradayUMC180/DigitalCore/BackEnd/lvs/fsa0a_c_generic_core.spi -o ./SARFastVerilog.spi -s /Cad/DesignK/FaradayUMC180/DigitalCore/BackEnd/lvs/fsa0a_c_generic_core.spi -s0 GND -s1 VCC -v ./SARTimer8.v -sk -log ./V2SCS.log

spp -convert < ./SARFastVerilog.spi > ./SARTimer8.scs -log SPP.log

