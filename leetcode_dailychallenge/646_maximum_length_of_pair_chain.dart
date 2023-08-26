import 'dart:math';

class Solution {
  int findLongestChain(List<List<int>> pairs) {
    pairs.sort(
      (a, b) {
        if (a[0] == b[0]) return a[1].compareTo(b[1]);
        return a[0].compareTo(b[0]);
      },
    );
    int n = pairs.length;
    List<int> dp = List.generate(n, (_) => 1);
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (pairs[i][0] > pairs[j][1]) {
          dp[i] = max(dp[i], dp[j] + 1);
        }
      }
    }

    return dp.reduce(max);
  }
}

void main(List<String> args) {
  print(Solution().findLongestChain([
    [1, 2],
    [2, 3],
    [3, 4]
  ]));
  print(Solution().findLongestChain([
    [1, 2],
    [7, 8],
    [4, 5]
  ]));
}
