import 'package:linked_list/linked_list.dart';

void main(List<String> arguments) {
  SinglyLinkedListOnePointer linkedList = SinglyLinkedListOnePointer();
  linkedList.insertEnd(1);
  linkedList.insertEnd(2);
  linkedList.insertEnd(3);
  linkedList.insertEnd(4);
  linkedList.insertEnd(5);
  
  
  linkedList.append(-1);
  linkedList.append(-2);
  linkedList.append(-3);
  linkedList.append(-4);
  linkedList.append(-5);

  linkedList.printList();
  
  linkedList.remove(3);
  linkedList.printList();

  linkedList.remove(1);
  linkedList.printList();

  linkedList.remove(6);
  linkedList.printList();

  linkedList.pop();
  linkedList.printList();
  linkedList.pop();
  linkedList.printList();
  linkedList.append(-1);
  linkedList.printList();
  linkedList.append(-2);
  linkedList.printList();
  linkedList.insertEnd(10);
  linkedList.printList();
  linkedList.insertEnd(11);
  linkedList.printList();

}
