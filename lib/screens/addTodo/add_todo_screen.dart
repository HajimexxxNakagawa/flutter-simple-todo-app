import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hello_world/constants.dart';
import 'package:hello_world/models/add_model.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _title = '';
  String _description = '';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('New Todo'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Edit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Preview',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: <Widget>[
              Consumer<AddModel>(
                builder: (context, model, child) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor)),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Title',
                              hintText: '洗濯物を干す'),
                          onChanged: (text) => {
                            model.title = text,
                            setState(() {
                              _title = text;
                            })
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor)),
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                            hintText: '3日分の洗濯物を片付けるぞー！'),
                        onChanged: (text) => {
                          model.description = text,
                          setState(() {
                            _description = text;
                          })
                        },
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
              Card(
                color: Theme.of(context).scaffoldBackgroundColor.withBlue(60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.white, width: 0.1)),
                child: Column(
                  children: [
                    CheckboxListTile(
                        activeColor: kPrimaryColor,
                        title: Text(
                          _title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        value: false,
                        onChanged: (bool? value) {}),
                    Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: MarkdownBody(
                            data: _description,
                          ),
                        ))
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
