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
  output [12:1] M
);
  
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
  
  reg sign_I;

  Comparator c12(.Vi(V1), .Vj(V2), .Cij(C12),.Cji(C21));
  Comparator c13(.Vi(V1), .Vj(V3), .Cij(C13),.Cji(C31));
  Comparator c14(.Vi(V1), .Vj(V4), .Cij(C14),.Cji(C41));
  Comparator c15(.Vi(V1), .Vj(V5), .Cij(C15),.Cji(C51));
  Comparator c16(.Vi(V1), .Vj(V6), .Cij(C16),.Cji(C61));
  
  Comparator c23(.Vi(V2), .Vj(V3), .Cij(C23),.Cji(C32));
  Comparator c24(.Vi(V2), .Vj(V4), .Cij(C24),.Cji(C42));
  Comparator c25(.Vi(V2), .Vj(V5), .Cij(C25),.Cji(C52));
  Comparator c26(.Vi(V2), .Vj(V6), .Cij(C26),.Cji(C62));
  
  
  Comparator c34(.Vi(V3), .Vj(V4), .Cij(C34),.Cji(C43));
  Comparator c35(.Vi(V3), .Vj(V5), .Cij(C35),.Cji(C53));
  Comparator c36(.Vi(V3), .Vj(V6), .Cij(C36),.Cji(C63));
  
  Comparator c45(.Vi(V4), .Vj(V5), .Cij(C45),.Cji(C54));
  Comparator c46(.Vi(V4), .Vj(V6), .Cij(C46),.Cji(C64));
  
  
  Comparator c56(.Vi(V5), .Vj(V6), .Cij(C56),.Cji(C65));
  
  
  
  Comparator c78(.Vi(V7), .Vj(V8), .Cij(C78),.Cji(C87));
  Comparator c79(.Vi(V7), .Vj(V9), .Cij(C79),.Cji(C97));
  Comparator c710(.Vi(V7), .Vj(V10), .Cij(C710),.Cji(C107));
  Comparator c711(.Vi(V7), .Vj(V11), .Cij(C711),.Cji(C117));
  Comparator c712(.Vi(V7), .Vj(V12), .Cij(C712),.Cji(C127));
  

  Comparator c89(.Vi(V8), .Vj(V9), .Cij(C89),.Cji(C98));
  Comparator c810(.Vi(V8), .Vj(V10), .Cij(C810),.Cji(C108));
  Comparator c811(.Vi(V8), .Vj(V11), .Cij(C811),.Cji(C118));
  Comparator c812(.Vi(V8), .Vj(V12), .Cij(C812),.Cji(C128));
  

  Comparator c910(.Vi(V9), .Vj(V10), .Cij(C910),.Cji(C109));
  Comparator c911(.Vi(V9), .Vj(V11), .Cij(C911),.Cji(C119));
  Comparator c912(.Vi(V9), .Vj(V12), .Cij(C912),.Cji(C129));
  

  Comparator c1011(.Vi(V10), .Vj(V11), .Cij(C1011),.Cji(C1110));
  Comparator c1012(.Vi(V10), .Vj(V12), .Cij(C1012),.Cji(C1210));
  

  Comparator c1112(.Vi(V11), .Vj(V12), .Cij(C1112),.Cji(C1211));
  

  
  always @* begin
    if (I[31] == 1'b1) begin
      // Logic expressions of all M for negative current value
    end
    else begin
      // Logic expressions of all M for positive current value
    end
  end
  
endmodule




















//A better way

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
  output [12:1] M
);
  
  reg [31:0] voltage [1:12]; // Declaration of 2D array to store voltages

  initial begin
    voltage[1] = V1;
    voltage[2] = V2;
    voltage[3] = V3;
    voltage[4] = V4;
    voltage[5] = V5;
    voltage[6] = V6;
    voltage[7] = V7;
    voltage[8] = V8;
    voltage[9] = V9;
    voltage[10] = V10;
    voltage[11] = V11;
    voltage[12] = V12;
  end
  
  reg [1:6] C_Upper [1:6];
  
  reg [7:12] C_lower [7:12];
  
  genvar i;
  generate for(i=2;i<7;i=i+1)
    begin:C1
      Comparator C(.Vi(voltage[1]), .Vj(voltage[i]), .Cij(C_Upper[1][i]),.Cji(C_Upper[i][1]));
    end
  endgenerate
  
  generate for(i=3;i<7;i=i+1)
    begin:C2
      Comparator C(.Vi(voltage[2]), .Vj(voltage[i]), .Cij(C_Upper[2][i]),.Cji(C_Upper[i][2]));
    end
  endgenerate
  
  generate for(i=4;i<7;i=i+1)
    begin:C3
      Comparator C(.Vi(voltage[3]), .Vj(voltage[i]), .Cij(C_Upper[3][i]),.Cji(C_Upper[i][3]));
    end
  endgenerate
  
  generate for(i=5;i<7;i=i+1)
    begin:C4
      Comparator C(.Vi(voltage[4]), .Vj(voltage[i]), .Cij(C_Upper[4][i]),.Cji(C_Upper[i][4]));
    end
  endgenerate
  
  generate for(i=6;i<7;i=i+1)
    begin:C5
      Comparator C(.Vi(voltage[5]), .Vj(voltage[i]), .Cij(C_Upper[5][i]),.Cji(C_Upper[i][5]));
    end
  endgenerate

  
  
  
  
  generate for(i=8;i<13;i=i+1)
    begin:C7
      Comparator C(.Vi(voltage[7]), .Vj(voltage[i]), .Cij(C_Lower[7][i]),.Cji(C_Lower[i][7]));
    end
  endgenerate
  
  generate for(i=9;i<13;i=i+1)
    begin:C8
      Comparator C(.Vi(voltage[8]), .Vj(voltage[i]), .Cij(C_Lower[8][i]),.Cji(C_Lower[i][8]));
    end
  endgenerate
  
  generate for(i=10;i<13;i=i+1)
    begin:C9
      Comparator C(.Vi(voltage[9]), .Vj(voltage[i]), .Cij(C_Lower[9][i]),.Cji(C_Lower[i][9]));
    end
  endgenerate
  
  generate for(i=11;i<13;i=i+1)
    begin:C10
      Comparator C(.Vi(voltage[10]), .Vj(voltage[i]), .Cij(C_Lower[10][i]),.Cji(C_Lower[i][10]));
    end
  endgenerate
  
  generate for(i=12;i<13;i=i+1)
    begin:C11
      Comparator C(.Vi(voltage[11]), .Vj(voltage[i]), .Cij(C_Lower[11][i]),.Cji(C_Lower[i][11]));
    end
  endgenerate
  

  
  always @* begin
    if (I[31] == 1'b1) begin
      // Logic expressions of all M for negative current value
    end
    else begin
      // Logic expressions of all M for positive current value
    end
  end
  
endmodule
