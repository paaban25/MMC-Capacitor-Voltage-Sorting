module LogicalORCombinations_tb;

    // Parameters
    localparam SIZE = 5;  // Size of input vector nums
    localparam MAX_R = 3; // Maximum value for r

    // Inputs
    reg [SIZE-1:0] nums;
    reg [2:0] r;

    // Outputs
    wire [SIZE-1:0] result;

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
