void main(List<String> args) {
  print(Solution().combine(4, 2));
  print(Solution().combine(1, 1));
}

class Solution {
  List<List<int>> combine(int n, int k) {
    List<List<int>> res = [];
    solve(1, k, n, [], res);
    return res;
  }

  void solve(int index, int k, int n, List<int> current, List<List<int>> res) {
    if (current.length == k) {
      res.add(List.from(current));
      return;
    }

    for (var i = index; i <= n; i++) {
      current.add(i);
      solve(i + 1, k, n, current, res);
      current.removeLast();
    }
  }
}
