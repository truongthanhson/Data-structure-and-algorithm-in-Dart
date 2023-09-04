class UnionFind {
  late List<int> parent;
  late List<int> rank;
  UnionFind(int n) {
    parent = List.generate(n, (_) => 0);
    rank = List.generate(n, (_) => 1);
    for (int i = 0; i < n; i++) {
      parent[i] = i;
    }
  }

  int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]);
    return parent[x];
  }

  void union(int x, int y) {
    int px = find(x), py = find(y);
    if (px == py) return;
    if (rank[px] >= rank[py]) {
      parent[py] = px;
      rank[px] += rank[py];
    } else {
      parent[px] = py;
      rank[py] += rank[px];
    }
  }

  int getSize(int x) {
    return rank[find(x)];
  }
}

class Solution {
  List<List<int>> findCriticalAndPseudoCriticalEdges(
      int n, List<List<int>> edges) {
    int minWeight = 0;
    for (int i = 0; i < edges.length; i++) {
      edges[i].add(i);
    }
    edges.sort((a, b) => a[2].compareTo(b[2]));
    UnionFind uf = UnionFind(n);
    for (int i = 0; i < edges.length; i++) {
      int a = edges[i][0], b = edges[i][1], w = edges[i][2];
      if (uf.find(a) == uf.find(b)) continue;
      uf.union(a, b);
      minWeight += w;
    }
    List<int> criticalEdges = [], pseudoCriticalEdges = [];
    for (var i = 0; i < edges.length; i++) {
      UnionFind newUf = UnionFind(n);
      int newWeight = 0, edgesCnt = 0;
      for (int j = 0; j < edges.length; j++) {
        int a = edges[j][0], b = edges[j][1], w = edges[j][2];
        if (i == j || newUf.find(a) == newUf.find(b)) continue;
        newUf.union(a, b);
        edgesCnt++;
        newWeight += w;
      }

      if (newUf.getSize(0) != n || newWeight > minWeight) {
        criticalEdges.add(edges[i][3]);
      } else {
        UnionFind tempUf = UnionFind(n);
        int newWeight = edges[i][2];
        tempUf.union(edges[i][0], edges[i][1]);
        for (int j = 0; j < edges.length; j++) {
          int a = edges[j][0], b = edges[j][1], w = edges[j][2];
          if (i == j || tempUf.find(a) == tempUf.find(b)) continue;
          tempUf.union(a, b);
          newWeight += w;
        }
        if (newWeight == minWeight) {
          pseudoCriticalEdges.add(edges[i][3]);
        }
      }
    }
    return [
      [...criticalEdges],
      [...pseudoCriticalEdges]
    ];
  }
}

void main(List<String> args) {
  print(Solution().findCriticalAndPseudoCriticalEdges(5, [
    [0, 1, 1],
    [1, 2, 1],
    [2, 3, 2],
    [0, 3, 2],
    [0, 4, 3],
    [3, 4, 3],
    [1, 4, 6]
  ]));
  print(Solution().findCriticalAndPseudoCriticalEdges(4, [
    [0, 1, 1],
    [1, 2, 1],
    [2, 3, 1],
    [0, 3, 1]
  ]));
  print(Solution().findCriticalAndPseudoCriticalEdges(6, [
    [0, 1, 1],
    [1, 2, 1],
    [0, 2, 1],
    [2, 3, 4],
    [3, 4, 2],
    [3, 5, 2],
    [4, 5, 2],
  ]));
}
