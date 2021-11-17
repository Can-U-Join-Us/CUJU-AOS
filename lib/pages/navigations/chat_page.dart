import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("채팅"),
      ),
      body: Center(
        child: Text("채팅 페이지"),
      ),
    );
  }
}
