import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/vehicle_details_page.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../../wishlist/wishlist.dart';
import '../../vehicle/domain/entities/vehicle.dart';

class ViewMoreBusesPage extends StatefulWidget {
  final List<Vehicle> buses;
  const ViewMoreBusesPage({super.key, required this.buses});

  @override
  State<ViewMoreBusesPage> createState() => _ViewMoreBusesPageState();
}

class _ViewMoreBusesPageState extends State<ViewMoreBusesPage> {
  ValueNotifier<bool> isSortByPopularityChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowerPriceChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByHighestRatingChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowestRatingChecked = ValueNotifier(false);

  List<Vehicle> sortedBuses = [];

  ///sorting functions
  ///sorting functions
  sortByPopularity() {
    List<Vehicle>? listToSort = widget.buses;
    listToSort.sort((a, b) =>
        (double.parse(a.popularity)).compareTo(double.parse(b.popularity)));
    if (isSortByPopularityChecked.value == false) {
      setState(() {
        sortedBuses = listToSort;
      });
    } else {
      if (isSortByPopularityChecked.value == true) {
        setState(() {
          sortedBuses = widget.buses;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByPrice() {
    List<Vehicle>? listToSort = widget.buses;
    listToSort.sort(
        (a, b) => (double.parse(a.price)).compareTo(double.parse(b.price)));
    if (isSortByLowerPriceChecked.value == false) {
      setState(() {
        sortedBuses = listToSort;
      });
    } else {
      if (isSortByLowerPriceChecked.value == true) {
        setState(() {
          sortedBuses = widget.buses;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByHighestRating() {
    List<Vehicle>? listToSort = widget.buses;
    listToSort.sort(
        (a, b) => (double.parse(b.rating)).compareTo(double.parse(a.rating)));

    if (isSortByHighestRatingChecked.value == false) {
      setState(() {
        sortedBuses = listToSort;
      });
    } else {
      if (isSortByHighestRatingChecked.value == true) {
        setState(() {
          sortedBuses = widget.buses;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByLowestRating() {
    List<Vehicle>? listToSort = widget.buses;
    listToSort.sort(
        (a, b) => (double.parse(a.rating)).compareTo(double.parse(b.rating)));

    if (isSortByLowestRatingChecked.value == false) {
      setState(() {
        sortedBuses = listToSort;
      });
    } else {
      if (isSortByLowestRatingChecked.value == true) {
        setState(() {
          sortedBuses = widget.buses;
        });
      }
    }
    // print(isSortByLowestRatingChecked.value.toString());
    print(sortedBuses.map((e) => (e.name)));
  }

  @override
  void initState() {
    super.initState();
    sortedBuses = widget.buses;
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
                          'Rentals',
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
                                          ValueListenableBuilder(
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                      'Price (lower first)'),
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
                                                          isSortByLowerPriceChecked
                                                              .value,
                                                      onChanged: (checked) {
                                                        sortByPrice();
                                                        isSortByLowerPriceChecked
                                                                .value =
                                                            !isSortByLowerPriceChecked
                                                                .value;
                                                      }),
                                                ],
                                              );
                                            },
                                            valueListenable:
                                                isSortByLowerPriceChecked,
                                          ),

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
                        '15 properties',
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
          child: GridView.builder(
              itemCount: sortedBuses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VehicleDetailsPage(
                                  color: sortedBuses[index].color,
                                  name: sortedBuses[index].name,
                                  luggage: sortedBuses[index].luggage,
                                  numberOfSeats: sortedBuses[index].seats,
                                  price: sortedBuses[index].price,
                                  rating: sortedBuses[index].rating,
                                  images: [],
                                  otherFeatures: [],
                                  transmission: '',
                                  category: sortedBuses[index].category,
                                  id: sortedBuses[index].id,
                                )));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/benz-front.png'))),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: 
                          
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () async {
                                ///add to wishlist
                                ///
                                ///
                                DocumentReference docRef = FirebaseFirestore
                                    .instance
                                    .doc('vehicles/${sortedBuses[index].id}');

                                if (sortedBuses[index].isFavorite == false) {
                                  await Wishlist.addToWishlist(
                                    sortedBuses[index].id,
                                    sortedBuses[index].name,
                                    FirebaseAuth.instance.currentUser!.uid,
                                    'vehicle-rentals',
                                    sortedBuses[index].price,
                                    sortedBuses[index].images.first,
                                    sortedBuses[index].color,
                                    '',
                                    '',
                                    sortedBuses[index].rating,
                                  );

                                  docRef.update({'isFavorite': true});
                                } else {
                                  await Wishlist.removeFromWishlist(
                                      sortedBuses[index].id);
                                  docRef.update({'isFavorite': false});
                                }
                              },
                              child: sortedBuses[index].isFavorite == true
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
                                    Text(
                                      sortedBuses[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black87),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(0xfff8c123),
                                          ),
                                          Text(
                                            sortedBuses[index].rating,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${sortedBuses[index].color} |',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        sortedBuses[index].availability
                                            ? " Available"
                                            : " Unavailable",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: lightColorScheme.primary),
                                      ),
                                    ],
                                  ),
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
                                            'GHS ${sortedBuses[index].price}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color:
                                                    lightColorScheme.primary),
                                          ),
                                          const Text(
                                            ' |  Per day',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87),
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
                );
              }),
        ));
  }
}
