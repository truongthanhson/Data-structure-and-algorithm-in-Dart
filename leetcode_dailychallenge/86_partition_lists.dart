class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? partition(ListNode? head, int x) {
    ListNode greater = new ListNode(-1);
    ListNode smaller = new ListNode(-1);
    ListNode tmp = smaller;
    ListNode? tmp2;
    while (head != null) {
      if (head.val >= x) {
        greater.next = head;
        greater = greater.next!;
        if (tmp2 == null) tmp2 = greater;
      } else {
        smaller.next = head;
        smaller = smaller.next!;
      }
      head = head.next;
      smaller.next = null;
      greater.next = null;
    }
    smaller.next = tmp2;
    return tmp.next;
  }

  void printList(ListNode? head) {
    StringBuffer st = StringBuffer("");
    while (head != null) {
      st.write('${head.val}->');
      head = head.next;
    }
    st.write("NULL");
    print(st.toString());
  }
}
