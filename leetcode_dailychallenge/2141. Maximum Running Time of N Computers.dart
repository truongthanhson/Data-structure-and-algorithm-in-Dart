void main(List<String> args) {
  print(Solution().maxRunTime(2, [3, 3, 3]));
  print(Solution().maxRunTime(2, [1, 1, 1, 1]));
  print(Solution().maxRunTime(3, [10, 10, 3, 5]));
}

class Solution {
  int maxRunTime(int n, List<int> batteries) {
    int l = 1, r = batteries.reduce((a, b) => a + b);
    batteries.sort();
    while (l < r) {
      int mid = l + (r - l + 1) ~/ 2;
      if (possible(mid, n, batteries)) {
        l = mid;
      } else {
        r = mid - 1;
      }
    }

    return l;
  }

  bool possible(int hours, int n, List<int> batteries) {
    int sum = 0;
    for (int i = 0; i < batteries.length; i++) {
      sum += batteries[i];
      if (sum >= hours) {
        sum -= hours;
        n--;
      }
      if (n == 0) return true;
    }
    return false;
  }
}
