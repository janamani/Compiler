module SARTimer5Verilog(StateP, SAROut, ClockT, Reset,
     Inc, Dcr, Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG,
     SAROutDG, SAROutCG, ClockDcr, ClockInc, ClockTck, DataOut,
     TimerOut, SAROutI, SAROutD, SAROutC);
  input [1:0] StateP;
  input [7:0] SAROut;
  input ClockT, Reset, Inc, Dcr;
  output Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  output [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  output [4:0] TimerOut;
  wire [1:0] StateP;
  wire [7:0] SAROut;
  wire ClockT, Reset, Inc, Dcr;
  wire Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  wire [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  wire [4:0] TimerOut;
  wire [4:0] TempTMR;
  wire N0, N1, N2, N3, N6, N7, N11, N12;
  wire N14, N15, N16, N17, N18, N19, N20, N21;
  wire N22, N23, N24, N25, N27, N28, N29, N31;
  wire N32, N33, N35, N36, N37, N39, N41, N42;
  wire N43, N44, N45, N47, N48, N49, N50, N51;
  wire N52, N53, N54, N55, N56, N57, N58, N59;
  wire N61, N62, N64, N66, N70, N72, N73, N75;
  wire N78, N80, N81, N83, N104, N105, N115, N117;
  wire N118, N119, N120, N121, N162, N170, N183, N190;
  wire N193, N206, N219, N225, N226, N229, N236, N244;
  wire N250, N266, N276, N277, N278, N279, N290, N297;
  wire N302, N319, N321, N324, N325, N330, N331, N332;
  wire N333, N334, N335, N336, N366, N370, N371, N399;
  wire N416, N417, N418, N419;


  BUF4 g200(.I(ClockDcr), .O(ClockTck));
  BUF4 g201(.I(ClockDcr), .O(ClockInc));
  BUF4 g202(.I(ResetN), .O(SAROutCG));
  BUF4 g203(.I(ResetN), .O(SAROutDG));
  BUF4 g204(.I(ResetN), .O(SAROutIG));
  BUF4 g205(.I(SAROutIS), .O(SAROutDS));
  BUF4 g206(.I (ResetP), .O (SAROutIS));
  INV1S g431(.I (N6), .O (N105));
  INV1S g426(.I (N119), .O (N104));
  BUF4 g444(.I (N162), .O (SAROutI[7]));
  BUF4 g443(.I (N170), .O (SAROutD[7]));
  BUF1CK g442(.I (Reset), .O (ResetP));
  INV3 g509(.I (StateP[0]), .O (N83));
  QDFFRBS Ready_reg(.RB (ResetN), .CK (ClockT), .D (N276), .Q (Ready));
  ND2 g495(.I1 (N80), .I2 (TempTMR[4]), .O (N81));
  NR3P g496(.I1 (ClockT), .I2 (ResetP), .I3 (N78), .O (ClockDcr));
  INV1S g497(.I (N80), .O (N117));
  AN4 g510(.I1 (TempTMR[0]), .I2 (TempTMR[2]), .I3 (TempTMR[3]), .I4
       (TempTMR[1]), .O (N80));
  DFFSBN \SAROutC_reg[0] (.SB (ResetN), .CK (ClockT), .D (N7), .Q
       (SAROutC[0]));
  DFFSBN \SAROutC_reg[1] (.SB (ResetN), .CK (ClockT), .D (N6), .Q
       (SAROutC[1]));
  DFFSBT \SAROutC_reg[7] (.SB (ResetN), .CK (ClockT), .D (N266), .Q
       (SAROutC[7]));
  DFFSBN \SAROutC_reg[6] (.SB (ResetN), .CK (ClockT), .D (N115), .Q 
		 (SAROutC[6]));
  DFFSBN \SAROutC_reg[5] (.SB (ResetN), .CK (ClockT), .D (N118), .Q
       (SAROutC[5]));
  DFFSBN \SAROutC_reg[4] (.SB (ResetN), .CK (ClockT), .D (N119), .Q
       (SAROutC[4]));
  DFFSBN \SAROutC_reg[3] (.SB (ResetN), .CK (ClockT), .D (N120), .Q
       (SAROutC[3]));
  DFFSBN \SAROutC_reg[2] (.SB (ResetN), .CK (ClockT), .D (N121), .Q
       (SAROutC[2]));
  NR2 g512(.I1 (N330), .I2 (N333), .O (N78));
  INV1 g513(.I (SAROut[3]), .O (N120));
  INV1S g514(.I (SAROut[4]), .O (N119));
  INV2 g516(.I (ResetP), .O (ResetN));
  INV1S g518(.I (SAROut[5]), .O (N118));
  INV1S g519(.I (SAROut[2]), .O (N121));
  INV1S g521(.I (SAROut[6]), .O (N115));
  DFFSBN \SAROutD_reg[7] (.SB (ResetN), .CK (ClockT), .D (N417), .Q
       (N170));
  DFFSBT \SAROutD_reg[6] (.SB (ResetN), .CK (ClockT), .D (N75), .Q
       (SAROutD[6]));
  ND3 g1361(.I1 (N399), .I2 (N324), .I3 (N18), .O (N75));
  DFFSBP \SAROutD_reg[5] (.SB (ResetN), .CK (ClockT), .D (N73), .Q
       (SAROutD[5]));
  ND2P g1364(.I1 (N72), .I2 (N324), .O (N73));
  AOI22S g1366(.A1 (N244), .A2 (N190), .B1 (N193), .B2 (SAROutD[5]), .O
       (N72));
  DFFSBN \SAROutD_reg[4] (.SB (ResetN), .CK (ClockT), .D (N70), .Q
       (SAROutD[4]));
  ND2 g1369(.I1 (N279), .I2 (N324), .O (N70));
  DFFSBN \SAROutD_reg[3] (.SB (ResetN), .CK (ClockT), .D (N66), .Q
       (SAROutD[3]));
  ND2 g1375(.I1 (N64), .I2 (N324), .O (N66));
  AOI22S g1377(.A1 (N190), .A2 (N57), .B1 (N193), .B2 (SAROutD[3]), .O
       (N64));
  DFFSBN \SAROutD_reg[2] (.SB (ResetN), .CK (ClockT), .D (N61), .Q
       (SAROutD[2]));
  QDFFRBN \TempTMR_reg[3] (.RB (ResetN), .CK (ClockT), .D (N62), .Q
       (TempTMR[3]));
  DFFSBN \SAROutI_reg[1] (.SB (ResetN), .CK (ClockT), .D (N56), .Q
       (SAROutI[1]));
  DFFSBN \SAROutI_reg[2] (.SB (ResetN), .CK (ClockT), .D (N55), .Q
       (SAROutI[2]));
  DFFSBN \SAROutI_reg[3] (.SB (ResetN), .CK (ClockT), .D (N54), .Q
       (SAROutI[3]));
  DFFSBN \SAROutI_reg[4] (.SB (ResetN), .CK (ClockT), .D (N53), .Q
       (SAROutI[4]));
  DFFSBP \SAROutI_reg[5] (.SB (ResetN), .CK (ClockT), .D (N52), .Q
       (SAROutI[5]));
  DFFSBT \SAROutI_reg[6] (.SB (ResetN), .CK (ClockT), .D (N51), .Q
       (SAROutI[6]));
  DFFSBN \SAROutI_reg[7] (.SB (ResetN), .CK (ClockT), .D (N50), .Q
       (N162));
  DFFSBN \SAROutI_reg[0] (.SB (ResetN), .CK (ClockT), .D (N59), .Q
       (SAROutI[0]));
  NR2 g1389(.I1 (N58), .I2 (N276), .O (N62));
  ND2 g1390(.I1 (N49), .I2 (N324), .O (N61));
  QDFFRBP \TempTMR_reg[2] (.RB (ResetN), .CK (ClockT), .D (N48), .Q
       (TempTMR[2]));
  ND2 g1393(.I1 (N47), .I2 (N45), .O (N59));
  XNR2HS g1394(.I1 (TempTMR[3]), .I2 (N0), .O (N58));
  MOAI1S g1395(.A1 (N36), .A2 (SAROut[3]), .B1 (N36), .B2 (SAROut[3]),
       .O (N57));
  MOAI1 g1396(.A1 (N44), .A2 (N105), .B1 (N183), .B2 (SAROutI[1]), .O
       (N56));
  MOAI1 g1397(.A1 (N44), .A2 (SAROut[2]), .B1 (N183), .B2 (SAROutI[2]),
       .O (N55));
  MOAI1 g1398(.A1 (N44), .A2 (SAROut[3]), .B1 (N183), .B2 (SAROutI[3]),
       .O (N54));
  MOAI1 g1399(.A1 (N44), .A2 (N104), .B1 (N183), .B2 (SAROutI[4]), .O
       (N53));
  MOAI1 g1400(.A1 (N44), .A2 (SAROut[5]), .B1 (N183), .B2 (SAROutI[5]),
       .O (N52));
  MOAI1 g1401(.A1 (N44), .A2 (SAROut[6]), .B1 (N183), .B2 (SAROutI[6]),
       .O (N51));
  MOAI1 g1402(.A1 (N44), .A2 (SAROut[7]), .B1 (N183), .B2 (N162), .O
       (N50));
  AOI22S g1403(.A1 (N190), .A2 (N416), .B1 (N183), .B2 (SAROutD[2]), .O
       (N49));
  DFFSBN \SAROutD_reg[1] (.SB (ResetN), .CK (ClockT), .D (N42), .Q
       (SAROutD[1]));
  NR2 g1405(.I1 (N39), .I2 (N276), .O (N48));
  ND2S g1406(.I1 (N43), .I2 (N7), .O (N47));
  AOI22S g1408(.A1 (N371), .A2 (N190), .B1 (N193), .B2 (SAROutI[0]), .O
       (N45));
  DFFSBN \SAROutD_reg[0] (.SB (ResetN), .CK (ClockT), .D (N41), .Q
       (SAROutD[0]));
  INV3 g1410(.I (N43), .O (N44));
  NR2P g1411(.I1 (N371), .I2 (N193), .O (N43));
  ND2 g1412(.I1 (N37), .I2 (N324), .O (N42));
  QDFFRBN \TempTMR_reg[1] (.RB (ResetN), .CK (ClockT), .D (N35), .Q
       (TempTMR[1]));
  ND2 g1414(.I1 (N24), .I2 (N324), .O (N41));
  XOR2HS g1416(.I1 (TempTMR[2]), .I2 (N16), .O (N39));
  AOI22S g1418(.A1 (N190), .A2 (N29), .B1 (N183), .B2 (SAROutD[1]), .O
       (N37));
  QDFFRBN \TempTMR_reg[4] (.RB (ResetN), .CK (ClockT), .D (N32), .Q
       (TempTMR[4]));
  NR2F g1420(.I1 (SAROut[2]), .I2 (N15), .O (N36));
  NR2 g1422(.I1 (N1), .I2 (N276), .O (N35));
  ND3 g1424(.I1 (N28), .I2 (SAROut[3]), .I3 (SAROut[2]), .O (N33));
  DFZSBN \DataOut_reg[0] (.SB (ResetN), .CK (ClockT), .D (DataOut[0]),
       .TD (SAROut[0]), .SEL (N335), .Q (DataOut[0]));
  QDFZRBN \DataOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (SAROut[2]),
       .TD (DataOut[2]), .SEL (N290), .Q (DataOut[2]));
  QDFZRBN \DataOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (SAROut[3]),
       .TD (DataOut[3]), .SEL (N236), .Q (DataOut[3]));
  QDFZRBN \DataOut_reg[4] (.RB (ResetN), .CK (ClockT), .D (SAROut[4]),
       .TD (DataOut[4]), .SEL (N236), .Q (DataOut[4]));
  QDFZRBN \DataOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (SAROut[1]),
       .TD (DataOut[1]), .SEL (N236), .Q (DataOut[1]));
  QDFZRBN \DataOut_reg[6] (.RB (ResetN), .CK (ClockT), .D (SAROut[6]),
       .TD (DataOut[6]), .SEL (N290), .Q (DataOut[6]));
  QDFZRBN \DataOut_reg[5] (.RB (ResetN), .CK (ClockT), .D (SAROut[5]),
       .TD (DataOut[5]), .SEL (N236), .Q (DataOut[5]));
  QDFZRBN \DataOut_reg[7] (.RB (ResetN), .CK (ClockT), .D (SAROut[7]),
       .TD (DataOut[7]), .SEL (N290), .Q (DataOut[7]));
  QDFFRBN \TimerOut_reg[0] (.RB (ResetN), .CK (ClockT), .D (N22), .Q
       (TimerOut[0]));
  QDFFRBN \TimerOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (N23), .Q
       (TimerOut[1]));
  QDFFRBN \TimerOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (N21), .Q
       (TimerOut[2]));
  QDFFRBN \TimerOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (N20), .Q
       (TimerOut[3]));
  QDFFRBN \TimerOut_reg[4] (.RB (ResetN), .CK (ClockT), .D (N19), .Q
       (TimerOut[4]));
  NR2 g1438(.I1 (N25), .I2 (N276), .O (N32));
  ND3 g1439(.I1 (N27), .I2 (N12), .I3 (N11), .O (N31));
  HA1 g1441(.A (SAROut[0]), .B (SAROut[1]), .S (N29), .C (N28));
  QDFFRBP \TempTMR_reg[0] (.RB (ResetN), .CK (ClockT), .D (N2), .Q
       (TempTMR[0]));
  NR3 g1444(.I1 (SAROut[7]), .I2 (SAROut[6]), .I3 (SAROut[1]), .O
       (N27));
  XOR2HS g1446(.I1 (TempTMR[4]), .I2 (N117), .O (N25));
  AOI22S g1447(.A1 (N193), .A2 (SAROutD[0]), .B1 (N190), .B2
       (SAROut[0]), .O (N24));
  MUX2 g1448(.S (N276), .A (TimerOut[1]), .B (TempTMR[1]), .O (N23));
  MUX2 g1449(.S (N276), .A (TimerOut[0]), .B (TempTMR[0]), .O (N22));
  MUX2 g1450(.S (N276), .A (TimerOut[2]), .B (TempTMR[2]), .O (N21));
  MUX2 g1451(.S (N276), .A (TimerOut[3]), .B (TempTMR[3]), .O (N20));
  MUX2 g1452(.S (N276), .A (TimerOut[4]), .B (TempTMR[4]), .O (N19));
  ND2S g1454(.I1 (N183), .I2 (SAROutD[6]), .O (N18));
  ND2S g1455(.I1 (N183), .I2 (N170), .O (N17));
  ND2 g1456(.I1 (TempTMR[1]), .I2 (TempTMR[0]), .O (N16));
  ND2T g1457(.I1 (N7), .I2 (N6), .O (N15));
  AN2S g1458(.I1 (SAROut[4]), .I2 (SAROut[7]), .O (N14));
  NR2 g1460(.I1 (SAROut[4]), .I2 (SAROut[5]), .O (N12));
  NR2 g1461(.I1 (SAROut[3]), .I2 (SAROut[2]), .O (N11));
  INV2 g1467(.I (SAROut[0]), .O (N7));
  INV2 g1469(.I (SAROut[1]), .O (N6));
  XOR2 g2(.I1 (SAROut[6]), .I2 (N226), .O (N3));
  OR2B1S g1480(.I1 (N276), .B1 (TempTMR[0]), .O (N2));
  XNR2HS g1481(.I1 (TempTMR[1]), .I2 (TempTMR[0]), .O (N1));
  AN2B1S g1482(.I1 (TempTMR[2]), .B1 (N16), .O (N0));
  BUF6 fopt1484(.I (N193), .O (N183));
  INV3 fopt1488(.I (N193), .O (N190));
  OR2S g1494(.I1 (N276), .I2 (N370), .O (N206));
  INV4 g1507(.I (StateP[1]), .O (N219));
  ND2 g1512(.I1 (N225), .I2 (N36), .O (N226));
  NR3 g1513(.I1 (SAROut[3]), .I2 (SAROut[5]), .I3 (SAROut[4]), .O
       (N225));
  NR2P g1514(.I1 (SAROut[4]), .I2 (N277), .O (N229));
  INV4CK fopt1521(.I (N334), .O (N236));
  XNR2HS g1526(.I1 (N229), .I2 (SAROut[5]), .O (N244));
  OAI12H g1531(.A1 (N219), .B1 (Dcr), .B2 (Inc), .O (N250));
  INV1S g80(.I (SAROut[7]), .O (N266));
  ND2T g25(.I1 (N81), .I2 (N302), .O (N276));
  AOI22S g69(.A1 (N190), .A2 (N278), .B1 (N193), .B2 (SAROutD[4]), .O
       (N279));
  XOR2HS g70(.I1 (N277), .I2 (SAROut[4]), .O (N278));
  ND2P g71(.I1 (N36), .I2 (N120), .O (N277));
  INV2CK g132(.I (N335), .O (N290));
  INV1S g121(.I (Reset), .O (N297));
  ND3 g113(.I1 (N325), .I2 (N366), .I3 (N297), .O (N302));
  INV6 g108(.I (N321), .O (N193));
  BUF2 g110(.I (N336), .O (N321));
  ND2P g1542(.I1 (StateP[1]), .I2 (StateP[0]), .O (N319));
  OR2P g106(.I1 (N193), .I2 (N31), .O (N324));
  ND2T g107(.I1 (N336), .I2 (N250), .O (N325));
  INV1S g1545(.I (N319), .O (N330));
  AOI12H g38(.A1 (N332), .B1 (N325), .B2 (N297), .O (N333));
  BUF4CK g41(.I (N331), .O (N332));
  ND2F g42(.I1 (N219), .I2 (N83), .O (N331));
  INV3 g39(.I (N332), .O (N334));
  INV4 g40(.I (N332), .O (N335));
  ND2T g37(.I1 (N331), .I2 (N319), .O (N336));
  DFFRBN FlagTMR_reg(.RB (ResetN), .CK (ClockT), .D (N206), .QB (N366));
  AN2B1S g1567(.I1 (N325), .B1 (Reset), .O (N370));
  AN4B1 g1568(.I1 (N14), .I2 (SAROut[5]), .I3 (SAROut[6]), .B1 (N33),
       .O (N371));
  OR2B1S g1579(.I1 (N183), .B1 (N3), .O (N399));
  XOR2 g1588(.I1 (N15), .I2 (SAROut[2]), .O (N416));
  ND2 g1589(.I1 (N419), .I2 (N17), .O (N417));
  ND2 g1590(.I1 (N418), .I2 (N190), .O (N419));
  OAI12S g1591(.A1 (SAROut[7]), .B1 (SAROut[6]), .B2 (N226), .O (N418));
endmodule

