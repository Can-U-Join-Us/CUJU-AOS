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
        title: Text("프로필 페이지"),
      ),
      body: Center(
        child: FlatButton(child: Text("로그아웃"), onPressed: () {
          _logout();
        }),
      ),
    );
  }
}
