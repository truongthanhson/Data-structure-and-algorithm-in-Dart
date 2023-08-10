void main(List<String> args) {
  print(Solution().search([2, 5, 6, 0, 0, 1, 2], 0));
  print(Solution().search([2, 5, 6, 0, 0, 1, 2], 3));
  print(Solution().search([0, 0, 0, 0, 1, 0], 1));
  print(Solution().search([0, 0, 1, 0, 0, 0], 1));
}

class Solution {
  bool search(List<int> nums, int target) {
    int l = 0, r = nums.length - 1;
    while (l <= r) {
      int mid = (l + r) ~/ 2, val = nums[mid];

      if (val == target) return true;

      if (val < nums[r]) {
        // right part was sorted
        if (val < target && target <= nums[r]) {
          l = mid + 1;
        } else {
          r = mid - 1;
        }
      } else if (val > nums[l]) {
        // left part was sorted
        if (nums[l] <= target && target < val) {
          r = mid - 1;
        } else {
          l = mid + 1;
        }
      } else {
        while (l < mid && nums[l] == val) l++;
        if (l == mid) {
          l = mid + 1;
        } else {
          r = mid - 1;
        }
      }
    }
    return false;
  }
}
