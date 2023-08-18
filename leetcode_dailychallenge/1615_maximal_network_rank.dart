import 'dart:collection';
import 'dart:math';

class Solution {
  int maximalNetworkRank(int n, List<List<int>> roads) {
    List<int> degrees = List.generate(n, (_) => 0);
    Map<int, Set<int>> m = HashMap();
    for (int i = 0; i < n; i++) {
      m[i] = HashSet<int>();
    }
    for (var r in roads) {
      m[r[0]]!.add(r[1]);
      m[r[1]]!.add(r[0]);
      degrees[r[0]]++;
      degrees[r[1]]++;
    }
    print(degrees);
    int maxRank = -1;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (i == j) continue;
        int rank = degrees[i] + degrees[j];
        if (m[i]!.contains(j)) rank--;
        maxRank = max(maxRank, rank);
      }
    }
    return maxRank;
  }
}

void main(List<String> args) {
  print(Solution().maximalNetworkRank(4, [
    [0, 1],
    [0, 3],
    [1, 2],
    [1, 3]
  ]));
  print(Solution().maximalNetworkRank(5, [
    [0, 1],
    [0, 3],
    [1, 2],
    [1, 3],
    [2, 3],
    [2, 4]
  ]));
  print(Solution().maximalNetworkRank(8, [
    [0, 1],
    [1, 2],
    [2, 3],
    [2, 4],
    [5, 6],
    [5, 7]
  ]));
}
