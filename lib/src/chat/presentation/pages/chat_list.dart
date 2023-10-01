import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                      subtitle: Text('2 weeks ago'),
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
