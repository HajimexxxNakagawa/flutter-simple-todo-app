import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    // ignore: omit_local_variable_types
    final Map<String, dynamic> data = doc.data();
    documentReference = doc.reference;

    title = data['title'] as String;
    description = data['description'] as String;
    createdAt = data['createdAt'] as Timestamp;
  }

  String title = '';
  String description = '';
  bool isDone = false;
  Timestamp createdAt = Timestamp.now();
  DocumentReference? documentReference;
}
