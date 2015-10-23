module SARImprVerilog(Clock, Reset, Compare, Ready,
     ClockTck, ClockCmp, ResetP, ResetN, SAROutG, SAROut, DataOut);
  input Clock, Reset, Compare;
  output Ready, ClockTck, ClockCmp, ResetP, ResetN, SAROutG;
  output [7:0] SAROut, DataOut;
  wire Clock, Reset, Compare;
  wire Ready, ClockTck, ClockCmp, ResetP, ResetN, SAROutG;
  wire [7:0] SAROut, DataOut;
  wire [1:0] StateP;
  wire [7:0] SAR;
  wire [7:0] TempSAR;
  wire [3:0] Count;
  wire FlagN, N0, N1, N2, N3, N4, N5, N6;
  wire N8, N10, N11, N12, N13, N14, N15, N16;
  wire N17, N18, N19, N20, N21, N22, N23, N24;
  wire N25, N26, N27, N28, N29, N30, N31, N32;
  wire N33, N34, N35, N36, N37, N38, N40, N41;
  wire N42, N43, N44, N45, N46, N47, N48, N49;
  wire N50, N51, N52, N53, N54, N55, N56, N57;
  wire N58, N59, N60, N61, N62, N63, N64, N65;
  wire N66, N67, N68, N69, N70, N71, N72, N73;
  wire N74, N75, N76, N77, N78, N79, N80, N81;
  wire N82, N83, N84, N86, N87, N88, N89, N90;
  wire N91, N92, N93, N94, N95, N96, N97, N98;
  wire N99, N100, N101, N102, N103, N104, N105, N106;
  wire N107, N108, N109, N110, N111, N112, N113, N114;
  wire N115, N116, N117, N118, N119, N120, N121, N125;
  wire N126, N127, N128, N129, N135, N136, N137, N139;
  wire N140, N141, N142, N143, N158, N159, N161, N163;
  wire N164, N165, N166, N167, N168, N169, N170, N174;
  wire N175, N176;
  BUF4 g298(.I (ResetN), .O(SAROutG));
  BUF4 g299(.I (Reset), .O(ResetP));
  INV1S g1752(.I (N161), .O (N158));
  OR2 g1748(.I1 (StateP[0]), .I2 (StateP[1]), .O (N161));
  ND2 g3366(.I1 (N142), .I2 (ResetN), .O (SAROut[1]));
  OR2 g3367(.I1 (SAR[1]), .I2 (TempSAR[1]), .O (N142));
  QDFFRBS \SAR_reg[1] (.RB (ResetN), .CK (Clock), .D (N121), .Q
       (SAR[1]));
  OAI112S g3369(.A1 (N111), .B1 (N112), .C1 (N89), .C2 (N166), .O
       (N121));
  ND2 g3370(.I1 (N141), .I2 (ResetN), .O (SAROut[2]));
  OR2 g3371(.I1 (SAR[2]), .I2 (TempSAR[2]), .O (N141));
  ND3 g3374(.I1 (N110), .I2 (N109), .I3 (N119), .O (N120));
  ND2 g3375(.I1 (N140), .I2 (ResetN), .O (SAROut[3]));
  ND2S g3376(.I1 (N88), .I2 (SAR[3]), .O (N119));
  OR2 g3377(.I1 (SAR[3]), .I2 (TempSAR[3]), .O (N140));
  QDFFRBS \SAR_reg[3] (.RB (ResetN), .CK (Clock), .D (N118), .Q
       (SAR[3]));
  OAI222S g3379(.A1 (N107), .A2 (N95), .B1 (N89), .B2 (N167), .C1
       (N91), .C2 (N103), .O (N118));
  ND2 g3380(.I1 (N139), .I2 (ResetN), .O (SAROut[4]));
  OR2 g3381(.I1 (SAR[4]), .I2 (TempSAR[4]), .O (N139));
  OAI112S g3384(.A1 (N108), .B1 (N116), .C1 (N95), .C2 (N101), .O
       (N117));
  ND2 g3385(.I1 (N137), .I2 (ResetN), .O (SAROut[5]));
  OR2 g3386(.I1 (SAR[5]), .I2 (TempSAR[5]), .O (N137));
  ND2S g3387(.I1 (N88), .I2 (SAR[5]), .O (N116));
  QDFFRBN \SAR_reg[5] (.RB (ResetN), .CK (Clock), .D (N115), .Q
       (SAR[5]));
  OAI222S g3389(.A1 (N94), .A2 (N95), .B1 (N89), .B2 (N168), .C1 (N99),
       .C2 (N91), .O (N115));
  ND2P g3390(.I1 (N136), .I2 (ResetN), .O (SAROut[6]));
  OR2 g3391(.I1 (SAR[6]), .I2 (TempSAR[6]), .O (N136));
  ND3 g3394(.I1 (N97), .I2 (N104), .I3 (N113), .O (N114));
  ND2T g3395(.I1 (N135), .I2 (ResetN), .O (SAROut[7]));
  OR2 g3396(.I1 (SAR[7]), .I2 (TempSAR[7]), .O (N135));
  ND2S g3397(.I1 (N88), .I2 (SAR[7]), .O (N113));
  ND3 g3398(.I1 (N96), .I2 (N126), .I3 (N90), .O (N112));
  OR3B2 g3399(.I1 (N163), .B1 (N92), .B2 (DataOut[1]), .O (N111));
  ND3 g3400(.I1 (N96), .I2 (N126), .I3 (N83), .O (N110));
  QDFFRBN \SAR_reg[7] (.RB (ResetN), .CK (Clock), .D (N106), .Q
       (SAR[7]));
  ND2S g3402(.I1 (N105), .I2 (N83), .O (N163));
  ND3 g3403(.I1 (N105), .I2 (N92), .I3 (DataOut[2]), .O (N109));
  ND3 g3404(.I1 (N92), .I2 (N100), .I3 (DataOut[4]), .O (N108));
  AN3B2S g3405(.I1 (N126), .B1 (N87), .B2 (N83), .O (N125));
  QDFFRBS Ready_reg(.RB (ResetN), .CK (Clock), .D (N102), .Q (Ready));
  OR2B1S g3407(.I1 (DataOut[3]), .B1 (N127), .O (N107));
  AN2 g3408(.I1 (N127), .I2 (DataOut[3]), .O (N126));
  NR2 g3409(.I1 (N91), .I2 (N98), .O (N106));
  AN3B2S g3410(.I1 (N100), .B1 (DataOut[3]), .B2 (DataOut[4]), .O
       (N105));
  ND3 g3411(.I1 (N92), .I2 (N93), .I3 (DataOut[6]), .O (N104));
  ND3 g3412(.I1 (N100), .I2 (DataOut[3]), .I3 (N86), .O (N103));
  INV1S g3413(.I (N159), .O (N102));
  OR2 g3414(.I1 (Count[3]), .I2 (N164), .O (N159));
  ND2S g3415(.I1 (N128), .I2 (N86), .O (N101));
  AN2 g3416(.I1 (N128), .I2 (DataOut[4]), .O (N127));
  AN3B2S g3417(.I1 (N93), .B1 (DataOut[5]), .B2 (DataOut[6]), .O
       (N100));
  ND3 g3418(.I1 (N93), .I2 (N82), .I3 (DataOut[5]), .O (N99));
  OA222 g3419(.A1 (Compare), .A2 (N5), .B1 (DataOut[7]), .B2 (N84), .C1
       (N81), .C2 (FlagN), .O (N98));
  ND3 g3420(.I1 (N96), .I2 (N82), .I3 (FlagN), .O (N97));
  ND2 g3421(.I1 (N169), .I2 (N10), .O (N164));
  AN2 g3422(.I1 (N129), .I2 (DataOut[5]), .O (N128));
  INV1S g3423(.I (N96), .O (N95));
  NR2 g3424(.I1 (N87), .I2 (N91), .O (N96));
  ND2 g3425(.I1 (N143), .I2 (ResetN), .O (SAROut[0]));
  OR2B1S g3426(.I1 (DataOut[5]), .B1 (N129), .O (N94));
  NR3 g3427(.I1 (Compare), .I2 (FlagN), .I3 (DataOut[7]), .O (N93));
  AN3B2S g3429(.I1 (N161), .B1 (Reset), .B2 (Clock), .O (ClockCmp));
  INV1S g3430(.I (N92), .O (N91));
  NR2 g3431(.I1 (N11), .I2 (StateP[1]), .O (N92));
  NR2 g3432(.I1 (N83), .I2 (DataOut[1]), .O (N90));
  INV1S g3433(.I (N89), .O (N88));
  ND2 g3434(.I1 (StateP[1]), .I2 (N11), .O (N89));
  NR2 g3435(.I1 (Count[0]), .I2 (Count[1]), .O (N169));
  ND2S g3436(.I1 (DataOut[7]), .I2 (Compare), .O (N87));
  NR2 g3437(.I1 (N84), .I2 (N82), .O (N129));
  ND2S g3438(.I1 (FlagN), .I2 (Compare), .O (N176));
  ND2 g3439(.I1 (N165), .I2 (N170), .O (N143));
  INV1S g3440(.I (DataOut[4]), .O (N86));
  INV1S g3441(.I (Reset), .O (ResetN));
  INV1S g3445(.I (FlagN), .O (N84));
  INV1S g3447(.I (DataOut[2]), .O (N83));
  INV1S g3449(.I (DataOut[6]), .O (N82));
  INV1S g3450(.I (Compare), .O (N81));
  AN3B1 g2(.I1 (N158), .I2 (Clock), .B1 (Reset), .O (ClockTck));
  QDFFRBN \TempSAR_reg[7] (.RB (ResetN), .CK (Clock), .D (N80), .Q
       (TempSAR[7]));
  QDFFRBN \TempSAR_reg[5] (.RB (ResetN), .CK (Clock), .D (N79), .Q
       (TempSAR[5]));
  QDFFRBN \TempSAR_reg[6] (.RB (ResetN), .CK (Clock), .D (N78), .Q
       (TempSAR[6]));
  OAI112S g3553(.A1 (N77), .B1 (N31), .C1 (N29), .C2 (N176), .O
       (N80));
  AO2222 g3554(.A1 (N48), .A2 (N128), .B1 (N72), .B2 (N13), .C1 (N19),
       .C2 (TempSAR[5]), .D1 (N16), .D2 (N137), .O (N79));
  AO2222 g3555(.A1 (N16), .A2 (N136), .B1 (N71), .B2 (N13), .C1 (N19),
       .C2 (TempSAR[6]), .D1 (N48), .D2 (N129), .O (N78));
  QDFFRBN \TempSAR_reg[4] (.RB (ResetN), .CK (Clock), .D (N76), .Q
       (TempSAR[4]));
  AOI22S g3557(.A1 (N74), .A2 (N13), .B1 (N19), .B2 (TempSAR[7]), .O
       (N77));
  QDFFRBN \TempSAR_reg[3] (.RB (ResetN), .CK (Clock), .D (N75), .Q
       (TempSAR[3]));
  AO2222 g3559(.A1 (N48), .A2 (N127), .B1 (N64), .B2 (N13), .C1 (N19),
       .C2 (TempSAR[4]), .D1 (N16), .D2 (N139), .O (N76));
  QDFFRBN \TempSAR_reg[2] (.RB (ResetN), .CK (Clock), .D (N73), .Q
       (TempSAR[2]));
  AO2222 g3561(.A1 (N48), .A2 (N126), .B1 (N61), .B2 (N13), .C1 (N19),
       .C2 (TempSAR[3]), .D1 (N16), .D2 (N140), .O (N75));
  MOAI1S g3562(.A1 (N69), .A2 (TempSAR[7]), .B1 (N69), .B2
       (TempSAR[7]), .O (N74));
  DFFSBN \StateP_reg[0] (.SB (ResetN), .CK (Clock), .D (N70), .Q
       (StateP[0]), .QB (N11));
  ND3 g3564(.I1 (N30), .I2 (N65), .I3 (N32), .O (N73));
  OAI112S g3565(.A1 (N66), .B1 (N63), .C1 (N0), .C2 (TempSAR[5]), .O
       (N72));
  MOAI1S g3566(.A1 (N68), .A2 (TempSAR[6]), .B1 (N68), .B2
       (TempSAR[6]), .O (N71));
  QDFFRBN \TempSAR_reg[1] (.RB (ResetN), .CK (Clock), .D (N67), .Q
       (TempSAR[1]));
  AOI13HS g3568(.A1 (Reset), .B1 (N62), .B2 (N37), .B3 (N38), .O (N70));
  MUX2 g3569(.S (TempSAR[6]), .A (N63), .B (N1), .O (N69));
  AN2 g3570(.I1 (N1), .I2 (N63), .O (N68));
  ND3 g3571(.I1 (N43), .I2 (N59), .I3 (N34), .O (N67));
  ND3 g3572(.I1 (N0), .I2 (N58), .I3 (TempSAR[5]), .O (N66));
  AOI22S g3573(.A1 (N54), .A2 (N13), .B1 (N19), .B2 (TempSAR[2]), .O
       (N65));
  MOAI1S g3574(.A1 (N60), .A2 (TempSAR[4]), .B1 (N60), .B2
       (TempSAR[4]), .O (N64));
  OR2 g3578(.I1 (TempSAR[5]), .I2 (N58), .O (N63));
  OAI12S g3579(.A1 (N11), .B1 (N27), .B2 (N53), .O (N62));
  OAI112S g3580(.A1 (N56), .B1 (N50), .C1 (N45), .C2 (TempSAR[3]), .O
       (N61));
  DFFSBN \StateP_reg[1] (.SB (ResetN), .CK (Clock), .D (N51), .Q
       (StateP[1]), .QB (N6));
  QDFZN FlagN_reg(.CK (Clock), .D (DataOut[7]), .TD (FlagN), .SEL
       (N28), .Q (FlagN));
  AN2 g3583(.I1 (N52), .I2 (N50), .O (N60));
  ND2S g3585(.I1 (N49), .I2 (N13), .O (N59));
  OR2 g3586(.I1 (TempSAR[4]), .I2 (N50), .O (N58));
  OAI13S g3587(.A1 (N24), .B1 (N36), .B2 (N11), .B3 (StateP[1]), .O
       (N57));
  ND3 g3588(.I1 (N45), .I2 (N40), .I3 (TempSAR[3]), .O (N56));
  OAI112S g3589(.A1 (N35), .B1 (N33), .C1 (N43), .C2 (N8), .O (N55));
  MOAI1S g3590(.A1 (N46), .A2 (TempSAR[2]), .B1 (N46), .B2
       (TempSAR[2]), .O (N54));
  QDFFRBN \Count_reg[1] (.RB (ResetN), .CK (Clock), .D (N47), .Q
       (Count[1]));
  QDFFRBN \Count_reg[0] (.RB (ResetN), .CK (Clock), .D (N42), .Q
       (Count[0]));
  AN4B1S g3595(.I1 (N23), .I2 (N14), .I3 (N168), .B1 (N165), .O (N53));
  ND2S g3596(.I1 (N2), .I2 (TempSAR[3]), .O (N52));
  AN2 g3597(.I1 (N44), .I2 (ResetN), .O (N51));
  OR2 g3598(.I1 (TempSAR[3]), .I2 (N40), .O (N50));
  MOAI1S g3599(.A1 (N21), .A2 (N5), .B1 (N21), .B2 (N5), .O (N49));
  QDFZRBN \DataOut_reg[0] (.RB (ResetN), .CK (Clock), .D (TempSAR[0]),
       .TD (DataOut[0]), .SEL (N159), .Q (DataOut[0]));
  QDFZRBN \DataOut_reg[1] (.RB (ResetN), .CK (Clock), .D (TempSAR[1]),
       .TD (DataOut[1]), .SEL (N159), .Q (DataOut[1]));
  QDFZRBN \DataOut_reg[2] (.RB (ResetN), .CK (Clock), .D (TempSAR[2]),
       .TD (DataOut[2]), .SEL (N159), .Q (DataOut[2]));
  QDFZRBN \DataOut_reg[3] (.RB (ResetN), .CK (Clock), .D (TempSAR[3]),
       .TD (DataOut[3]), .SEL (N159), .Q (DataOut[3]));
  QDFZRBN \DataOut_reg[4] (.RB (ResetN), .CK (Clock), .D (TempSAR[4]),
       .TD (DataOut[4]), .SEL (N159), .Q (DataOut[4]));
  QDFZRBN \DataOut_reg[5] (.RB (ResetN), .CK (Clock), .D (TempSAR[5]),
       .TD (DataOut[5]), .SEL (N159), .Q (DataOut[5]));
  QDFZRBN \DataOut_reg[6] (.RB (ResetN), .CK (Clock), .D (TempSAR[6]),
       .TD (DataOut[6]), .SEL (N159), .Q (DataOut[6]));
  QDFZRBN \DataOut_reg[7] (.RB (ResetN), .CK (Clock), .D (TempSAR[7]),
       .TD (DataOut[7]), .SEL (N159), .Q (DataOut[7]));
  AN2B1S g3608(.I1 (Compare), .B1 (N29), .O (N48));
  AN2 g3609(.I1 (N3), .I2 (N22), .O (N47));
  AN2 g3610(.I1 (N26), .I2 (N4), .O (N46));
  INV1S g3611(.I (N2), .O (N45));
  OAI112S g3613(.A1 (N27), .B1 (N17), .C1 (N175), .C2 (N11), .O (N44));
  OR2B1S g3614(.I1 (N30), .B1 (DataOut[1]), .O (N43));
  ND2 g3615(.I1 (N3), .I2 (Count[0]), .O (N42));
  AN2 g3616(.I1 (N3), .I2 (N20), .O (N41));
  OR2 g3617(.I1 (TempSAR[2]), .I2 (N4), .O (N40));
  OAI112S g3619(.A1 (StateP[0]), .B1 (StateP[1]), .C1 (Count[2]), .C2
       (Count[0]), .O (N38));
  OAI12S g3620(.A1 (N27), .B1 (Count[3]), .B2 (Count[1]), .O (N37));
  OA13S g3621(.A1 (N25), .B1 (N163), .B2 (N8), .B3 (DataOut[1]), .O
       (N36));
  AOI22S g3622(.A1 (N13), .A2 (N170), .B1 (N19), .B2 (TempSAR[0]), .O
       (N35));
  AOI22S g3623(.A1 (N19), .A2 (TempSAR[1]), .B1 (N16), .B2 (N142), .O
       (N34));
  ND2 g3624(.I1 (N16), .I2 (N143), .O (N33));
  ND2 g3625(.I1 (N16), .I2 (N141), .O (N32));
  ND2 g3626(.I1 (N16), .I2 (N135), .O (N31));
  ND2 g3627(.I1 (N125), .I2 (N12), .O (N30));
  ND2 g3628(.I1 (N12), .I2 (DataOut[7]), .O (N29));
  ND2 g3630(.I1 (N13), .I2 (ResetN), .O (N28));
  OAI12S g3631(.A1 (N161), .B1 (N11), .B2 (N6), .O (N27));
  ND3 g3632(.I1 (N5), .I2 (TempSAR[1]), .I3 (TempSAR[0]), .O (N26));
  ND3 g3633(.I1 (N125), .I2 (N8), .I3 (DataOut[1]), .O (N25));
  ND3 g3635(.I1 (N11), .I2 (StateP[1]), .I3 (SAR[1]), .O (N24));
  NR3 g3636(.I1 (SAR[5]), .I2 (SAR[1]), .I3 (N15), .O (N23));
  MOAI1S g3637(.A1 (Count[0]), .A2 (Count[1]), .B1 (Count[1]), .B2
       (Count[0]), .O (N22));
  MOAI1S g3638(.A1 (N170), .A2 (TempSAR[1]), .B1 (N170), .B2
       (TempSAR[1]), .O (N21));
  MOAI1S g3639(.A1 (N169), .A2 (N10), .B1 (N169), .B2 (N10), .O (N20));
  NR2 g3640(.I1 (Compare), .I2 (N6), .O (N19));
  ND2S g3641(.I1 (N164), .I2 (Count[3]), .O (N18));
  ND2 g3642(.I1 (N164), .I2 (StateP[0]), .O (N17));
  AN2 g3643(.I1 (StateP[1]), .I2 (Compare), .O (N16));
  ND2S g3644(.I1 (N167), .I2 (N166), .O (N15));
  NR2 g3645(.I1 (SAR[3]), .I2 (SAR[7]), .O (N14));
  AN2 g3646(.I1 (N6), .I2 (N11), .O (N13));
  NR2 g3647(.I1 (StateP[1]), .I2 (N11), .O (N12));
  INV1S g3684(.I (DataOut[0]), .O (N8));
  INV1S g3719(.I (DataOut[7]), .O (N5));
  OR3B1 g3451(.I1 (TempSAR[1]), .I2 (TempSAR[0]), .B1 (DataOut[7]), .O
       (N4));
  AN2B1S g3726(.I1 (N159), .B1 (N13), .O (N3));
  AN2B1S g3727(.I1 (TempSAR[2]), .B1 (N26), .O (N2));
  OR2B1S g3728(.I1 (N0), .B1 (TempSAR[5]), .O (N1));
  OR2B1S g3729(.I1 (N52), .B1 (TempSAR[4]), .O (N0));
  ND2 g3730(.I1 (N3), .I2 (N18), .O (N174));
  DFFRBN \SAR_reg[2] (.RB (ResetN), .CK (Clock), .D (N120), .Q
       (SAR[2]), .QB (N166));
  DFFRBN \SAR_reg[4] (.RB (ResetN), .CK (Clock), .D (N117), .Q
       (SAR[4]), .QB (N167));
  DFFRBN \SAR_reg[6] (.RB (ResetN), .CK (Clock), .D (N114), .Q
       (SAR[6]), .QB (N168));
  DFFRBN \SAR_reg[0] (.RB (ResetN), .CK (Clock), .D (N57), .QB (N165));
  DFFRBN \TempSAR_reg[0] (.RB (ResetN), .CK (Clock), .D (N55), .Q
       (TempSAR[0]), .QB (N170));
  DFFRBN \Count_reg[2] (.RB (ResetN), .CK (Clock), .D (N41), .Q
       (Count[2]), .QB (N10));
  DFFRBN \Count_reg[3] (.RB (ResetN), .CK (Clock), .D (N174), .Q
       (Count[3]), .QB (N175));
endmodule

