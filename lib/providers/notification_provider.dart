import 'dart:convert';
import 'package:canyoujoinus/models/keyword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationProvider with ChangeNotifier {
  List<Keyword> notificationList = [];
  List<Keyword> systemNotificationList = [];
  List<Keyword> projectNotificationList = [];

  Future<void> fetchAndSetNotification() async {
    final url = Uri.parse("http://192.168.0.7:4000/api/Refresh");
    final uid = await FlutterSecureStorage().read(key: 'auth');
    List<Keyword> systemData = [];
    List<Keyword> projectData = [];

    try {
      final response = await http.get(url, headers: {'uid': uid!});
      if (response.statusCode == 200) {
        final extractedData = jsonDecode(response.body)['Message'];
        extractedData.forEach((value) {
          if (value['type'] == 0) {
            systemData.add(
              Keyword(
                title: value['subject'],
                content: value['content'],
                uid: value['uid'],
                pid: value['pid'],
              ),
            );
          } else if (value['type'] == 1) {
            projectData.add(
              Keyword(
                title: value['subject'],
                content: value['content'],
                uid: value['uid'],
                pid: value['pid'],
              ),
            );
          } else {}
        });
        systemNotificationList = systemData;
        projectNotificationList = projectData;
        notifyListeners();
      } else {
        throw Error;
      }
    } catch (error) {
      throw error;
    }
  }

  void fetchSystemNotification() {}

  void fetchContestNotification() {}
}
