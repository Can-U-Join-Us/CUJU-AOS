import 'dart:io';
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
  List<Project> selectItems = [];

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
        print(extractedData);
        for (int i = 0; i < extractedData.length; i++) {
          loadedData.add(
            Project(
              id: extractedData[i]['uid'],
              pid: extractedData[i]['pid'],
              title: extractedData[i]['title'],
              description: extractedData[i]['desc'],
              imageUrl: extractedData[i]['path'],
              count: extractedData[i]['total'],
              term: extractedData[i]['term'],
              due: DateFormat('yyyy-MM-dd').format(
                DateTime.parse(extractedData[i]['due']),
              ),
              aos: 0,
              ios: 0,
              fe: 0,
              be: 0,
              devops: 0,
              design: 0,
              pm: 0,
              etc: 0,
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
    final url = Uri.parse('http://192.168.0.7:4000/api/Projects/category');
    try {
      final response = await http.get(url, headers: {"category": category});
      if (response.statusCode == 200) {
        final Data = json.decode(response.body);
        final extractedData = Data['projects'];
        List<Project> loadedData = [];
        print(extractedData);
        for (int i = 0; i < extractedData.length; i++) {
          loadedData.add(
            Project(
              id: extractedData[i]['uid'],
              pid: extractedData[i]['pid'],
              title: extractedData[i]['title'],
              description: extractedData[i]['desc'],
              imageUrl: extractedData[i]['path'],
              count: extractedData[i]['total'],
              term: extractedData[i]['term'],
              due: DateFormat('yyyy-MM-dd').format(
                DateTime.parse(extractedData[i]['due']),
              ),
              aos: 0,
              ios: 0,
              fe: 0,
              be: 0,
              devops: 0,
              design: 0,
              pm: 0,
              etc: 0,
            ),
          );
        }
        selectItems = loadedData;
        notifyListeners();
      } else {
        throw Error;
      }
    } catch (error) {
      throw error;
    }
  }

  // 3. 프로젝트 모집 게시글 등록 메소드
  Future<void> addProject(PickedFile projectImage, String title, String content,
      int total, String due, int term, int aos, int ios, int fe, int be, int devops, int desiger, int pm, int etc) async {
    final stream =
        http.ByteStream(DelegatingStream.typed(projectImage.openRead()));
    var uid = await FlutterSecureStorage().read(key: "auth");

    // http의 MultipartFile을 사용하기 위해 파일의 크기를 알아낸다.
    final length = File(projectImage.path).lengthSync();

    final url = 'http://192.168.0.7:4000/api/Projects/add';
    final request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );

    request.files
        .add(await http.MultipartFile.fromPath('hello', projectImage.path));
    request.fields['uid'] = uid!;
    request.fields['title'] = title;
    request.fields['desc'] = content;
    request.fields['total'] = total.toString();
    request.fields['due'] = due;
    request.fields['term'] = term.toString();
    request.fields['aos'] = aos.toString();
    request.fields['ios'] = ios.toString();
    request.fields['fe'] = fe.toString();
    request.fields['be'] = be.toString();
    request.fields['devops'] = devops.toString();
    request.fields['designer'] = desiger.toString();
    request.fields['pm'] = pm.toString();
    request.fields['etc'] = etc.toString();
    ;

    // request를 전송한다.
    final response = await request.send();

    // 응답코드가 201이 아니면 오류.
    if (response.statusCode == 200) {
      return;
    } else {}
  }

  Future<void> detailProject(int pid) async {
    final url = Uri.parse('http://192.168.0.7:4000/api/Projects');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        print(data);
        final extractedData = data['projects'];
        List<Project> loadedData = [];
        for (int i = 0; i < extractedData.length; i++) {
          loadedData.add(
            Project(
              id: extractedData[i]['uid'],
              pid: extractedData[i]['pid'],
              title: extractedData[i]['title'],
              description: extractedData[i]['desc'],
              imageUrl: extractedData[i]['path'],
              count: extractedData[i]['total'],
              term: extractedData[i]['term'],
              due: DateFormat('yyyy-MM-dd').format(
                DateTime.parse(extractedData[i]['due']),
              ),
              aos: extractedData[i]['aos'],
              ios: extractedData[i]['ios'],
              fe: extractedData[i]['fe'],
              be: extractedData[i]['be'],
              devops: extractedData[i]['devops'],
              design: extractedData[i]['designer'],
              pm: extractedData[i]['pm'],
              etc: extractedData[i]['etc'],
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
}
