import 'package:flutter/material.dart';

class DesignPage extends StatelessWidget {
  static const routeName = "/design";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text("디자인"),
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
