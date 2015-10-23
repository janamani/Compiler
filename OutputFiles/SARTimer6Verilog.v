module SARTimer6Verilog(StateP, SAROut, ClockT, Reset,
     Inc, Dcr, Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG,
     SAROutDG, SAROutCG, ClockDcr, ClockInc, ClockTck, DataOut,
     TimerOut, SAROutI, SAROutD, SAROutC);
  input [1:0] StateP;
  input [7:0] SAROut;
  input ClockT, Reset, Inc, Dcr;
  output Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  output [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  output [5:0] TimerOut;
  wire [1:0] StateP;
  wire [7:0] SAROut;
  wire ClockT, Reset, Inc, Dcr;
  wire Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  wire [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  wire [5:0] TimerOut;
  wire [5:0] TempTMR;
  wire N0, N1, N3, N12, N14, N15, N16, N19;
  wire N21, N22, N23, N24, N25, N26, N27, N37;
  wire N39, N40, N43, N45, N46, N48, N49, N50;
  wire N51, N52, N53, N55, N56, N57, N58, N59;
  wire N60, N61, N62, N64, N69, N71, N75, N79;
  wire N83, N117, N118, N122, N125, N129, N170, N178;
  wire N213, N214, N219, N275, N293, N300, N301, N322;
  wire N326, N327, N330, N363, N364, N368, N369, N372;
  wire N373, N382, N383, N384, N386, N389, N390, N391;
  wire N393, N397, N399, N400, N401, N403, N404, N405;
  wire N407, N414, N417, N422, N424, N427, N430, N431;
  wire N435, N436, N438, N440, N444, N446, N449, N453;
  wire N454, N457, N459, N465, N471, N472, N473, N474;
  wire N475, N476, N479, N480, N482, N483, N485, N486;
  wire N495, N496, N497, N498, N501, N502, N510, N511;
  wire N513, N514;

  BUF4 g200(.I(ClockDcr), .O(ClockTck));
  BUF4 g201(.I(ClockDcr), .O(ClockInc));
  BUF4 g202(.I(ResetN), .O(SAROutCG));
  BUF4 g203(.I(ResetN), .O(SAROutDG));
  BUF4 g204(.I(ResetN), .O(SAROutIG));
  BUF4 g205(.I(SAROutIS), .O(SAROutDS));
  BUF4 g206(.I (ResetP), .O (SAROutIS));
  BUF6CK g441(.I (N170), .O (SAROutI[7]));
  BUF6CK g442(.I (N178), .O (SAROutD[7]));
  BUF2 g450(.I (Reset), .O (ResetP));
  INV1S g512(.I (N373), .O (N118));
  QDFFRBS Ready_reg(.RB (ResetN), .CK (ClockT), .D (N327), .Q (Ready));
  NR3T g518(.I1 (ClockT), .I2 (ResetP), .I3 (N83), .O (ClockDcr));
  DFFSBN \SAROutC_reg[0] (.SB (ResetN), .CK (ClockT), .D (N403), .Q
       (SAROutC[0]));
  DFFSBN \SAROutC_reg[1] (.SB (ResetN), .CK (ClockT), .D (N213), .Q
       (SAROutC[1]));
  DFFSBN \SAROutC_reg[7] (.SB (ResetN), .CK (ClockT), .D (N117), .Q
       (N330));
  DFFSBN \SAROutC_reg[6] (.SB (ResetN), .CK (ClockT), .D (N122), .Q 
		 (SAROutC[6]));
  DFFSBN \SAROutC_reg[5] (.SB (ResetN), .CK (ClockT), .D (N369), .Q
       (SAROutC[5]));
  DFFSBN \SAROutC_reg[4] (.SB (ResetN), .CK (ClockT), .D (N125), .Q
       (SAROutC[4]));
  DFFSBN \SAROutC_reg[3] (.SB (ResetN), .CK (ClockT), .D (N12), .Q
       (SAROutC[3]));
  DFFSBN \SAROutC_reg[2] (.SB (ResetN), .CK (ClockT), .D (N453), .Q
       (SAROutC[2]));
  NR2 g523(.I1 (N118), .I2 (N472), .O (N83));
  INV2 g526(.I (ResetP), .O (ResetN));
  INV1S g527(.I (SAROut[4]), .O (N125));
  INV3 g529(.I (SAROut[0]), .O (N129));
  INV1S g530(.I (SAROut[6]), .O (N122));
  INV1S g532(.I (SAROut[7]), .O (N117));
  DFFSBN \SAROutD_reg[7] (.SB (ResetN), .CK (ClockT), .D (N510), .Q
       (N178));
  DFFSBT \SAROutD_reg[6] (.SB (ResetN), .CK (ClockT), .D (N322), .Q
       (SAROutD[6]));
  DFFSBP \SAROutD_reg[5] (.SB (ResetN), .CK (ClockT), .D (N293), .Q
       (SAROutD[5]));
  ND2P g1432(.I1 (N474), .I2 (N465), .O (N79));
  DFFSBN \SAROutD_reg[4] (.SB (ResetN), .CK (ClockT), .D (N75), .Q
       (SAROutD[4]));
  ND2S g1438(.I1 (N483), .I2 (N391), .O (N75));
  DFFSBN \SAROutD_reg[3] (.SB (ResetN), .CK (ClockT), .D (N71), .Q
       (SAROutD[3]));
  ND2 g1444(.I1 (N69), .I2 (N391), .O (N71));
  AOI22S g1446(.A1 (N454), .A2 (N62), .B1 (N457), .B2 (SAROutD[3]), .O
       (N69));
  DFFSBN \SAROutD_reg[2] (.SB (ResetN), .CK (ClockT), .D (N383), .Q
       (SAROutD[2]));
  QDFFRBP \TempTMR_reg[3] (.RB (ResetN), .CK (ClockT), .D (N431), .Q
       (TempTMR[3]));
  DFFSBN \SAROutI_reg[1] (.SB (ResetN), .CK (ClockT), .D (N61), .Q
       (SAROutI[1]));
  DFFSBN \SAROutI_reg[2] (.SB (ResetN), .CK (ClockT), .D (N60), .Q
       (SAROutI[2]));
  DFFSBN \SAROutI_reg[3] (.SB (ResetN), .CK (ClockT), .D (N59), .Q
       (SAROutI[3]));
  DFFSBN \SAROutI_reg[4] (.SB (ResetN), .CK (ClockT), .D (N58), .Q
       (SAROutI[4]));
  DFFSBP \SAROutI_reg[5] (.SB (ResetN), .CK (ClockT), .D (N57), .Q
       (SAROutI[5]));
  DFFSBT \SAROutI_reg[6] (.SB (ResetN), .CK (ClockT), .D (N56), .Q
       (SAROutI[6]));
  DFFSBN \SAROutI_reg[7] (.SB (ResetN), .CK (ClockT), .D (N55), .Q
       (N170));
  DFFSBN \SAROutI_reg[0] (.SB (ResetN), .CK (ClockT), .D (N64), .Q
       (SAROutI[0]));
  QDFFRBP \TempTMR_reg[2] (.RB (ResetN), .CK (ClockT), .D (N53), .Q
       (TempTMR[2]));
  ND2 g1462(.I1 (N52), .I2 (N50), .O (N64));
  MOAI1 g1464(.A1 (N405), .A2 (SAROut[3]), .B1 (N405), .B2 (SAROut[3]),
       .O (N62));
  MOAI1 g1465(.A1 (N48), .A2 (N214), .B1 (N459), .B2 (SAROutI[1]), .O
       (N61));
  MOAI1 g1466(.A1 (N48), .A2 (N449), .B1 (N459), .B2 (SAROutI[2]), .O
       (N60));
  MOAI1 g1467(.A1 (N48), .A2 (SAROut[3]), .B1 (N459), .B2 (SAROutI[3]),
       .O (N59));
  MOAI1 g1468(.A1 (N48), .A2 (SAROut[4]), .B1 (N459), .B2 (SAROutI[4]),
       .O (N58));
  MOAI1 g1469(.A1 (N48), .A2 (SAROut[5]), .B1 (N459), .B2 (SAROutI[5]),
       .O (N57));
  MOAI1 g1470(.A1 (N48), .A2 (SAROut[6]), .B1 (N459), .B2 (SAROutI[6]),
       .O (N56));
  MOAI1 g1471(.A1 (N48), .A2 (SAROut[7]), .B1 (N459), .B2 (N170), .O
       (N55));
  DFFSBN \SAROutD_reg[1] (.SB (ResetN), .CK (ClockT), .D (N46), .Q
       (SAROutD[1]));
  QDFFRBN \TempTMR_reg[5] (.RB (ResetN), .CK (ClockT), .D (N49), .Q
       (TempTMR[5]));
  NR2 g1475(.I1 (N43), .I2 (N327), .O (N53));
  ND2S g1476(.I1 (N486), .I2 (N403), .O (N52));
  ND2T g1477(.I1 (N405), .I2 (N12), .O (N51));
  AOI22S g1478(.A1 (N454), .A2 (N485), .B1 (N457), .B2 (SAROutI[0]), .O
       (N50));
  DFFSBN \SAROutD_reg[0] (.SB (ResetN), .CK (ClockT), .D (N45), .Q
       (SAROutD[0]));
  NR2 g1480(.I1 (N501), .I2 (N327), .O (N49));
  INV3 g1481(.I (N486), .O (N48));
  ND2 g1483(.I1 (N40), .I2 (N391), .O (N46));
  QDFFRBP \TempTMR_reg[4] (.RB (ResetN), .CK (ClockT), .D (N39), .Q
       (TempTMR[4]));
  QDFFRBP \TempTMR_reg[1] (.RB (ResetN), .CK (ClockT), .D (N37), .Q
       (N219));
  ND2 g1486(.I1 (N27), .I2 (N391), .O (N45));
  XOR2HS g1488(.I1 (TempTMR[2]), .I2 (N14), .O (N43));
  AOI22S g1491(.A1 (N454), .A2 (N301), .B1 (N457), .B2 (SAROutD[1]), .O
       (N40));
  NR2 g1492(.I1 (N440), .I2 (N327), .O (N39));
  NR2 g1495(.I1 (N0), .I2 (N327), .O (N37));
  DFZSBN \DataOut_reg[0] (.SB (ResetN), .CK (ClockT), .D (DataOut[0]),
       .TD (SAROut[0]), .SEL (N400), .Q (DataOut[0]));
  QDFFRBN \TimerOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (N21), .Q
       (TimerOut[3]));
  QDFFRBN \TimerOut_reg[4] (.RB (ResetN), .CK (ClockT), .D (N26), .Q
       (TimerOut[4]));
  QDFFRBN \TimerOut_reg[5] (.RB (ResetN), .CK (ClockT), .D (N25), .Q
       (TimerOut[5]));
  QDFFRBN \TimerOut_reg[0] (.RB (ResetN), .CK (ClockT), .D (N24), .Q
       (TimerOut[0]));
  QDFFRBN \TimerOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (N23), .Q
       (TimerOut[1]));
  QDFFRBN \TimerOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (N22), .Q
       (TimerOut[2]));
  QDFZRBN \DataOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (N214), .TD
       (DataOut[1]), .SEL (N401), .Q (DataOut[1]));
  QDFZRBN \DataOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (N449), .TD
       (DataOut[2]), .SEL (N401), .Q (DataOut[2]));
  QDFZRBN \DataOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (SAROut[3]),
       .TD (DataOut[3]), .SEL (N401), .Q (DataOut[3]));
  QDFZRBN \DataOut_reg[4] (.RB (ResetN), .CK (ClockT), .D (SAROut[4]),
       .TD (DataOut[4]), .SEL (N401), .Q (DataOut[4]));
  QDFZRBN \DataOut_reg[5] (.RB (ResetN), .CK (ClockT), .D (SAROut[5]),
       .TD (DataOut[5]), .SEL (N401), .Q (DataOut[5]));
  QDFZRBN \DataOut_reg[6] (.RB (ResetN), .CK (ClockT), .D (SAROut[6]),
       .TD (DataOut[6]), .SEL (N401), .Q (DataOut[6]));
  QDFZRBN \DataOut_reg[7] (.RB (ResetN), .CK (ClockT), .D (SAROut[7]),
       .TD (DataOut[7]), .SEL (N401), .Q (DataOut[7]));
  AOI22S g1520(.A1 (N459), .A2 (SAROutD[0]), .B1 (N465), .B2
       (SAROut[0]), .O (N27));
  MUX2 g1521(.S (N480), .A (TimerOut[4]), .B (TempTMR[4]), .O (N26));
  MUX2 g1522(.S (N480), .A (TimerOut[5]), .B (TempTMR[5]), .O (N25));
  MUX2 g1523(.S (N480), .A (TimerOut[0]), .B (TempTMR[0]), .O (N24));
  MUX2 g1524(.S (N480), .A (TimerOut[1]), .B (N393), .O (N23));
  MUX2 g1525(.S (N480), .A (TimerOut[2]), .B (TempTMR[2]), .O (N22));
  MUX2 g1526(.S (N480), .A (TimerOut[3]), .B (TempTMR[3]), .O (N21));
  ND2S g1530(.I1 (N459), .I2 (N178), .O (N19));
  NR2 g1533(.I1 (N449), .I2 (SAROut[3]), .O (N16));
  NR2 g1534(.I1 (SAROut[4]), .I2 (SAROut[5]), .O (N15));
  ND2 g1535(.I1 (TempTMR[0]), .I2 (N393), .O (N14));
  INV2 g1539(.I (SAROut[3]), .O (N12));
  OR2B1S g1558(.I1 (N480), .B1 (TempTMR[0]), .O (N3));
  XNR2HS g1561(.I1 (N393), .I2 (TempTMR[0]), .O (N0));
  INV1S fopt1578(.I (N214), .O (N213));
  BUF2 fopt1580(.I (SAROut[1]), .O (N214));
  INV2 g157(.I (StateP[0]), .O (N275));
  ND2 g91(.I1 (N391), .I2 (N444), .O (N293));
  MXL2S g37(.S (SAROut[0]), .A (N300), .B (SAROut[1]), .OB (N301));
  INV2 g39(.I (SAROut[1]), .O (N300));
  ND2 g33(.I1 (N79), .I2 (N424), .O (N322));
  INV3CK g3(.I (N480), .O (N326));
  INV4 g1639(.I (N326), .O (N327));
  BUF6CK fopt(.I (N330), .O (SAROutC[7]));
  INV2 g158(.I (N51), .O (N363));
  NR2 g156(.I1 (SAROut[5]), .I2 (SAROut[4]), .O (N364));
  NR2P g1661(.I1 (SAROut[4]), .I2 (N51), .O (N368));
  INV1S g159(.I (SAROut[5]), .O (N369));
  ND2S g99(.I1 (N391), .I2 (N382), .O (N383));
  ND2P g110(.I1 (N386), .I2 (N275), .O (N372));
  ND2P g113(.I1 (StateP[1]), .I2 (StateP[0]), .O (N373));
  OAI22S g100(.A1 (N459), .A2 (N407), .B1 (N454), .B2 (SAROutD[2]), .O
       (N382));
  NR2P g28(.I1 (Inc), .I2 (Dcr), .O (N384));
  INV3 g29(.I (StateP[1]), .O (N386));
  INV2 g30(.I (N390), .O (N391));
  AN4B1 g31(.I1 (N389), .I2 (N16), .I3 (N15), .B1 (N457), .O (N390));
  NR3H g32(.I1 (SAROut[6]), .I2 (N214), .I3 (SAROut[7]), .O (N389));
  BUF1CK g1667(.I (N219), .O (N393));
  AN2S g1672(.I1 (TempTMR[5]), .I2 (TempTMR[4]), .O (N397));
  INV3 g1673(.I (N399), .O (N400));
  ND2P g1674(.I1 (N275), .I2 (N386), .O (N399));
  INV4CK g1675(.I (N400), .O (N401));
  BUF1CK g1677(.I (N129), .O (N403));
  NR2F g1678(.I1 (N449), .I2 (N404), .O (N405));
  ND2F g1679(.I1 (N300), .I2 (N129), .O (N404));
  XOR2HS g1680(.I1 (N449), .I2 (N404), .O (N407));
  ND2F g43(.I1 (N372), .I2 (N373), .O (N414));
  ND2P g49(.I1 (N497), .I2 (N414), .O (N417));
  OR2S g45(.I1 (N498), .I2 (N480), .O (N422));
  AOI12S g16(.A1 (N390), .B1 (N459), .B2 (SAROutD[6]), .O (N424));
  NR2 g21(.I1 (Reset), .I2 (N495), .O (N427));
  NR2 g1687(.I1 (N430), .I2 (N327), .O (N431));
  XNR2HS g24(.I1 (TempTMR[3]), .I2 (N1), .O (N430));
  OAI22S g1688(.A1 (N459), .A2 (N513), .B1 (N454), .B2 (SAROutD[5]), .O
       (N444));
  XNR2HS g34(.I1 (SAROut[5]), .I2 (N368), .O (N513));
  ND2 g57(.I1 (N436), .I2 (TempTMR[4]), .O (N438));
  NR2T g58(.I1 (N435), .I2 (N496), .O (N436));
  ND3P g59(.I1 (TempTMR[2]), .I2 (TempTMR[3]), .I3 (N219), .O (N435));
  OAI12S g54(.A1 (N438), .B1 (N436), .B2 (TempTMR[4]), .O (N440));
  ND2P g55(.I1 (N397), .I2 (N436), .O (N446));
  INV3 fopt1697(.I (N453), .O (N449));
  INV2 fopt1699(.I (SAROut[2]), .O (N453));
  INV2 fopt1701(.I (N457), .O (N454));
  INV6 fopt1703(.I (N414), .O (N457));
  INV2 fopt1704(.I (N459), .O (N465));
  BUF8 fopt1706(.I (N457), .O (N459));
  NR2 g1708(.I1 (N399), .I2 (N471), .O (N472));
  NR3H g1709(.I1 (Reset), .I2 (1'b0), .I3 (N384), .O (N471));
  XOR2HS g1710(.I1 (SAROut[6]), .I2 (N473), .O (N474));
  ND2P g1711(.I1 (N363), .I2 (N364), .O (N473));
  NR2T g1712(.I1 (N475), .I2 (N473), .O (N476));
  BUF1CK fopt1713(.I (SAROut[6]), .O (N475));
  ND2F g11(.I1 (N479), .I2 (N446), .O (N480));
  ND2T g12(.I1 (N427), .I2 (N417), .O (N479));
  AOI22S g36(.A1 (N482), .A2 (N454), .B1 (N457), .B2 (SAROutD[4]), .O
       (N483));
  XOR2HS g1715(.I1 (SAROut[4]), .I2 (N51), .O (N482));
  NR2 g25(.I1 (N502), .I2 (N514), .O (N485));
  DFFRBN \TempTMR_reg[0] (.RB (ResetN), .CK (ClockT), .D (N3), .Q
       (TempTMR[0]), .QB (N496));
  OR2B1S g2(.I1 (N384), .B1 (N386), .O (N497));
  AN2B1S g1725(.I1 (N417), .B1 (Reset), .O (N498));
  XOR2HS g1727(.I1 (TempTMR[5]), .I2 (N438), .O (N501));
  ND4 g1728(.I1 (SAROut[7]), .I2 (SAROut[4]), .I3 (SAROut[5]), .I4
       (SAROut[6]), .O (N502));
  QDFFRBN FlagTMR_reg(.RB (ResetN), .CK (ClockT), .D (N422), .Q (N495));
  AN2B1 g1731(.I1 (TempTMR[2]), .B1 (N14), .O (N1));
  DELA g1735(.I (N414), .O (N486));
  OAI12S g1736(.A1 (N19), .B1 (N511), .B2 (N459), .O (N510));
  HA2 g1739(.A (SAROut[7]), .B (N476),  .C (N511));
  ND3 g1740(.I1 (SAROut[3]), .I2 (SAROut[2]), .I3 (N214), .O (N514));
endmodule

