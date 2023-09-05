class UnionFind {
  late List<int> parents;
  UnionFind(int n) {
    parents = List.generate(n, (_) => 0);
    for (int i = 0; i < n; i++) {
      parents[i] = i;
    }
  }

  int find(int x) {
    if (parents[x] != x) parents[x] = find(parents[x]);
    return parents[x];
  }

  bool union(int x, int y) {
    int px = find(x), py = find(y);
    if (px != py) {
      parents[px] = py;
      return true;
    }
    return false;
  }
}

class Solution {
  int minCostConnectPoints(List<List<int>> points) {
    int n = points.length;
    List<List<int>> edges = [];
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        List<int> a = points[i], b = points[j];
        int dist = (a[0] - b[0]).abs() + (a[1] - b[1]).abs();
        edges.add([i, j, dist]);
      }
    }
    edges.sort((a, b) => a[2].compareTo(b[2]));

    int minCost = 0;
    UnionFind uf = UnionFind(n);
    for (List<int> e in edges) {
      if (uf.union(e[0], e[1])) minCost += e[2];
    }
    return minCost;
  }
}

void main(List<String> args) {
  print(Solution().minCostConnectPoints([
    [0, 0],
    [2, 2],
    [3, 10],
    [5, 2],
    [7, 0]
  ]));
  print(Solution().minCostConnectPoints([
    [3, 12],
    [-2, 5],
    [-4, 1]
  ]));
}
