import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'shopping_list_page.dart';
import 'calendar_page.dart';
import 'task_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    TaskPage(),
    ShoppingPage(),
    CalendarPage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
        index: _currentIndex,
        children: _pages,
    ),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentIndex,
    onTap: (index) {
    setState(() {
    _currentIndex = index;
    });
    },
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: 'Tarefas',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Compras',
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendário',
      ),
    ],
    ),
    );
  }
}

