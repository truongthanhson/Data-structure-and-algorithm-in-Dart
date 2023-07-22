import 'package:linked_list/linked_list.dart';
import 'package:test/test.dart';

void main() {
  test('list is empty on creation', () {
    SinglyLinkedList<int> linkedList = SinglyLinkedList<int>();
    expect(linkedList.isEmpty, true);
    expect(linkedList.size, isZero);
  });

  test('remove last element on empty list return null', () {
    SinglyLinkedList<int> linkedList = SinglyLinkedList<int>();
    expect(linkedList.isEmpty, true);
    expect(linkedList.size, isZero);
    expect(linkedList.removeLast(), isNull);
  });

  test('push element works properly', () {
    SinglyLinkedList<int> linkedList = SinglyLinkedList<int>();
    linkedList.push(1);
    linkedList.push(2);
    linkedList.push(3);
    linkedList.push(4);
    linkedList.push(5);
    expect(linkedList.size, 5);
    expect(linkedList.head!.value, 5);
    expect(linkedList.tail!.value, 1);
  });

  test('remove last return correct value', () {
    SinglyLinkedList<int> linkedList = SinglyLinkedList<int>();
    linkedList.push(1);
    linkedList.push(2);
    linkedList.push(3);
    expect(linkedList.removeLast(), 1);
    expect(linkedList.removeLast(), 2);
    expect(linkedList.removeLast(), 3);
    expect(linkedList, isEmpty);
  });

  test('pop return correct value', () {
    SinglyLinkedList<int> linkedList = SinglyLinkedList<int>();
    linkedList.push(1);
    linkedList.push(2);
    linkedList.push(3);
    expect(linkedList.pop(), 3);
    expect(linkedList.pop(), 2);
    expect(linkedList.pop(), 1);
    expect(linkedList, isEmpty);
  });

  test('should maintain correct order after modifications', () {
    SinglyLinkedList<int> linkedList = SinglyLinkedList<int>();
    linkedList.push(1);
    linkedList.push(2);
    linkedList.push(3);
    linkedList.push(4);
    linkedList.push(5);
    linkedList.removeLast();
    linkedList.append(6);
    linkedList.pop();
    linkedList.append(7);
    expect(linkedList.size, 5);
    expect(linkedList.head!.value, 4);
    expect(linkedList.tail!.value, 7);
  });

  test('iterator should work properly', () {
    SinglyLinkedList<int> linkedList = SinglyLinkedList<int>();
    linkedList.push(1);
    linkedList.push(2);
    linkedList.push(3);
    Iterator<int> iterator = linkedList.iterator;
    expect(iterator.moveNext(), true);
    expect(iterator.current, 3);
    expect(iterator.moveNext(), true);
    expect(iterator.current, 2);
    expect(iterator.moveNext(), true);
    expect(iterator.current, 1);
    expect(iterator.moveNext(), false);
    expect(iterator.moveNext(), false);
  });
}
