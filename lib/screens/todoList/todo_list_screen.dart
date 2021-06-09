import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/todoList/components/todolist.dart';

import 'components/add_button.dart';
import 'components/delete_button.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
        actions: [DeleteButton()],
      ),
      drawer: Drawer(
        child: Center(child: Text("アカウント設定")),
      ),
      body: TodoList(),
      floatingActionButton: AddButton(),
    );
  }
}
