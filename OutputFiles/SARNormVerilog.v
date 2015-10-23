module SARNormVerilog(Clock, Reset, Compare, Ready, ClockTck,
     ClockCmp, ResetP, ResetN, SAROutG, SAROut, DataOut);
  input Clock, Reset, Compare;
  output Ready, ClockTck, ClockCmp, ResetP, ResetN, SAROutG;
  output [7:0] SAROut, DataOut;
  wire Clock, Reset, Compare;
  wire Ready, ClockTck, ClockCmp, ResetP, ResetN, SAROutG;
  wire [7:0] SAROut, DataOut;
  wire [1:0] StateP;
  wire [7:0] SAR;
  wire [7:0] TempSAR;
  wire N1, N2, N3, N4, N5, N6, N7, N8;
  wire N9, N10, N11, N12, N13, N14, N15, N16;
  wire N17, N18, N19, N20, N21, N22, N23, N24;
  wire N26, N27, N28, N39, N49, N50, N56, N57;
  wire N58, N59, N60, N63;
  BUF4 g298(.I (ResetN), .O(SAROutG));
  BUF4 g299(.I (Reset), .O(ResetP));
  NR2 g300(.I1 (StateP[0]), .I2 (StateP[1]), .O (N39));
  ND2 g455(.I1 (N28), .I2 (ResetN), .O (SAROut[0]));
  OR2 g456(.I1 (SAR[0]), .I2 (TempSAR[0]), .O (N28));
  ND2 g459(.I1 (N27), .I2 (ResetN), .O (SAROut[1]));
  OR2 g460(.I1 (SAR[1]), .I2 (TempSAR[1]), .O (N27));
  AN2 g461(.I1 (N17), .I2 (SAR[1]), .O (N24));
  QDFFRBN \SAR_reg[1] (.RB (ResetN), .CK (Clock), .D (N23), .Q
       (SAR[1]));
  ND2 g463(.I1 (N26), .I2 (ResetN), .O (SAROut[2]));
  OR2 g464(.I1 (SAR[2]), .I2 (TempSAR[2]), .O (N26));
  AN2 g465(.I1 (N17), .I2 (SAR[2]), .O (N23));
  QDFFRBN \SAR_reg[2] (.RB (ResetN), .CK (Clock), .D (N22), .Q
       (SAR[2]));
  ND2 g467(.I1 (N60), .I2 (ResetN), .O (SAROut[3]));
  AN2 g468(.I1 (N17), .I2 (SAR[3]), .O (N22));
  OR2 g469(.I1 (SAR[3]), .I2 (TempSAR[3]), .O (N60));
  QDFFRBN \SAR_reg[3] (.RB (ResetN), .CK (Clock), .D (N21), .Q
       (SAR[3]));
  ND2 g471(.I1 (N59), .I2 (ResetN), .O (SAROut[4]));
  AN2 g472(.I1 (N17), .I2 (SAR[4]), .O (N21));
  OR2 g473(.I1 (SAR[4]), .I2 (TempSAR[4]), .O (N59));
  QDFFRBN \SAR_reg[4] (.RB (ResetN), .CK (Clock), .D (N20), .Q
       (SAR[4]));
  ND2 g475(.I1 (N58), .I2 (ResetN), .O (SAROut[5]));
  OR2 g476(.I1 (SAR[5]), .I2 (TempSAR[5]), .O (N58));
  AN2 g477(.I1 (N17), .I2 (SAR[5]), .O (N20));
  QDFFRBN \SAR_reg[5] (.RB (ResetN), .CK (Clock), .D (N19), .Q
       (SAR[5]));
  ND2P g479(.I1 (N57), .I2 (ResetN), .O (SAROut[6]));
  AN2 g480(.I1 (N17), .I2 (SAR[6]), .O (N19));
  OR2 g481(.I1 (SAR[6]), .I2 (TempSAR[6]), .O (N57));
  QDFFRBN \SAR_reg[6] (.RB (ResetN), .CK (Clock), .D (N18), .Q
       (SAR[6]));
  ND2T g483(.I1 (N56), .I2 (ResetN), .O (SAROut[7]));
  AN2 g484(.I1 (N17), .I2 (SAR[7]), .O (N18));
  OR2 g485(.I1 (SAR[7]), .I2 (TempSAR[7]), .O (N56));
  AN3B2S g486(.I1 (N39), .B1 (Reset), .B2 (Clock), .O (ClockTck));
  AN3B2S g487(.I1 (N3), .B1 (Reset), .B2 (Clock), .O (ClockCmp));
  QDFFRBN \SAR_reg[7] (.RB (ResetN), .CK (Clock), .D (N39), .Q
       (SAR[7]));
  INV1S g489(.I (N50), .O (N17));
  ND2 g490(.I1 (N49), .I2 (StateP[0]), .O (N50));
  INV1S g492(.I (Reset), .O (ResetN));
  NR6 g663(.I1 (SAR[1]), .I2 (N63), .I3 (N50), .I4 (SAR[5]), .I5
       (SAR[6]), .I6 (N15), .O (N16));
  QDFFRBN \TempSAR_reg[0] (.RB (ResetN), .CK (Clock), .D (N14), .Q
       (TempSAR[0]));
  QDFFRBN \TempSAR_reg[1] (.RB (ResetN), .CK (Clock), .D (N13), .Q
       (TempSAR[1]));
  QDFFRBN \TempSAR_reg[2] (.RB (ResetN), .CK (Clock), .D (N12), .Q
       (TempSAR[2]));
  QDFFRBN \TempSAR_reg[3] (.RB (ResetN), .CK (Clock), .D (N11), .Q
       (TempSAR[3]));
  QDFFRBN \TempSAR_reg[4] (.RB (ResetN), .CK (Clock), .D (N10), .Q
       (TempSAR[4]));
  QDFFRBN \TempSAR_reg[5] (.RB (ResetN), .CK (Clock), .D (N9), .Q
       (TempSAR[5]));
  QDFFRBN \TempSAR_reg[6] (.RB (ResetN), .CK (Clock), .D (N8), .Q
       (TempSAR[6]));
  QDFFRBN \TempSAR_reg[7] (.RB (ResetN), .CK (Clock), .D (N7), .Q
       (TempSAR[7]));
  QDFZRBN \DataOut_reg[5] (.RB (ResetN), .CK (Clock), .D (TempSAR[5]),
       .TD (DataOut[5]), .SEL (N5), .Q (DataOut[5]));
  QDFZRBN \DataOut_reg[6] (.RB (ResetN), .CK (Clock), .D (TempSAR[6]),
       .TD (DataOut[6]), .SEL (N5), .Q (DataOut[6]));
  QDFZRBN \DataOut_reg[7] (.RB (ResetN), .CK (Clock), .D (TempSAR[7]),
       .TD (DataOut[7]), .SEL (N5), .Q (DataOut[7]));
  QDFZRBN \DataOut_reg[0] (.RB (ResetN), .CK (Clock), .D (TempSAR[0]),
       .TD (DataOut[0]), .SEL (N5), .Q (DataOut[0]));
  QDFZRBN \DataOut_reg[1] (.RB (ResetN), .CK (Clock), .D (TempSAR[1]),
       .TD (DataOut[1]), .SEL (N5), .Q (DataOut[1]));
  QDFZRBN \DataOut_reg[2] (.RB (ResetN), .CK (Clock), .D (TempSAR[2]),
       .TD (DataOut[2]), .SEL (N5), .Q (DataOut[2]));
  QDFZRBN \DataOut_reg[3] (.RB (ResetN), .CK (Clock), .D (TempSAR[3]),
       .TD (DataOut[3]), .SEL (N5), .Q (DataOut[3]));
  QDFZRBN \DataOut_reg[4] (.RB (ResetN), .CK (Clock), .D (TempSAR[4]),
       .TD (DataOut[4]), .SEL (N5), .Q (DataOut[4]));
  ND3 g680(.I1 (ResetN), .I2 (N2), .I3 (N1), .O (N15));
  AO22 g681(.A1 (TempSAR[0]), .A2 (N3), .B1 (N28), .B2 (N6), .O (N14));
  AO22 g682(.A1 (TempSAR[1]), .A2 (N3), .B1 (N27), .B2 (N6), .O (N13));
  AO22 g683(.A1 (TempSAR[2]), .A2 (N3), .B1 (N26), .B2 (N6), .O (N12));
  AO22 g684(.A1 (TempSAR[3]), .A2 (N3), .B1 (N60), .B2 (N6), .O (N11));
  AO22 g685(.A1 (TempSAR[4]), .A2 (N3), .B1 (N59), .B2 (N6), .O (N10));
  AO22 g686(.A1 (TempSAR[5]), .A2 (N3), .B1 (N58), .B2 (N6), .O (N9));
  AO22 g687(.A1 (TempSAR[6]), .A2 (N3), .B1 (N57), .B2 (N6), .O (N8));
  AO22 g688(.A1 (TempSAR[7]), .A2 (N3), .B1 (N56), .B2 (N6), .O (N7));
  QDFFRBN Ready_reg(.RB (ResetN), .CK (Clock), .D (N4), .Q (Ready));
  QDFFRBN \StateP_reg[0] (.RB (ResetN), .CK (Clock), .D (N49), .Q
       (StateP[0]));
  AN2B1S g691(.I1 (Compare), .B1 (N39), .O (N6));
  INV1S g692(.I (N5), .O (N4));
  OR2B1S g693(.I1 (N49), .B1 (StateP[0]), .O (N5));
  NR2 g695(.I1 (SAR[2]), .I2 (SAR[4]), .O (N2));
  NR2 g696(.I1 (SAR[7]), .I2 (SAR[3]), .O (N1));
  INV1S g714(.I (N39), .O (N3));
  DFFRBN \SAR_reg[0] (.RB (ResetN), .CK (Clock), .D (N24), .Q (SAR[0]),
       .QB (N63));
  DFFRBN \StateP_reg[1] (.RB (ResetN), .CK (Clock), .D (N16), .Q
       (StateP[1]), .QB (N49));
endmodule

