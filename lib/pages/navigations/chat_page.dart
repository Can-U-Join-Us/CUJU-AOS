import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../chat/entrance_page/entrance_page.dart';
import '../../chat/entrance_page/local_utils/EntranceProvider.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider;


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create : (context) => EntranceProvider(), child: EntrancePage());
  }
}
