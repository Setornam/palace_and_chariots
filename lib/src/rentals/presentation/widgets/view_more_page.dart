import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/vehicle_details_page.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../vehicle/domain/entities/vehicle.dart';

class ViewMorePage extends StatefulWidget {
  final List<Vehicle>? saloonCars, buses, privateJets;
  ViewMorePage({super.key, this.saloonCars, this.buses, this.privateJets});

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
  ValueNotifier<bool> isSortByPopularityChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowerPriceChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByHighestRatingChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowestRatingChecked = ValueNotifier(false);
  List<Vehicle> sortedSaloonCars = [];

  ///sorting functions
  sortByPopularity() {
    List<Vehicle>? listToSort = widget.saloonCars;
    listToSort!.sort((a, b) =>
        (double.parse(a.popularity)).compareTo(double.parse(b.popularity)));
    print(listToSort.map((e) => (e.name)));
  }

  sortByPrice() {
    List<Vehicle>? listToSort = widget.saloonCars;
    listToSort!.sort(
        (a, b) => (double.parse(a.price)).compareTo(double.parse(b.price)));
    print(listToSort.map((e) => (e.name)));
  }

  sortByHighestRating() {
    List<Vehicle>? listToSort = widget.saloonCars;
    listToSort!.sort(
        (a, b) => (double.parse(b.rating)).compareTo(double.parse(a.rating)));
    print(listToSort.map((e) => (e.name)));
  }

  sortByLowestRating() {
    List<Vehicle>? listToSort = widget.saloonCars;
    listToSort!.sort(
        (a, b) => (double.parse(b.rating)).compareTo(double.parse(a.rating)));

    if (isSortByLowestRatingChecked.value == true) {
      setState(() {
        sortedSaloonCars = listToSort;
      });
    } else {
      if (isSortByLowestRatingChecked.value == false) {
        setState(() {
          sortedSaloonCars = widget.saloonCars!;
        });
      }
    }

    print(listToSort.map((e) => (e.name)));
  }

  @override
  void initState() {
    super.initState();
    sortedSaloonCars = widget.saloonCars!;
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
                                  const BoxConstraints.tightFor(height: 250),
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
                                                      onChanged: (checked) {
                                                        sortByLowestRating();
                                                        isSortByLowestRatingChecked
                                                                .value =
                                                            !isSortByLowestRatingChecked
                                                                .value;
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
        body: widget.saloonCars?.first.category == "saloon"
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                // child: isSortByLowestRatingChecked.value == false
                //     ? GridView.builder(
                //         itemCount: widget.saloonCars!.length,
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
                //                           VehicleDetailsPage(
                //                             color:
                //                                 widget.saloonCars![index].color,
                //                             name:
                //                                 widget.saloonCars![index].name,
                //                             luggage: widget
                //                                 .saloonCars![index].luggage,
                //                             numberOfSeats:
                //                                 widget.saloonCars![index].seats,
                //                             price:
                //                                 widget.saloonCars![index].price,
                //                             rating: widget
                //                                 .saloonCars![index].rating,
                //                             images: [],
                //                             otherFeatures: [],
                //                             transmission: widget
                //                                 .saloonCars![index]
                //                                 .transmission,
                //                             category: widget
                //                                 .saloonCars![index].category,
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
                //                                 widget.saloonCars![index].name,
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
                //                                       widget.saloonCars![index]
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
                //                                   '${widget.saloonCars![index].color} |',
                //                                   style: TextStyle(
                //                                       fontSize: 13,
                //                                       color: Colors.black87),
                //                                 ),
                //                                 Text(
                //                                   widget.saloonCars![index]
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
                //                                       'GHS ${widget.saloonCars![index].price}',
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
                    itemCount: sortedSaloonCars.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            mainAxisExtent: 180),
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      VehicleDetailsPage(
                                        color: sortedSaloonCars[index].color,
                                        name: sortedSaloonCars[index].name,
                                        luggage:
                                            sortedSaloonCars[index].luggage,
                                        numberOfSeats:
                                            sortedSaloonCars[index].seats,
                                        price: sortedSaloonCars[index].price,
                                        rating: sortedSaloonCars[index].rating,
                                        images: [],
                                        otherFeatures: [],
                                        transmission: widget
                                            .saloonCars![index].transmission,
                                        category:
                                            sortedSaloonCars[index].category,
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
                              child: const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
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
                                            sortedSaloonCars[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black87),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Color(0xfff8c123),
                                                ),
                                                Text(
                                                  sortedSaloonCars[index]
                                                      .rating,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${sortedSaloonCars[index].color} |',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              sortedSaloonCars[index]
                                                      .availability
                                                  ? " Available"
                                                  : " Unavailable",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color:
                                                      lightColorScheme.primary),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'GHS ${sortedSaloonCars[index].price}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: lightColorScheme
                                                          .primary),
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
                    }))
            : widget.buses?.first.category == "bus"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        itemCount: widget.buses!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            color: widget.buses![index].color,
                                            name: widget.buses![index].name,
                                            luggage:
                                                widget.buses![index].luggage,
                                            numberOfSeats:
                                                widget.buses![index].seats,
                                            price: widget.buses![index].price,
                                            rating: widget.buses![index].rating,
                                            images: [],
                                            otherFeatures: [],
                                            transmission: widget
                                                .buses![index].transmission,
                                            category:
                                                widget.buses![index].category,
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
                                  child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
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
                                                widget.buses![index].name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.black87),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 18,
                                                      color: Color(0xfff8c123),
                                                    ),
                                                    Text(
                                                      widget
                                                          .buses![index].rating,
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${widget.buses![index].color} |',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black87),
                                                ),
                                                Text(
                                                  widget.buses![index]
                                                          .availability
                                                      ? " Available"
                                                      : " Unavailable",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: lightColorScheme
                                                          .primary),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'GHS ${widget.buses![index].price}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          color:
                                                              lightColorScheme
                                                                  .primary),
                                                    ),
                                                    const Text(
                                                      ' |  Per day',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black87),
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
                  )
                : widget.privateJets?.first.category == "private jet"
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            itemCount: widget.privateJets!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                                color: widget
                                                    .privateJets![index].color,
                                                name: widget
                                                    .privateJets![index].name,
                                                luggage: widget
                                                    .privateJets![index]
                                                    .luggage,
                                                numberOfSeats: widget
                                                    .privateJets![index].seats,
                                                price: widget
                                                    .privateJets![index].price,
                                                rating: widget
                                                    .privateJets![index].rating,
                                                images: [],
                                                otherFeatures: [],
                                                transmission: widget
                                                    .privateJets![index]
                                                    .transmission,
                                                category: widget
                                                    .privateJets![index]
                                                    .category,
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
                                      child: const Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    widget.privateJets![index]
                                                        .name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        color: Colors.black87),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.star,
                                                          size: 18,
                                                          color:
                                                              Color(0xfff8c123),
                                                        ),
                                                        Text(
                                                          widget
                                                              .privateJets![
                                                                  index]
                                                              .rating,
                                                          style:
                                                              Theme.of(context)
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
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '${widget.privateJets![index].color} |',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                    Text(
                                                      widget.privateJets![index]
                                                              .availability
                                                          ? " Available"
                                                          : " Unavailable",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              lightColorScheme
                                                                  .primary),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'GHS ${widget.privateJets![index].price}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary),
                                                        ),
                                                        const Text(
                                                          ' |  Per day',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black87),
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
                      )
                    : Container());
  }
}
