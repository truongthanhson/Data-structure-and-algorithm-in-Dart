import 'dart:collection';

class Solution {
  int combinationSum4(List<int> nums, int target) {
// (1, 1, 1, 1)
// (1, 1, 2)
// (1, 2, 1)
// (1, 3)
// (2, 1, 1)
// (2, 2)
// (3, 1)
    int n = nums.length;
    Map<int, int> dp = HashMap();
    int solve(int target) {
      if (target == 0) {
        return 1;
      }

      if (target < 0) return 0;
      if (dp.containsKey(target)) return dp[target]!;
      int cnt = 0;

      for (int i = 0; i < n; i++) {
        cnt += solve(target - nums[i]);
      }
      return dp[target] = cnt;
    }

    return solve(target);
  }
}

void main(List<String> args) {
  print(Solution().combinationSum4([1, 2, 3], 4));
  print(Solution().combinationSum4([9], 3));
  print(Solution().combinationSum4([2, 1, 3], 35));
}
