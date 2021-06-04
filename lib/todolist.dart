import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(builder: (context, model, child) {
      final todoList = model.todoList;
      return ListView(
        children: todoList
            .map(
              (todo) => CheckboxListTile(
                title: Text(todo.title),
                value: todo.isDone,
                onChanged: (bool? value) {
                  todo.isDone = !todo.isDone;
                  model.reload();
                },
              ),
            )
            .toList(),
      );
    });
  }
}
