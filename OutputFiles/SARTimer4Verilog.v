module SARTimer4Verilog(StateP, SAROut, ClockT, Reset,
     Inc, Dcr, Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG,
     SAROutDG, SAROutCG, ClockDcr, ClockInc, ClockTck, DataOut,
     TimerOut, SAROutI, SAROutD, SAROutC);
  input [1:0] StateP;
  input [7:0] SAROut;
  input ClockT, Reset, Inc, Dcr;
  output Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  output [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  output [3:0] TimerOut;
  wire [1:0] StateP;
  wire [7:0] SAROut;
  wire ClockT, Reset, Inc, Dcr;
  wire Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  wire [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  wire [3:0] TimerOut;
  wire [3:0] TempTMR;
  wire N0, N2, N3, N8, N9, N13, N14, N15;
  wire N16, N19, N21, N22, N23, N24, N25, N27;
  wire N29, N30, N32, N36, N38, N39, N41, N44;
  wire N46, N47, N48, N50, N51, N52, N54, N56;
  wire N57, N60, N62, N64, N68, N74, N75, N76;
  wire N77, N78, N109, N110, N111, N118, N158, N166;
  wire N175, N177, N189, N213, N214, N218, N236, N248;
  wire N249, N250, N251, N273, N277, N299, N304, N315;
  wire N316, N317, N320, N321, N335, N356, N357, N361;
  wire N364, N368, N369, N387, N393, N397, N398, N399;
  wire N402, N405, N406, N409, N411, N413, N415, N416;
  wire N417, N432, N433, N435, N436, N437, N442, N443;
  wire N445, N446, N447, N451, N452, N453, N454, N457;
  wire N459, N460, N480, N481, N482, N494;

  BUF4 g200(.I(ClockDcr), .O(ClockTck));
  BUF4 g201(.I(ClockDcr), .O(ClockInc));
  BUF4 g202(.I(ResetN), .O(SAROutCG));
  BUF4 g203(.I(ResetN), .O(SAROutDG));
  BUF4 g204(.I(ResetN), .O(SAROutIG));
  BUF4 g205(.I(SAROutIS), .O(SAROutDS));
  BUF4 g206(.I (ResetP), .O (SAROutIS));
  BUF6CK g408(.I (N158), .O (SAROutI[7]));
  BUF6CK g407(.I (N166), .O (SAROutD[7]));
  BUF2 g406(.I (Reset), .O (ResetP));
  INV1S g469(.I (N357), .O (N111));
  QDFFRBS Ready_reg(.RB (ResetN), .CK (ClockT), .D (N250), .Q (Ready));
  NR3T g454(.I1 (ClockT), .I2 (ResetP), .I3 (N76), .O (ClockDcr));
  DFFSBN \SAROutC_reg[1] (.SB (ResetN), .CK (ClockT), .D (N214), .Q
       (SAROutC[1]));
  DFFSBN \SAROutC_reg[0] (.SB (ResetN), .CK (ClockT), .D (N8), .Q
       (SAROutC[0]));
  DFFSBN \SAROutC_reg[7] (.SB (ResetN), .CK (ClockT), .D (N109), .Q
       (N277));
  DFFSBN \SAROutC_reg[6] (.SB (ResetN), .CK (ClockT), .D (N110), .Q 
		 (SAROutC[6]));
  DFFSBN \SAROutC_reg[5] (.SB (ResetN), .CK (ClockT), .D (N446), .Q
       (SAROutC[5]));
  DFFSBN \SAROutC_reg[4] (.SB (ResetN), .CK (ClockT), .D (N442), .Q
       (SAROutC[4]));
  DFFSBN \SAROutC_reg[3] (.SB (ResetN), .CK (ClockT), .D (N118), .Q
       (SAROutC[3]));
  DFFSBN \SAROutC_reg[2] (.SB (ResetN), .CK (ClockT), .D (N316), .Q
       (SAROutC[2]));
  ND2 g473(.I1 (TempTMR[3]), .I2 (TempTMR[2]), .O (N78));
  ND2 g474(.I1 (TempTMR[1]), .I2 (TempTMR[0]), .O (N77));
  NR2 g475(.I1 (N111), .I2 (N494), .O (N76));
  INV1S g478(.I (SAROut[6]), .O (N110));
  INV1S g479(.I (SAROut[7]), .O (N109));
  INV2 g480(.I (ResetP), .O (ResetN));
  INV1S g483(.I (N369), .O (N118));
  DFFSBN \SAROutD_reg[7] (.SB (ResetN), .CK (ClockT), .D (N75), .Q
       (N166));
  OAI112H g1319(.A1 (N405), .B1 (N19), .C1 (N74), .C2 (N189), .O (N75));
  DFFSBT \SAROutD_reg[6] (.SB (ResetN), .CK (ClockT), .D (N364), .Q
       (SAROutD[6]));
  XOR2HS g1321(.I1 (SAROut[7]), .I2 (N399), .O (N74));
  DFFSBN \SAROutD_reg[5] (.SB (ResetN), .CK (ClockT), .D (N406), .QB (N433));
  DFFSBN \SAROutD_reg[4] (.SB (ResetN), .CK (ClockT), .D (N68), .Q
       (SAROutD[4]));
  ND2 g1330(.I1 (N321), .I2 (N405), .O (N68));
  DFFSBN \SAROutD_reg[3] (.SB (ResetN), .CK (ClockT), .D (N64), .Q
       (SAROutD[3]));
  ND2 g1336(.I1 (N62), .I2 (N405), .O (N64));
  AOI22S g1338(.A1 (N315), .A2 (N56), .B1 (N189), .B2 (SAROutD[3]), .O
       (N62));
  DFFSBN \SAROutD_reg[2] (.SB (ResetN), .CK (ClockT), .D (N417), .Q
       (SAROutD[2]));
  QDFFRBN \TempTMR_reg[3] (.RB (ResetN), .CK (ClockT), .D (N60), .Q
       (TempTMR[3]));
  NR2 g1342(.I1 (N57), .I2 (N250), .O (N60));
  QDFFRBN \TempTMR_reg[2] (.RB (ResetN), .CK (ClockT), .D (N54), .Q
       (TempTMR[2]));
  XNR2HS g1346(.I1 (TempTMR[3]), .I2 (N2), .O (N57));
  MOAI1 g1347(.A1 (N453), .A2 (N369), .B1 (N453), .B2 (N369), .O (N56));
  DFFSBN \SAROutI_reg[1] (.SB (ResetN), .CK (ClockT), .D (N50), .Q
       (SAROutI[1]));
  DFFSBN \SAROutI_reg[2] (.SB (ResetN), .CK (ClockT), .D (N317), .Q
       (SAROutI[2]));
  DFFSBN \SAROutI_reg[3] (.SB (ResetN), .CK (ClockT), .D (N48), .Q
       (SAROutI[3]));
  DFFSBP \SAROutI_reg[5] (.SB (ResetN), .CK (ClockT), .D (N46), .Q
       (SAROutI[5]));
  DFFSBT \SAROutI_reg[6] (.SB (ResetN), .CK (ClockT), .D (N480), .Q
       (SAROutI[6]));
  DFFSBN \SAROutI_reg[7] (.SB (ResetN), .CK (ClockT), .D (N44), .Q
       (N158));
  DFFSBN \SAROutI_reg[4] (.SB (ResetN), .CK (ClockT), .D (N47), .Q
       (SAROutI[4]));
  DFFSBN \SAROutD_reg[1] (.SB (ResetN), .CK (ClockT), .D (N52), .Q
       (SAROutD[1]));
  DFFSBN \SAROutI_reg[0] (.SB (ResetN), .CK (ClockT), .D (N51), .Q
       (SAROutI[0]));
  NR2 g1358(.I1 (N41), .I2 (N250), .O (N54));
  DFFSBN \SAROutD_reg[0] (.SB (ResetN), .CK (ClockT), .D (N335), .Q
       (SAROutD[0]));
  ND2 g1361(.I1 (N38), .I2 (N405), .O (N52));
  ND2 g1362(.I1 (N320), .I2 (N39), .O (N51));
  MOAI1S g1363(.A1 (N189), .A2 (N213), .B1 (N189), .B2 (SAROutI[1]), .O
       (N50));
  MOAI1S g1365(.A1 (N189), .A2 (N369), .B1 (N189), .B2 (SAROutI[3]), .O
       (N48));
  MOAI1S g1366(.A1 (N189), .A2 (N443), .B1 (N189), .B2 (SAROutI[4]), .O
       (N47));
  MOAI1S g1367(.A1 (N189), .A2 (SAROut[5]), .B1 (N189), .B2
       (SAROutI[5]), .O (N46));
  MOAI1S g1369(.A1 (N189), .A2 (SAROut[7]), .B1 (N189), .B2 (N158), .O
       (N44));
  QDFFRBN \TempTMR_reg[1] (.RB (ResetN), .CK (ClockT), .D (N36), .Q
       (TempTMR[1]));
  XOR2HS g1373(.I1 (TempTMR[2]), .I2 (N14), .O (N41));
  AOI22S g1375(.A1 (N315), .A2 (N32), .B1 (N189), .B2 (SAROutI[0]), .O
       (N39));
  AOI22S g1376(.A1 (N315), .A2 (N21), .B1 (N189), .B2 (SAROutD[1]), .O
       (N38));
  NR2 g1379(.I1 (N3), .I2 (N250), .O (N36));
  DFZSBN \DataOut_reg[0] (.SB (ResetN), .CK (ClockT), .D (DataOut[0]),
       .TD (N9), .SEL (N304), .Q (DataOut[0]));
  QDFZRBN \DataOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (N368), .TD
       (DataOut[2]), .SEL (N177), .Q (DataOut[2]));
  QDFZRBN \DataOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (N369), .TD
       (DataOut[3]), .SEL (N177), .Q (DataOut[3]));
  QDFZRBN \DataOut_reg[4] (.RB (ResetN), .CK (ClockT), .D (N443), .TD
       (DataOut[4]), .SEL (N177), .Q (DataOut[4]));
  QDFZRBN \DataOut_reg[6] (.RB (ResetN), .CK (ClockT), .D (SAROut[6]),
       .TD (DataOut[6]), .SEL (N177), .Q (DataOut[6]));
  QDFZRBN \DataOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (N213), .TD
       (DataOut[1]), .SEL (N177), .Q (DataOut[1]));
  QDFZRBN \DataOut_reg[7] (.RB (ResetN), .CK (ClockT), .D (SAROut[7]),
       .TD (DataOut[7]), .SEL (N177), .Q (DataOut[7]));
  QDFZRBN \DataOut_reg[5] (.RB (ResetN), .CK (ClockT), .D (SAROut[5]),
       .TD (DataOut[5]), .SEL (N177), .Q (DataOut[5]));
  QDFFRBN \TimerOut_reg[0] (.RB (ResetN), .CK (ClockT), .D (N24), .Q
       (TimerOut[0]));
  QDFFRBN \TimerOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (N23), .Q
       (TimerOut[1]));
  QDFFRBN \TimerOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (N22), .Q
       (TimerOut[2]));
  QDFFRBN \TimerOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (N25), .Q
       (TimerOut[3]));
  NR2 g1395(.I1 (N437), .I2 (N27), .O (N32));
  INV1S g1397(.I (N398), .O (N30));
  QDFFRBP \TempTMR_reg[0] (.RB (ResetN), .CK (ClockT), .D (N0), .Q
       (TempTMR[0]));
  NR3 g1400(.I1 (N213), .I2 (SAROut[6]), .I3 (SAROut[7]), .O (N29));
  ND3 g1402(.I1 (N16), .I2 (SAROut[6]), .I3 (N443), .O (N27));
  MUX2 g1404(.S (N250), .A (TimerOut[3]), .B (TempTMR[3]), .O (N25));
  MUX2 g1405(.S (N250), .A (TimerOut[0]), .B (TempTMR[0]), .O (N24));
  MUX2 g1406(.S (N250), .A (TimerOut[1]), .B (TempTMR[1]), .O (N23));
  MUX2 g1407(.S (N250), .A (TimerOut[2]), .B (TempTMR[2]), .O (N22));
  MOAI1S g1409(.A1 (N251), .A2 (N213), .B1 (N251), .B2 (N213), .O
       (N21));
  ND2S g1411(.I1 (N189), .I2 (N166), .O (N19));
  NR2 g1415(.I1 (N445), .I2 (N446), .O (N16));
  NR2 g1416(.I1 (N368), .I2 (N369), .O (N15));
  ND2 g1417(.I1 (TempTMR[1]), .I2 (TempTMR[0]), .O (N14));
  NR2 g1418(.I1 (N443), .I2 (SAROut[5]), .O (N13));
  INV2 g1437(.I (N251), .O (N9));
  INV3CK g1438(.I (SAROut[0]), .O (N8));
  XNR2HS g1444(.I1 (TempTMR[1]), .I2 (TempTMR[0]), .O (N3));
  AN2B1S g1445(.I1 (TempTMR[2]), .B1 (N14), .O (N2));
  OR2B1S g1447(.I1 (N250), .B1 (TempTMR[0]), .O (N0));
  XOR2HS g1450(.I1 (N451), .I2 (N443), .O (N175));
  INV3CK fopt1453(.I (N304), .O (N177));
  INV1 fopt1473(.I (N213), .O (N214));
  INV2CK fopt1476(.I (N218), .O (N213));
  INV3CK fopt1477(.I (SAROut[1]), .O (N218));
  INV3 g73(.I (StateP[0]), .O (N236));
  ND2F g15(.I1 (N248), .I2 (N249), .O (N250));
  OR2 g17(.I1 (N78), .I2 (N77), .O (N249));
  BUF2CK fopt1494(.I (N8), .O (N251));
  INV3 g33(.I (StateP[1]), .O (N273));
  BUF6CK fopt1499(.I (N277), .O (SAROutC[7]));
  OR2S g1515(.I1 (N460), .I2 (N250), .O (N299));
  INV3 g135(.I (N387), .O (N304));
  MUX2 g97(.S (N315), .A (SAROutI[2]), .B (N316), .O (N317));
  ND2S g100(.I1 (N315), .I2 (N8), .O (N320));
  OAI22S g98(.A1 (SAROutD[4]), .A2 (N315), .B1 (N175), .B2 (N189), .O
       (N321));
  ND2S g1520(.I1 (N457), .I2 (N405), .O (N335));
  OAI112H g86(.A1 (N405), .B1 (N361), .C1 (N481), .C2 (N189), .O
       (N364));
  ND2T g1532(.I1 (N273), .I2 (N236), .O (N356));
  ND2P g94(.I1 (StateP[1]), .I2 (StateP[0]), .O (N357));
  ND2S g88(.I1 (N189), .I2 (SAROutD[6]), .O (N361));
  INV2 g2(.I (N316), .O (N368));
  BUF1 g1(.I (SAROut[3]), .O (N369));
  ND2T g27(.I1 (N273), .I2 (N236), .O (N387));
  NR3 g1540(.I1 (N393), .I2 (N397), .I3 (N398), .O (N399));
  OR2 g1541(.I1 (SAROut[6]), .I2 (SAROut[4]), .O (N393));
  ND3S g1542(.I1 (N316), .I2 (N446), .I3 (N445), .O (N397));
  INV2 fopt58(.I (SAROut[2]), .O (N316));
  ND2T g55(.I1 (N8), .I2 (N218), .O (N398));
  ND2 g68(.I1 (N436), .I2 (N405), .O (N406));
  XNR2HS g71(.I1 (N452), .I2 (SAROut[5]), .O (N402));
  ND4T g1544(.I1 (N454), .I2 (N29), .I3 (N13), .I4 (N15), .O (N405));
  INV3 g74(.I (N189), .O (N315));
  INV1S g38(.I (Reset), .O (N409));
  ND3 g42(.I1 (N413), .I2 (N405), .I3 (N416), .O (N417));
  ND2S g45(.I1 (N189), .I2 (SAROutD[2]), .O (N413));
  ND2S g43(.I1 (N315), .I2 (N415), .O (N416));
  MOAI1S g44(.A1 (N30), .A2 (N368), .B1 (N30), .B2 (N368), .O (N415));
  HA3 g1548(.A (N273), .B (N435), .C (N411));
  DFFRBN FlagTMR_reg(.RB (ResetN), .CK (ClockT), .D (N299), .QB (N432));
  INV3 g10(.I (N433), .O (SAROutD[5]));
  OR2 g1553(.I1 (Dcr), .I2 (Inc), .O (N435));
  MXL2HS g1554(.S (N189), .A (N402), .B (SAROutD[5]), .OB (N436));
  OR3B2 g1555(.I1 (N214), .B1 (N368), .B2 (SAROut[7]), .O (N437));
  ND2P g1556(.I1 (N460), .I2 (N432), .O (N248));
  INV2 g1560(.I (N442), .O (N443));
  INV2 g4(.I (SAROut[4]), .O (N442));
  INV2 g40(.I (SAROut[3]), .O (N445));
  INV2 g41(.I (SAROut[5]), .O (N446));
  NR2P g39(.I1 (SAROut[2]), .I2 (N398), .O (N447));
  NR2P g1561(.I1 (N443), .I2 (N451), .O (N452));
  ND2P g1562(.I1 (N447), .I2 (N445), .O (N451));
  NR2 g1563(.I1 (SAROut[2]), .I2 (N398), .O (N453));
  OAI22S g28(.A1 (SAROutD[0]), .A2 (N454), .B1 (N189), .B2 (N9), .O
       (N457));
  INV8 g30(.I (N454), .O (N189));
  ND2T g31(.I1 (N356), .I2 (N357), .O (N454));
  AOI12H g21(.A1 (ResetP), .B1 (N459), .B2 (N411), .O (N460));
  ND2T g22(.I1 (N356), .I2 (N357), .O (N459));
  MUX2 g1579(.S (N189), .A (N110), .B (SAROutI[6]), .O (N480));
  XOR2HS g1580(.I1 (SAROut[6]), .I2 (N482), .O (N481));
  AN4 g1581(.I1 (N442), .I2 (N445), .I3 (N446), .I4 (N447), .O (N482));
  AOI12S g1590(.A1 (N387), .B1 (N435), .B2 (N409), .O (N494));
endmodule

