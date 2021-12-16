import '../chatting_page/chatting_page.dart';
import '../chatting_page/local_utils/ChattingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EntrancePage extends StatefulWidget{
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
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: _controller,
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '닉네임 입력',
                          hintStyle: TextStyle(color: Colors.grey[400]))),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async{
                    var u = Uuid().v1();
                    Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=> ChangeNotifierProvider
                              (create : (context) => ChattingProvider(u, _controller.text),
                                child: ChattingPage())));

                  },
                  child: Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.blue)),
                      child: Text('방 입장하기')
                  ),
                ),
              ],
            )
        )
    );
  }
}