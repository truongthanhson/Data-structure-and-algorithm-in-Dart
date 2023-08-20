import 'dart:math';

class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int fast = 0, slow = 0, current_sum = 0;
    int ans = 100001;
    while (fast < nums.length) {
      current_sum += nums[fast];
      if (current_sum >= target) {
        ans = min(ans, fast - slow + 1);
      }
      while (slow <= fast && current_sum >= target) {
        current_sum -= nums[slow++];

        if (current_sum >= target) {
          ans = min(ans, fast - slow + 1);
        }
      }
      fast++;
    }
    return ans == 100001 ? 0 : ans;
  }
}

void main(List<String> args) {
  print(Solution().minSubArrayLen(7, [2, 3, 1, 2, 4, 3]));
  print(Solution().minSubArrayLen(4, [1, 4, 4]));
  print(Solution().minSubArrayLen(11, [1, 1, 1, 1, 1, 1, 1, 1]));
}
