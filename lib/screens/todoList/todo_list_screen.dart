import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/MainModel.dart';
import 'package:hello_world/screens/addTodo/add_todo_screen.dart';
import 'package:hello_world/screens/todoList/components/delete_button.dart';
import 'package:hello_world/screens/todoList/components/todo_card.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

AppBar todoPageBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text("Todos"),
    actions: [DeleteButton()],
  );
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(builder: (context, model, child) {
      final todoList = model.todoList;
      return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: todoList.map((todo) => TodoCard(todo, model)).toList(),
        ),
      );
    });
  }
}

class AddTodoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddPage(), fullscreenDialog: true));
      },
      tooltip: 'Add todo',
      child: Icon(Icons.add),
      backgroundColor: kPrimaryColor,
    );
  }
}
