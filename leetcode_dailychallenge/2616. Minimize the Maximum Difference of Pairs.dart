void main(List<String> args) {
  print(Solution().minimizeMax([10, 1, 2, 7, 1, 3], 2));
  print(Solution().minimizeMax([4, 2, 1, 2], 1));
}

class Solution {
  int minimizeMax(List<int> nums, int p) {
    nums.sort();
    bool canFormPairs(int maximum) {
      int pairs = 0;
      for (int i = 0; i < nums.length - 1;) {
        if (nums[i + 1] - nums[i] <= maximum) {
          pairs++;
          i += 2;
        } else {
          i++;
        }
      }
      return pairs >= p;
    }

    int l = 0, r = nums[nums.length - 1] - nums[0];
    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (canFormPairs(mid)) {
        r = mid;
      } else {
        l = mid + 1;
      }
    }
    return r;
  }
}
