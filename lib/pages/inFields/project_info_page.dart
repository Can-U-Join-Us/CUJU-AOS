import 'package:flutter/material.dart';

class ProjectInfoPage extends StatefulWidget {
  static const routeName = "/project-info";

  const ProjectInfoPage({Key? key}) : super(key: key);

  @override
  _ProjectInfoPageState createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {

  void didChangeDependencies(){

    super.didChangeDependencies();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}
