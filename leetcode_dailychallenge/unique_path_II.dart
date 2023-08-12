// Constraints:
//
// m == obstacleGrid.length
// n == obstacleGrid[i].length
// 1 <= m, n <= 100
// obstacleGrid[i][j] is 0 or 1.
class Solution {
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    if (obstacleGrid[0][0] == 1) return 0;
    int M = obstacleGrid.length, N = obstacleGrid[0].length;
    var dp = List.generate(M + 1, (_) => List.generate(N + 1, (_) => 0));
    dp[1][1] = 1;
    for (var i = 1; i <= M; i++) {
      for (var j = 1; j <= N; j++) {
        if (i == 1 && j == 1) continue;
        if (obstacleGrid[i - 1][j - 1] == 1) {
          dp[i][j] = 0;
          continue;
        }
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
      }
    }
    return dp[M][N];
  }
}

void main(List<String> args) {
  print(Solution().uniquePathsWithObstacles([
    [0, 0, 0],
    [0, 1, 0],
    [0, 0, 0]
  ]));
  print(Solution().uniquePathsWithObstacles([
    [0, 1],
    [0, 0]
  ]));
}
