void main(List<String> args) {
  print(Solution().myPow(2.00000, 10));
  print(Solution().myPow(2.10000, 3));
  print(Solution().myPow(2.00000, -2));
}

class Solution {
  // naive solution with get TLE if n > 10^8
  double myPow_naive(double x, int n) {
    bool isNegative = n < 0;
    if (isNegative) n *= -1;
    double res = 1.0;
    for (int i = 0; i < n; i++) {
      res *= x;
    }
    return isNegative ? 1 / res : res;
  }

  double myPow(double x, int n) {
    if (n < 0) {
      x = 1 / x;
      n *= -1;
    }
    return solve(x, n);
  }

  double solve(double x, int n) {
    if (n == 0) return 1;
    if (n % 2 == 0) {
      return solve(x * x, n ~/ 2);
    } else {
      return x * solve(x * x, n ~/ 2);
    }
  }
}
