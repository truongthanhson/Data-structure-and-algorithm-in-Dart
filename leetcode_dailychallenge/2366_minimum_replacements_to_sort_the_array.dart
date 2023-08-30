class Solution {
  int minimumReplacement(List<int> nums) {
    int n = nums.length;
    int cnt = 0;
    int limit = nums[n - 1];
    for (int i = n - 2; i >= 0; i--) {
      if (nums[i] > limit) {
        // long long no_of_times = (num + prev_bound - 1) / prev_bound;
        int times = (nums[i] + limit - 1) ~/ limit;
        cnt += times - 1;
        limit = nums[i] ~/ times;
      } else {
        limit = nums[i];
      }
    }
    return cnt;
  }
}

void main(List<String> args) {
  print(Solution().minimumReplacement([3, 9, 3]));
  print(Solution().minimumReplacement([1, 2, 3, 4, 5]));
  print(Solution().minimumReplacement([3, 4, 3]));
}
