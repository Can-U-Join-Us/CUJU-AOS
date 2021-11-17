import 'package:flutter/material.dart';

class IosPage extends StatelessWidget {
  static const routeName = "/ios";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text("IOS"),
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
