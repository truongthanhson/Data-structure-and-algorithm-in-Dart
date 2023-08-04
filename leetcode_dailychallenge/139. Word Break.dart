void main(List<String> args) {
  print(Solution().wordBreak('leetcode', ['leet', 'code']));
  print(Solution().wordBreak('applepenapple', ['apple', 'pen']));
  print(
      Solution().wordBreak('catsandog', ['cats', 'dog', 'sand', 'and', 'cat']));
  print(Solution().wordBreak(
      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab',
      [
        "a",
        "aa",
        "aaa",
        "aaaa",
        "aaaaa",
        "aaaaaa",
        "aaaaaaa",
        "aaaaaaaa",
        "aaaaaaaaa",
        "aaaaaaaaaa"
      ]));
}

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    Map<String, bool> memo = {};
    bool solve(String s1) {
      if (s1.length == 0) return true;
      if (memo.containsKey(s1)) {
        return memo[s1]!;
      }
      bool ans = false;
      for (var word in wordDict) {
        if (word.length > s1.length) continue;
        String s2 = s1.substring(0, word.length);
        if (s2 == word) {
          ans |= solve(s1.substring(word.length));
        }
      }
      memo[s1] = ans;
      return ans;
    }

    return solve(s);
  }
}
// 1 <= s.length <= 300
// 1 <= wordDict.length <= 1000
// 1 <= wordDict[i].length <= 20
// s and wordDict[i] consist of only lowercase English letters.
// All the strings of wordDict are unique.

// Naive Solution, will get TLE
// class Solution {
//   bool wordBreak(String s, List<String> wordDict) {
//     bool solve(String s1) {
//       if (s1.length == 0) return true;
//       bool ans = false;
//       for (var word in wordDict) {
//         if (word.length > s1.length) continue;
//         String s2 = s1.substring(0, word.length);
//         if (s2 == word) {
//           ans |= solve(s1.substring(word.length));
//         }
//       }
//       return ans;
//     }
//
//     return solve(s);
//   }
// }

