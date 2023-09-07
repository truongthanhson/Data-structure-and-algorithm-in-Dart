class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  List<ListNode?> splitListToParts(ListNode? head, int k) {
    ListNode? curr = head;
    int cnt = 0;
    while (curr != null) {
      curr = curr.next;
      cnt++;
    }
    int minNodePerPart = cnt ~/ k, extraNodePartCnt = cnt % k;
    List<ListNode?> ans = List.generate(k, (_) => ListNode(-1));
    curr = head;
    for (int i = 0; i < k; i++) {
      ListNode? tmp = ans[i];
      int nodeCnt = minNodePerPart + (extraNodePartCnt-- > 0 ? 1 : 0);
      while (nodeCnt > 0) {
        tmp!.next = curr;
        tmp = tmp.next;
        curr = curr!.next;
        nodeCnt--;
      }
      tmp?.next = null;
      ans[i] = ans[i]?.next;
    }
    return ans;
  }
}
