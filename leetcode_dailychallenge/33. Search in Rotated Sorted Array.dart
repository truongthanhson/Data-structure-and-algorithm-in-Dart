void main(List<String> args) {
  print(Solution().search([4, 5, 6, 7, 0, 1, 2], 0));
  print(Solution().search([4, 5, 6, 7, 0, 1, 2], 3));
  print(Solution().search([1], 0));
  print(Solution().search([1, 2], 1));
  print(Solution().search([1, 2], 2));
  print(Solution().search([1, 2], 0));
}

class Solution {
  int search(List<int> nums, int target) {
    int l = 0, r = nums.length - 1;
    while (l <= r) {
      int mid = (l + r) ~/ 2, val = nums[mid];
      if (val == target) return mid;
      if (val < nums[0]) {
        if (target > val && target <= nums[r]) {
          l = mid + 1;
        } else {
          r = mid - 1;
        }
      } else {
        if (target < val && target >= nums[l]) {
          r = mid - 1;
        } else {
          l = mid + 1;
        }
      }
    }
    return -1;
  }
}
