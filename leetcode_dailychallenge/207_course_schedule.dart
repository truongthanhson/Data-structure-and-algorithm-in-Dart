import 'dart:collection';

class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    List<int> inDegrees = List.generate(numCourses, (_) => 0);
    List<List<int>> g = List.generate(numCourses, (_) => []);
    for (var p in prerequisites) {
      g[p[1]].add(p[0]);
      inDegrees[p[0]]++;
    }
    int sourceCnt = 0;
    Queue<int> sources = Queue<int>();
    for (int i = 0; i < numCourses; i++) {
      if (inDegrees[i] == 0) {
        sources.add(i);
        sourceCnt++;
      }
    }
    while (sources.isNotEmpty) {
      int u = sources.removeFirst();
      for (var v in g[u]) {
        inDegrees[v]--;
        if (inDegrees[v] == 0) {
          sources.add(v);
          sourceCnt++;
        }
      }
    }
    return sourceCnt == numCourses;
  }
}

void main() {
  print(Solution().canFinish(2, [
    [1, 0]
  ]));
  print(Solution().canFinish(2, [
    [1, 0],
    [0, 1]
  ]));
}
