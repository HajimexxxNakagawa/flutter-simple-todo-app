import 'package:flutter/material.dart';
import 'package:hello_world/add/add_model.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("新規Todo"),
          ),
          body: Consumer<AddModel>(
            builder: (context, model, child) {
              return Column(children: [
                TextField(
                  decoration:
                      InputDecoration(labelText: "Title", hintText: "洗濯物を干す"),
                  onChanged: (text) => {model.title = text},
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Description", hintText: "3日分の洗濯物を片付けるぞー！"),
                  onChanged: (text) => {model.description = text},
                ),
                ElevatedButton(
                    onPressed: () async {
                      await model.addTodo();
                      Navigator.pop(context);
                    },
                    child: Text('追加')),
              ]);
            },
          )),
    );
  }
}
