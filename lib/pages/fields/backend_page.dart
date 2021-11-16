import 'package:flutter/material.dart';

class BackendPage extends StatelessWidget {

  static const routeName = "/backend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text("백엔드"),
        ),
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
