import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/main_model.dart';

class DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(builder: (context, model, child) {
      final isActive = model.isDeleteButtonActive();
      return TextButton(
          onPressed: isActive
              ? () async {
                  await model.deleteCheckedTodos();
                }
              : null,
          child: Text(
            '一掃',
            style: TextStyle(
                color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.bold),
          ));
    });
  }
}
