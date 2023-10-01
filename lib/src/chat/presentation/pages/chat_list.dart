import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/chat/presentation/pages/chat_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  String formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    return timeago.format(now.subtract(difference),
        locale:
            'en_short'); // 'en_short' for English, adjust for your desired locale
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('chats')
          .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return SizedBox(
              height: 300,
              child: ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime chatTime =
                        documents[index]['chat_start_time'].toDate();

                    return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Chat(
                                    color: documents[index]['color'],
                                    id: documents[index]['id'],
                                    image: documents[index]['image'],
                                    name: documents[index]['name'],
                                    price: documents[index]['price'],
                                    rating: documents[index]['rating'],
                                  ))),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(documents[index]['image']),
                      ),
                      title: Text(
                        documents[index]['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${formatTimeAgo(chatTime)} ago'),
                    );
                  }));
        } else {
          if (snapshot.hasError) {
            return const Text('Error');
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
