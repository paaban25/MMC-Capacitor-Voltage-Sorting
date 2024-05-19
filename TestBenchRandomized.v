`timescale 1ns / 1ps

module TopModule_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Signals
  reg [31:0] V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, I;
  reg [2:0] n;
  wire [12:1] M;
  reg [31:0] current_values [1:0];
  reg [31:0] V1_values [4:0];
  reg [31:0] V2_values [4:0];
  reg [31:0] V3_values [4:0];
  reg [31:0] V4_values [4:0];
  reg [31:0] V5_values [4:0];
  reg [31:0] V6_values [4:0];
  reg [31:0] V7_values [4:0];
  reg [31:0] V8_values [4:0];
  reg [31:0] V9_values [4:0];
  reg [31:0] V10_values [4:0];
  reg [31:0] V11_values [4:0];
  reg [31:0] V12_values [4:0];

  // Instantiate the module under test
  TopModule dut (
    .V1(V1), .V2(V2), .V3(V3), .V4(V4), .V5(V5), .V6(V6),
    .V7(V7), .V8(V8), .V9(V9), .V10(V10), .V11(V11), .V12(V12),
    .I(I), .n(n), .M(M)
  );

  // Clock generation
  reg clk = 0;
  always #((CLK_PERIOD)/2) clk = ~clk;
  
  initial begin
    current_values[0] = 32'hc1b80000;
    current_values[1] = 32'h31b80000;
	V1_values[0] = 32'h40490FDB; // 3.14
    V1_values[1] = 32'h3F800000; // 1.0
    V1_values[2] = 32'h40000000; // 2.0
    V1_values[3] = 32'h3FC00000; // 1.5
    V1_values[4] = 32'h40400000; // 3.0

    V2_values[0] = 32'h40A00000; // 5.0
    V2_values[1] = 32'h40800000; // 4.0
    V2_values[2] = 32'h40400000; // 3.0
    V2_values[3] = 32'h40000000; // 2.0
    V2_values[4] = 32'h3F800000; // 1.0

    V3_values[0] = 32'h40C00000; // 6.0
    V3_values[1] = 32'h40E00000; // 7.0
    V3_values[2] = 32'h41000000; // 8.0
    V3_values[3] = 32'h41100000; // 9.0
    V3_values[4] = 32'h41200000; // 10.0

    V4_values[0] = 32'h41300000; // 11.0
    V4_values[1] = 32'h41400000; // 12.0
    V4_values[2] = 32'h41500000; // 13.0
    V4_values[3] = 32'h41600000; // 14.0
    V4_values[4] = 32'h41700000; // 15.0

    V5_values[0] = 32'h41800000; // 16.0
    V5_values[1] = 32'h41900000; // 18.0
    V5_values[2] = 32'h41A00000; // 20.0
    V5_values[3] = 32'h41B00000; // 22.0
    V5_values[4] = 32'h41C00000; // 24.0

    V6_values[0] = 32'h41D00000; // 26.0
    V6_values[1] = 32'h41E00000; // 28.0
    V6_values[2] = 32'h41F00000; // 30.0
    V6_values[3] = 32'h42000000; // 32.0
    V6_values[4] = 32'h42100000; // 34.0

    V7_values[0] = 32'h42200000; // 36.0
    V7_values[1] = 32'h42300000; // 38.0
    V7_values[2] = 32'h42400000; // 40.0
    V7_values[3] = 32'h42500000; // 42.0
    V7_values[4] = 32'h42600000; // 44.0

    V8_values[0] = 32'h42700000; // 46.0
    V8_values[1] = 32'h42800000; // 48.0
    V8_values[2] = 32'h42900000; // 50.0
    V8_values[3] = 32'h42A00000; // 52.0
    V8_values[4] = 32'h42B00000; // 54.0

    V9_values[0] = 32'h42C00000; // 56.0
    V9_values[1] = 32'h42D00000; // 58.0
    V9_values[2] = 32'h42E00000; // 60.0
    V9_values[3] = 32'h42F00000; // 62.0
    V9_values[4] = 32'h43000000; // 64.0

    V10_values[0] = 32'h43100000; // 66.0
    V10_values[1] = 32'h43200000; // 68.0
    V10_values[2] = 32'h43300000; // 70.0
    V10_values[3] = 32'h43400000; // 72.0
    V10_values[4] = 32'h43500000; // 74.0

    V11_values[0] = 32'h43600000; // 76.0
    V11_values[1] = 32'h43700000; // 78.0
    V11_values[2] = 32'h43800000; // 80.0
    V11_values[3] = 32'h43900000; // 82.0
    V11_values[4] = 32'h43A00000; // 84.0

    V12_values[0] = 32'h43B00000; // 86.0
    V12_values[1] = 32'h43C00000; // 88.0
    V12_values[2] = 32'h43D00000; // 90.0
    V12_values[3] = 32'h43E00000; // 92.0
    V12_values[4] = 32'h43F00000; // 94.0

  end

  // Test stimulus
  initial begin
    // Open VCD file
    $dumpfile("TopModule_tb.vcd");
    $dumpvars(0, TopModule_tb); // Dump all signals

    // Initialize inputs
    V1 = 32'h00000000;  
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
    n = 3'b000;

    // Apply stimulus
    #10;
    /*V1 = 32'h41400000;  // 12
    V2 = 32'h00000000;  // 0
    V3 = 32'h41500000;  // 13
    V4 = 32'h41200000;  // 10
    V5 = 32'h40e00000;  // 7
    V6 = 32'h41100000;  // 9
    V7 = 32'h41980000;  // 19
    V8 = 32'h41880000;  // 17
    V9 = 32'h42f00000;  // 120
    V10 = 32'h42140000; // 37
    V11 = 32'h41c80000; // 25
    V12 = 32'h41b80000; // 23 */
    
    V1 = V1_values[$random % 5];
	V2 = V2_values[$random % 5];
	V3 = V3_values[$random % 5];
	V4 = V4_values[$random % 5];
	V5 = V5_values[$random % 5];
	V6 = V6_values[$random % 5];
	V7 = V7_values[$random % 5];
	V8 = V8_values[$random % 5];
	V9 = V9_values[$random % 5];
	V10 = V10_values[$random % 5];
	V11 = V11_values[$random % 5];
	V12 = V12_values[$random % 5];


    // Assign a random value to I from current_values array
    I = current_values[$random % 2];
    n = 3'b011;

    #20;

    // Display the value of M
    $display("M = %b", M);

    $stop; // Stop simulation
  end

endmodule
