import 'package:flutter/material.dart';
import 'package:hello_world/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO APP',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: ChangeNotifierProvider<MainModel>(
          create: (_) => MainModel()..getTodoList(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [Text("TODO APP")],
      )),
      drawer: Drawer(
        child: Center(child: Text("アカウント設定")),
      ),
      body: Consumer<MainModel>(
        builder: (context, model, child) {
          final todoList = model.todoList;
          return ListView(
            children: todoList
                .map(
                  (todo) => ListTile(title: Text(todo.title)),
                )
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
