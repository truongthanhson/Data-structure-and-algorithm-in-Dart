class Solution {
  bool repeatedSubstringPattern(String s) {
    var N = s.length;
    for (var i = 1; i <= N / 2; i++) {
      if (N % i == 0) {
        String newString = "";
        String candidate = s.substring(0, i);
        for (var j = 0; j < N / i; j++) {
          newString += candidate;
        }
        if (newString == s) return true;
      }
    }
    return false;
  }
}

void main(List<String> args) {
  //n * (n + 1) / 2
  print(Solution().repeatedSubstringPattern("abab"));
  print(Solution().repeatedSubstringPattern("aba"));
  print(Solution().repeatedSubstringPattern("abcabcabcabc"));
}
