import 'dart:math';

class Solution {
  int minTaps(int n, List<int> ranges) {
    List<int> dp = List.generate(n + 1, (_) => n + 1);
    dp[0] = 0;
    for (int i = 0; i < n + 1; i++) {
      int l = max(0, i - ranges[i]), r = min(n, i + ranges[i]);
      for (int j = l; j <= r; j++) {
        dp[j] = min(dp[j], dp[l] + 1);
      }
    }
    return dp[n] == n + 1 ? -1 : dp[n];
  }
}

void main(List<String> args) {
  print(Solution().minTaps(5, [3, 4, 1, 1, 0, 0]));
  print(Solution().minTaps(3, [0, 0, 0, 0]));
}
