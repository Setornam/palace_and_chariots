import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/notifications/presentation/widgets/empty_notification.dart';

import '../../../../shared/theme/color_scheme.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
            'Notifications',
            style: TextStyle(color: lightColorScheme.primary),
          ),
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('notifications').get(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;

              return ListView(
                children: documents
                    .map((doc) => SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: documents.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 17),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(8)),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      doc['image']))),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 80,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8)),
                                                color: Color(0xffe7e7f4)),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: ListTile(
                                                  tileColor: lightColorScheme
                                                      .primary
                                                      .withOpacity(0.2),
                                                  title: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Text(
                                                      doc['title'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  subtitle: Text(doc['body']),
                                                  trailing: const Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom: 40,
                                                    ),
                                                    child: Text('3h ago'),
                                                  ),
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                        ))
                    .toList(),
              );
            } else {
              if (snapshot.hasError) {
                return const Text('Error');
              }
            }

            return const Center(child: CircularProgressIndicator());
          },
        )

        //  EmptyNotificationWidget()

        );
  }
}
