void main(List<String> args) {
  print(Solution().searchMatrix([
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
  ], 3));
  print(Solution().searchMatrix([
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
  ], 13));
}

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    int m = matrix.length, n = matrix[0].length;
    int l = 0, r = m * n - 1;
    while (l <= r) {
      int mid = (l + r) ~/ 2;
      int row = mid ~/ n, col = mid % n, val = matrix[row][col];
      if (val == target) {
        return true;
      } else if (val < target) {
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
    return false;
  }
}
