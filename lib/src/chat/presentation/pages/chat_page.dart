import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

class Chat extends StatefulWidget {
  final String chatId = "";
  final String color, id, image, name, price, rating;

  Chat({
    required this.color,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late String chatId;
  final String chatID = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    chatId = widget.id;
  }

  // Stream<QuerySnapshot> chats =
  TextEditingController messageEditingController = TextEditingController();

  Widget chatMessages() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(widget.id)
          .collection('chats')
          .orderBy('created-at')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Error occurred");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        final data = snapshot.requireData;

        return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return MessageTile(
                message: data.docs[index]['message'],
                sender: data.docs[index]['sendBy'],
              );
            });
      },
    );
  }

  addMessage() {
    final _auth = FirebaseAuth.instance;
    final _getEmail = _auth.currentUser!.email;
    CollectionReference chats = FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.id)
        .collection('chats');

    print(_getEmail);

    if (messageEditingController.text.isNotEmpty) {
      chats
          .add({
            'message': messageEditingController.text,
            'sendBy': _getEmail,
            'created-at': Timestamp.now()
          })
          .then((value) => print("chat added"))
          .catchError((error) => print("Failed to add chat: $error"));

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        automaticallyImplyLeading: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'ChatBox',
          style: TextStyle(color: lightColorScheme.primary),
        ),
      ),
      body: Stack(
        children: [
          


          chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      maxLines: 1,
                      controller: messageEditingController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Type a message here ...",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          border: InputBorder.none),
                    ),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        addMessage();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: lightColorScheme.primary,
                              borderRadius: BorderRadius.circular(40)),
                          padding: EdgeInsets.all(0),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

displayToastMessage(String message, BuildContext context) {
  print('Error');
}

class MessageTile extends StatelessWidget {
  final String message;
  final String sender;

  MessageTile({required this.message, required this.sender});

  String? _getEmail() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    print(firebaseUser!.email);
    return firebaseUser.email;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sender == _getEmail()
          ? EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4)
          : EdgeInsets.only(top: 8, bottom: 8, left: 10),
      alignment:
          sender == _getEmail() ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: 300.0,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sender == _getEmail()
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))
                : const BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23)),
            gradient: sender == _getEmail()
                ? const LinearGradient(
                    colors: [Color(0xffdfe2fa), Color(0xffdfe2fa)],
                  )
                : const LinearGradient(colors: [
                    Color(0xffdfe2fa),
                  ])),
        child: Text(message,
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}
