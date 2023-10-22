import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/event_details.dart';

import '../../accommodation/domain/entities/accommodation.dart';
import '../../event_services/domain/entities/event_service.dart';

class EventSearchResultPage extends StatefulWidget {
  final List<EventService> eventServices;
  final String searchQuery, startDate, endDate, numberOfGuests;

  const EventSearchResultPage({
    super.key,
    required this.searchQuery,
    required this.startDate,
    required this.endDate,
    required this.numberOfGuests,
    required this.eventServices,
  });

  @override
  State<EventSearchResultPage> createState() => _EventSearchResultPageState();
}

class _EventSearchResultPageState extends State<EventSearchResultPage> {
  ValueNotifier<bool> isSortByPopularityChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowerPriceChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByHighestRatingChecked = ValueNotifier(false);
  ValueNotifier<bool> isSortByLowestRatingChecked = ValueNotifier(false);

  late final List<EventService> searchResult;

  searchForEventServices(String location) {
    try {
      List<EventService> result = widget.eventServices!
          .where((eventServices) => eventServices.location.contains(location))
          .toList();

      return result;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    searchResult = searchForEventServices(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        // title: Padding(
        //   padding: EdgeInsets.only(top: 20),
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 50,
        //         child: TextField(
        //           decoration: InputDecoration(
        //             contentPadding: EdgeInsets.symmetric(
        //               horizontal: 30,
        //             ),
        //             suffixIcon: Padding(
        //               padding: EdgeInsets.only(right: 20),
        //               child: Icon(Icons.cancel,
        //                   color: Colors.grey.withOpacity(.5)),
        //             ),
        //             prefixIcon: BackButton(
        //               color: Colors.black87,
        //             ),
        //             floatingLabelBehavior: FloatingLabelBehavior.never,
        //             labelText: 'Enter destination',
        //             labelStyle: TextStyle(color: Colors.black87),
        //             focusedBorder: OutlineInputBorder(
        //                 borderSide: BorderSide(color: lightColorScheme.primary),
        //                 borderRadius: BorderRadius.all(Radius.circular(5))),
        //             enabledBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(color: Color(0xffe7e9f4)),
        //                 borderRadius: BorderRadius.all(Radius.circular(5))),
        //             fillColor: Color(0xffe7e9f4),
        //           ),
        //         ),
        //       ),

        //     ],
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 25, top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        constraints: const BoxConstraints.tightFor(height: 250),
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color: lightColorScheme.primary),
                                    ),

                                    ValueListenableBuilder(
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Popularity'),
                                            Checkbox(
                                                side: const BorderSide(
                                                  color: Colors.grey,
                                                ),
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        lightColorScheme
                                                            .primary),
                                                value: isSortByPopularityChecked
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
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Price (lower first)'),
                                            Checkbox(
                                                side: const BorderSide(
                                                  color: Colors.grey,
                                                ),
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        lightColorScheme
                                                            .primary),
                                                value: isSortByLowerPriceChecked
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
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                'Star rating (highest first) '),
                                            Checkbox(
                                                side: const BorderSide(
                                                  color: Colors.grey,
                                                ),
                                                fillColor:
                                                    MaterialStateProperty.all(
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
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                'Star rating (lowest first)'),
                                            Checkbox(
                                                side: const BorderSide(
                                                  color: Colors.grey,
                                                ),
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        lightColorScheme
                                                            .primary),
                                                value:
                                                    isSortByLowestRatingChecked
                                                        .value,
                                                onChanged: (checked) {
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
                      Icon(
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
                  '1 property',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
          SizedBox(
            height: 680,
            child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EventDetailsPage(
                                      endDate: widget.endDate,
                                      startDate: widget.startDate,
                                      eventService: searchResult[index],
                                      numberOfGuests: widget.numberOfGuests,
                                      destination: widget.searchQuery,
                                    )));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 80,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    bottomLeft: Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/event_space.png'))),
                            // child: const Align(
                            //   alignment: Alignment.topLeft,
                            //   child: Padding(
                            //     padding: EdgeInsets.all(5.0),
                            //     child: Icon(
                            //       size: 18,
                            //       Icons.favorite_outline,
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                          ),
                          Expanded(
                            child: Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7),
                                      bottomLeft: Radius.circular(7)),
                                  color: Color(0xffe7e7f4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          searchResult[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          searchResult[index].availability ==
                                                  true
                                              ? 'Available'
                                              : 'Unavailable',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: lightColorScheme.primary),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(0xfff8c123),
                                          ),
                                          Text(
                                            ' ${searchResult[index].rating}  ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Text(
                                            ' |   ${searchResult[index].review} reviews',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          )
                                        ],
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       'Superior room: 1 bed',
                                    //       style:
                                    //           Theme.of(context).textTheme.bodyMedium,
                                    //     )
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Text('300 (USD)',
                                    //         style: Theme.of(context)
                                    //             .textTheme
                                    //             .bodyMedium!
                                    //             .copyWith(
                                    //               fontSize: 18,
                                    //               color: lightColorScheme.primary,
                                    //               fontWeight: FontWeight.bold,
                                    //             )),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text('Include taxes',
                                    //         style: Theme.of(context)
                                    //             .textTheme
                                    //             .bodyMedium!
                                    //             .copyWith(
                                    //               fontSize: 14,
                                    //             )),
                                    //     Row(
                                    //       children: [
                                    //         Icon(
                                    //           Icons.check,
                                    //           size: 14,
                                    //           color: lightColorScheme.primary,
                                    //         ),
                                    //         Text(' Free cancellation',
                                    //             style: Theme.of(context)
                                    //                 .textTheme
                                    //                 .bodyMedium!
                                    //                 .copyWith(
                                    //                   fontSize: 14,
                                    //                   color: lightColorScheme.primary,
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
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
