module TopModule(
  input [31:0] V1,
  input [31:0] V2,
  input [31:0] V3,
  input [31:0] V4,
  input [31:0] V5,
  input [31:0] V6,
  input [31:0] V7,
  input [31:0] V8,
  input [31:0] V9,
  input [31:0] V10,
  input [31:0] V11,
  input [31:0] V12,
  input [31:0] I,
  input [2:0] n,
  output reg [12:1] M
);
  
  reg I_sign;
  initial I_sign= I[31];
  
  wire [12:1] M_wire_pos,M_wire_neg;
  
  wire C12, C13, C14, C15, C16;
  wire C21, C23, C24, C25, C26;
  wire C31, C32, C34, C35, C36;
  wire C41, C42, C43, C45, C46;
  wire C51, C52, C53, C54, C56;
  wire C61, C62, C63, C64, C65;
  
  wire C78, C79, C710, C711, C712;
  wire C87, C89, C810, C811, C812;
  wire C97, C98, C910, C911, C912;
  wire C107, C108, C109, C1011, C1012;
  wire C117, C118, C119, C1110, C1112;
  wire C127, C128, C129, C1210, C1211;

  Comparator c12(.Vi(V1), .Vj(V2), .Cij(C12), .Cji(C21));
  Comparator c13(.Vi(V1), .Vj(V3), .Cij(C13), .Cji(C31));
  Comparator c14(.Vi(V1), .Vj(V4), .Cij(C14), .Cji(C41));
  Comparator c15(.Vi(V1), .Vj(V5), .Cij(C15), .Cji(C51));
  Comparator c16(.Vi(V1), .Vj(V6), .Cij(C16), .Cji(C61));
  
  Comparator c23(.Vi(V2), .Vj(V3), .Cij(C23), .Cji(C32));
  Comparator c24(.Vi(V2), .Vj(V4), .Cij(C24), .Cji(C42));
  Comparator c25(.Vi(V2), .Vj(V5), .Cij(C25), .Cji(C52));
  Comparator c26(.Vi(V2), .Vj(V6), .Cij(C26), .Cji(C62));
  
  Comparator c34(.Vi(V3), .Vj(V4), .Cij(C34), .Cji(C43));
  Comparator c35(.Vi(V3), .Vj(V5), .Cij(C35), .Cji(C53));
  Comparator c36(.Vi(V3), .Vj(V6), .Cij(C36), .Cji(C63));
  
  Comparator c45(.Vi(V4), .Vj(V5), .Cij(C45), .Cji(C54));
  Comparator c46(.Vi(V4), .Vj(V6), .Cij(C46), .Cji(C64));
  
  Comparator c56(.Vi(V5), .Vj(V6), .Cij(C56), .Cji(C65));
  
  Comparator c78(.Vi(V7), .Vj(V8), .Cij(C78), .Cji(C87));
  Comparator c79(.Vi(V7), .Vj(V9), .Cij(C79), .Cji(C97));
  Comparator c710(.Vi(V7), .Vj(V10), .Cij(C710), .Cji(C107));
  Comparator c711(.Vi(V7), .Vj(V11), .Cij(C711), .Cji(C117));
  Comparator c712(.Vi(V7), .Vj(V12), .Cij(C712), .Cji(C127));
  
  Comparator c89(.Vi(V8), .Vj(V9), .Cij(C89), .Cji(C98));
  Comparator c810(.Vi(V8), .Vj(V10), .Cij(C810), .Cji(C108));
  Comparator c811(.Vi(V8), .Vj(V11), .Cij(C811), .Cji(C118));
  Comparator c812(.Vi(V8), .Vj(V12), .Cij(C812), .Cji(C128));
  
  Comparator c910(.Vi(V9), .Vj(V10), .Cij(C910), .Cji(C109));
  Comparator c911(.Vi(V9), .Vj(V11), .Cij(C911), .Cji(C119));
  Comparator c912(.Vi(V9), .Vj(V12), .Cij(C912), .Cji(C129));
  
  Comparator c1011(.Vi(V10), .Vj(V11), .Cij(C1011), .Cji(C1110));
  Comparator c1012(.Vi(V10), .Vj(V12), .Cij(C1012), .Cji(C1210));
  
  Comparator c1112(.Vi(V11), .Vj(V12), .Cij(C1112), .Cji(C1211));
  
  
  
   LogicalORCombinations G1 (
     .nums({C12, C13, C14, C15, C16}),  
     .r(n) ,
     .result(M_wire_pos[1]));
  
  LogicalORCombinations G2 (
    .nums({C21, C23, C24, C25, C26}),  
     .r(n) ,
    .result(M_wire_pos[2])); 
  
  LogicalORCombinations G3 (
    .nums({C31, C32, C34, C35, C36}),  
     .r(n) ,
    .result(M_wire_pos[3]));
  
  LogicalORCombinations G4 (
    .nums({C41, C42, C43, C45, C46}),  
     .r(n) ,
    .result(M_wire_pos[4]));
  
  LogicalORCombinations G5 (
    .nums({C51, C52, C53, C54, C56}),  
     .r(n) ,
    .result(M_wire_pos[5]));
  
  LogicalORCombinations G6 (
    .nums({C61, C62, C63, C64, C65}),  
     .r(n) ,
    .result(M_wire_pos[6]));
  
  LogicalORCombinations G7 (
    .nums({C78, C79, C710, C711, C712}),  
     .r(n) ,
    .result(M_wire_pos[7]));
  
  LogicalORCombinations G8 (
    .nums({C87, C89, C810, C811, C812}),  
     .r(n) ,
    .result(M_wire_pos[8]));
  
  LogicalORCombinations G9 (
    .nums({C97, C98, C910, C911, C912}),  
     .r(n) ,
    .result(M_wire_pos[9]));
  
  LogicalORCombinations G10 (
    .nums({C107, C108,C109, C1011, C1012}),  
     .r(n) ,
    .result(M_wire_pos[10]));
  
  LogicalORCombinations G11 (
    .nums({C117, C118,C119, C1110, C1112}),  
     .r(n) ,
    .result(M_wire_pos[11]));
  
  LogicalORCombinations G12 (
    .nums({C127, C128,C129, C1210, C1211}),  
     .r(n) ,
    .result(M_wire_pos[12]));
  
  
  
  
  LogicalORCombinations H1 (
     .nums({C21, C31, C41, C51, C61}),  
     .r(n) ,
     .result(M_wire_neg[1]));
  
  LogicalORCombinations H2 (
    .nums({C12, C32, C42, C52, C62}),  
     .r(n) ,
    .result(M_wire_neg[2])); 
  
  LogicalORCombinations H3 (
    .nums({C13, C23, C43, C53, C63}),  
     .r(n) ,
    .result(M_wire_neg[3]));
  
  LogicalORCombinations H4 (
    .nums({C14, C24, C34, C54, C64}),  
     .r(n) ,
    .result(M_wire_neg[4]));
  
  LogicalORCombinations H5 (
    .nums({C15, C25, C35, C45, C65}),  
     .r(n) ,
    .result(M_wire_neg[5]));
  
  LogicalORCombinations H6 (
    .nums({C16, C26, C36, C46, C56}),  
     .r(n) ,
    .result(M_wire_neg[6]));
  
  LogicalORCombinations H7 (
    .nums({C87, C97, C107, C117, C127}),  
     .r(n) ,
    .result(M_wire_neg[7]));
  
  LogicalORCombinations H8 (
    .nums({C78, C98, C108, C118, C128}),  
     .r(n) ,
    .result(M_wire_neg[8]));
  
  LogicalORCombinations H9 (
    .nums({C79, C89, C109, C119, C129}),  
     .r(n) ,
    .result(M_wire_neg[9]));
  
  LogicalORCombinations H10 (
    .nums({C710, C810,C910, C1110, C1210}),  
     .r(n) ,
    .result(M_wire_neg[10]));
  
  LogicalORCombinations H11 (
    .nums({C711, C811,C911, C1011, C1211}),  
     .r(n) ,
    .result(M_wire_neg[11]));
  
  LogicalORCombinations H12 (
    .nums({C712, C812,C912, C1012, C1112}),  
     .r(n) ,
    .result(M_wire_neg[12]));
  
  
  always@* M=I_sign?M_wire_neg:M_wire_pos;

  
  
endmodule