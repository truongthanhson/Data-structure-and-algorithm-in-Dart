import 'dart:io';
import 'package:meta/meta.dart';

class ListNode<E> {
  ListNode<E>? next;
  E value;

  ListNode({required this.value, this.next});

  @override
  String toString() {
    StringBuffer st = StringBuffer();
    st.write('[');
    st.write(value);
    st.write(']');
    return st.toString();
  }
}

// implementation with only 1 pointer
class SinglyLinkedListOnePointer<E> {
  ListNode<E>? head;

  SinglyLinkedListOnePointer();

  void insertEnd(E val) {
    ListNode<E> newNode = ListNode(value: val, next: null);
    if (head == null) {
      head = newNode;
    } else {
      ListNode? curr = head;

      while (curr?.next != null) {
        curr = curr!.next;
      }
      curr!.next = newNode;
    }
  }

  void remove(E val) {
    if (head != null && head!.value == val) {
      head = head!.next;
      return;
    }

    ListNode<E>? curr = head;
    while (curr != null && curr.next != null) {
      if (curr.next!.value == val) {
        curr.next = curr.next!.next;
        return;
      }
      curr = curr.next;
    }
  }

  void append(E value) {
    head = ListNode(value: value, next: head);
  }

  E? pop() {
    if (head == null) return null;
    if (head!.next == null) {
      head = null;
      return null;
    }
    ListNode<E>? curr = head;
    while (curr!.next != null && curr.next!.next != null) {
      curr = curr.next;
    }
    E res = curr.next!.value;
    curr.next = curr.next!.next;
    return res;
  }

  E? removeLast() {
    if (head != null) {
      ListNode<E>? node = head!.next;
      head = head!.next;
      return node?.value;
    }
    return null;
  }

  void printList() {
    print("=============================");
    ListNode? curr = head;
    stdout.write("head -> ");
    while (curr != null) {
      stdout.write('${curr.toString()} -> ');
      curr = curr.next;
    }
    stdout.write("null\n");
  }
}

// implementation with 2 pointers
class SinglyLinkedList<E> {
  ListNode<E>? head;
  ListNode<E>? tail;

  SinglyLinkedList();

  void append(E value) {
    ListNode<E> newNode = ListNode(value: value);
    if (tail != null) {
      tail!.next = newNode;
      tail = newNode;
    } else {
      head = newNode;
      tail = newNode;
    }
  }

  E? pop() {
    if (isEmpty) return null;
    ListNode<E> temp = head!;
    head = head!.next;
    if (head == null) tail = null;
    return temp.value;
  }

  E? removeLast() {
    if (head == null) return null;
    if (head == tail) {
      E value = head!.value;
      head = null;
      tail = null;
      return value;
    }
    ListNode<E>? curr = head;
    E value = tail!.value;
    while (curr!.next != null && curr.next != tail) {
      curr = curr.next;
    }
    curr.next = null;
    tail = curr;
    return value;
  }

  void push(E value) {
    head = ListNode(value: value, next: head);
    tail ??= head;
  }

  bool get isEmpty => head == null && tail == null;

  Iterator<E> get iterator => _LinkedListIterator(this);
  
  @visibleForTesting
  int get size {
    if (isEmpty) return 0;
    ListNode<E>? curr = head;
    var cnt = 0; 
    while (curr != null) {
      cnt++;
      curr = curr.next;
    }
    return cnt;
  }
}

class _LinkedListIterator<E> implements Iterator<E> {

  _LinkedListIterator(SinglyLinkedList<E> list) : _linkedList = list;

  final SinglyLinkedList<E> _linkedList;

  ListNode<E>? _currentNode;
  bool _first = true;

  @override
  E get current => _currentNode!.value; 

  @override
  bool moveNext() {
    if (_linkedList.isEmpty) return false;

    if (_first) {
      _currentNode = _linkedList.head;
      _first = false;
    } else {
      _currentNode = _currentNode?.next; 
    }
    return _currentNode != null;
  }
}
