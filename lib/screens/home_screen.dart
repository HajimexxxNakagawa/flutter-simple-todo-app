// 全てのスクリーンの土台。bottomNavに合わせてWidgetの切り替えを管理する。
import 'package:flutter/material.dart';
import 'package:hello_world/screens/todoList/todo_list_screen.dart';

import 'chats/chats_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<PreferredSizeWidget> _appBarOptions = <AppBar>[
    chatPageBar(),
    todoPageBar(),
    chatPageBar(),
  ];

  static const List<Widget> _bodyWidgetOptions = <Widget>[
    ChatPageBody(),
    TodoList(),
    Text('Index 2: Settings'),
  ];

  static List<Widget> _floatingActionButtonOptions = <Widget>[
    chatPageButton(),
    AddTodoButton(),
    chatPageButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarOptions.elementAt(_selectedIndex),
      body: Center(child: _bodyWidgetOptions.elementAt(_selectedIndex)),
      floatingActionButton:
          _floatingActionButtonOptions.elementAt(_selectedIndex),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.toll_rounded), label: "Todo"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            label: "settings")
      ],
    );
  }
}
