import '/pages/inFields/android_page.dart';
import '/pages/inFields/backend_page.dart';
import '/pages/inFields/design_page.dart';
import '/pages/inFields/frontend_page.dart';
import '/pages/inFields/ios_page.dart';
import '/pages/inFields/pm_page.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  static const routeName = "/project-page";

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<String> _fieldItems = ["프론트엔드", "백엔드", "안드로이드", "IOS", "디자인", "PM"];
  List<String> _routeNames = [FrontendPage.routeName, BackendPage.routeName, AndroidPage.routeName, IosPage.routeName, DesignPage.routeName, PmPage.routeName];

  List<String> _favoriteItems = [];

  List<String> _popularItems = [];

  List<String> _dueDateItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("프로젝트 탐색"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BetweenTapArea(context, "분야별로 보기"),
              FieldComponent(context, _fieldItems, _routeNames),
              BetweenTapArea(context, "관심 분야 관련 프로젝트"),
              // FieldComponent(context, _favoriteItems),
              BetweenTapArea(context, "지금 다른 사람들이 많이 보는 프로젝트"),
              // FieldComponent(context, _popularItems),
              BetweenTapArea(context, "곧 마감되는 프로젝트"),
              // FieldComponent(context, _dueDateItems),
              BetweenTapArea(context, "최근 본 프로젝트"),
            ],
          ),
        ),
      ),
    );
  }

  Widget BetweenTapArea(BuildContext context, String keyword) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Text(
        keyword,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

  Widget FieldComponent(BuildContext context, List<String> items, List<String> routeNames) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  items[index],
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(routeNames[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
