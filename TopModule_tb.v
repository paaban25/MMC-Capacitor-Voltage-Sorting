
`timescale 1ns / 1ps

module TopModule_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Signals
  reg [31:0] V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, I;
  reg [2:0] n;
  wire [12:1] M;

  // Instantiate the module under test
  TopModule dut (
    .V1(V1), .V2(V2), .V3(V3), .V4(V4), .V5(V5), .V6(V6),
    .V7(V7), .V8(V8), .V9(V9), .V10(V10), .V11(V11), .V12(V12),
    .I(I), .n(n), .M(M)
  );

  // Clock generation
  reg clk = 0;
  always #((CLK_PERIOD)/2) clk = ~clk;

  // Test stimulus
  initial begin
    // Initialize inputs
    /*V1 = 32'h00000000;  
    V2 = 32'h00000000;  
    V3 = 32'h00000000;  
    V4 = 32'h00000000;  
    V5 = 32'h00000000;  
    V6 = 32'h00000000;  
    V7 = 32'h00000000;  
    V8 = 32'h00000000;  
    V9 = 32'h00000000;  
    V10 = 32'h00000000;  
    V11 = 32'h00000000;  
    V12 = 32'h00000000;  
    I = 32'h00000000;
    n = 3'b000;*/

    // Apply stimulus
    #10;
    V1 = 32'h41400000;  //12
    V2 = 32'h00000000;  //0
    V3 = 32'h41500000;  //13
    V4 = 32'h41200000;  //10
    V5 = 32'h40e00000;  //7
    V6 = 32'h41100000;  //9
    V7 = 32'h41980000;  //19
    V8 = 32'h41880000;  //17
    V9 = 32'h42f00000;  //120
    V10 = 32'h42140000;  //37
    V11 = 32'h41c80000;  //25
    V12 = 32'h41b80000;  //23
    I = 32'h41b80000;
    n = 3'b001;

    #20;

    // Add more test cases as needed

    // Display the value of M
    $display("M = %b", M);

    $stop; // Stop simulation
  end

endmodule
