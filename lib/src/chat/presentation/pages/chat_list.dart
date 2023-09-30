import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/chat/presentation/pages/chat_page.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Chat(chatRoomId: ''))),
        leading: CircleAvatar(),
        title: Text(
          'Mercedes Benz',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('2 weeks ago'),
      );
    });
  }
}
