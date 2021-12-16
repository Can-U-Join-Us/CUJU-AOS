import 'package:canyoujoinus/models/competition.dart';
import 'package:canyoujoinus/pages/inFields/notification_page.dart';
import 'package:canyoujoinus/providers/project_provider.dart';
import 'package:canyoujoinus/widgets/projectItems_list.dart';
import 'package:provider/provider.dart';
import '/pages/inFields/search_page.dart';
import '/pages/posts/add_project.dart';
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
  List<String> _routeNames = [
    FrontendPage.routeName,
    BackendPage.routeName,
    AndroidPage.routeName,
    IosPage.routeName,
    DesignPage.routeName,
    PmPage.routeName
  ];
  var _isLoading = true;

  Future<void> _refresh() async {
    await Provider.of<ProjectProvider>(context, listen: false).fetchAndSetProject();
  }

  @override
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<ProjectProvider>(context, listen: false).fetchAndSetProject();
    setState(() {
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "프로젝트 탐색",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).pushNamed(SearchPage.routeName);
              },
            ),
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: RefreshIndicator(
          onRefresh: () => _refresh(),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Colors.grey,),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BetweenTapArea(context, "분야별로 보기"),
                        FieldComponent(context, _fieldItems, _routeNames),
                        BetweenTapArea(context, "관심 분야 관련 프로젝트"),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.72,
                              child: Container(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          ProjectItemsList(
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].id,
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].pid,
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].title,
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].description,
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].imageUrl,
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].count,
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].term,
                                            Provider.of<ProjectProvider>(context, listen : false).projectItems[index].due,
                                  ),
                                  itemCount: CompetitionItems().itemCount,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushNamed(AddProjectPage.routeName);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }

  Widget BetweenTapArea(BuildContext context, String keyword) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      height: MediaQuery.of(context).size.height * 0.05,
      child: Text(
        keyword,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

  Widget FieldComponent(
      BuildContext context, List<String> items, List<String> routeNames) {
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
