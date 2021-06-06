import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(builder: (context, model, child) {
      final todoList = model.todoList;
      return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: todoList
              .map(
                (todo) => Card(
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        value: todo.isDone,
                        onChanged: (bool? value) {
                          todo.isDone = !todo.isDone;
                          model.reload();
                        },
                      ),
                      if (!todo.isDone)
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          child: Text(
                            todo.description,
                            textAlign: TextAlign.left,
                          ),
                        )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
