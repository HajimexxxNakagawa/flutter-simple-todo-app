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
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          labelText: "Title",
                          hintText: "洗濯物を干す"),
                      onChanged: (text) => {model.title = text},
                    ),
                  ),
                  Container(
                    height: 240,
                    child: TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          border: OutlineInputBorder(),
                          labelText: "Description",
                          hintText: "3日分の洗濯物を片付けるぞー！"),
                      onChanged: (text) => {model.description = text},
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        await model.addTodo();
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text('追加')),
                ]),
              );
            },
          )),
    );
  }
}
