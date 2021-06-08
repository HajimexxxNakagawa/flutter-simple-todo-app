import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hello_world/todo.dart';
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
          children: todoList.map((todo) => TodoCard(todo, model)).toList(),
        ),
      );
    });
  }
}

class TodoCard extends StatefulWidget {
  final Todo todo;
  final MainModel model;
  TodoCard(this.todo, this.model);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _isHide = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _isHide ? 0 : 12,
      child: Column(
        children: [
          CheckboxListTile(
            title: Text(
              widget.todo.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            value: widget.todo.isDone,
            onChanged: (bool? value) {
              widget.todo.isDone = !widget.todo.isDone;
              setState(() {
                _isHide = widget.todo.isDone;
              });
              widget.model.reload();
            },
          ),
          AnimatedContainer(
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              constraints: _isHide
                  ? BoxConstraints(maxHeight: 0)
                  : BoxConstraints(minHeight: 30, maxHeight: 300),
              child: SingleChildScrollView(
                child: MarkdownBody(
                  data: widget.todo.description,
                ),
              ))
        ],
      ),
    );
  }
}
