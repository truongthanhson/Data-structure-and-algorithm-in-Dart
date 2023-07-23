void main() {
  print(Solution().knightProbability(3, 2, 0, 0));
  print(Solution().knightProbability(1, 0, 0, 0));
  print(Solution().knightProbability(8, 30, 6, 4));
}

class Solution {

  double knightProbability(int n, int k, int row, int column) {
		var dp = List.generate(n, (_) => List<double>.filled(k + 1, 1));
		print(dp);
		return 1;
  }

}
