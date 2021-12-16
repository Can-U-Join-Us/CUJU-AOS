import 'package:flutter/material.dart';

class FavoriteCategoryPage extends StatefulWidget {
  static const routeName = "/favoriteCategory";

  @override
  _FavoriteCategoryPageState createState() => _FavoriteCategoryPageState();
}

class _FavoriteCategoryPageState extends State<FavoriteCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "관심 키워드 설정",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(),
    );
  }
}
