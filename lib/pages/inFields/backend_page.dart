import 'package:canyoujoinus/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackendPage extends StatelessWidget {

  static const routeName = "/backend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "백엔드",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
