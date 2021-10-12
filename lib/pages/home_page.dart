import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Container(
              height : MediaQuery.of(context).size.height * 0.3
            ),
            SizedBox(),
            Container(),
            SizedBox(),
            Container(),
          ],
        ),
      ),
    );
  }
}
