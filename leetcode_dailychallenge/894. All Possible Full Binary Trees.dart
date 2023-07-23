void main() {
  print(Solution().allPossibleFBT(1));
  print(Solution().allPossibleFBT(2));
  print(Solution().allPossibleFBT(3));
  print(Solution().allPossibleFBT(4));
}
 class TreeNode {
   int val;
   TreeNode? left;
   TreeNode? right;
   TreeNode([this.val = 0, this.left, this.right]);
 }
 
class Solution {
  List<TreeNode?> allPossibleFBT(int n) {
    List<List<TreeNode?>?> dp = List.generate(n + 1, (_) => null);
    return solve(n, dp);
  }

  List<TreeNode?> solve(int n, List<List<TreeNode?>?> dp) {
    if (n == 1) return [TreeNode()];
    if (dp[n] != null) return dp[n]!;
    List<TreeNode?> res = [];
    for (int i = 1; i <= n - 1; i++) {
      List<TreeNode?> lefts = solve(i, dp);
      List<TreeNode?> rights = solve(n - i - 1, dp);
      if (lefts.length > 0 && rights.length > 0) {
        for (TreeNode? nodeLeft in lefts) {
          for (TreeNode? nodeRight in rights) {
            res.add(TreeNode(0, nodeLeft, nodeRight));
          }
        }
      }
    }
    dp[n] = res;
    return res;
  }
}
