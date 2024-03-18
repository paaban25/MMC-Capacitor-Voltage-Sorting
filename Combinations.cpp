#include <iostream>
#include <vector>
using namespace std;

// Function to find logical OR of all combinations
int logicalOrCombinations(vector<int>& nums, int r) {
    int result = 0;
    int n = nums.size();

    // Iterate through all possible combinations
    for (int i = 0; i < (1 << n); ++i) {
        if (__builtin_popcount(i) == r) { // Count number of set bits
            int bitwise_and = -1; // Initialize bitwise AND to all bits set
            for (int j = 0; j < n; ++j) {
                if (i & (1 << j)) {
                    if (bitwise_and == -1)
                        bitwise_and = nums[j];
                    else
                        bitwise_and &= nums[j]; // Calculate bitwise AND
                }
            }
            result |= bitwise_and; // Update result with bitwise AND
        }
    }

    return result;
}

int main() {
    vector<int> nums = {1, 0, 1, 0, 1};
    int r = 4;

    int result = logicalOrCombinations(nums, r);
    cout << "Logical OR of all possible combinations of " << r << " numbers:" << endl;
    cout << result << endl;

    return 0;
}
