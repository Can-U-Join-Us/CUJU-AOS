import 'package:canyoujoinus/pages/login_page.dart';
import 'package:canyoujoinus/pages/signUp_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var _pageController = PageController();
  var _index = 0;
  List<String> images = [
    "images/initial_1.png",
    "images/initial_2.png",
    "images/initial_3.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              child: PageView(
                onPageChanged: (int currentIndex) {
                  setState(() {
                    _index = currentIndex;
                  });
                },
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("images/initial_1.png"),
                        SizedBox(height: 20),
                        Text(
                          "프로젝트 팀원을\n찾고 계신가요?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("images/initial_2.png"),
                        SizedBox(height: 30),
                        Text(
                          "분야별로 한 눈에\n확인하고 싶으신가요?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("images/initial_3.png"),
                        SizedBox(height: 20),
                        Text(
                          "팀원 모집 시간을\n대폭 줄여드립니다.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset("images/initial_4.png"),
                          ),
                          FlatButton(
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(10.0),
                              //   color: Colors.grey,
                              // ),
                              child: Text(
                                "로그인",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(LoginPage.routeName);
                            },
                          ),
                          FlatButton(
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(10.0),
                              //   color: Colors.lightBlueAccent,
                              // ),
                              child: Text(
                                "회원 가입",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(SignUpPage.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    SmoothPageIndicator(
                      count: 4,
                      controller: _pageController,
                    ),
                    _index == 3
                        ? Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: FlatButton(
                        child: Text(""),
                        onPressed: null,
                      ),
                    )
                        : Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: FlatButton(
                        child: Text("건너뛰기"),
                        onPressed: onSkipButtonTap,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onSkipButtonTap() {
    _pageController.jumpToPage(3);
  }
}
