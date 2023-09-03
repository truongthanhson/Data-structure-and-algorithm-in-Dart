class Solution {
  int uniquePaths(int m, int n) {
    if (m == 1 && n == 1) return 1;
    List<List<int>> dp =
        List.generate(m + 1, (_) => List.generate(n + 1, (_) => 0));
    dp[1][1] = 1;
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (i == 1 && j == 1) continue;
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
      }
    }
    return dp[m][n];
  }
}

void main(List<String> args) {
  print(Solution().uniquePaths(3, 7));
  print(Solution().uniquePaths(3, 2));
}
