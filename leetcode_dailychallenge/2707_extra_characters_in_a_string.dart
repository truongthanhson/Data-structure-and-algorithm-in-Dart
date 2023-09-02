import 'dart:math';

const int inf = 51;

class Solution {
  int minExtraChar(String s, List<String> dictionary) {
    List<int> dp = List.generate(s.length, (_) => inf);
    int solve(int i) {
      if (i >= s.length) return 0;
      if (dp[i] != inf) return dp[i];

      for (String word in dictionary) {
        if (word.length > s.length - i) {
          continue;
        }
        String substr = s.substring(i, min(i + word.length, s.length));
        if (substr == word) {
          dp[i] = min(dp[i], solve(i + word.length));
        }
      }
      dp[i] = min(dp[i], 1 + solve(i + 1));
      return dp[i];
    }

    return solve(0);
  }
}

void main(List<String> args) {
  print(Solution().minExtraChar("leetscode", ["leet", "code", "leetcode"]));
  print(Solution().minExtraChar("sayhelloworld", ["hello", "world"]));
}
