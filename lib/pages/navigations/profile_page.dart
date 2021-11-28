import 'package:canyoujoinus/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _logout() async {
      await Provider.of<AuthProvider>(context, listen: false).logout();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "프로필",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: FlatButton(child: Text("로그아웃"), onPressed: () {
          _logout();
        }),
      ),
    );
  }
}
