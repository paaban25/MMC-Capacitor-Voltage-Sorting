module LogicalORCombinations (
    input [4:0] nums,
    input [2:0] r,
    output reg [4:0] result
);
  
    integer i, j;
    integer bitwise_and; // Variable to store bitwise AND of selected numbers

    always @* begin
        result = 0;
        
        // Iterate through all possible combinations
        for (i = 0; i < (1 << 5); i = i + 1) begin
            if ($clog2(i+1) == r) begin // Check if the number of set bits equals r
                bitwise_and = -1; // Initialize bitwise AND to all bits set
                for (j = 0; j < 5; j = j + 1) begin
                    if (i & (1 << j)) begin
                        if (bitwise_and == -1)
                            bitwise_and = nums[j]; // Store the first selected number
                        else
                            bitwise_and = bitwise_and & nums[j]; // Calculate bitwise AND
                    end
                end
                result = result | bitwise_and; // Update result with bitwise AND
            end
        end
    end

endmodule
