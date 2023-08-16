import 'dart:collection';

class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k) {
    Queue<int> deque = Queue<int>();
    List<int> ans = [];
    int l = 0, r = 0;
    while (r < nums.length) {
      while (deque.isNotEmpty && nums[r] > nums[deque.last]) {
        deque.removeLast();
      }
      deque.addLast(r);

      if (l > deque.first) {
        deque.removeFirst();
      }

      if (r >= k - 1) {
        ans.add(nums[deque.first]);
        l++;
      }
      r++;
    }
    return ans;
  }
}

void main(List<String> args) {
  print(Solution().maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3));
  print(Solution().maxSlidingWindow([1, 3, 1, 2, 0, 5], 3));
  print(Solution().maxSlidingWindow([1], 1));
}
