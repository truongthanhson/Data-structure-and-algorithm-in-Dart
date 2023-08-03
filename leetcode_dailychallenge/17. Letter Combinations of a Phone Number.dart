void main(List<String> args) {
  print(Solution().letterCombinations('23'));
  print(Solution().letterCombinations(''));
  print(Solution().letterCombinations('2'));
}

class Solution {
  List<String> letterCombinations(String digits) {
    if (digits.length == 0) return [];
    List<String> res = [];
    var digitToChars = {
      '2': 'abc',
      '3': 'def',
      '4': 'ghi',
      '5': 'jkl',
      '6': 'mno',
      '7': 'pqrs',
      '8': 'tuv',
      '9': 'wxyz',
    };
    void solve(int index, List<String> current) {
      if (current.length == digits.length) {
        res.add(current.join());
        return;
      }

      for (int i = 0; i < digitToChars[digits[index]]!.length; i++) {
        current.add(digitToChars[digits[index]]![i]);
        solve(index + 1, current);
        current.removeLast();
      }
    }

    solve(0, []);
    return res;
  }
}
