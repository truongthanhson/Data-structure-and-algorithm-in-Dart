// * Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void main(List<String> args) {
  print(Solution().generateTrees(1));
  print(Solution().generateTrees(2));
  print(Solution().generateTrees(3));
}

class Solution {
  List<TreeNode?> generateTrees(int n) {
    List<TreeNode?> generate(int l, int r) {
      List<TreeNode?> res = [];
      if (l > r) return [null];
      if (l == r) return [TreeNode(l, null, null)];

      for (var i = l; i <= r; i++) {
        List<TreeNode?> left = generate(l, i - 1);
        List<TreeNode?> right = generate(i + 1, r);
        for (var leftNode in left) {
          for (var rightNode in right) {
            res.add(TreeNode(i, leftNode, rightNode));
          }
        }
      }

      return res;
    }

    return generate(1, n);
  }
}
