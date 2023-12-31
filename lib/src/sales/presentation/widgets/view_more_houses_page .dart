import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/house_details_page.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../../wishlist/wishlist.dart';
import '../../accommodation/domain/entities/house.dart';

class ViewMoreHouses extends StatefulWidget {
  final List<House> houses;
  const ViewMoreHouses({
    super.key,
    required this.houses,
  });

  @override
  State<ViewMoreHouses> createState() => _ViewMoreHousesState();
}

class _ViewMoreHousesState extends State<ViewMoreHouses> {
  ValueNotifier<bool> isSortByPopularityChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowerPriceChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByHighestRatingChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowestRatingChecked = ValueNotifier(false);
  List<House> sortedhouses = [];

  ///sorting functions
  sortByPopularity() {
    List<House>? listToSort = widget.houses;
    listToSort.sort((a, b) =>
        (double.parse(a.popularity)).compareTo(double.parse(b.popularity)));
    if (isSortByPopularityChecked.value == false) {
      setState(() {
        sortedhouses = listToSort;
      });
    } else {
      if (isSortByPopularityChecked.value == true) {
        setState(() {
          sortedhouses = widget.houses;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByPrice() {
    List<House>? listToSort = widget.houses;
    listToSort.sort(
        (a, b) => (double.parse(a.price)).compareTo(double.parse(b.price)));
    if (isSortByLowerPriceChecked.value == false) {
      setState(() {
        sortedhouses = listToSort;
      });
    } else {
      if (isSortByLowerPriceChecked.value == true) {
        setState(() {
          sortedhouses = widget.houses;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByHighestRating() {
    List<House>? listToSort = widget.houses;
    listToSort.sort(
        (a, b) => (double.parse(b.rating)).compareTo(double.parse(a.rating)));

    if (isSortByHighestRatingChecked.value == false) {
      setState(() {
        sortedhouses = listToSort;
      });
    } else {
      if (isSortByHighestRatingChecked.value == true) {
        setState(() {
          sortedhouses = widget.houses;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByLowestRating() {
    List<House>? listToSort = widget.houses;
    listToSort.sort(
        (a, b) => (double.parse(a.rating)).compareTo(double.parse(b.rating)));

    if (isSortByLowestRatingChecked.value == false) {
      setState(() {
        sortedhouses = listToSort;
      });
    } else {
      if (isSortByLowestRatingChecked.value == true) {
        setState(() {
          sortedhouses = widget.houses;
        });
      }
    }
    // print(isSortByLowestRatingChecked.value.toString());
    print(sortedhouses.map((e) => (e.name)));
  }

  @override
  void initState() {
    super.initState();
    sortedhouses = widget.houses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Column(children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          BackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.black,
                          ),
                          const Text(
                            'Back',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Text(
                          'Sales',
                          style: TextStyle(color: lightColorScheme.primary),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'What are you searching for?',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe7e9f4)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor: Color(0xffe7e9f4),
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              constraints:
                                  const BoxConstraints.tightFor(height: 200),
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              color: Colors.black,
                                              height: 2,
                                              width: 50,
                                            ),
                                          ),
                                          Text(
                                            'Sort by',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    lightColorScheme.primary),
                                          ),

                                          ValueListenableBuilder(
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text('Popularity'),
                                                  Checkbox(
                                                      side: const BorderSide(
                                                        color: Colors.grey,
                                                      ),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value:
                                                          isSortByPopularityChecked
                                                              .value,
                                                      onChanged: (checked) {
                                                        sortByPopularity();
                                                        isSortByPopularityChecked
                                                                .value =
                                                            !isSortByPopularityChecked
                                                                .value;
                                                      }),
                                                ],
                                              );
                                            },
                                            valueListenable:
                                                isSortByPopularityChecked,
                                          ),

                                          //sort by lower price
                                          // ValueListenableBuilder(
                                          //   builder: (BuildContext context,
                                          //       value, Widget? child) {
                                          //     return Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment
                                          //               .spaceBetween,
                                          //       children: [
                                          //         const Text(
                                          //             'Price (lower first)'),
                                          //         Checkbox(
                                          //             side: const BorderSide(
                                          //               color: Colors.grey,
                                          //             ),
                                          //             fillColor:
                                          //                 MaterialStateProperty
                                          //                     .all(
                                          //                         lightColorScheme
                                          //                             .primary),
                                          //             value:
                                          //                 isSortByLowerPriceChecked
                                          //                     .value,
                                          //             onChanged: (checked) {
                                          //               sortByLowestRating();
                                          //               isSortByLowerPriceChecked
                                          //                       .value =
                                          //                   !isSortByLowerPriceChecked
                                          //                       .value;
                                          //             }),
                                          //       ],
                                          //     );
                                          //   },
                                          //   valueListenable:
                                          //       isSortByLowerPriceChecked,
                                          // ),

                                          //sort by highest rating
                                          ValueListenableBuilder(
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                      'Star rating (highest first) '),
                                                  Checkbox(
                                                      side: const BorderSide(
                                                        color: Colors.grey,
                                                      ),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value:
                                                          isSortByHighestRatingChecked
                                                              .value,
                                                      onChanged: (checked) {
                                                        sortByHighestRating();
                                                        isSortByHighestRatingChecked
                                                                .value =
                                                            !isSortByHighestRatingChecked
                                                                .value;
                                                      }),
                                                ],
                                              );
                                            },
                                            valueListenable:
                                                isSortByHighestRatingChecked,
                                          ),

                                          //sort by lowest rating
                                          ValueListenableBuilder(
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                      'Star rating (lowest first)'),
                                                  Checkbox(
                                                      side: const BorderSide(
                                                        color: Colors.grey,
                                                      ),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value:
                                                          isSortByLowestRatingChecked
                                                              .value,
                                                      onChanged:
                                                          (bool? checked) {
                                                        sortByLowestRating();

                                                        isSortByLowestRatingChecked
                                                                .value =
                                                            checked ?? false;
                                                      }),
                                                ],
                                              );
                                            },
                                            valueListenable:
                                                isSortByLowestRatingChecked,
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              color: Colors.black,
                              size: 20,
                            ),
                            const Icon(
                              Icons.arrow_downward,
                              color: Colors.black,
                              size: 20,
                            ),
                            Text(
                              'Sort',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '2 properties',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            // child: isSortByLowestRatingChecked.value == false
            //     ? GridView.builder(
            //         itemCount: widget.houses!.length,
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2,
            //                 crossAxisSpacing: 15,
            //                 mainAxisSpacing: 15,
            //                 mainAxisExtent: 180),
            //         itemBuilder: (BuildContext context, index) {
            //           return GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (BuildContext context) =>
            //                           HouseDetailsPage(
            //                             color:
            //                                 widget.houses![index].color,
            //                             name:
            //                                 widget.houses![index].name,
            //                             luggage: widget
            //                                 .houses![index].luggage,
            //                             numberOfSeats:
            //                                 widget.houses![index].seats,
            //                             price:
            //                                 widget.houses![index].price,
            //                             rating: widget
            //                                 .houses![index].rating,
            //                             images: [],
            //                             otherFeatures: [],
            //                             transmission: widget
            //                                 .houses![index]
            //                                 .transmission,
            //                             category: widget
            //                                 .houses![index].category,
            //                           )));
            //             },
            //             child: Column(
            //               children: [
            //                 Container(
            //                   height: 80,
            //                   decoration: const BoxDecoration(
            //                       borderRadius: BorderRadius.only(
            //                           topLeft: Radius.circular(7),
            //                           topRight: Radius.circular(7)),
            //                       image: DecorationImage(
            //                           fit: BoxFit.cover,
            //                           image: AssetImage(
            //                               'assets/images/benz-front.png'))),
            //                   child: const Align(
            //                     alignment: Alignment.topLeft,
            //                     child: Padding(
            //                       padding: EdgeInsets.all(5.0),
            //                       child: Icon(
            //                         size: 18,
            //                         Icons.favorite_outline,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: Container(
            //                     height: 80,
            //                     decoration: const BoxDecoration(
            //                         borderRadius: BorderRadius.only(
            //                             bottomRight: Radius.circular(7),
            //                             bottomLeft: Radius.circular(7)),
            //                         color: Color(0xffe7e7f4)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Column(
            //                         children: [
            //                           Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             children: [
            //                               Text(
            //                                 widget.houses![index].name,
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.bold,
            //                                     fontSize: 12,
            //                                     color: Colors.black87),
            //                               ),
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     bottom: 10),
            //                                 child: Row(
            //                                   children: [
            //                                     const Icon(
            //                                       Icons.star,
            //                                       size: 18,
            //                                       color: Color(0xfff8c123),
            //                                     ),
            //                                     Text(
            //                                       widget.houses![index]
            //                                           .rating,
            //                                       style: Theme.of(context)
            //                                           .textTheme
            //                                           .bodySmall,
            //                                     )
            //                                   ],
            //                                 ),
            //                               )
            //                             ],
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.symmetric(
            //                                 vertical: 5),
            //                             child: Row(
            //                               children: [
            //                                 Text(
            //                                   '${widget.houses![index].color} |',
            //                                   style: TextStyle(
            //                                       fontSize: 13,
            //                                       color: Colors.black87),
            //                                 ),
            //                                 Text(
            //                                   widget.houses![index]
            //                                           .availability
            //                                       ? " Available"
            //                                       : " Unavailable",
            //                                   style: TextStyle(
            //                                       fontSize: 13,
            //                                       color: lightColorScheme
            //                                           .primary),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                           Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             children: [
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     top: 5),
            //                                 child: Row(
            //                                   children: [
            //                                     Text(
            //                                       'GHS ${widget.houses![index].price}',
            //                                       style: TextStyle(
            //                                           fontWeight:
            //                                               FontWeight.bold,
            //                                           fontSize: 15,
            //                                           color:
            //                                               lightColorScheme
            //                                                   .primary),
            //                                     ),
            //                                     const Text(
            //                                       ' |  Per day',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           color:
            //                                               Colors.black87),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           );
            //         })

            child: GridView.builder(
                itemCount: sortedhouses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 180),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SalesDetailsPageAccommodation(
                                    accommodation: sortedhouses[index],
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(7)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    sortedhouses[index].images.first,
                                  ))),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  ///add to wishlist
                                  ///
                                  ///
                                  DocumentReference docRef = FirebaseFirestore
                                      .instance
                                      .doc('houses/${sortedhouses[index].id}');

                                  if (sortedhouses[index].isFavorite == false) {
                                    await Wishlist.addToWishlist(
                                        sortedhouses[index].id,
                                        sortedhouses[index].name,
                                        FirebaseAuth.instance.currentUser!.uid,
                                        'house-sales',
                                        sortedhouses[index].price,
                                        sortedhouses[index].images.first,
                                        '',
                                        '',
                                        '',
                                        sortedhouses[index].rating,
                                        '',
                                        '',
                                        '',
                                        sortedhouses[index].condition,
                                        sortedhouses[index].location,
                                        sortedhouses[index]
                                            .amenities['bathrooms'],
                                        sortedhouses[index]
                                            .amenities['bedrooms']);

                                    docRef.update({'isFavorite': true});
                                  } else {
                                    await Wishlist.removeFromWishlist(
                                        sortedhouses[index].id);
                                    docRef.update({'isFavorite': false});
                                  }
                                },
                                child: sortedhouses[index].isFavorite == true
                                    ? const Icon(
                                        size: 25,
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        size: 25,
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    bottomLeft: Radius.circular(7)),
                                color: Color(0xffe7e7f4)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          sortedhouses[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'GHS ${sortedhouses[index].price}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color:
                                                      lightColorScheme.primary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: SizedBox(
                                      width: 155,
                                      child: Text(
                                        ' ${sortedhouses[index].condition} | ${sortedhouses[index].amenities['bedrooms']} | ${sortedhouses[index].facilities.first}  ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })));
  }
}
