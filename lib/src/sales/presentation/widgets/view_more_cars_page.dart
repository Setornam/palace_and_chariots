import 'package:flutter/material.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../cars/domain/entities/car.dart';
import 'cars_details_page.dart';

class ViewMoreCarsPage extends StatefulWidget {
  final List<Car> cars;
  const ViewMoreCarsPage({
    super.key,
    required this.cars,
  });

  @override
  State<ViewMoreCarsPage> createState() => _ViewMoreCarsPageState();
}

class _ViewMoreCarsPageState extends State<ViewMoreCarsPage> {
  ValueNotifier<bool> isSortByPopularityChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowerPriceChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByHighestRatingChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowestRatingChecked = ValueNotifier(false);
  List<Car> sortedCars = [];

  ///sorting functions
  sortByPopularity() {
    List<Car>? listToSort = widget.cars;
    listToSort.sort((a, b) =>
        (double.parse(a.popularity)).compareTo(double.parse(b.popularity)));
    if (isSortByPopularityChecked.value == false) {
      setState(() {
        sortedCars = listToSort;
      });
    } else {
      if (isSortByPopularityChecked.value == true) {
        setState(() {
          sortedCars = widget.cars;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByPrice() {
    List<Car>? listToSort = widget.cars;
    listToSort.sort(
        (a, b) => (double.parse(a.price)).compareTo(double.parse(b.price)));
    if (isSortByLowerPriceChecked.value == false) {
      setState(() {
        sortedCars = listToSort;
      });
    } else {
      if (isSortByLowerPriceChecked.value == true) {
        setState(() {
          sortedCars = widget.cars;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByHighestRating() {
    List<Car>? listToSort = widget.cars;
    listToSort.sort(
        (a, b) => (double.parse(b.rating)).compareTo(double.parse(a.rating)));

    if (isSortByHighestRatingChecked.value == false) {
      setState(() {
        sortedCars = listToSort;
      });
    } else {
      if (isSortByHighestRatingChecked.value == true) {
        setState(() {
          sortedCars = widget.cars;
        });
      }
    }
    print(listToSort.map((e) => (e.name)));
  }

  sortByLowestRating() {
    List<Car>? listToSort = widget.cars;
    listToSort.sort(
        (a, b) => (double.parse(a.rating)).compareTo(double.parse(b.rating)));

    if (isSortByLowestRatingChecked.value == false) {
      setState(() {
        sortedCars = listToSort;
      });
    } else {
      if (isSortByLowestRatingChecked.value == true) {
        setState(() {
          sortedCars = widget.cars;
        });
      }
    }
    // print(isSortByLowestRatingChecked.value.toString());
    print(sortedCars.map((e) => (e.name)));
  }

  @override
  void initState() {
    super.initState();
    sortedCars = widget.cars;
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

                                          //sort by lowest rating
                                          // ValueListenableBuilder(
                                          //   builder: (BuildContext context,
                                          //       value, Widget? child) {
                                          //     return Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment
                                          //               .spaceBetween,
                                          //       children: [
                                          //         const Text(
                                          //             'Star rating (lowest first)'),
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
                                          //                 isSortByLowestRatingChecked
                                          //                     .value,
                                          //             onChanged:
                                          //                 (bool? checked) {
                                          //               sortByLowestRating();

                                          //               isSortByLowestRatingChecked
                                          //                       .value =
                                          //                   checked ?? false;
                                          //             }),
                                          //       ],
                                          //     );
                                          //   },
                                          //   valueListenable:
                                          //       isSortByLowestRatingChecked,
                                          // )
                                      
                                      
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
            child: GridView.builder(
                itemCount: sortedCars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 180),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CarDetailsPage(
                                    car: sortedCars[index],
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
                                    sortedCars[index].images.first,
                                  ))),
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
                                        sortedCars[index].name,
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
                                              sortedCars[index].rating,
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
                                          '${sortedCars[index].color} |',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          sortedCars[index].availability
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
                                              'GHS ${sortedCars[index].price}',
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
                })));
  }
}
