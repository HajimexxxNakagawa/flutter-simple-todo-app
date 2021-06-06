import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/main_model.dart';
import 'package:hello_world/todolist.dart';
import 'package:provider/provider.dart';

import 'add_button.dart';
import 'delete_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO APP',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: ChangeNotifierProvider<MainModel>(
          create: (_) => MainModel()..getTodoListRealTime(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
        actions: [DeleteButton()],
      ),
      drawer: Drawer(
        child: Center(child: Text("アカウント設定")),
      ),
      body: TodoList(),
      floatingActionButton: AddButton(),
    );
  }
}
