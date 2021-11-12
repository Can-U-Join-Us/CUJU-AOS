import 'package:canyoujoinus/pages/competition_page.dart';
import 'package:canyoujoinus/pages/fields/android_page.dart';
import 'package:canyoujoinus/pages/fields/backend_page.dart';
import 'package:canyoujoinus/pages/fields/design_page.dart';
import 'package:canyoujoinus/pages/fields/frontend_page.dart';
import 'package:canyoujoinus/pages/fields/ios_page.dart';
import 'package:canyoujoinus/pages/fields/pm_page.dart';
import 'package:canyoujoinus/pages/fields/signUp_page.dart';
import 'package:canyoujoinus/pages/initial_page.dart';
import 'package:canyoujoinus/pages/profile_page.dart';
import 'package:canyoujoinus/pages/project_page.dart';
import 'package:flutter/material.dart';
import 'pages/chat_page.dart';
import 'pages/competition_info_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 2;
  List<Widget> _screen = [
    ProjectPage(),
    CompetitionPage(),
    HomePage(),
    ChatPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.indigo,
      ),
      home: Scaffold(
        body: InitialPage(),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   backgroundColor: Colors.white,
        //   currentIndex: _selectedIndex,
        //   items: [
        //     BottomNavigationBarItem(
        //       title: Text('탐색'),
        //       icon: Icon(Icons.wb_sunny),
        //     ),
        //     BottomNavigationBarItem(
        //       title: Text('공모전'),
        //       icon: Icon(Icons.cloud),
        //     ),
        //     BottomNavigationBarItem(
        //       title: Text('홈'),
        //       icon: Icon(Icons.home),
        //     ),
        //     BottomNavigationBarItem(
        //       title: Text('채팅'),
        //       icon: Icon(Icons.chat),
        //     ),
        //     BottomNavigationBarItem(
        //       title: Text('내 정보'),
        //       icon: Icon(Icons.person),
        //     ),
        //   ],
        //   onTap: (int index) {
        //     setState(
        //       () {
        //         _selectedIndex = index;
        //       },
        //     );
        //   },
        // ),
      ),
      routes: {
        CompetitionInfoPage.routeName: (ctx) => CompetitionInfoPage(),
        FrontendPage.routeName: (ctx) => FrontendPage(),
        BackendPage.routeName: (ctx) => BackendPage(),
        AndroidPage.routeName: (ctx) => AndroidPage(),
        IosPage.routeName: (ctx) => IosPage(),
        DesignPage.routeName: (ctx) => DesignPage(),
        PmPage.routeName: (ctx) => PmPage(),
        SignUpPage.routeName : (ctx) => SignUpPage(),
      },
    );
  }
}
