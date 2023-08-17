import 'dart:collection';

class Pair {
  final int x;
  final int y;

  const Pair(this.x, this.y);
}

class Solution {
  List<List<int>> updateMatrix(List<List<int>> mat) {
    var M = mat.length, N = mat[0].length;
    List<List<int>> dist = List.generate(M, (_) => List.generate(N, (_) => -1));
    Queue<Pair> q = Queue<Pair>();
    for (var i = 0; i < M; i++) {
      for (var j = 0; j < N; j++) {
        if (mat[i][j] == 0) {
          dist[i][j] = 0;
          q.add(Pair(i, j));
        }
      }
    }

    List<int> dr = [-1, 0, 1, 0, -1];

    while (q.isNotEmpty) {
      var p = q.removeFirst();
      int r = p.x, c = p.y;
      for (var i = 0; i < 4; i++) {
        int nr = r + dr[i], nc = c + dr[i + 1];

        if (0 <= nr && nr < M && 0 <= nc && nc < N && dist[nr][nc] == -1) {
          dist[nr][nc] = dist[r][c] + 1;
          q.add(Pair(nr, nc));
        }
      }
    }
    return dist;
  }
}

void main(List<String> args) {
  print(Solution().updateMatrix([
    [0, 0, 0],
    [0, 1, 0],
    [0, 0, 0]
  ]));
  print(Solution().updateMatrix([
    [0, 0, 0],
    [0, 1, 0],
    [1, 1, 1]
  ]));
}
