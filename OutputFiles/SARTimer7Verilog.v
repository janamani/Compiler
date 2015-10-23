module SARTimer7Verilog(StateP, SAROut, ClockT, Reset,
     Inc, Dcr, Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG,
     SAROutDG, SAROutCG, ClockDcr, ClockInc, ClockTck, DataOut,
     TimerOut, SAROutI, SAROutD, SAROutC);
  input [1:0] StateP;
  input [7:0] SAROut;
  input ClockT, Reset, Inc, Dcr;
  output Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  output [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  output [6:0] TimerOut;
  wire [1:0] StateP;
  wire [7:0] SAROut;
  wire ClockT, Reset, Inc, Dcr;
  wire Ready, ResetP, ResetN, SAROutIS, SAROutDS, SAROutIG, SAROutDG,
       SAROutCG, ClockDcr, ClockInc, ClockTck;
  wire [7:0] DataOut, SAROutI, SAROutD, SAROutC;
  wire [6:0] TimerOut;
  wire [6:0] TempTMR;
  wire N0, N1, N2, N3, N5, N13, N16, N17;
  wire N19, N21, N22, N23, N24, N25, N26, N27;
  wire N28, N29, N30, N31, N32, N33, N34, N35;
  wire N37, N39, N40, N41, N43, N44, N45, N46;
  wire N48, N49, N52, N53, N55, N56, N57, N58;
  wire N59, N60, N61, N62, N63, N64, N66, N67;
  wire N68, N69, N71, N72, N73, N75, N77, N78;
  wire N81, N84, N88, N89, N91, N92, N94, N95;
  wire N96, N118, N119, N122, N123, N126, N128, N149;
  wire N172, N180, N193, N194, N205, N212, N213, N214;
  wire N221, N224, N232, N233, N234, N235, N236, N237;
  wire N238, N239, N241, N243, N244, N245, N248, N250;
  wire N251, N252, N253, N259, N260, N264, N265, N269;
  wire N270, N271, N272, N274, N275, N285;

  BUF4 g200(.I(ClockDcr), .O(ClockTck));
  BUF4 g201(.I(ClockDcr), .O(ClockInc));
  BUF4 g202(.I(ResetN), .O(SAROutCG));
  BUF4 g203(.I(ResetN), .O(SAROutDG));
  BUF4 g204(.I(ResetN), .O(SAROutIG));
  BUF4 g205(.I(SAROutIS), .O(SAROutDS));
  BUF4 g206(.I (ResetP), .O (SAROutIS));
  BUF4 g454(.I (N172), .O (SAROutI[7]));
  BUF4 g462(.I (N180), .O (SAROutD[7]));
  BUF1 g461(.I (Reset), .O (ResetP));
  INV1S g526(.I (N96), .O (N119));
  ND2P g527(.I1 (StateP[1]), .I2 (StateP[0]), .O (N96));
  INV3 g528(.I (StateP[1]), .O (N95));
  INV3 g529(.I (StateP[0]), .O (N94));
  QDFFRBS Ready_reg(.RB (ResetN), .CK (ClockT), .D (N122), .Q (Ready));
  ND2F g535(.I1 (N235), .I2 (N92), .O (N122));
  ND3P g536(.I1 (N91), .I2 (N89), .I3 (TempTMR[6]), .O (N92));
  NR3P g537(.I1 (ClockT), .I2 (ResetP), .I3 (N88), .O (ClockDcr));
  INV2 g538(.I (N91), .O (N149));
  AN4P g539(.I1 (TempTMR[0]), .I2 (TempTMR[2]), .I3 (TempTMR[3]), .I4
       (TempTMR[1]), .O (N91));
  DFFSBN \SAROutC_reg[0] (.SB (ResetN), .CK (ClockT), .D (N13), .Q
       (SAROutC[0]));
  DFFSBN \SAROutC_reg[1] (.SB (ResetN), .CK (ClockT), .D (N5), .Q
       (SAROutC[1]));
  DFFSBT \SAROutC_reg[7] (.SB (ResetN), .CK (ClockT), .D (N118), .Q
       (SAROutC[7]));
  DFFSBN \SAROutC_reg[6] (.SB (ResetN), .CK (ClockT), .D (N123), .Q 
		 (SAROutC[6]));
  DFFSBN \SAROutC_reg[5] (.SB (ResetN), .CK (ClockT), .D (N243), .Q
       (SAROutC[5]));
  DFFSBN \SAROutC_reg[4] (.SB (ResetN), .CK (ClockT), .D (N126), .Q
       (SAROutC[4]));
  DFFSBN \SAROutC_reg[3] (.SB (ResetN), .CK (ClockT), .D (N238), .Q
       (SAROutC[3]));
  DFFSBN \SAROutC_reg[2] (.SB (ResetN), .CK (ClockT), .D (N128), .Q
       (SAROutC[2]));
  AN2 g549(.I1 (TempTMR[5]), .I2 (TempTMR[4]), .O (N89));
  NR2 g550(.I1 (N119), .I2 (N236), .O (N88));
  INV2 g551(.I (ResetP), .O (ResetN));
  INV1 g555(.I (SAROut[2]), .O (N128));
  INV1S g557(.I (SAROut[4]), .O (N126));
  INV1S g558(.I (SAROut[7]), .O (N118));
  INV1S g559(.I (SAROut[6]), .O (N123));
  DFFSBT \SAROutD_reg[6] (.SB (ResetN), .CK (ClockT), .D (N250), .Q
       (SAROutD[6]));
  DFFSBN \SAROutD_reg[7] (.SB (ResetN), .CK (ClockT), .D (N84), .Q
       (N180));
  DFFSBN \SAROutD_reg[5] (.SB (ResetN), .CK (ClockT), .D (N275),  .QB (N260));
  ND2 g1501(.I1 (N248), .I2 (N33), .O (N84));
  DFFSBN \SAROutD_reg[4] (.SB (ResetN), .CK (ClockT), .D (N81), .Q
       (SAROutD[4]));
  ND2S g1505(.I1 (N40), .I2 (N78), .O (N81));
  AOI22S g1507(.A1 (N241), .A2 (N213), .B1 (N214), .B2 (SAROutD[4]), .O
       (N78));
  DFFSBN \SAROutD_reg[3] (.SB (ResetN), .CK (ClockT), .D (N77), .Q
       (SAROutD[3]));
  ND2 g1509(.I1 (N40), .I2 (N75), .O (N77));
  AOI22S g1511(.A1 (N213), .A2 (N66), .B1 (N205), .B2 (SAROutD[3]), .O
       (N75));
  DFFSBN \SAROutD_reg[2] (.SB (ResetN), .CK (ClockT), .D (N71), .Q
       (SAROutD[2]));
  QDFFRBN \TempTMR_reg[3] (.RB (ResetN), .CK (ClockT), .D (N73), .Q
       (TempTMR[3]));
  QDFFRBS \TempTMR_reg[6] (.RB (ResetN), .CK (ClockT), .D (N72), .Q
       (TempTMR[6]));
  DFFSBN \SAROutI_reg[1] (.SB (ResetN), .CK (ClockT), .D (N264), .Q
       (SAROutI[1]));
  DFFSBN \SAROutI_reg[2] (.SB (ResetN), .CK (ClockT), .D (N64), .Q
       (SAROutI[2]));
  DFFSBN \SAROutI_reg[3] (.SB (ResetN), .CK (ClockT), .D (N63), .Q
       (SAROutI[3]));
  DFFSBN \SAROutI_reg[4] (.SB (ResetN), .CK (ClockT), .D (N62), .Q
       (SAROutI[4]));
  DFFSBP \SAROutI_reg[5] (.SB (ResetN), .CK (ClockT), .D (N61), .Q
       (SAROutI[5]));
  DFFSBT \SAROutI_reg[6] (.SB (ResetN), .CK (ClockT), .D (N60), .Q
       (SAROutI[6]));
  DFFSBN \SAROutI_reg[7] (.SB (ResetN), .CK (ClockT), .D (N59), .Q
       (N172));
  DFFSBN \SAROutI_reg[0] (.SB (ResetN), .CK (ClockT), .D (N69), .Q
       (SAROutI[0]));
  NR2 g1524(.I1 (N68), .I2 (N122), .O (N73));
  NR2 g1525(.I1 (N67), .I2 (N122), .O (N72));
  ND2 g1526(.I1 (N40), .I2 (N58), .O (N71));
  QDFFRBP \TempTMR_reg[2] (.RB (ResetN), .CK (ClockT), .D (N57), .Q
       (TempTMR[2]));
  QDFFRBN \TempTMR_reg[5] (.RB (ResetN), .CK (ClockT), .D (N56), .Q
       (TempTMR[5]));
  ND2 g1530(.I1 (N55), .I2 (N53), .O (N69));
  XNR2HS g1531(.I1 (TempTMR[3]), .I2 (N3), .O (N68));
  XOR2HS g1532(.I1 (TempTMR[6]), .I2 (N41), .O (N67));
  MOAI1S g1533(.A1 (N237), .A2 (SAROut[3]), .B1 (N237), .B2
       (SAROut[3]), .O (N66));
  MOAI1S g1535(.A1 (N214), .A2 (SAROut[2]), .B1 (N205), .B2
       (SAROutI[2]), .O (N64));
  MOAI1S g1536(.A1 (N205), .A2 (SAROut[3]), .B1 (N205), .B2
       (SAROutI[3]), .O (N63));
  MOAI1 g1537(.A1 (N221), .A2 (SAROut[4]), .B1 (N205), .B2
       (SAROutI[4]), .O (N62));
  MOAI1 g1538(.A1 (N221), .A2 (SAROut[5]), .B1 (N205), .B2
       (SAROutI[5]), .O (N61));
  MOAI1 g1539(.A1 (N221), .A2 (SAROut[6]), .B1 (N205), .B2
       (SAROutI[6]), .O (N60));
  MOAI1 g1540(.A1 (N221), .A2 (SAROut[7]), .B1 (N205), .B2 (N172), .O
       (N59));
  AOI22S g1541(.A1 (N213), .A2 (N285), .B1 (N205), .B2 (SAROutD[2]), .O
       (N58));
  DFFSBN \SAROutD_reg[1] (.SB (ResetN), .CK (ClockT), .D (N52), .Q
       (SAROutD[1]));
  NR2 g1543(.I1 (N46), .I2 (N122), .O (N57));
  NR2 g1544(.I1 (N45), .I2 (N122), .O (N56));
  ND2 g1545(.I1 (N213), .I2 (N13), .O (N55));
  AOI22S g1547(.A1 (N213), .A2 (N48), .B1 (N205), .B2 (SAROutI[0]), .O
       (N53));
  DFFSBN \SAROutD_reg[0] (.SB (ResetN), .CK (ClockT), .D (N49), .Q
       (SAROutD[0]));
  ND2 g1549(.I1 (N40), .I2 (N44), .O (N52));
  QDFFRBN \TempTMR_reg[4] (.RB (ResetN), .CK (ClockT), .D (N43), .Q
       (TempTMR[4]));
  QDFFRBN \TempTMR_reg[1] (.RB (ResetN), .CK (ClockT), .D (N39), .Q
       (TempTMR[1]));
  ND2 g1554(.I1 (N40), .I2 (N32), .O (N49));
  NR2 g1555(.I1 (N265), .I2 (N35), .O (N48));
  XOR2HS g1557(.I1 (TempTMR[2]), .I2 (N17), .O (N46));
  XNR2 g1558(.I1 (TempTMR[5]), .I2 (N0), .O (N45));
  AOI22S g1559(.A1 (N213), .A2 (N24), .B1 (N205), .B2 (SAROutD[1]), .O
       (N44));
  NR2 g1560(.I1 (N34), .I2 (N122), .O (N43));
  ND2S g1562(.I1 (N0), .I2 (TempTMR[5]), .O (N41));
  ND2P g1563(.I1 (N22), .I2 (N37), .O (N40));
  NR2 g1565(.I1 (N1), .I2 (N122), .O (N39));
  DFZSBN \DataOut_reg[0] (.SB (ResetN), .CK (ClockT), .D (DataOut[0]),
       .TD (SAROut[0]), .SEL (N194), .Q (DataOut[0]));
  QDFFRBN \TimerOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (N31), .Q
       (TimerOut[2]));
  QDFFRBN \TimerOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (N30), .Q
       (TimerOut[3]));
  QDFFRBN \TimerOut_reg[4] (.RB (ResetN), .CK (ClockT), .D (N29), .Q
       (TimerOut[4]));
  QDFFRBN \TimerOut_reg[6] (.RB (ResetN), .CK (ClockT), .D (N27), .Q
       (TimerOut[6]));
  QDFFRBN \TimerOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (N25), .Q
       (TimerOut[1]));
  QDFFRBN \TimerOut_reg[5] (.RB (ResetN), .CK (ClockT), .D (N28), .Q
       (TimerOut[5]));
  QDFFRBN \TimerOut_reg[0] (.RB (ResetN), .CK (ClockT), .D (N26), .Q
       (TimerOut[0]));
  QDFZRBN \DataOut_reg[2] (.RB (ResetN), .CK (ClockT), .D (SAROut[2]),
       .TD (DataOut[2]), .SEL (N193), .Q (DataOut[2]));
  QDFZRBN \DataOut_reg[1] (.RB (ResetN), .CK (ClockT), .D (SAROut[1]),
       .TD (DataOut[1]), .SEL (N193), .Q (DataOut[1]));
  QDFZRBN \DataOut_reg[3] (.RB (ResetN), .CK (ClockT), .D (SAROut[3]),
       .TD (DataOut[3]), .SEL (N193), .Q (DataOut[3]));
  QDFZRBN \DataOut_reg[4] (.RB (ResetN), .CK (ClockT), .D (SAROut[4]),
       .TD (DataOut[4]), .SEL (N193), .Q (DataOut[4]));
  QDFZRBN \DataOut_reg[5] (.RB (ResetN), .CK (ClockT), .D (SAROut[5]),
       .TD (DataOut[5]), .SEL (N193), .Q (DataOut[5]));
  QDFZRBN \DataOut_reg[6] (.RB (ResetN), .CK (ClockT), .D (SAROut[6]),
       .TD (DataOut[6]), .SEL (N193), .Q (DataOut[6]));
  QDFZRBN \DataOut_reg[7] (.RB (ResetN), .CK (ClockT), .D (SAROut[7]),
       .TD (DataOut[7]), .SEL (N193), .Q (DataOut[7]));
  NR6 g1582(.I1 (SAROut[2]), .I2 (SAROut[3]), .I3 (SAROut[4]), .I4
       (SAROut[7]), .I5 (SAROut[5]), .I6 (SAROut[1]), .O (N37));
  QDFFRBP \TempTMR_reg[0] (.RB (ResetN), .CK (ClockT), .D (N2), .Q
       (TempTMR[0]));
  ND3 g1586(.I1 (N19), .I2 (SAROut[4]), .I3 (SAROut[5]), .O (N35));
  XOR2 g1587(.I1 (TempTMR[4]), .I2 (N149), .O (N34));
  AOI22S g1588(.A1 (N205), .A2 (N180), .B1 (N213), .B2 (N118), .O
       (N33));
  AOI22S g1589(.A1 (N205), .A2 (SAROutD[0]), .B1 (N213), .B2
       (SAROut[0]), .O (N32));
  MUX2 g1590(.S (N122), .A (TimerOut[2]), .B (TempTMR[2]), .O (N31));
  MUX2 g1591(.S (N122), .A (TimerOut[3]), .B (TempTMR[3]), .O (N30));
  MUX2 g1592(.S (N122), .A (TimerOut[4]), .B (TempTMR[4]), .O (N29));
  MUX2 g1593(.S (N122), .A (TimerOut[5]), .B (TempTMR[5]), .O (N28));
  MUX2 g1594(.S (N122), .A (TimerOut[6]), .B (TempTMR[6]), .O (N27));
  MUX2 g1595(.S (N122), .A (TimerOut[0]), .B (TempTMR[0]), .O (N26));
  MUX2 g1596(.S (N122), .A (TimerOut[1]), .B (TempTMR[1]), .O (N25));
  MOAI1S g1598(.A1 (N13), .A2 (SAROut[1]), .B1 (N13), .B2 (SAROut[1]),
       .O (N24));
  INV1S g1601(.I (N22), .O (N21));
  NR2P g1602(.I1 (SAROut[6]), .I2 (N212), .O (N22));
  NR2 g1604(.I1 (N238), .I2 (N128), .O (N19));
  ND2 g1606(.I1 (TempTMR[1]), .I2 (TempTMR[0]), .O (N17));
  ND2T g1607(.I1 (N5), .I2 (N13), .O (N16));
  INV2 g1613(.I (SAROut[0]), .O (N13));
  INV3 g1614(.I (SAROut[1]), .O (N5));
  AN2B1S g2(.I1 (TempTMR[2]), .B1 (N17), .O (N3));
  OR2B1S g1631(.I1 (N122), .B1 (TempTMR[0]), .O (N2));
  XNR2HS g1632(.I1 (TempTMR[1]), .I2 (TempTMR[0]), .O (N1));
  INV2CK fopt1638(.I (N253), .O (N194));
  INV3CK fopt1639(.I (N194), .O (N193));
  BUF6 fopt1644(.I (N212), .O (N205));
  INV2 fopt1645(.I (N224), .O (N212));
  INV2 fopt1649(.I (N213), .O (N221));
  INV3 fopt1650(.I (N214), .O (N213));
  INV3 fopt1651(.I (N224), .O (N214));
  BUF2 fopt1652(.I (N270), .O (N224));
  OR2S g1655(.I1 (N233), .I2 (N122), .O (N234));
  BUF1S g1(.I (N232), .O (N233));
  AOI12HP g1656(.A1 (Reset), .B1 (N270), .B2 (N252), .O (N232));
  ND2 g1658(.I1 (N232), .I2 (N259), .O (N235));
  NR2 g1659(.I1 (N253), .I2 (N232), .O (N236));
  NR2F g1660(.I1 (SAROut[2]), .I2 (N16), .O (N237));
  INV2 g1661(.I (SAROut[3]), .O (N238));
  XOR2HS g1662(.I1 (N239), .I2 (SAROut[4]), .O (N241));
  ND2T g1664(.I1 (N237), .I2 (N238), .O (N239));
  XOR2HS g1667(.I1 (N243), .I2 (N244), .O (N245));
  INV1S g1668(.I (SAROut[5]), .O (N243));
  NR2T g1669(.I1 (SAROut[4]), .I2 (N239), .O (N244));
  ND2S g1670(.I1 (N271), .I2 (N22), .O (N248));
  OAI112H g1672(.A1 (N272), .B1 (N40), .C1 (N271), .C2 (N21), .O
       (N250));
  ND2P g1676(.I1 (N251), .I2 (N95), .O (N252));
  OR2P g3(.I1 (Dcr), .I2 (Inc), .O (N251));
  ND2 g1677(.I1 (N95), .I2 (N94), .O (N253));
  HA2 g1679(.A (TempTMR[4]), .B (N149), .C (N0));
  DFFRBN FlagTMR_reg(.RB (ResetN), .CK (ClockT), .D (N234), .QB (N259));
  INV2 g13(.I (N260), .O (SAROutD[5]));
  MUX2 g1686(.S (N205), .A (N5), .B (SAROutI[1]), .O (N264));
  ND3S g1687(.I1 (SAROut[1]), .I2 (SAROut[6]), .I3 (SAROut[7]), .O
       (N265));
  AN2T g1689(.I1 (SAROutD[6]), .I2 (N214), .O (N23));
  ND2F g19(.I1 (N269), .I2 (N96), .O (N270));
  ND2F g23(.I1 (N95), .I2 (N94), .O (N269));
  AOI13H g27(.A1 (N23), .B1 (N271), .B2 (N213), .B3 (SAROut[6]), .O
       (N272));
  AN2T g28(.I1 (N244), .I2 (N243), .O (N271));
  ND2S g26(.I1 (N274), .I2 (N40), .O (N275));
  AOI22S g1690(.A1 (N245), .A2 (N213), .B1 (N214), .B2 (SAROutD[5]), .O
       (N274));
  XOR2 g1692(.I1 (N16), .I2 (SAROut[2]), .O (N285));
endmodule

