import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/gallery_page.dart';

import '../../../checkout/presentation/pages/sales_checkout_page.dart';
import '../../accommodation/domain/entities/house.dart';
import 'accomoodation_sales_gallery_page.dart';

class SalesDetailsPageAccommodation extends StatefulWidget {
  final House accommodation;
  const SalesDetailsPageAccommodation({super.key, required this.accommodation});

  @override
  State<SalesDetailsPageAccommodation> createState() =>
      _SalesDetailsPageAccommodationState();
}

class _SalesDetailsPageAccommodationState
    extends State<SalesDetailsPageAccommodation> {
  final messageEditingController = TextEditingController();
  String userName = '';

  String generateRandomId(int length) {
    final random = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ));
  }

  // getuserName() {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   String? email = _auth.currentUser!.email;
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .where('email_address', isEqualTo: email)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       setState(() {
  //         userName = '${doc['first_name']}';
  //       });
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getuserName();
  //   print(userName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          widget.accommodation.name,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: lightColorScheme.primary),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black87,
              ))
        ],
      ),
      body: FutureBuilder(
       
        future: FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return SizedBox(
              child: ListView(
                  children: documents
                      .map((doc) => Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(widget
                                                      .accommodation
                                                      .images
                                                      .first))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 80,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.48,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(7)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            widget.accommodation
                                                                .images[1]))),
                                              ),
                                              Container(
                                                height: 80,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.43,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(7)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            widget.accommodation
                                                                .images[2]))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  GalleryPage(
                                                                    images: widget
                                                                        .accommodation
                                                                        .images,
                                                                  )));
                                                    },
                                                    child: Container(
                                                      color: Colors.black
                                                          .withOpacity(.5),
                                                      child: Center(
                                                        child: Text(
                                                          '+ ${widget.accommodation.images.length.toString()}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 30),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    widget.accommodation.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.black87),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .bed_outlined,
                                                              color: Colors
                                                                  .black87,
                                                              size: 20,
                                                            ),
                                                            Text(
                                                              widget.accommodation
                                                                      .amenities[
                                                                  'bed']!,
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .bathtub_outlined,
                                                                color: Colors
                                                                    .black54,
                                                                size: 20,
                                                              ),
                                                              Text(
                                                                widget.accommodation
                                                                        .amenities[
                                                                    'bath']!,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .black87),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .local_parking_rounded,
                                                              color: Colors
                                                                  .black54,
                                                              size: 20,
                                                            ),
                                                            Text(
                                                              widget.accommodation
                                                                      .amenities[
                                                                  'parking']!,
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Container(
                                                        color: Colors.black12,
                                                        width: 2,
                                                        height: 300,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5),
                                                                  child: Text(
                                                                    'Condition',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  widget
                                                                      .accommodation
                                                                      .condition,
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 65),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                            5),
                                                                    child: Text(
                                                                      'Property size',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    widget
                                                                        .accommodation
                                                                        .propertySize,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                            width: 180,
                                                            child:
                                                                const Divider()),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5),
                                                                  child: Text(
                                                                    'Furnishing',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  widget
                                                                      .accommodation
                                                                      .furnishing,
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 40),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                            5),
                                                                    child: Text(
                                                                      'Out house',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    widget
                                                                        .accommodation
                                                                        .outHouse,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                            width: 180,
                                                            child:
                                                                const Divider()),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            5),
                                                                child: Text(
                                                                  'Facilities',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 200,
                                                                child: Wrap(
                                                                  children: [
                                                                    ...List.generate(
                                                                        widget
                                                                            .accommodation
                                                                            .facilities
                                                                            .length,
                                                                        (index) => Text(widget
                                                                            .accommodation
                                                                            .facilities[index]))
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 180,
                                                            child:
                                                                const Divider()),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.40,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.green,
                                                          minimumSize: const Size
                                                              .fromHeight(50),
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Request call back')),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.40,
                                                    child: ElevatedButton.icon(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.green,
                                                          minimumSize: const Size
                                                              .fromHeight(50),
                                                        ),
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                              constraints: BoxConstraints
                                                                  .tightFor(
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      height:
                                                                          200),
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Stack(
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                            child:
                                                                                Text(
                                                                              'Chat box',
                                                                              style: TextStyle(color: lightColorScheme.primary, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 20),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: messageEditingController,
                                                                              maxLines: 4,
                                                                              decoration: const InputDecoration(
                                                                                labelText: 'Type Message here',
                                                                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                                                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                                                                labelStyle: TextStyle(color: Colors.grey),
                                                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue), borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                fillColor: Colors.white,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Positioned(
                                                                        bottom:
                                                                            0,
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width,
                                                                          child: ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                backgroundColor: Colors.green,
                                                                                minimumSize: const Size.fromHeight(50),
                                                                              ),
                                                                              onPressed: () {
                                                                                ///initiate a new chat session
                                                                                ///
                                                                                String randomId = generateRandomId(10);

                                                                                final _auth = FirebaseAuth.instance;
                                                                                final _getEmail = _auth.currentUser!.email;
                                                                                CollectionReference chats = FirebaseFirestore.instance.collection('chats').doc(randomId).collection('chats');

                                                                                FirebaseFirestore.instance.collection('chats').doc(randomId).set({
                                                                                  'id': randomId,
                                                                                  'chat_start_time': DateTime.now(),
                                                                                  'image': widget.accommodation.images.first,
                                                                                  'name': widget.accommodation.name,
                                                                                  'rating': widget.accommodation.rating,
                                                                                  'color': '',
                                                                                  'price': widget.accommodation.price,
                                                                                  'user_id': FirebaseAuth.instance.currentUser!.uid,
                                                                                  'user_email': _getEmail,
                                                                                  'user_name': '${doc['first_name']} ${doc['last_name']}'
                                                                                });

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

                                                                                // Navigator.push(
                                                                                //     context,
                                                                                //     MaterialPageRoute(
                                                                                //         builder: (BuildContext
                                                                                //                 context) =>
                                                                                //             const SalesCheckoutPage()));
                                                                              },
                                                                              child: const Text('Send')),
                                                                        ),
                                                                      )
                                                                    ]);
                                                              });
                                                        },
                                                        icon: const Icon(
                                                            Icons.message),
                                                        label: const Text(
                                                            'Start Chat')),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                      .toList()),
            );
          } else {
            if (snapshot.hasError) {
              return Text('Error');
            }
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
