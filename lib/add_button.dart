import 'package:flutter/material.dart';

import 'add/add_page.dart';

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
