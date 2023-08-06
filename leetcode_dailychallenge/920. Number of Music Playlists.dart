import 'dart:math';

void main(List<String> args) {
  print(Solution().numMusicPlaylists(3, 3, 1));
  print(Solution().numMusicPlaylists(2, 3, 0));
  print(Solution().numMusicPlaylists(2, 3, 1));
}

// Constraints:
//
// 0 <= k < n <= goal <= 100

class Solution {
  int numMusicPlaylists(int n, int goal, int k) {
    List<List<int>> dp =
        List.generate(n + 1, (_) => List.generate(goal + 1, (_) => -1));

    int solve(int i, int j) {
      if (i == 0 && j == 0) return 1;
      if (i == 0 || j == 0) return 0;
      if (dp[i][j] != -1) return dp[i][j];
      int pick = solve(i - 1, j - 1) * i;
      int not = solve(i, j - 1) * max(0, i - k);
      dp[i][j] = (pick + not) % 1000000007;
      return dp[i][j];
    }

    return solve(n, goal);
  }
}
