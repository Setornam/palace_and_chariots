import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/chat/presentation/pages/chat_page.dart';
import 'package:palace_and_chariots/src/chat/presentation/widgets/empty_chat.dart';

import '../../../../shared/theme/color_scheme.dart';

class ChatBoxPage extends StatefulWidget {
  const ChatBoxPage({super.key});

  @override
  State<ChatBoxPage> createState() => _ChatBoxPageState();
}

class _ChatBoxPageState extends State<ChatBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ChatBox',
            style: TextStyle(color: lightColorScheme.primary),
          ),
        ),
        body: Chat(chatRoomId: '1'));
  }
}
