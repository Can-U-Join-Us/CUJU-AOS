import 'dart:convert';

import 'package:canyoujoinus/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationProvider with ChangeNotifier {
  List<Notification> notificationList = [];
  List<Notification> systemNotificationList = [];
  List<Notification> projectNotificationList = [];

  Future<void> fetchAndSetNotification() async {
    final url = Uri.parse("http://192.168.0.7:4000/api/Refresh");
    final uid = await FlutterSecureStorage().read(key: 'auth');

    try {
      final response = await http.get(
        url,
        headers : {
          'uid' : uid!
        }
      );
      if (response.statusCode == 200) {
        final extractedData = jsonEncode(response.body);
        print(extractedData);
        notifyListeners();
      } else {
        throw Error;
      }
    } catch (error) {
      throw error;
    }
  }

  void fetchSystemNotification() {

  }

  void fetchContestNotification() {

  }
}