module LogicalORCombinations_tb;

    // Parameters
    localparam SIZE = 5;  // Size of input vector nums
    localparam MAX_R = 3; // Maximum value for r

    // Inputs
    reg [SIZE-1:0] nums;
    reg [2:0] r;

    // Outputs
    wire  result;

    // Instantiate the module under test
    LogicalORCombinations uut (
        .nums(nums),
        .r(r),
        .result(result)
    );

    // Clock
    reg clk = 0;
    always #5 clk = ~clk; // Clock period of 10 time units

    // Test stimulus
    initial begin
        // Test case 1: r = 0, nums = {1, 0, 1, 0, 1}
        nums = 5'b11111;
        r = 3'b101;
        #10; // Wait for some time for the result to stabilize
        $display("Test Case 1: r = %d, nums = %b, result = %b ", r, nums, result);
        
        
        
        // Terminate simulation
        $finish;
    end

endmodule


//For the other possibility
`timescale 1ns / 1ns

module LogicalORCombinations_tb;

    // Parameters
    parameter PERIOD = 10; // Simulation time step
    parameter WIDTH = 5;   // Width of input nums
    parameter R_WIDTH = 3; // Width of input r

    // Signals
    reg [WIDTH-1:0] nums;
    reg [R_WIDTH-1:0] r;
    wire result;

    // Instantiate the module under test
    LogicalORCombinations dut (
        .nums(nums),
        .r(r),
        .result(result)
    );

    // Clock generation
    reg clk = 0;
    always #((PERIOD / 2)) clk = ~clk;

    // Stimulus
    initial begin
        // Initialize inputs
        nums = 5'b00000;
        r = 3'b000;
        
        // Test case 1
        #10 nums = 5'b00001; // 1 '1'
        #10 r = 3'b000;
        #10 $display("nums = %b, r = %b, result = %b", nums, r, result); // Should be 0
        
        // Test case 2
        #10 nums = 5'b10101; // 3 '1's
        #10 r = 3'b010;
        #10 $display("nums = %b, r = %b, result = %b", nums, r, result); // Should be 1
        
        // Test case 3
        #10 nums = 5'b11011; // 4 '1's
        #10 r = 3'b011;
        #10 $display("nums = %b, r = %b, result = %b", nums, r, result); // Should be 1
        
        // Test case 4
        #10 nums = 5'b11111; // 5 '1's
        #10 r = 3'b111;
        #10 $display("nums = %b, r = %b, result = %b", nums, r, result); // Should be 1
        
        // Finish simulation
        #10 $finish;
    end

endmodule
