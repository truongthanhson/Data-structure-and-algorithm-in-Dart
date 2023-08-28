import 'dart:collection';

class MyStack {
  late Queue<int> q;
  MyStack() {
    q = Queue<int>();
  }

  void push(int x) {
    q.add(x);
  }

  int pop() {
    int sz = q.length;
    if (sz == 0) return 0;
    for (int i = 0; i < sz - 1; i++) {
      int val = q.removeFirst();
      q.add(val);
    }
    int val = q.removeFirst();
    return val;
  }

  int top() {
    int sz = q.length;
    if (sz == 0) return 0;
    for (int i = 0; i < sz - 1; i++) {
      int val = q.removeFirst();
      q.add(val);
    }
    int val = q.removeFirst();
    q.add(val);
    return val;
  }

  bool empty() {
    return q.isEmpty;
  }
}
