import 'package:flutter/material.dart';

class OtherInfoPage extends StatefulWidget {
  static const routeName = "/other-info";

  @override
  _OtherInfoPageState createState() => _OtherInfoPageState();
}

class _OtherInfoPageState extends State<OtherInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "상대방 프로필 정보",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text("등록된 정보가 없습니다."),
      ),
    );
  }
}
