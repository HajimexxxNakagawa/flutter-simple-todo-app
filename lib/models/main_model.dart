import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/todo_model.dart';

class MainModel extends ChangeNotifier {
  List<Todo> todoList = [];

  void getTodoListRealTime() {
    final snapshots =
        FirebaseFirestore.instance.collection('todoList').snapshots();
    // ignore: cascade_invocations
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      // ignore: cascade_invocations
      this.todoList = todoList;
      notifyListeners();
    });
  }

  Future deleteCheckedTodos() async {
    final checkedTodos = todoList.where((todo) => todo.isDone).toList();
    final references =
        checkedTodos.map((item) => item.documentReference).toList();

    final batch = FirebaseFirestore.instance.batch();

    for (final reference in references) {
      batch.delete(reference!);
    }

    return batch.commit();
  }

  bool isDeleteButtonActive() {
    final checkedTodos = todoList.where((todo) => todo.isDone).toList();
    return checkedTodos.isNotEmpty;
  }

  void reload() {
    notifyListeners();
  }
}
