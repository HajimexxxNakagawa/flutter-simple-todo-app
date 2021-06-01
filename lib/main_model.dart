import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/todo.dart';

class MainModel extends ChangeNotifier {
  List<Todo> todoList = [];

  Future getTodoList() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('todoList').get();
    final docs = snapshots.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.todoList = todoList;
    notifyListeners();
  }
}
