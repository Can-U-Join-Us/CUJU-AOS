import 'package:canyoujoinus/pages/posts/add_project.dart';
import 'package:canyoujoinus/pages/posts/contest_list_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '/pages/inFields/android_page.dart';
import '/pages/inFields/backend_page.dart';
import '/pages/inFields/design_page.dart';
import '/pages/inFields/frontend_page.dart';
import '/pages/inFields/ios_page.dart';
import '/pages/inFields/pm_page.dart';
import '/pages/auths/login_page.dart';
import '/pages/auths/signUp_page.dart';
import '/pages/initial_page.dart';
import 'package:flutter/material.dart';
import 'pages/inFields/competition_info_page.dart';
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
        builder: (ctx, auth, _) => MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ko', ''),
          ],
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
            AddProjectPage.routeName: (ctx) => AddProjectPage(),
            ContestListPage.routeName : (ctx) => ContestListPage(),
          },
        ),
      ),
    );
  }
}
