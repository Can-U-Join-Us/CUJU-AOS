import 'package:canyoujoinus/pages/competition_page.dart';
import 'package:canyoujoinus/pages/profile_page.dart';
import 'package:canyoujoinus/pages/project_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<Widget> _screen = [ProjectPage(), CompetitionPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("시험 테스트"),
        ),
        body: _screen[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              title: Text('프로젝트'),
              icon: Icon(Icons.wb_sunny),
            ),
            BottomNavigationBarItem(
              title: Text('공모전'),
              icon: Icon(Icons.cloud),
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
      ),
    );
  }
}
