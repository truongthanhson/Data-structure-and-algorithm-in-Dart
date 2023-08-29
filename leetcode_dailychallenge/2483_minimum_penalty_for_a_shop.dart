import 'dart:math';

class Solution {
  int bestClosingTime(String customers) {
    // YYNY
    int n = customers.length;
    List<int> penaltyOpen = List.generate(n + 1, (_) => 0);
    List<int> penaltyClose = List.generate(n + 1, (_) => 0);
    for (int i = 1; i < n; i++) {
      penaltyOpen[i] = penaltyOpen[i - 1] + (customers[i - 1] == "N" ? 1 : 0);
    }
    for (int i = n - 1; i >= 0; i--) {
      penaltyClose[i] = penaltyClose[i + 1] + (customers[i] == "Y" ? 1 : 0);
    }
    int best = -1, minPenalty = 100001;
    for (int i = 0; i <= n; i++) {
      final int prev = minPenalty;
      minPenalty =
          min(minPenalty, (i > 0 ? penaltyOpen[i - 1] : 0) + penaltyClose[i]);
      if (minPenalty < prev) {
        best = i;
      }
    }
    return best;
  }
}

void main(List<String> args) {
  print(Solution().bestClosingTime("YYNY"));
  print(Solution().bestClosingTime("NNNNN"));
  print(Solution().bestClosingTime("YYYY"));
  print(Solution().bestClosingTime("NYNNNYYN"));
}
