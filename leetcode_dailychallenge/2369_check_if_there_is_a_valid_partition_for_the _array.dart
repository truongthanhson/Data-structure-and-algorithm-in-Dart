class Solution {
  bool validPartition_stackoverflow(List<int> nums) {
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

  bool validPartition(List<int> nums) {
    var N = nums.length;

    if (N == 0 || N == 1) return false;
    if (N == 2) return nums[1] == nums[0];

    List<bool> dp = List.generate(N, (_) => false);
    dp[0] = false;
    dp[1] = nums[0] == nums[1];
    dp[2] = (nums[0] == nums[1] && nums[1] == nums[2]) ||
        (nums[1] - nums[0] == 1 && nums[2] - nums[1] == 1);

    for (int i = 3; i < N; i++) {
      dp[i] = (dp[i - 2] && nums[i - 1] == nums[i]) ||
          (dp[i - 3] &&
              ((nums[i - 1] - nums[i - 2] == 1 && nums[i] - nums[i - 1] == 1) ||
                  (nums[i - 2] == nums[i - 1] && nums[i - 1] == nums[i])));
    }

    return dp[N - 1];
  }
}

void main(List<String> args) {
  print(Solution().validPartition([4, 4, 4, 5, 6]));
  print(Solution().validPartition([1, 1, 2]));
}
