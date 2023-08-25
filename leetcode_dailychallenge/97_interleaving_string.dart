import 'dart:collection';

class Solution {
  Map<String, bool> dp = HashMap();
  bool isInterleave(String s1, String s2, String s3) {
    if (s1 == "" && s2 == "") return s3 == "";
    if (s1 == "") return s2 == s3;
    if (s2 == "") return s1 == s3;
    if (s3 == "") return false;
    String key = "$s1-$s2-$s3";
    if (dp.containsKey(key)) return dp[key]!;
    bool ans = false;
    if (s1[0] != s3[0] && s2[0] != s3[0]) return false;
    if (s1[0] == s3[0])
      ans |= isInterleave(s1.substring(1), s2, s3.substring(1));
    if (s2[0] == s3[0])
      ans |= isInterleave(s1, s2.substring(1), s3.substring(1));
    return dp[key] = ans;
  }

  bool isInterleave_tabulation(String s1, String s2, String s3) {
    int m = s1.length, n = s2.length;
    if (m + n != s3.length) return false;

    List<List<bool>> dp =
        List.generate(m + 1, (_) => List.generate(n + 1, (_) => false));
    dp[0][0] = true;
    for (int i = 0; i <= m; i++) {
      for (int j = 0; j <= n; j++) {
        int k = i + j - 1;
        if (i > 0 && s1[i - 1] == s3[k]) {
          dp[i][j] |= dp[i - 1][j];
        }
        if (j > 0 && s2[j - 1] == s3[k]) {
          dp[i][j] |= dp[i][j - 1];
        }
      }
    }
    return dp[m][n];
  }
}

void main(List<String> args) {
  print(Solution().isInterleave("aabcc", "dbbca", "aadbbcbcac"));
  print(Solution().isInterleave("aabcc", "dbbca", "aadbbbaccc"));
  print(Solution().isInterleave("", "", ""));

  print(Solution().isInterleave_tabulation("aabcc", "dbbca", "aadbbcbcac"));
  print(Solution().isInterleave_tabulation("aabcc", "dbbca", "aadbbbaccc"));
  print(Solution().isInterleave_tabulation("", "", ""));
}
