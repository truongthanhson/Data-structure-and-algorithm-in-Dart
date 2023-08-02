void main(List<String> args) {
  print(Solution().permute([1, 2, 3]));
  print(Solution().permute([0, 1]));
  print(Solution().permute([1]));
}

class Solution {
  List<List<int>> permute(List<int> nums) {
    int n = nums.length;
    List<List<int>> res = [];
    List<bool> visited = List.generate(n, (_) => false);
    void solve(List<int> current, List<bool> taken) {
      if (current.length == n) {
        res.add([...current]);
        return;
      }
      for (var i = 0; i < n; i++) {
        if (!taken[i]) {
          taken[i] = true;
          current.add(nums[i]);
          solve(current, taken);
          current.removeLast();
          taken[i] = false;
        }
      }
    }

    solve([], visited);
    return res;
  }
}
