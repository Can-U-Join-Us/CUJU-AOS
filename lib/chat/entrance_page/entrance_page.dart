import 'package:canyoujoinus/providers/auth_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../chatting_page/chatting_page.dart';
import '../chatting_page/local_utils/ChattingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EntrancePage extends StatefulWidget {
  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "채팅",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("k906506@naver.com"),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                var u = Uuid().v1();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (context) =>
                            ChattingProvider(u, "k906506@naver.com"),
                        child: ChattingPage())));
              },
              child: Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: Text('방 입장하기')),
            ),
          ],
        )));
  }
}
