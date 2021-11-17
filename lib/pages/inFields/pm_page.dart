import 'package:flutter/material.dart';

class PmPage extends StatefulWidget {
  static const routeName = "/pm";

  @override
  _PmPageState createState() => _PmPageState();
}

class _PmPageState extends State<PmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text("PM"),
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
