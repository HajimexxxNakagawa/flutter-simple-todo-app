import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddModel extends ChangeNotifier {
  String title = '';
  String description = '';

  Future addTodo() async {
    final collection = FirebaseFirestore.instance.collection('todoList');
    await collection.add(<String, dynamic>{
      'title': title,
      'description': description,
      'createdAt': Timestamp.now()
    });
  }
}
