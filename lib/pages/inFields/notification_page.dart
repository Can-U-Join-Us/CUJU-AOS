import 'package:canyoujoinus/pages/inFields/otherInfo_page.dart';
import 'package:canyoujoinus/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = "/notification";

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "알림",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.grey,
            tabs: <Widget>[
              Tab(text: "시스템 알림"),
              Tab(text: "프로젝트 알림"),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Provider.of<NotificationProvider>(context, listen: false)
                    .fetchAndSetNotification();
              },
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            OfficalNotification(),
            ProjectNotification(),
          ],
        ),
      ),
    );
  }
}

class OfficalNotification extends StatefulWidget {
  const OfficalNotification({Key? key}) : super(key: key);

  @override
  _OfficalNotificationState createState() => _OfficalNotificationState();
}

class _OfficalNotificationState extends State<OfficalNotification> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<NotificationProvider>(context, listen: false)
                .systemNotificationList
                .length ==
            0
        ? Center(child: Text("시스템 알림이 없습니다."))
        : Container(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, index) {
                return Divider(thickness: 2);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Provider.of<NotificationProvider>(context,
                                  listen: false)
                              .systemNotificationList[index]
                              .title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(Provider.of<NotificationProvider>(context,
                                listen: false)
                            .systemNotificationList[index]
                            .content),
                      ],
                    ),
                  ),
                );
              },
              itemCount:
                  Provider.of<NotificationProvider>(context, listen: false)
                      .systemNotificationList
                      .length,
            ),
          );
  }
}

class ProjectNotification extends StatefulWidget {
  const ProjectNotification({Key? key}) : super(key: key);

  @override
  _ProjectNotificationState createState() => _ProjectNotificationState();
}

class _ProjectNotificationState extends State<ProjectNotification> {
  void _clickYes() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "참가 수락",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text("프로젝트 참가를 수락하시겠습니까?"),
        actions: <Widget>[
          FlatButton(
            child: Text("예"),
            onPressed: () {
              // success
              Navigator.of(ctx).pop();
            },
          ),
          FlatButton(
            child: Text("아니요"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void _clickNo() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "참가 거절",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text("프로젝트 참가를 거절하시겠습니까?"),
        actions: <Widget>[
          FlatButton(
            child: Text("예"),
            onPressed: () {
              // delete
              Navigator.of(ctx).pop();
            },
          ),
          FlatButton(
            child: Text("아니요"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<NotificationProvider>(context, listen: false)
                .projectNotificationList
                .length ==
            0
        ? Center(child: Text("프로젝트 알림이 없습니다."))
        : Container(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, index) {
                return Divider(thickness: 2);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                Provider.of<NotificationProvider>(context,
                                        listen: false)
                                    .projectNotificationList[index]
                                    .title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            FlatButton(
                              child: Text(
                                  "참가자 : ${Provider.of<NotificationProvider>(context, listen: false).projectNotificationList[index].content}"),
                              onPressed: () {
                                Navigator.of(context).pushNamed(OtherInfoPage.routeName);
                              },
                            )
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: FlatButton(
                            child: Text("O"),
                            onPressed: () {
                              _clickYes();
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: FlatButton(
                            child: Text("X"),
                            onPressed: () {
                              _clickNo();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount:
                  Provider.of<NotificationProvider>(context, listen: false)
                      .systemNotificationList
                      .length,
            ),
          );
  }
}
