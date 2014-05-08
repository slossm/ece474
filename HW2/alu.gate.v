
module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [9:0] carry;
  wire   [8:0] B_AS;
  assign carry[0] = ADD_SUB;

  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR2X1 U1 ( .IN1(carry[0]), .IN2(carry[8]), .Q(SUM[8]) );
  XOR2X1 U2 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U3 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U4 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U5 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U6 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U7 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U8 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U9 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( in_a, in_b, opcode, alu_out, alu_zero, alu_carry );
  input [7:0] in_a;
  input [7:0] in_b;
  input [3:0] opcode;
  output [7:0] alu_out;
  output alu_zero, alu_carry;
  wire   N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82,
         N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96,
         N97, N98, N99, N100, N101, N113, N114, N115, N116, N117, N118,
         \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 , \U3/U2/Z_3 , \U3/U2/Z_4 ,
         \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , \U3/U3/Z_0 , \U3/U3/Z_1 ,
         \U3/U3/Z_2 , \U3/U3/Z_3 , \U3/U3/Z_4 , \U3/U3/Z_5 , \U3/U3/Z_6 ,
         \U3/U3/Z_7 , \U3/U4/Z_0 , n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173;
  assign alu_out[1] = N113;
  assign alu_out[2] = N114;
  assign alu_out[3] = N115;
  assign alu_out[4] = N116;
  assign alu_out[5] = N117;
  assign alu_out[6] = N118;

  alu_DW01_addsub_0 r30 ( .A({1'b0, \U3/U2/Z_7 , \U3/U2/Z_6 , \U3/U2/Z_5 , 
        \U3/U2/Z_4 , \U3/U2/Z_3 , \U3/U2/Z_2 , \U3/U2/Z_1 , \U3/U2/Z_0 }), .B(
        {1'b0, \U3/U3/Z_7 , \U3/U3/Z_6 , \U3/U3/Z_5 , \U3/U3/Z_4 , \U3/U3/Z_3 , 
        \U3/U3/Z_2 , \U3/U3/Z_1 , \U3/U3/Z_0 }), .CI(1'b0), .ADD_SUB(
        \U3/U4/Z_0 ), .SUM({N77, N76, N75, N74, N73, N72, N71, N70, N69}) );
  MUX41X1 U123 ( .IN1(n144), .IN3(n141), .IN2(n143), .IN4(n139), .S0(opcode[0]), .S1(opcode[1]), .Q(alu_out[7]) );
  MUX21X1 U124 ( .IN1(n142), .IN2(N86), .S(opcode[2]), .Q(n143) );
  MUX21X1 U125 ( .IN1(n140), .IN2(N78), .S(opcode[2]), .Q(n141) );
  MUX21X1 U126 ( .IN1(N76), .IN2(N94), .S(opcode[2]), .Q(n139) );
  MUX21X1 U127 ( .IN1(n122), .IN2(n120), .S(opcode[0]), .Q(N114) );
  MUX41X1 U128 ( .IN1(n119), .IN3(N71), .IN2(N83), .IN4(N99), .S0(opcode[1]), 
        .S1(opcode[2]), .Q(n120) );
  MUX41X1 U129 ( .IN1(in_a[3]), .IN3(n121), .IN2(N71), .IN4(N91), .S0(
        opcode[1]), .S1(opcode[2]), .Q(n122) );
  MUX21X1 U130 ( .IN1(N71), .IN2(in_a[1]), .S(opcode[3]), .Q(n119) );
  MUX21X1 U131 ( .IN1(n138), .IN2(n136), .S(opcode[0]), .Q(N118) );
  MUX41X1 U132 ( .IN1(n135), .IN3(N75), .IN2(N79), .IN4(N95), .S0(opcode[1]), 
        .S1(opcode[2]), .Q(n136) );
  MUX41X1 U133 ( .IN1(in_a[7]), .IN3(n137), .IN2(N75), .IN4(N87), .S0(
        opcode[1]), .S1(opcode[2]), .Q(n138) );
  MUX21X1 U134 ( .IN1(N75), .IN2(in_a[5]), .S(opcode[3]), .Q(n135) );
  MUX21X1 U135 ( .IN1(n114), .IN2(n112), .S(opcode[0]), .Q(alu_out[0]) );
  MUX41X1 U136 ( .IN1(n111), .IN3(N69), .IN2(N85), .IN4(N101), .S0(opcode[1]), 
        .S1(opcode[2]), .Q(n112) );
  MUX41X1 U137 ( .IN1(in_a[1]), .IN3(n113), .IN2(N69), .IN4(N93), .S0(
        opcode[1]), .S1(opcode[2]), .Q(n114) );
  AND2X1 U138 ( .IN1(N69), .IN2(n150), .Q(n111) );
  MUX21X1 U139 ( .IN1(n126), .IN2(n124), .S(opcode[0]), .Q(N115) );
  MUX41X1 U140 ( .IN1(n123), .IN3(N72), .IN2(N82), .IN4(N98), .S0(opcode[1]), 
        .S1(opcode[2]), .Q(n124) );
  MUX41X1 U141 ( .IN1(in_a[4]), .IN3(n125), .IN2(N72), .IN4(N90), .S0(
        opcode[1]), .S1(opcode[2]), .Q(n126) );
  MUX21X1 U142 ( .IN1(N72), .IN2(in_a[2]), .S(opcode[3]), .Q(n123) );
  MUX21X1 U143 ( .IN1(n118), .IN2(n116), .S(opcode[0]), .Q(N113) );
  MUX41X1 U144 ( .IN1(n115), .IN3(N70), .IN2(N84), .IN4(N100), .S0(opcode[1]), 
        .S1(opcode[2]), .Q(n116) );
  MUX41X1 U145 ( .IN1(in_a[2]), .IN3(n117), .IN2(N70), .IN4(N92), .S0(
        opcode[1]), .S1(opcode[2]), .Q(n118) );
  MUX21X1 U146 ( .IN1(N70), .IN2(in_a[0]), .S(opcode[3]), .Q(n115) );
  MUX21X1 U147 ( .IN1(n130), .IN2(n128), .S(opcode[0]), .Q(N116) );
  MUX41X1 U148 ( .IN1(n127), .IN3(N73), .IN2(N81), .IN4(N97), .S0(opcode[1]), 
        .S1(opcode[2]), .Q(n128) );
  MUX41X1 U149 ( .IN1(in_a[5]), .IN3(n129), .IN2(N73), .IN4(N89), .S0(
        opcode[1]), .S1(opcode[2]), .Q(n130) );
  MUX21X1 U150 ( .IN1(N73), .IN2(in_a[3]), .S(opcode[3]), .Q(n127) );
  MUX21X1 U151 ( .IN1(n134), .IN2(n132), .S(opcode[0]), .Q(N117) );
  MUX41X1 U152 ( .IN1(n131), .IN3(N74), .IN2(N80), .IN4(N96), .S0(opcode[1]), 
        .S1(opcode[2]), .Q(n132) );
  MUX41X1 U153 ( .IN1(in_a[6]), .IN3(n133), .IN2(N74), .IN4(N88), .S0(
        opcode[1]), .S1(opcode[2]), .Q(n134) );
  MUX21X1 U154 ( .IN1(N74), .IN2(in_a[4]), .S(opcode[3]), .Q(n131) );
  AND2X1 U155 ( .IN1(N76), .IN2(opcode[2]), .Q(n144) );
  MUX21X1 U156 ( .IN1(N69), .IN2(n173), .S(opcode[3]), .Q(n113) );
  MUX21X1 U157 ( .IN1(N70), .IN2(n172), .S(opcode[3]), .Q(n117) );
  MUX21X1 U158 ( .IN1(N71), .IN2(n171), .S(opcode[3]), .Q(n121) );
  MUX21X1 U159 ( .IN1(N72), .IN2(n170), .S(opcode[3]), .Q(n125) );
  MUX21X1 U160 ( .IN1(N73), .IN2(n169), .S(opcode[3]), .Q(n129) );
  MUX21X1 U161 ( .IN1(N74), .IN2(n168), .S(opcode[3]), .Q(n133) );
  MUX21X1 U162 ( .IN1(N75), .IN2(n167), .S(opcode[3]), .Q(n137) );
  MUX21X1 U163 ( .IN1(N76), .IN2(n166), .S(opcode[3]), .Q(n142) );
  MUX21X1 U164 ( .IN1(N76), .IN2(in_a[6]), .S(opcode[3]), .Q(n140) );
  NOR4X0 U165 ( .IN1(n145), .IN2(N113), .IN3(N115), .IN4(N114), .QN(alu_zero)
         );
  OR4X1 U166 ( .IN1(N117), .IN2(N116), .IN3(alu_out[0]), .IN4(N118), .Q(n145)
         );
  AO22X1 U167 ( .IN1(n146), .IN2(N77), .IN3(n147), .IN4(n148), .Q(alu_carry)
         );
  MUX21X1 U168 ( .IN1(in_a[7]), .IN2(N77), .S(opcode[1]), .Q(n148) );
  NOR2X0 U169 ( .IN1(n149), .IN2(n150), .QN(n147) );
  MUX21X1 U170 ( .IN1(n150), .IN2(n151), .S(opcode[2]), .Q(n146) );
  NOR2X0 U171 ( .IN1(opcode[1]), .IN2(opcode[0]), .QN(n151) );
  AO21X1 U172 ( .IN1(opcode[1]), .IN2(n149), .IN3(opcode[2]), .Q(\U3/U4/Z_0 )
         );
  NOR2X0 U173 ( .IN1(n152), .IN2(n153), .QN(\U3/U3/Z_7 ) );
  NOR2X0 U174 ( .IN1(n152), .IN2(n154), .QN(\U3/U3/Z_6 ) );
  NOR2X0 U175 ( .IN1(n152), .IN2(n155), .QN(\U3/U3/Z_5 ) );
  NOR2X0 U176 ( .IN1(n152), .IN2(n156), .QN(\U3/U3/Z_4 ) );
  NOR2X0 U177 ( .IN1(n152), .IN2(n157), .QN(\U3/U3/Z_3 ) );
  NOR2X0 U178 ( .IN1(n152), .IN2(n158), .QN(\U3/U3/Z_2 ) );
  NOR2X0 U179 ( .IN1(n152), .IN2(n159), .QN(\U3/U3/Z_1 ) );
  AO221X1 U180 ( .IN1(in_b[0]), .IN2(n160), .IN3(opcode[0]), .IN4(opcode[1]), 
        .IN5(n161), .Q(\U3/U3/Z_0 ) );
  NAND2X0 U181 ( .IN1(n162), .IN2(n150), .QN(n161) );
  INVX0 U182 ( .IN(n152), .QN(n160) );
  MUX21X1 U183 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[7]), .Q(\U3/U2/Z_7 ) );
  MUX21X1 U184 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[6]), .Q(\U3/U2/Z_6 ) );
  MUX21X1 U185 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[5]), .Q(\U3/U2/Z_5 ) );
  MUX21X1 U186 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[4]), .Q(\U3/U2/Z_4 ) );
  MUX21X1 U187 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[3]), .Q(\U3/U2/Z_3 ) );
  MUX21X1 U188 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[2]), .Q(\U3/U2/Z_2 ) );
  MUX21X1 U189 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[1]), .Q(\U3/U2/Z_1 ) );
  MUX21X1 U190 ( .IN1(opcode[3]), .IN2(n163), .S(in_a[0]), .Q(\U3/U2/Z_0 ) );
  NAND3X0 U191 ( .IN1(n164), .IN2(n162), .IN3(n152), .QN(n163) );
  XOR2X1 U192 ( .IN1(n149), .IN2(opcode[1]), .Q(n152) );
  INVX0 U193 ( .IN(opcode[0]), .QN(n149) );
  INVX0 U194 ( .IN(opcode[2]), .QN(n162) );
  NAND2X0 U195 ( .IN1(opcode[0]), .IN2(n150), .QN(n164) );
  INVX0 U196 ( .IN(opcode[3]), .QN(n150) );
  XOR2X1 U197 ( .IN1(in_b[2]), .IN2(in_a[2]), .Q(N99) );
  XOR2X1 U198 ( .IN1(in_b[3]), .IN2(in_a[3]), .Q(N98) );
  XOR2X1 U199 ( .IN1(in_b[4]), .IN2(in_a[4]), .Q(N97) );
  XOR2X1 U200 ( .IN1(in_b[5]), .IN2(in_a[5]), .Q(N96) );
  XOR2X1 U201 ( .IN1(in_b[6]), .IN2(in_a[6]), .Q(N95) );
  XOR2X1 U202 ( .IN1(in_b[7]), .IN2(in_a[7]), .Q(N94) );
  NOR2X0 U203 ( .IN1(n173), .IN2(n165), .QN(N93) );
  NOR2X0 U204 ( .IN1(n172), .IN2(n159), .QN(N92) );
  NOR2X0 U205 ( .IN1(n171), .IN2(n158), .QN(N91) );
  NOR2X0 U206 ( .IN1(n170), .IN2(n157), .QN(N90) );
  NOR2X0 U207 ( .IN1(n169), .IN2(n156), .QN(N89) );
  NOR2X0 U208 ( .IN1(n168), .IN2(n155), .QN(N88) );
  NOR2X0 U209 ( .IN1(n167), .IN2(n154), .QN(N87) );
  NOR2X0 U210 ( .IN1(n166), .IN2(n153), .QN(N86) );
  NAND2X0 U211 ( .IN1(n165), .IN2(n173), .QN(N85) );
  INVX0 U212 ( .IN(in_a[0]), .QN(n173) );
  INVX0 U213 ( .IN(in_b[0]), .QN(n165) );
  NAND2X0 U214 ( .IN1(n159), .IN2(n172), .QN(N84) );
  INVX0 U215 ( .IN(in_a[1]), .QN(n172) );
  INVX0 U216 ( .IN(in_b[1]), .QN(n159) );
  NAND2X0 U217 ( .IN1(n158), .IN2(n171), .QN(N83) );
  INVX0 U218 ( .IN(in_a[2]), .QN(n171) );
  INVX0 U219 ( .IN(in_b[2]), .QN(n158) );
  NAND2X0 U220 ( .IN1(n157), .IN2(n170), .QN(N82) );
  INVX0 U221 ( .IN(in_a[3]), .QN(n170) );
  INVX0 U222 ( .IN(in_b[3]), .QN(n157) );
  NAND2X0 U223 ( .IN1(n156), .IN2(n169), .QN(N81) );
  INVX0 U224 ( .IN(in_a[4]), .QN(n169) );
  INVX0 U225 ( .IN(in_b[4]), .QN(n156) );
  NAND2X0 U226 ( .IN1(n155), .IN2(n168), .QN(N80) );
  INVX0 U227 ( .IN(in_a[5]), .QN(n168) );
  INVX0 U228 ( .IN(in_b[5]), .QN(n155) );
  NAND2X0 U229 ( .IN1(n154), .IN2(n167), .QN(N79) );
  INVX0 U230 ( .IN(in_a[6]), .QN(n167) );
  INVX0 U231 ( .IN(in_b[6]), .QN(n154) );
  NAND2X0 U232 ( .IN1(n153), .IN2(n166), .QN(N78) );
  INVX0 U233 ( .IN(in_a[7]), .QN(n166) );
  INVX0 U234 ( .IN(in_b[7]), .QN(n153) );
  XOR2X1 U235 ( .IN1(in_b[0]), .IN2(in_a[0]), .Q(N101) );
  XOR2X1 U236 ( .IN1(in_b[1]), .IN2(in_a[1]), .Q(N100) );
endmodule

