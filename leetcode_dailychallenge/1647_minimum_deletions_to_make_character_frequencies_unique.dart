import 'dart:collection';

class Solution {
  int minDeletions(String s) {
    Map<String, int> freq = HashMap();
    Set<int> used = {};
    int ans = 0;
    for (int i = 0; i < s.length; i++) {
      freq.putIfAbsent(s[i], () => 0);
      freq[s[i]] = freq[s[i]]! + 1;
    }
    for (MapEntry<String, int> entry in freq.entries) {
      int cnt = entry.value;
      while (cnt > 0 && used.contains(cnt)) {
        cnt--;
        ans++;
      }
      used.add(cnt);
    }

    return ans;
  }
}

void main(List<String> args) {
  print(Solution().minDeletions("aab"));
  print(Solution().minDeletions("aaabbbcc"));
  print(Solution().minDeletions("ceabaacb"));
}
