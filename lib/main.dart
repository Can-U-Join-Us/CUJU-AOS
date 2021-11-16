import 'package:canyoujoinus/pages/competition_page.dart';
import 'package:canyoujoinus/pages/fields/android_page.dart';
import 'package:canyoujoinus/pages/fields/backend_page.dart';
import 'package:canyoujoinus/pages/fields/design_page.dart';
import 'package:canyoujoinus/pages/fields/frontend_page.dart';
import 'package:canyoujoinus/pages/fields/ios_page.dart';
import 'package:canyoujoinus/pages/fields/pm_page.dart';
import 'package:canyoujoinus/pages/login_page.dart';
import 'package:canyoujoinus/pages/signUp_page.dart';
import 'package:canyoujoinus/pages/initial_page.dart';
import 'package:canyoujoinus/pages/profile_page.dart';
import 'package:canyoujoinus/pages/project_page.dart';
import 'package:flutter/material.dart';
import 'pages/chat_page.dart';
import 'pages/competition_info_page.dart';
import 'pages/home_page.dart';
import 'providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder : (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            splashColor: Colors.transparent,
            primaryColor: Colors.blue,
            accentColor: Colors.indigo,
          ),
          home: auth.isAuth ? HomePage() : InitialPage(),
          routes: {
            CompetitionInfoPage.routeName: (ctx) => CompetitionInfoPage(),
            FrontendPage.routeName: (ctx) => FrontendPage(),
            BackendPage.routeName: (ctx) => BackendPage(),
            AndroidPage.routeName: (ctx) => AndroidPage(),
            IosPage.routeName: (ctx) => IosPage(),
            DesignPage.routeName: (ctx) => DesignPage(),
            PmPage.routeName: (ctx) => PmPage(),
            LoginPage.routeName: (ctx) => LoginPage(),
            SignUpPage.routeName: (ctx) => SignUpPage(),
          },
        ),
      ),
    );
  }
}
