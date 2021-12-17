import 'package:canyoujoinus/chat/entrance_page/entrance_page.dart';
import 'package:flutter/material.dart';
import 'navigations/main_page.dart';
import 'navigations/profile_page.dart';
import 'navigations/chat_page.dart';
import 'navigations/contest_page.dart';
import 'navigations/project_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  List<Widget> _screen = [
    ProjectPage(),
    ContestPage(),
    EntrancePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            title: Text('탐색'),
            icon: Icon(Icons.wb_sunny),
          ),
          BottomNavigationBarItem(
            title: Text('공모전'),
            icon: Icon(Icons.cloud),
          ),
          BottomNavigationBarItem(
            title: Text('채팅'),
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            title: Text('내 정보'),
            icon: Icon(Icons.person),
          ),
        ],
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
