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
}

void main(List<String> args) {
  print(Solution().isInterleave("aabcc", "dbbca", "aadbbcbcac"));
  print(Solution().isInterleave("aabcc", "dbbca", "aadbbbaccc"));
  print(Solution().isInterleave("", "", ""));
}
