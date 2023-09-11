class Solution {
  List<List<int>> groupThePeople(List<int> groupSizes) {
    List<List<int>> ans = [];
    List<List<int>> m = List.generate(501, (_) => []);
    for (int i = 0; i < groupSizes.length; i++) {
      m[groupSizes[i]].add(i);
    }
    for (int i = 1; i < m.length; i++) {
      if (m[i].length > 0) {
        List<int> people = m[i];
        for (int j = 0; j < people.length; j += i) {
          ans.add(people.sublist(j, j + i));
        }
      }
    }
    return ans;
  }
}

void main(List<String> args) {
  print(Solution().groupThePeople([3, 3, 3, 3, 3, 1, 3]));
  print(Solution().groupThePeople([2, 1, 3, 3, 3, 2]));
}
