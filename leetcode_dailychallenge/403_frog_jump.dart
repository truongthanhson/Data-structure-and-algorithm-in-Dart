import 'dart:collection';

class Solution {
  bool canCross(List<int> stones) {
    List<List<bool?>> dp =
        List.generate(2001, (_) => List.generate(2001, (_) => null));
    Map<int, int> m = HashMap();
    bool solve(int i, int k) {
      if (i == stones.length - 1) return true;
      if (dp[i][k] != null) return dp[i][k]!;
      bool ans = false;
      if (m.containsKey(stones[i] + k)) {
        ans |= solve(m[stones[i] + k]!, k);
      }

      if (k > 1 && m.containsKey(stones[i] + k - 1)) {
        ans |= solve(m[stones[i] + k - 1]!, k - 1);
      }
      if (m.containsKey(stones[i] + k + 1)) {
        ans |= solve(m[stones[i] + k + 1]!, k + 1);
      }
      return dp[i][k] = ans;
    }

    if (stones[1] != stones[0] + 1) return false;

    for (int i = 0; i < stones.length; i++) {
      m[stones[i]] = i;
    }

    return solve(1, 1);
  }
}

void main(List<String> args) {
  print(Solution().canCross([0, 1, 3, 5, 6, 8, 12, 17]));
  print(Solution().canCross([0, 1, 2, 3, 4, 8, 9, 11]));
}
