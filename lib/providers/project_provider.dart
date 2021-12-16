import 'package:canyoujoinus/models/project.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  Future<void> addProject() async {}

  // 4. 프로젝트 모집 게시글 삭제 메소드
  Future<void> deleteProject() async {}
}
