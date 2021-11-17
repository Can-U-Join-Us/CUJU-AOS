import 'package:flutter/material.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'chat_page.dart';
import 'competition_page.dart';
import 'project_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  List<Widget> _screen = [
    ProjectPage(),
    CompetitionPage(),
    MainPage(),
    ChatPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
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
            title: Text('홈'),
            icon: Icon(Icons.home),
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
