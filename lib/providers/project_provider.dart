import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:canyoujoinus/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class ProjectProvider with ChangeNotifier {
  List<Project> projectItems = [];

  List<Project> get items {
    return [...projectItems];
  }

  int get itemCount {
    return projectItems.length;
  }

  // 1. 전체 프로젝트 가져오는 메소드
  Future<void> fetchAndSetProject() async {
    final url = Uri.parse('http://192.168.0.7:4000/api/Projects');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final extractedData = data['projects'];
        List<Project> loadedData = [];
        for (int i = 0; i < extractedData.length; i++) {
          loadedData.add(
            Project(
              id: extractedData[i]['uid'],
              pid : extractedData[i]['pid'],
              title: extractedData[i]['title'],
              description: extractedData[i]['desc'],
              imageUrl: extractedData[i]['path'],
              count: extractedData[i]['total'],
              term: extractedData[i]['term'],
              due: DateFormat('yyyy-MM-dd').format(
                DateTime.parse(extractedData[i]['due']),
              ),
            ),
          );
        }
        projectItems = loadedData;
        notifyListeners();
      } else {
        throw Error;
      }
    } catch (error) {
      throw error;
    }
  }

  // 2. 카테고리별 프로젝트 가져오는 메소드
  Future<void> fetchAndSetProjectByCategory(String category) async {
    final url = Uri.parse('http://192.168.0.7:4000/api/Category');

    try {
      final response = await http.get(url, headers: {"category": category});
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List<dynamic>;
        List<Project> loadedData = [];
        for (int i = 0; i < extractedData.length; i++) {
          loadedData.add(
            Project(
              id: extractedData[i]['id'],
              pid: extractedData[i]['pid'],
              title: extractedData[i]['title'],
              description: extractedData[i]['description'],
              imageUrl: extractedData[i]['imageUrl'],
              count: extractedData[i]['count'],
              term: extractedData[i]['term'],
              due: DateFormat('yyyy-MM-dd').format(
                DateTime.parse(extractedData[i]['due']),
              ),
            ),
          );
        }
        projectItems = loadedData;
        notifyListeners();
      } else {
        throw Error;
      }
    } catch (error) {
      throw error;
    }
  }

  // 3. 프로젝트 모집 게시글 등록 메소드
  Future<void> addProject(PickedFile projectImage, String title, String content, int total, String due, int term) async {
    final stream = http.ByteStream(DelegatingStream.typed(projectImage.openRead()));
    var uid = await FlutterSecureStorage().read(key: "auth");

    // final url = Uri.parse('http://192.168.0.7:4000/api/Projects/add');
    // final imageUrl = Uri.parse('http://192.168.0.7:4000/api/${projectImage.path}');
    //
    // // try {
    // //   final response = await http.post(url, body : {
    // //     'uid' : uid,
    // //     'title' : title,
    // //     'desc' : content,
    // //     'total' : total,
    // //     'due' : DateTime.parse(due),
    // //     'term' : term,
    // //   })
    //
    // final response = await http.post(imageUrl);
    // print(response.statusCode);

    // http의 MultipartFile을 사용하기 위해 파일의 크기를 알아낸다.
    final length = File(projectImage.path).lengthSync();

    final url = 'http://192.168.0.7:4000/api/Projects/add';
    final request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );
    print(projectImage.path);
    final multipartFileSign = new http.MultipartFile('content', stream, length, filename: basename("/test1"));
    request.files.add(multipartFileSign);
    Map<String, dynamic> requestBody = new Map<String, dynamic>();
    requestBody['uid'] = int.parse("1");
    requestBody['title'] = title;
    requestBody['desc'] = content;
    requestBody['total'] = total;
    requestBody['due'] = due;
    requestBody['term'] = term;
    print(request);
    print(requestBody);
    print(request.files);

    // request를 전송한다.
    final response = await request.send();

    // 응답코드가 201이 아니면 오류.
    if (response.statusCode != 200) {
      return;
    } else {
    }
  }

  // 4. 프로젝트 모집 게시글 삭제 메소드
  Future<void> deleteProject() async {}

  Future<void> participateProject() async {
    var uid = await FlutterSecureStorage().read(key: "auth");
    final url = Uri.parse('http://192.168.0.7:4000/api/Projects/');
  }
}
