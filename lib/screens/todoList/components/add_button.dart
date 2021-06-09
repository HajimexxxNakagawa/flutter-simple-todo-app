import 'package:flutter/material.dart';

import '../../addTodo/add_todo_screen.dart';

class AddButton extends StatelessWidget {
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
    );
  }
}
