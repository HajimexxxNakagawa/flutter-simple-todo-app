import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/Todo.dart';

class MainModel extends ChangeNotifier {
  List<Todo> todoList = [];

  void getTodoListRealTime() {
    final snapshots =
        FirebaseFirestore.instance.collection('todoList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.todoList = todoList;
      notifyListeners();
    });
  }

  Future deleteCheckedTodos() async {
    final checkedTodos = todoList.where((todo) => todo.isDone).toList();
    final references =
        checkedTodos.map((item) => item.documentReference).toList();

    WriteBatch batch = FirebaseFirestore.instance.batch();

    references.forEach((reference) {
      batch.delete(reference!);
    });

    return batch.commit();
  }

  bool isDeleteButtonActive() {
    final checkedTodos = todoList.where((todo) => todo.isDone).toList();
    return checkedTodos.length > 0;
  }

  void reload() {
    notifyListeners();
  }
}
