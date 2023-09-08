class Solution {
  List<List<int>> generate(int numRows) {
    // 1
    // 1 1
    // 1 2 1
    // 1 3 3 1
    // 1 4 6 4 1
    List<List<int>> ans = [];
    List<int> prev = [];
    for (int i = 0; i < numRows; i++) {
      List<int> row = [];
      row.add(1);

      for (int j = 1; j < prev.length; j++) {
        row.add(prev[j] + prev[j - 1]);
      }
      if (i != 0) row.add(1);
      ans.add(row);
      prev = List.from(row);
    }
    return ans;
  }
}

void main(List<String> args) {
  print(Solution().generate(5));
  print(Solution().generate(1));
}
