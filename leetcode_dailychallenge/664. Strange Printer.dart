import 'dart:math';

void main(List<String> args) {
  print(Solution().strangePrinter('aaabbb'));
}

class Solution {
  int strangePrinter(String s) {
    int N = s.length;
    List<List<int>> dp =
        List.generate(N + 1, (_) => List.generate(N + 1, (_) => -1));
    return solve(0, N - 1, dp, s);
  }

  int solve(int i, int j, List<List<int>> dp, String s) {
    if (dp[i][j] != -1) return dp[i][j];
    if (i == j) {
      dp[i][j] = 1;
      return 1;
    }
    int ans = -1;
    if (s[i] == s[j] || s[j - 1] == s[j]) {
      return solve(i, j - 1, dp, s);
    } else if (s[i + 1] == s[i]) {
      return solve(i + 1, j, dp, s);
    } else {
      ans = 1 + solve(i, j - 1, dp, s);
      for (int k = i + 1; k < j; ++k) {
        if (s[k] == s[j])
          ans = min(ans, solve(i, k - 1, dp, s) + solve(k, j - 1, dp, s));
      }
    }
    dp[i][j] = ans;
    return ans;
  }
}
