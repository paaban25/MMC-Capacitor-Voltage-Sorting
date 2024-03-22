`timescale 1ns / 1ps

module Comparator(
  input [31:0] Vi,
  input [31:0] Vj,
  output Cij,
  output Cji
);

  reg Vi_sign, Vj_sign;
  reg [7:0] Vi_exponent, Vj_exponent;
  reg [22:0] Vi_mantissa, Vj_mantissa;
  reg Cij_reg;

  always @(*) begin
    Vi_sign = Vi[31];
    Vi_exponent = Vi[30:23];
    Vi_mantissa = Vi[22:0];
    
    Vj_sign = Vj[31];
    Vj_exponent = Vj[30:23];
    Vj_mantissa = Vj[22:0];
    
    if (Vi_exponent > Vj_exponent)
      Cij_reg = 1'b0;
    else if (Vi_exponent < Vj_exponent)
      Cij_reg = 1'b1;
    else begin
      if (Vi_mantissa > Vj_mantissa)
        Cij_reg = 1'b0;
      else if (Vi_mantissa < Vj_mantissa)
        Cij_reg = 1'b1;
      else
        Cij_reg = 1'b0;
    end
  end
  
  assign Cij = Cij_reg;
  assign Cji=~Cij_reg;

endmodule






//TestBench
//TestBench
// Code your testbench here
// or browse Examples
module Comparator_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in time units
  parameter SIM_TIME = 100;  // Simulation time in time units
  
  // Signals
  reg [31:0] Vi, Vj;
  reg clk;
  wire Cij;
  wire Cji;
  
  // Instantiate the module under test
  Comparator comparator_inst (
    .Vi(Vi),
    .Vj(Vj),
    .Cij(Cij),
    .Cji(Cji)
  );
  
  // Clock generation
  always #((CLK_PERIOD)/2) clk = ~clk;
  
  // Stimulus
  initial begin
    $dumpfile("comparator_tb.vcd");
    $dumpvars(0, Comparator_tb);
    
    // Test cases
    Vi = 32'h40e00000;  // Vi = 7
    Vj = 32'h00000001;  // Vj = 1
    #10;
    
    Vi = 32'h41b80000;  // Vi = 23
    Vj = 32'h3f800000;  // Vj = 1
    #10;
    
    Vi = 32'h41200000;  // Vi = 10.0 (IEEE 754 single precision floating point)
    Vj = 32'h3F800001;  // Vj = 1.00000012 (IEEE 754 single precision floating point)
    #10;
    
    Vi = 32'h3f800000;  // Vi = 1.0 (IEEE 754 single precision floating point)
    Vj = 32'h3F800001;  // Vj = 1.00000012 (IEEE 754 single precision floating point)
    #10;
    
    Vi = 32'h3F800000;  // Vi = 1.0 (IEEE 754 single precision floating point)
    Vj = 32'h3F800000;  // Vj = 1.0 (IEEE 754 single precision floating point)
    #10;
    
    Vi = 32'h3F800000;  // Vi = 1.0 (IEEE 754 single precision floating point)
    Vj = 32'h40000000;  // Vj = 2.0 (IEEE 754 single precision floating point)
    #10;
    
    Vi = 32'h40000000;  // Vi = 2.0 (IEEE 754 single precision floating point)
    Vj = 32'h3F800000;  // Vj = 1.0 (IEEE 754 single precision floating point)
    #10;
    
    $finish;
  end
  
endmodule
