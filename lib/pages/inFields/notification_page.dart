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
        : Container();
  }
}

class ProjectNotification extends StatefulWidget {
  const ProjectNotification({Key? key}) : super(key: key);

  @override
  _ProjectNotificationState createState() => _ProjectNotificationState();
}

class _ProjectNotificationState extends State<ProjectNotification> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<NotificationProvider>(context, listen: false)
                .projectNotificationList
                .length ==
            0
        ? Center(child: Text("프로젝트 알림이 없습니다."))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Text(
                    Provider.of<NotificationProvider>(context, listen: false)
                        .projectNotificationList[index]
                        .toString()),
              );
            },
            itemCount: Provider.of<NotificationProvider>(context, listen: false)
                .projectNotificationList
                .length,
          );
  }
}
