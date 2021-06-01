import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    final data = doc.data() as dynamic;
    final Timestamp timestamp = data['createdAt'];

    this.title = data['title'];
    this.description = data['description'];
    this.createdAt = timestamp.toDate();
  }

  String title = '';
  String description = '';
  bool isDone = false;
  DateTime createdAt = DateTime.now();
}
