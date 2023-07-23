void main() {
  print(Solution().knightProbability(3, 2, 0, 0));
  print(Solution().knightProbability(1, 0, 0, 0));
  print(Solution().knightProbability(8, 30, 6, 4));
}

class Solution {
  double knightProbability(int n, int k, int row, int column) {
    List<List<List<double>>> dp = List.generate(
        n, (_) => List.generate(n, (_) => List<double>.filled(k + 1, 0)));
    return solve(row, column, k, n, dp);
  }

  static const dr = [2, 1, -1, -2, -2, -1, 1, 2];
  static const dc = [1, 2, 2, 1, -1, -2, -2, -1];
  double solve(int r, int c, int k, int n, List<List<List<double>>> dp) {
    if (r < 0 || r >= n || c < 0 || c >= n) return 0;
    if (k == 0) return 1;

    if (dp[r][c][k] != 0) return dp[r][c][k];
    double ans = 0;
    for (int i = 0; i < 8; i++) {
      ans += solve(r + dr[i], c + dc[i], k - 1, n, dp);
    }
    dp[r][c][k] += ans / 8;
    return dp[r][c][k];
  }
}
