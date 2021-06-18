import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/main_model.dart';
import 'package:hello_world/screens/addTodo/add_todo_screen.dart';
import 'package:hello_world/screens/todoList/components/delete_button.dart';
import 'package:hello_world/screens/todoList/components/todo_card.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

AppBar todoPageBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text('Todos'),
    actions: [DeleteButton()],
  );
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, model, child) {
        final todoList = model.todoList;
        return Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: todoList.map((todo) => TodoCard(todo, model)).toList(),
          ),
        );
      },
    );
  }
}

class AddTodoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push<void>(
            context,
            MaterialPageRoute(
                builder: (context) => AddPage(), fullscreenDialog: true));
      },
      tooltip: 'Add todo',
      backgroundColor: kPrimaryColor,
      child: const Icon(Icons.add),
    );
  }
}
