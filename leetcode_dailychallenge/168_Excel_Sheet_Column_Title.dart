class Solution {
  String convertToTitle(int columnNumber) {
    StringBuffer st = StringBuffer("");
    while (columnNumber > 0) {
      int remain = --columnNumber % 26;
      columnNumber = columnNumber ~/ 26;
      st.write(String.fromCharCode("A".codeUnitAt(0) + remain));
    }
    return st.toString().split('').reversed.join('');
  }
}

void main(List<String> args) {
  print(Solution().convertToTitle(1));
  // 26 * 1 + 2
  print(Solution().convertToTitle(28));
  // 26 * 26 + 25
  print(Solution().convertToTitle(701));
}
