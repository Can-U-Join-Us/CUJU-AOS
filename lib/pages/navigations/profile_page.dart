import 'package:canyoujoinus/pages/inFields/changePassword_page.dart';
import 'package:canyoujoinus/pages/inFields/favoriteCategory_page.dart';
import 'package:canyoujoinus/pages/inFields/notification_page.dart';
import 'package:canyoujoinus/pages/inFields/registGithub_page.dart';
import 'package:canyoujoinus/pages/inFields/userInfo_page.dart';
import 'package:canyoujoinus/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _id = "고도현";
  var _join = 4;

  var check = false;
  var _notJoin = 0;
  int _count = 5;
  final _passwordController = TextEditingController();

  Future<void> _logout() async {
    await Provider.of<AuthProvider>(context, listen: false).logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "프로필",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.build_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed(UserInfoPage.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationPage.routeName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      child: Container(),
                      radius: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "$_id님의 프로필",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ]),
                        Row(children: <Widget>[
                          Text(
                            "참여 중인 프로젝트",
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Text(
                              "$_join개",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            onTap: () {},
                          ),
                        ]),
                        Row(children: <Widget>[
                          Text(
                            "참여 대기 중인 프로젝트",
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Text(
                              "$_notJoin개",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            onTap: () {},
                          )
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text("비밀번호 변경"),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ChangePasswordPage.routeName);
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text("깃허브 연동"),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RegistGithubPage.routeName);
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text("관심 키워드 설정"),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(FavoriteCategoryPage.routeName);
                      },
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: InkWell(
                        child: Text("로그아웃"),
                        onTap: () {
                          _logout();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
