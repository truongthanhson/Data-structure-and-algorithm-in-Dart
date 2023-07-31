import 'dart:math';

void main(List<String> args) {
  print(Solution().minimumDeleteSum('sea', 'eat'));
  print(Solution().minimumDeleteSum('delete', 'leet'));
}

class Solution {
  int minimumDeleteSum(String s1, String s2) {
    var dp = List.generate(
        s1.length + 1, (_) => List.generate(s2.length + 1, (_) => -1));
    return solve(s1, s2, 0, 0, dp);
  }

  int solve(String s1, String s2, int i, int j, List<List<int>> dp) {
    if (i >= s1.length && j >= s2.length) {
      return 0;
    }
    if (dp[i][j] != -1) return dp[i][j];
    if (i >= s1.length) {
      int remain = 0;
      for (var k = j; k < s2.length; k++) {
        remain += s2.codeUnitAt(k);
      }
      return remain;
    }
    if (j >= s2.length) {
      int remain = 0;
      for (var k = i; k < s1.length; k++) {
        remain += s1.codeUnitAt(k);
      }
      return remain;
    }

    if (s1[i] == s2[j]) {
      return dp[i][j] = solve(s1, s2, i + 1, j + 1, dp);
    }

    return dp[i][j] = min(solve(s1, s2, i + 1, j, dp) + s1.codeUnitAt(i),
        solve(s1, s2, i, j + 1, dp) + s2.codeUnitAt(j));
  }
}
