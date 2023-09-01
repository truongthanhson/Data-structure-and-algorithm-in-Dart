class Solution {
  List<int> countBits_nlogn(int n) {
    List<int> res = List.generate(n + 1, (_) => 0);
    for (int i = 0; i <= n; i++) {
      int j = i;
      int cnt = 0;
      while (j != 0) {
        cnt += (j & 1) == 1 ? 1 : 0;
        j >>= 1;
      }
      res[i] = cnt;
    }
    return res;
  }

  List<int> countBits_n(int n) {
    List<int> res = List.generate(n + 1, (_) => 0);
    for (int i = 0; i <= n; i++) {
      res[i] = res[i ~/ 2] + i % 2;
    }
    return res;
  }
}

void main(List<String> args) {
  print(Solution().countBits_n(2));
  print(Solution().countBits_n(5));
}
