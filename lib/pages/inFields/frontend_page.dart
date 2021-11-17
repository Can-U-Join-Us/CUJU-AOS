import 'package:flutter/material.dart';

class FrontendPage extends StatelessWidget {
  static const routeName = "/frontend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text("프론트엔드"),
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
