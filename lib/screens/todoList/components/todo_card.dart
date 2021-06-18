import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hello_world/constants.dart';
import 'package:hello_world/models/todo_model.dart';

import '../../../models/main_model.dart';

class TodoCard extends StatefulWidget {
  const TodoCard(this.todo, this.model);
  final Todo todo;
  final MainModel model;

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _isHide = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor.withBlue(60),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white, width: 0.1)),
      elevation: _isHide ? 0 : 12,
      child: Column(
        children: [
          CheckboxListTile(
            activeColor: kPrimaryColor,
            title: Text(
              widget.todo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              constraints: _isHide
                  ? const BoxConstraints(maxHeight: 0)
                  : const BoxConstraints(minHeight: 30, maxHeight: 300),
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
