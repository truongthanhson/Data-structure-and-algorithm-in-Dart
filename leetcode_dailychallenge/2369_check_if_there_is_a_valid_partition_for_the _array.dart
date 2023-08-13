class Solution {
  bool validPartition(List<int> nums) {
    var N = nums.length;

    List<bool?> dp = List.generate(N, (_) => null);
    bool valid(int index) {
      if (index >= N) return true;
      if (dp[index] != null) return dp[index]!;
      bool possible = false;
      if (index <= N - 3) {
        possible |= ((nums[index] == nums[index + 1] &&
                    nums[index] == nums[index + 2]) ||
                (nums[index + 1] - nums[index] == 1 &&
                    nums[index + 2] - nums[index + 1] == 1)) &&
            valid(index + 3);
      }
      if (index <= N - 2) {
        possible |= (nums[index] == nums[index + 1]) && valid(index + 2);
      }

      return dp[index] = possible;
    }

    return valid(0);
  }
}

void main(List<String> args) {
  print(Solution().validPartition([4, 4, 4, 5, 6]));
  print(Solution().validPartition([1, 1, 2]));
}
