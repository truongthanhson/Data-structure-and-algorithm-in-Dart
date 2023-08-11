// Constraints:
//
// 1 <= coins.length <= 300
// 1 <= coins[i] <= 5000
// All the values of coins are unique.
// 0 <= amount <= 5000
class Solution {
  int change(int amount, List<int> coins) {
    List<int> dp = List.generate(amount + 1, (_) => 0);
    dp[0] = 1;
    for (var coin in coins) {
      for (var i = coin; i <= amount; i++) {
        dp[i] += dp[i - coin];
      }
    }
    return dp[amount];
  }
}

void main(List<String> args) {
  print(Solution().change(5, [1, 2, 5]));
  print(Solution().change(3, [2]));
  print(Solution().change(10, [10]));
}
