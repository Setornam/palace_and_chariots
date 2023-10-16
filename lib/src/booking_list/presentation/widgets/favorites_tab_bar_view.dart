import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

import '../../../rentals/presentation/widgets/accommodation_details_.dart';
import 'empty_favorites.dart';

class FavoritesTabBarView extends StatefulWidget {
  const FavoritesTabBarView({super.key});

  @override
  State<FavoritesTabBarView> createState() => _FavoritesTabBarViewState();
}

class _FavoritesTabBarViewState extends State<FavoritesTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('wishlist')
            .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return SizedBox(
              height: 300,
              child: documents.isEmpty
                  ? EmptyFavorite()
                  : ListView(
                      children: documents
                          .map((doc) => Column(
                                children: [
                                  doc['service'] == 'vehicle-rentals'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            doc['image']
                                                                .toString()))),
                                                child: const Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Icon(
                                                      size: 18,
                                                      Icons.favorite_outline,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 80,
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(8),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                      color: Color(0xffe7e7f4)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              doc['name'],
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              doc['color'],
                                                              style: const TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'GHS ${doc['price']}',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15,
                                                                        color: lightColorScheme
                                                                            .primary),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),
                                  doc['service'] == 'accommodation-rentals'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const AccommodationDetailsPage()));
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Hotel Reservation',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .apply(
                                                                fontWeightDelta:
                                                                    2,
                                                                color:
                                                                    lightColorScheme
                                                                        .primary),
                                                      ),
                                                      Text(
                                                        doc['order_date'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .apply(
                                                                color: Colors
                                                                    .grey),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 120,
                                                      width: 80,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          7)),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'assets/images/hotel.png'))),
                                                      child: const Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Icon(
                                                            size: 18,
                                                            Icons
                                                                .favorite_outline,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 120,
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        7),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        7)),
                                                            color: Color(
                                                                0xffe7e7f4)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    doc['name'],
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black87),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                    ' ${doc['accommodation_distance']} away | ',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                  const Icon(
                                                                    Icons.star,
                                                                    size: 18,
                                                                    color: Color(
                                                                        0xfff8c123),
                                                                  ),
                                                                  Text(
                                                                    doc['rating'],
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                  Text(
                                                                    ' | ${doc['review']} reviews',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    doc['room_type'],
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      '${doc['price']} USD',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyMedium!
                                                                          .copyWith(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                lightColorScheme.primary,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          )),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                      'Include taxes',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyMedium!
                                                                          .copyWith(
                                                                            fontSize:
                                                                                14,
                                                                          )),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .check,
                                                                        size:
                                                                            14,
                                                                        color: lightColorScheme
                                                                            .primary,
                                                                      ),
                                                                      Text(
                                                                          ' Free cancellation',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyMedium!
                                                                              .copyWith(
                                                                                fontSize: 14,
                                                                                color: lightColorScheme.primary,
                                                                              )),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  doc['service'] == 'event-rentals'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const AccommodationDetailsPage()));
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Event Rentals',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .apply(
                                                                fontWeightDelta:
                                                                    2,
                                                                color:
                                                                    lightColorScheme
                                                                        .primary),
                                                      ),
                                                      Text(
                                                        doc['order_date'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .apply(
                                                                color: Colors
                                                                    .grey),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 120,
                                                      width: 80,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          7)),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'assets/images/event_space.png'))),
                                                      child: const Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Icon(
                                                            size: 18,
                                                            Icons
                                                                .favorite_outline,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 120,
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        7),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        7)),
                                                            color: Color(
                                                                0xffe7e7f4)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    doc['name'],
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black87),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.star,
                                                                    size: 18,
                                                                    color: Color(
                                                                        0xfff8c123),
                                                                  ),
                                                                  Text(
                                                                    doc['rating'],
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                  Text(
                                                                    ' | ${doc['review']} reviews',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  )
                                                                ],
                                                              ),

                                                              // Row(
                                                              //   children: [
                                                              //     Text(
                                                              //         '${doc['price']} USD',
                                                              //         style: Theme.of(
                                                              //                 context)
                                                              //             .textTheme
                                                              //             .bodyMedium!
                                                              //             .copyWith(
                                                              //               fontSize:
                                                              //                   18,
                                                              //               color: lightColorScheme
                                                              //                   .primary,
                                                              //               fontWeight:
                                                              //                   FontWeight.bold,
                                                              //             )),
                                                              //   ],
                                                              // ),
                                                              // Row(
                                                              //   mainAxisAlignment:
                                                              //       MainAxisAlignment
                                                              //           .spaceBetween,
                                                              //   children: [
                                                              //     Text(
                                                              //         'Include taxes',
                                                              //         style: Theme.of(
                                                              //                 context)
                                                              //             .textTheme
                                                              //             .bodyMedium!
                                                              //             .copyWith(
                                                              //               fontSize:
                                                              //                   14,
                                                              //             )),
                                                              //     Row(
                                                              //       children: [
                                                              //         Icon(
                                                              //           Icons.check,
                                                              //           size: 14,
                                                              //           color: lightColorScheme
                                                              //               .primary,
                                                              //         ),
                                                              //         Text(
                                                              //             ' Free cancellation',
                                                              //             style: Theme.of(
                                                              //                     context)
                                                              //                 .textTheme
                                                              //                 .bodyMedium!
                                                              //                 .copyWith(
                                                              //                   fontSize:
                                                              //                       14,
                                                              //                   color:
                                                              //                       lightColorScheme.primary,
                                                              //                 )),
                                                              //       ],
                                                              //     ),
                                                              //   ],
                                                              // ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  doc['service'] == 'tourism'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const AccommodationDetailsPage()));
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Tourism Reservation',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .apply(
                                                                fontWeightDelta:
                                                                    2,
                                                                color:
                                                                    lightColorScheme
                                                                        .primary),
                                                      ),
                                                      Text(
                                                        doc['order_date'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .apply(
                                                                color: Colors
                                                                    .grey),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 120,
                                                      width: 80,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8)),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'assets/images/capecoast.png'))),
                                                      child: const Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Icon(
                                                            size: 18,
                                                            Icons
                                                                .favorite_outline,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 120,
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8)),
                                                            color: Color(
                                                                0xffe7e7f4)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    doc['name'],
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black87),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .timelapse,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                    ' ${doc['tour_duration']} | ',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                  const Icon(
                                                                    Icons.star,
                                                                    size: 18,
                                                                    color: Color(
                                                                        0xfff8c123),
                                                                  ),
                                                                  Text(
                                                                    doc['rating'],
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                  Text(
                                                                    ' | ${doc['review']} reviews',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  )
                                                                ],
                                                              ),
                                                              const Row(
                                                                children: [
                                                                  // Text(
                                                                  //   'Superior room: 1 bed',
                                                                  //   style: Theme.of(context)
                                                                  //       .textTheme
                                                                  //       .bodyMedium,
                                                                  // )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      '${doc['price']} (USD)',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyMedium!
                                                                          .copyWith(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                lightColorScheme.primary,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          )),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                      'Include taxes',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyMedium!
                                                                          .copyWith(
                                                                            fontSize:
                                                                                14,
                                                                          )),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .check,
                                                                        size:
                                                                            14,
                                                                        color: lightColorScheme
                                                                            .primary,
                                                                      ),
                                                                      Text(
                                                                          ' Free cancellation',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyMedium!
                                                                              .copyWith(
                                                                                fontSize: 14,
                                                                                color: lightColorScheme.primary,
                                                                              )),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  doc['service'] == 'travel'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Travel Reservation',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              fontWeightDelta:
                                                                  2,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary),
                                                    ),
                                                    Text(
                                                      doc['order_date'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              color:
                                                                  Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              //depart
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 7),
                                                    child: Text(
                                                        'Depart ${doc['flight_departure_date']}'),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 180,
                                                        child: const Divider(
                                                          height: 2,
                                                        ),
                                                      ),
                                                      const Icon(Icons
                                                          .connecting_airports_outlined),
                                                      const SizedBox(
                                                        width: 108,
                                                        child: Divider(
                                                          height: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          '${doc['flight_departure']} Airport'),
                                                      Text(
                                                          '${doc['flight_return']} Airport')
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(doc[
                                                          'flight_departure']),
                                                      Text(doc['flight_return'])
                                                    ],
                                                  )
                                                ],
                                              ),

                                              //return
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 7),
                                                      child: Text(
                                                          'Return ${doc['flight_return_date']}'),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 180,
                                                          child: const Divider(
                                                            height: 2,
                                                          ),
                                                        ),
                                                        const Icon(Icons
                                                            .connecting_airports_outlined),
                                                        const SizedBox(
                                                          width: 108,
                                                          child: Divider(
                                                            height: 2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            '${doc['flight_departure']} Airport'),
                                                        Text(
                                                            '${doc['flight_return']} Airport')
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(doc[
                                                            'flight_departure']),
                                                        Text(doc[
                                                            'flight_return'])
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ))
                                      : const SizedBox(),
                                  doc['service'] == 'security'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Security Reservation',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              fontWeightDelta:
                                                                  2,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary),
                                                    ),
                                                    Text(
                                                      doc['order_date'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              color:
                                                                  Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 120,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8)),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                doc['image']))),
                                                    child: const Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          size: 18,
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 120,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          8)),
                                                          color: Color(
                                                              0xffe7e7f4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  doc['name'],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  ' | ${doc['securityAvailableFor']}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyMedium,
                                                                )
                                                              ],
                                                            ),
                                                            const Row(
                                                              children: [
                                                                // Text(
                                                                //   'Superior room: 1 bed',
                                                                //   style: Theme.of(context)
                                                                //       .textTheme
                                                                //       .bodyMedium,
                                                                // )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),

                                  ///sales
                                  doc['service'] == 'car-sales'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Car Sales',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              fontWeightDelta:
                                                                  2,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary),
                                                    ),
                                                    Text(
                                                      doc['order_date'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              color:
                                                                  Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        7),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        7)),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                doc['image']))),
                                                    child: const Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          size: 18,
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 80,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          7)),
                                                          color: Color(
                                                              0xffe7e7f4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  doc['name'],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Color(
                                                                          0xfff8c123),
                                                                    ),
                                                                    Text(
                                                                      doc['rating'],
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyMedium,
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '${doc['color']} ',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 5),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'GHS ${doc['price']}',
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                lightColorScheme.primary),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),

                                  doc['service'] == 'house-sales'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'House Sales',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              fontWeightDelta:
                                                                  2,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary),
                                                    ),
                                                    Text(
                                                      doc['order_date'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              color:
                                                                  Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 115,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        7),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        7)),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                doc['image']))),
                                                    child: const Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          size: 18,
                                                          Icons
                                                              .favorite_outline,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 115,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          8)),
                                                          color: Color(
                                                              0xffe7e7f4)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  doc['name'],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  size: 18,
                                                                ),
                                                                Text(
                                                                  doc['house_location'],
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyMedium,
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          5),
                                                              child: Text(
                                                                ' GHS ${doc['price']}',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyLarge!
                                                                    .copyWith(
                                                                        color: lightColorScheme
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${doc['house_condition']} | ${doc['number_of_bathrooms']} | ${doc['number_of_bedrooms']}',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ))
                          .toList()),
            );
          } else {
            if (snapshot.hasError) {
              return const Center(child: Text('Error Loading Favorites'));
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
