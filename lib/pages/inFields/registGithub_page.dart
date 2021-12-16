import 'package:flutter/material.dart';

class RegistGithubPage extends StatefulWidget {
  static const routeName = "/github";

  @override
  _RegistGithubPageState createState() => _RegistGithubPageState();
}

class _RegistGithubPageState extends State<RegistGithubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "깃허브 연동",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(),
    );
  }
}
