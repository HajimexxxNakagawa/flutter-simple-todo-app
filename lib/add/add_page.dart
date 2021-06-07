import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hello_world/add/add_model.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("新規Todo"),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text('editing'),
                  ),
                  Tab(
                    child: Text('preview'),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: <Widget>[
              Consumer<AddModel>(
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
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              labelText: "Title",
                              hintText: "洗濯物を干す"),
                          onChanged: (text) => {
                            model.title = text,
                            setState(() {
                              title = text;
                            })
                          },
                        ),
                      ),
                      Container(
                        height: 240,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              border: OutlineInputBorder(),
                              labelText: "Description",
                              hintText: "3日分の洗濯物を片付けるぞー！"),
                          onChanged: (text) => {
                            model.description = text,
                            setState(() {
                              description = text;
                            })
                          },
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
              ),
              Column(
                children: [
                  CheckboxListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      value: false,
                      onChanged: (bool? value) {}),
                  Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: MarkdownBody(
                        data: description,
                      ))
                ],
              )
            ])),
      ),
    );
  }
}
