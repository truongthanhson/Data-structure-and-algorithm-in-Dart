void main(List<String> args) {
  print(Solution().minSpeedOnTime([1, 3, 2], 6));
  print(Solution().minSpeedOnTime([1, 3, 2], 2.7));
  print(Solution().minSpeedOnTime([1, 3, 2], 1.9));
}

class Solution {
  int minSpeedOnTime(List<int> dist, double hour) {
    int N = dist.length;
    if (N - 1 >= hour) return -1;

    int l = 1, r = 1000000;
    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (commuteTime(dist, mid) <= hour) {
        r = mid;
      } else {
        l = mid + 1;
      }
    }
    return r;
  }

  double commuteTime(List<int> dist, int speed) {
    double arrivedTime = 0.0;
    for (int i = 0; i < dist.length; i++) {
      if (i != dist.length - 1) {
        arrivedTime += (dist[i] / speed).ceil();
      } else {
        arrivedTime += dist[i] / speed;
      }
    }
    return arrivedTime;
  }
}
