module SARSlowVerilog(Clock, Reset, Inc, Dcr, Compare, ClockCmp,
     StateP, SAROut);
  input Clock, Reset, Inc, Dcr, Compare;
  output ClockCmp;
  output [1:0] StateP;
  output [7:0] SAROut;
  wire Clock, Reset, Inc, Dcr, Compare;
  wire ClockCmp;
  wire [1:0] StateP;
  wire [7:0] SAROut;
  wire [7:0] SAR;
  wire [7:0] TempSAR;
  wire [7:0] SetSAR;
  wire [1:0] CheckID;
  wire N0, N1, N2, N3, N4, N6, N7, N8;
  wire N9, N10, N11, N12, N13, N14, N15, N16;
  wire N17, N18, N19, N20, N21, N23, N24, N25;
  wire N26, N27, N28, N29, N30, N31, N32, N33;
  wire N34, N35, N36, N37, N38, N39, N40, N41;
  wire N42, N43, N44, N45, N46, N47, N48, N49;
  wire N51, N52, N53, N54, N55, N56, N57, N58;
  wire N59, N62, N63, N64, N65, N66, N67, N69;
  wire N70, N71, N74, N75, N76, N77, N78, N79;
  wire N81, N82, N84, N85, N86, N87, N90, N91;
  wire N92, N93, N94, N95, N96, N97, N99, N100;
  wire N101, N102, N103, N104, N105, N106, N107, N108;
  wire N109, N110, N111, N112, N113, N114, N115, N116;
  wire N117, N118, N119, N120, N121, N122, N123, N124;
  wire N125, N126, N127, N128, N129, N130, N131, N132;
  wire N133, N134, N135, N136, N137, N138, N139, N140;
  wire N141, N142, N143, N144, N145, N146, N147, N148;
  wire N149, N150, N152, N153, N154, N155, N156, N157;
  wire N158, N162, N165, N167, N168, N169, N170, N171;
  wire N172, N181, N182, N183, N184, N185, N186, N187;
  wire N192, N193, N194, N197, N198, N199, N200, N201;
  INV1S g2206(.I (N168), .O (N158));
  INV1S g2207(.I (N169), .O (N157));
  INV1S g2205(.I (N171), .O (N156));
  INV1S g2204(.I (N181), .O (N155));
  INV1S g2208(.I (N170), .O (N154));
  NR2 g2209(.I1 (StateP[1]), .I2 (StateP[0]), .O (N182));
  NR2 g2463(.I1 (Reset), .I2 (N153), .O (SAROut[0]));
  INV1S g2464(.I (N153), .O (N184));
  NR2 g2465(.I1 (SAR[0]), .I2 (TempSAR[0]), .O (N153));
  QDFFRBS \SAR_reg[0] (.RB (N12), .CK (Clock), .D (N152), .Q (SAR[0]));
  AO22 g2467(.A1 (N162), .A2 (SetSAR[0]), .B1 (SAR[1]), .B2
       (StateP[1]), .O (N152));
  AN3 g2469(.I1 (N167), .I2 (N165), .I3 (N185), .O (N162));
  AN2 g2470(.I1 (N171), .I2 (N12), .O (SAROut[4]));
  AN2 g2471(.I1 (N168), .I2 (N12), .O (SAROut[7]));
  AN2 g2472(.I1 (N169), .I2 (N12), .O (SAROut[6]));
  AN2 g2473(.I1 (N172), .I2 (N12), .O (SAROut[3]));
  AN2 g2474(.I1 (N170), .I2 (N12), .O (SAROut[5]));
  AN2 g2475(.I1 (N181), .I2 (N12), .O (SAROut[2]));
  AN2 g2476(.I1 (N183), .I2 (N12), .O (SAROut[1]));
  OR2 g2477(.I1 (N186), .I2 (N187), .O (N167));
  NR3 g2478(.I1 (Clock), .I2 (N182), .I3 (Reset), .O (ClockCmp));
  MOAI1S g2479(.A1 (CheckID[0]), .A2 (Compare), .B1 (CheckID[0]), .B2
       (Compare), .O (N185));
  NR2 g2480(.I1 (CheckID[0]), .I2 (N150), .O (N186));
  AN2 g2481(.I1 (N150), .I2 (CheckID[0]), .O (N187));
  OR2 g2483(.I1 (TempSAR[1]), .I2 (SAR[1]), .O (N183));
  OR2 g2484(.I1 (TempSAR[5]), .I2 (SAR[5]), .O (N170));
  OR2 g2485(.I1 (TempSAR[4]), .I2 (SAR[4]), .O (N171));
  OR2 g2486(.I1 (TempSAR[7]), .I2 (SAR[7]), .O (N168));
  OR2 g2487(.I1 (TempSAR[3]), .I2 (SAR[3]), .O (N172));
  OR2 g2488(.I1 (TempSAR[6]), .I2 (SAR[6]), .O (N169));
  OR2 g2489(.I1 (TempSAR[2]), .I2 (SAR[2]), .O (N181));
  INV1S g2490(.I (Reset), .O (N12));
  AN2B1S g2(.I1 (StateP[0]), .B1 (StateP[1]), .O (N165));
  OAI222S g4010(.A1 (N28), .A2 (N124), .B1 (N145), .B2 (N1), .C1 (N62),
       .C2 (N158), .O (N149));
  DFFSBN \StateP_reg[1] (.SB (N12), .CK (Clock), .D (N147), .Q
       (StateP[1]));
  OAI222S g4014(.A1 (N14), .A2 (N144), .B1 (N114), .B2 (N28), .C1
       (N62), .C2 (N157), .O (N148));
  QDFFRBN \SetSAR_reg[7] (.RB (N12), .CK (Clock), .D (N143), .Q
       (SetSAR[7]));
  ND3 g4017(.I1 (N132), .I2 (N140), .I3 (N198), .O (N147));
  OAI222S g4018(.A1 (N0), .A2 (N139), .B1 (N104), .B2 (N28), .C1 (N62),
       .C2 (N154), .O (N146));
  AOI112S g4019(.A1 (N136), .B1 (N138), .C1 (Compare), .C2 (SetSAR[6]),
       .O (N145));
  QDFFRBN \SetSAR_reg[5] (.RB (N12), .CK (Clock), .D (N135), .Q
       (SetSAR[5]));
  AOI13HS g4023(.A1 (N138), .B1 (N115), .B2 (N116), .B3 (N8), .O
       (N144));
  ND3 g4024(.I1 (N128), .I2 (N129), .I3 (N19), .O (N143));
  OAI222S g4025(.A1 (N4), .A2 (N131), .B1 (N90), .B2 (N28), .C1 (N62),
       .C2 (N156), .O (N142));
  QDFFRBN \SetSAR_reg[6] (.RB (N12), .CK (Clock), .D (N127), .Q
       (SetSAR[6]));
  QDFFRBN \TempSAR_reg[1] (.RB (N12), .CK (Clock), .D (N134), .Q
       (TempSAR[1]));
  OAI112S g4028(.A1 (N133), .B1 (N78), .C1 (N74), .C2 (N28), .O (N141));
  OAI12S g4029(.A1 (N165), .B1 (N118), .B2 (N44), .O (N140));
  OA13S g4030(.A1 (N130), .B1 (N105), .B2 (N106), .B3 (Compare), .O
       (N139));
  ND2 g4031(.I1 (N130), .I2 (N76), .O (N138));
  OAI222S g4032(.A1 (N9), .A2 (N117), .B1 (N59), .B2 (N28), .C1 (N62),
       .C2 (N155), .O (N137));
  OA112 g4033(.A1 (N126), .B1 (N8), .C1 (N116), .C2 (SetSAR[6]), .O
       (N136));
  ND3 g4034(.I1 (N108), .I2 (N123), .I3 (N31), .O (N135));
  QDFFRBN \SetSAR_reg[3] (.RB (N12), .CK (Clock), .D (N120), .Q
       (SetSAR[3]));
  QDFFRBN \SetSAR_reg[4] (.RB (N12), .CK (Clock), .D (N122), .Q
       (SetSAR[4]));
  AO222 g4037(.A1 (N183), .A2 (N63), .B1 (N112), .B2 (TempSAR[1]), .C1
       (N25), .C2 (N29), .O (N134));
  OAI12S g4038(.A1 (TempSAR[3]), .B1 (N110), .B2 (N101), .O (N133));
  OR3 g4039(.I1 (N8), .I2 (N1), .I3 (N124), .O (N132));
  AOI13HS g4040(.A1 (N121), .B1 (N92), .B2 (N87), .B3 (N8), .O (N131));
  AOI12S g4041(.A1 (N121), .B1 (Compare), .B2 (SetSAR[4]), .O (N130));
  ND3 g4042(.I1 (N125), .I2 (N16), .I3 (TempSAR[7]), .O (N129));
  OR3 g4043(.I1 (TempSAR[7]), .I2 (N18), .I3 (N124), .O (N128));
  ND3 g4044(.I1 (N119), .I2 (N99), .I3 (N32), .O (N127));
  DFFSBN \StateP_reg[0] (.SB (N12), .CK (Clock), .D (N113), .Q
       (StateP[0]));
  QDFFRBN \SetSAR_reg[0] (.RB (N12), .CK (Clock), .D (N107), .Q
       (SetSAR[0]));
  QDFFRBN \SetSAR_reg[2] (.RB (N12), .CK (Clock), .D (N109), .Q
       (SetSAR[2]));
  INV1S g4049(.I (N125), .O (N126));
  NR2 g4050(.I1 (TempSAR[6]), .I2 (N115), .O (N125));
  OR2 g4051(.I1 (N14), .I2 (N114), .O (N124));
  ND3 g4052(.I1 (N105), .I2 (N16), .I3 (TempSAR[5]), .O (N123));
  ND3 g4053(.I1 (N85), .I2 (N96), .I3 (N39), .O (N122));
  AO12 g4054(.A1 (N110), .B1 (Compare), .B2 (SetSAR[3]), .O (N121));
  ND3 g4055(.I1 (N95), .I2 (N100), .I3 (N35), .O (N120));
  OR3 g4056(.I1 (TempSAR[6]), .I2 (N46), .I3 (N114), .O (N119));
  OAI22S g4057(.A1 (Compare), .A2 (N192), .B1 (N186), .B2 (N8), .O
       (N118));
  AOI112S g4058(.A1 (N103), .B1 (N97), .C1 (N26), .C2 (N65), .O (N117));
  QDFFRBN \SetSAR_reg[1] (.RB (N12), .CK (Clock), .D (N102), .Q
       (SetSAR[1]));
  OR2B1S g4060(.I1 (SetSAR[5]), .B1 (N106), .O (N116));
  ND2 g4061(.I1 (N105), .I2 (N0), .O (N115));
  OR2 g4062(.I1 (N0), .I2 (N104), .O (N114));
  OAI12S g4063(.A1 (N94), .B1 (N199), .B2 (N13), .O (N113));
  OR2 g4064(.I1 (N97), .I2 (N93), .O (N112));
  OAI112S g4065(.A1 (N201), .B1 (N82), .C1 (N24), .C2 (N167), .O
       (N111));
  AO12 g4066(.A1 (N97), .B1 (N66), .B2 (Compare), .O (N110));
  ND3 g4067(.I1 (N70), .I2 (N86), .I3 (N21), .O (N109));
  OR3 g4068(.I1 (TempSAR[5]), .I2 (N18), .I3 (N104), .O (N108));
  MOAI1S g4069(.A1 (N84), .A2 (N6), .B1 (N162), .B2 (SetSAR[0]), .O
       (N107));
  NR2 g4072(.I1 (SetSAR[4]), .I2 (N87), .O (N106));
  NR2 g4073(.I1 (TempSAR[4]), .I2 (N92), .O (N105));
  OR2 g4074(.I1 (N4), .I2 (N90), .O (N104));
  NR2 g4075(.I1 (N40), .I2 (N194), .O (N103));
  OAI112S g4076(.A1 (N69), .B1 (N20), .C1 (N17), .C2 (N49), .O (N102));
  NR2 g4077(.I1 (N77), .I2 (N193), .O (N101));
  ND3 g4078(.I1 (N16), .I2 (N77), .I3 (TempSAR[3]), .O (N100));
  ND3 g4079(.I1 (N47), .I2 (N71), .I3 (TempSAR[6]), .O (N99));
  OR3 g4082(.I1 (TempSAR[4]), .I2 (N46), .I3 (N90), .O (N96));
  OR3 g4083(.I1 (TempSAR[3]), .I2 (N74), .I3 (N18), .O (N95));
  AOI112S g4084(.A1 (N91), .B1 (Reset), .C1 (N13), .C2 (N54), .O (N94));
  MOAI1S g4085(.A1 (N67), .A2 (Compare), .B1 (Compare), .B2
       (SetSAR[0]), .O (N93));
  QDFFRBN \SAR_reg[7] (.RB (N12), .CK (Clock), .D (N75), .Q (SAR[7]));
  ND2 g4087(.I1 (N77), .I2 (N11), .O (N92));
  NR6 g4088(.I1 (SAR[5]), .I2 (SAR[7]), .I3 (N64), .I4 (SAR[6]), .I5
       (SAR[4]), .I6 (N45), .O (N91));
  OR2 g4089(.I1 (N11), .I2 (N74), .O (N90));
  OR3 g4092(.I1 (SetSAR[3]), .I2 (N66), .I3 (N2), .O (N87));
  OR3 g4093(.I1 (TempSAR[2]), .I2 (N59), .I3 (N46), .O (N86));
  ND3 g4094(.I1 (N47), .I2 (N51), .I3 (TempSAR[4]), .O (N85));
  AOI13HS g4095(.A1 (N48), .B1 (N3), .B2 (N25), .B3 (CheckID[0]), .O
       (N84));
  AOI22S g4097(.A1 (N63), .A2 (N184), .B1 (N200), .B2 (TempSAR[0]), .O
       (N82));
  MOAI1S g4098(.A1 (N64), .A2 (N150), .B1 (N182), .B2 (Inc), .O (N81));
  MOAI1S g4100(.A1 (N64), .A2 (N7), .B1 (N182), .B2 (Dcr), .O (N79));
  QDFFRBN \SAR_reg[4] (.RB (N12), .CK (Clock), .D (N58), .Q (SAR[4]));
  QDFFRBN \SAR_reg[5] (.RB (N12), .CK (Clock), .D (N57), .Q (SAR[5]));
  QDFFRBN \SAR_reg[6] (.RB (N12), .CK (Clock), .D (N56), .Q (SAR[6]));
  QDFFRBN \SAR_reg[3] (.RB (N12), .CK (Clock), .D (N52), .Q (SAR[3]));
  QDFFRBN \SAR_reg[1] (.RB (N12), .CK (Clock), .D (N53), .Q (SAR[1]));
  QDFFRBN \SAR_reg[2] (.RB (N12), .CK (Clock), .D (N55), .Q (SAR[2]));
  ND2S g4107(.I1 (N172), .I2 (N63), .O (N78));
  NR2 g4108(.I1 (TempSAR[2]), .I2 (N65), .O (N77));
  ND2 g4109(.I1 (Compare), .I2 (SetSAR[5]), .O (N76));
  AN4B1S g4110(.I1 (SetSAR[7]), .I2 (N185), .I3 (N165), .B1 (N6), .O
       (N75));
  OR2 g4111(.I1 (N9), .I2 (N59), .O (N74));
  AN3 g4114(.I1 (N51), .I2 (N4), .I3 (N0), .O (N71));
  ND3 g4115(.I1 (N47), .I2 (N38), .I3 (TempSAR[2]), .O (N70));
  OR3 g4116(.I1 (TempSAR[1]), .I2 (N24), .I3 (N18), .O (N69));
  AOI22S g4118(.A1 (N30), .A2 (N10), .B1 (N187), .B2 (TempSAR[0]), .O
       (N67));
  OR2B1S g4119(.I1 (SetSAR[2]), .B1 (N40), .O (N66));
  ND2 g4120(.I1 (N187), .I2 (N38), .O (N65));
  NR2 g4121(.I1 (N43), .I2 (N165), .O (N64));
  INV1S g4122(.I (N63), .O (N62));
  AN2 g4123(.I1 (N43), .I2 (Compare), .O (N63));
  ND2 g4126(.I1 (N25), .I2 (TempSAR[1]), .O (N59));
  ND2 g4127(.I1 (N39), .I2 (N37), .O (N58));
  ND2 g4128(.I1 (N31), .I2 (N41), .O (N57));
  ND2 g4129(.I1 (N32), .I2 (N34), .O (N56));
  ND2 g4130(.I1 (N21), .I2 (N42), .O (N55));
  NR2 g4131(.I1 (N23), .I2 (StateP[1]), .O (N54));
  ND2 g4132(.I1 (N20), .I2 (N27), .O (N53));
  ND2 g4133(.I1 (N35), .I2 (N36), .O (N52));
  AN3 g4134(.I1 (N38), .I2 (N11), .I3 (N9), .O (N51));
  ND3 g4136(.I1 (N187), .I2 (N15), .I3 (TempSAR[1]), .O (N49));
  NR3 g4137(.I1 (CheckID[0]), .I2 (TempSAR[0]), .I3 (N17), .O (N48));
  NR3 g4138(.I1 (CheckID[1]), .I2 (N7), .I3 (N17), .O (N47));
  ND3 g4139(.I1 (N3), .I2 (N7), .I3 (CheckID[1]), .O (N46));
  OR3B2 g4140(.I1 (SAR[1]), .B1 (N33), .B2 (SAR[0]), .O (N45));
  AOI22S g4141(.A1 (N187), .A2 (N8), .B1 (N10), .B2 (Compare), .O
       (N44));
  AN2B1S g4142(.I1 (StateP[1]), .B1 (StateP[0]), .O (N43));
  ND2S g4143(.I1 (SAR[3]), .I2 (StateP[1]), .O (N42));
  ND2S g4144(.I1 (SAR[6]), .I2 (StateP[1]), .O (N41));
  NR2 g4145(.I1 (SetSAR[0]), .I2 (SetSAR[1]), .O (N40));
  ND2S g4146(.I1 (N162), .I2 (SetSAR[4]), .O (N39));
  NR2 g4147(.I1 (TempSAR[0]), .I2 (TempSAR[1]), .O (N38));
  ND2S g4148(.I1 (SAR[5]), .I2 (StateP[1]), .O (N37));
  ND2S g4149(.I1 (SAR[4]), .I2 (StateP[1]), .O (N36));
  ND2S g4150(.I1 (N162), .I2 (SetSAR[3]), .O (N35));
  ND2S g4151(.I1 (SAR[7]), .I2 (StateP[1]), .O (N34));
  NR2 g4152(.I1 (SAR[2]), .I2 (SAR[3]), .O (N33));
  ND2S g4153(.I1 (N162), .I2 (SetSAR[6]), .O (N32));
  ND2S g4154(.I1 (N162), .I2 (SetSAR[5]), .O (N31));
  OR2 g4155(.I1 (SetSAR[0]), .I2 (N2), .O (N30));
  INV1S g4156(.I (N29), .O (N28));
  NR2 g4157(.I1 (N8), .I2 (N2), .O (N29));
  ND2S g4158(.I1 (SAR[2]), .I2 (StateP[1]), .O (N27));
  NR2 g4159(.I1 (Compare), .I2 (N186), .O (N26));
  INV1S g4160(.I (N25), .O (N24));
  NR2 g4161(.I1 (N15), .I2 (N13), .O (N25));
  NR2 g4162(.I1 (Dcr), .I2 (Inc), .O (N23));
  ND2S g4164(.I1 (N162), .I2 (SetSAR[2]), .O (N21));
  ND2S g4165(.I1 (N162), .I2 (SetSAR[1]), .O (N20));
  ND2S g4166(.I1 (N162), .I2 (SetSAR[7]), .O (N19));
  ND2 g4167(.I1 (N3), .I2 (N186), .O (N18));
  INV1S g4168(.I (N17), .O (N16));
  ND2 g4169(.I1 (N3), .I2 (N165), .O (N17));
  INV1S g4186(.I (N165), .O (N13));
  INV1S g4202(.I (N187), .O (N10));
  INV1S g4212(.I (Compare), .O (N8));
  INV1S g4217(.I (N167), .O (N6));
  INV1S g4234(.I (N162), .O (N3));
  INV1S g4235(.I (N186), .O (N2));
  ND3 g4257(.I1 (N71), .I2 (N1), .I3 (N14), .O (N192));
  NR2 g4258(.I1 (N26), .I2 (N66), .O (N193));
  NR2 g4259(.I1 (Compare), .I2 (N65), .O (N194));
  OAI12S g4261(.A1 (N165), .B1 (N8), .B2 (N187), .O (N97));
  OA12S g4262(.A1 (N165), .B1 (N6), .B2 (N185), .O (N197));
  NR2 g4263(.I1 (Reset), .I2 (N43), .O (N198));
  AN2B1S g4264(.I1 (N44), .B1 (N26), .O (N199));
  OR2 g4265(.I1 (N182), .I2 (StateP[1]), .O (N200));
  DFFRBN \CheckID_reg[1] (.RB (N12), .CK (Clock), .D (N81), .Q
       (CheckID[1]), .QB (N150));
  DFFRBN \TempSAR_reg[0] (.RB (N12), .CK (Clock), .D (N111), .Q
       (TempSAR[0]), .QB (N15));
  DFFRBN \TempSAR_reg[6] (.RB (N12), .CK (Clock), .D (N148), .Q
       (TempSAR[6]), .QB (N14));
  DFFRBN \TempSAR_reg[3] (.RB (N12), .CK (Clock), .D (N141), .Q
       (TempSAR[3]), .QB (N11));
  DFFRBN \TempSAR_reg[2] (.RB (N12), .CK (Clock), .D (N137), .Q
       (TempSAR[2]), .QB (N9));
  DFFRBN \CheckID_reg[0] (.RB (N12), .CK (Clock), .D (N79), .Q
       (CheckID[0]), .QB (N7));
  DFFRBN \TempSAR_reg[4] (.RB (N12), .CK (Clock), .D (N142), .Q
       (TempSAR[4]), .QB (N4));
  DFFRBN \TempSAR_reg[7] (.RB (N12), .CK (Clock), .D (N149), .Q
       (TempSAR[7]), .QB (N1));
  DFFRBN \TempSAR_reg[5] (.RB (N12), .CK (Clock), .D (N146), .Q
       (TempSAR[5]), .QB (N0));
  OR3B2 g4284(.I1 (N197), .B1 (StateP[0]), .B2 (Compare), .O (N201));
endmodule

