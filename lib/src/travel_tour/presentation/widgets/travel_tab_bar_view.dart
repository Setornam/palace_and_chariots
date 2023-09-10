import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/destination_search_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/search_result_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../../checkout/presentation/pages/travel_checkout_page.dart';

class TravelTabBarView extends StatefulWidget {
  const TravelTabBarView({super.key});

  @override
  State<TravelTabBarView> createState() => _TravelTabBarViewState();
}

class _TravelTabBarViewState extends State<TravelTabBarView> {
  ValueNotifier<int> numberOfAdults = ValueNotifier(0);
  ValueNotifier<int> numberOfChildren = ValueNotifier(0);

  ValueNotifier<int> numberOfRoomsApartment = ValueNotifier(0);
  ValueNotifier<int> numberOfAdultsApartment = ValueNotifier(0);
  ValueNotifier<int> numberOfChildrenApartment = ValueNotifier(0);

  final ValueNotifier<DateTime> _selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  final ValueNotifier<String> _startDate = ValueNotifier('start date');
  final ValueNotifier<String> _endDate = ValueNotifier('end date');

  List<Map<String, String>> locations = [
    {'name': 'Accra', 'image': 'assets/images/accra.png'},
    {'name': 'Lagos', 'image': 'assets/images/lagos.png'},
    {'name': 'Dubai', 'image': 'assets/images/dubai.png'},
    {'name': 'London', 'image': 'assets/images/london.png'},
    {'name': 'Barcelona', 'image': 'assets/images/barca.png'},
    {'name': 'New York', 'image': 'assets/images/new_york.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///search container
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: lightColorScheme.primary),
                      left: BorderSide(color: lightColorScheme.primary),
                      right: BorderSide(color: lightColorScheme.primary),
                      bottom: BorderSide(
                          color: lightColorScheme.primary, width: 0.011)),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(29),
                      bottomRight: Radius.circular(29))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DestinationSearchPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //from
                          Row(
                            children: [
                              const Icon(Icons.flight_takeoff,
                                  size: 18, color: Colors.black54),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '   take off',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    '   City or airport',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              )
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Row(
                              children: [
                                const Icon(Icons.flight_land,
                                    size: 18, color: Colors.black54),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '   destination',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      '   City or airport',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),

                  //date
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 5, bottom: 5),
                    child: Row(children: [
                      ///start date
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              constraints:
                                  const BoxConstraints.tightFor(height: 398),
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ValueListenableBuilder(
                                        builder: (BuildContext context, value,
                                            Widget? child) {
                                          return Stack(children: [
                                            Column(
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
                                                  '   Select Date',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lightColorScheme
                                                          .primary),
                                                ),
                                                ValueListenableBuilder(
                                                  builder:
                                                      (BuildContext context,
                                                          value,
                                                          Widget? child) {
                                                    return TableCalendar(
                                                        headerStyle:
                                                            const HeaderStyle(
                                                                formatButtonVisible:
                                                                    false),
                                                        calendarStyle:
                                                            CalendarStyle(
                                                          isTodayHighlighted:
                                                              false,
                                                          selectedTextStyle:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          selectedDecoration:
                                                              BoxDecoration(
                                                                  color: lightColorScheme
                                                                      .primary,
                                                                  shape: BoxShape
                                                                      .circle),
                                                        ),
                                                        firstDay: DateTime.utc(
                                                            2010, 10, 16),
                                                        lastDay: DateTime.utc(
                                                            2030, 3, 14),
                                                        focusedDay:
                                                            _focusedDay.value,
                                                        rowHeight: 32,
                                                        selectedDayPredicate:
                                                            (day) {
                                                          return isSameDay(
                                                              _selectedDay
                                                                  .value,
                                                              day);

                                                          // Return true if the day is within the selected range.
                                                          // return _rangeStart != null &&
                                                          //     _rangeEnd != null &&
                                                          //     day.isAfter(_rangeStart!) &&
                                                          //     day.isBefore(_rangeEnd!);
                                                        },
                                                        onDaySelected:
                                                            (selectedDay,
                                                                focusedDay) {
                                                          setState(() {
                                                            _focusedDay.value =
                                                                focusedDay;
                                                            _selectedDay.value =
                                                                selectedDay;
                                                          });
                                                        });
                                                  },
                                                  valueListenable: _focusedDay,
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      color: lightColorScheme
                                                          .primary
                                                          .withOpacity(.2),
                                                      width: MediaQuery.sizeOf(
                                                              context)
                                                          .width,
                                                      height: 40,
                                                      child: Center(
                                                          child: Text(
                                                        DateFormat('dd MMMM')
                                                            .format(_selectedDay
                                                                .value),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _startDate.value =
                                                            DateFormat(
                                                                    'dd MMMM')
                                                                .format(
                                                                    _selectedDay
                                                                        .value);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        color: lightColorScheme
                                                            .primary,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                        height: 40,
                                                        child: const Center(
                                                            child: Text(
                                                          'Select Date',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]);
                                        },
                                        valueListenable: _selectedDay,
                                      ),
                                    ),
                                  ));
                        },
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, right: 18),
                              child: Icon(Icons.calendar_today_outlined,
                                  size: 18, color: Colors.black54),
                            ),
                            Row(
                              children: [
                                ValueListenableBuilder(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Text(
                                      _startDate.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    );
                                  },
                                  valueListenable: _startDate,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text('-'),
                      ),

                      ///end date
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              constraints:
                                  const BoxConstraints.tightFor(height: 398),
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ValueListenableBuilder(
                                        builder: (BuildContext context, value,
                                            Widget? child) {
                                          return Stack(children: [
                                            Column(
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
                                                  '   Select Date',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lightColorScheme
                                                          .primary),
                                                ),
                                                ValueListenableBuilder(
                                                  builder:
                                                      (BuildContext context,
                                                          value,
                                                          Widget? child) {
                                                    return TableCalendar(
                                                        headerStyle:
                                                            const HeaderStyle(
                                                                formatButtonVisible:
                                                                    false),
                                                        calendarStyle:
                                                            CalendarStyle(
                                                          isTodayHighlighted:
                                                              false,
                                                          selectedTextStyle:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          selectedDecoration:
                                                              BoxDecoration(
                                                                  color: lightColorScheme
                                                                      .primary,
                                                                  shape: BoxShape
                                                                      .circle),
                                                        ),
                                                        firstDay: DateTime.utc(
                                                            2010, 10, 16),
                                                        lastDay: DateTime.utc(
                                                            2030, 3, 14),
                                                        focusedDay:
                                                            _focusedDay.value,
                                                        rowHeight: 32,
                                                        selectedDayPredicate:
                                                            (day) {
                                                          return isSameDay(
                                                              _selectedDay
                                                                  .value,
                                                              day);

                                                          // Return true if the day is within the selected range.
                                                          // return _rangeStart != null &&
                                                          //     _rangeEnd != null &&
                                                          //     day.isAfter(_rangeStart!) &&
                                                          //     day.isBefore(_rangeEnd!);
                                                        },
                                                        onDaySelected:
                                                            (selectedDay,
                                                                focusedDay) {
                                                          setState(() {
                                                            _focusedDay.value =
                                                                focusedDay;
                                                            _selectedDay.value =
                                                                selectedDay;
                                                          });
                                                        });
                                                  },
                                                  valueListenable: _focusedDay,
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      color: lightColorScheme
                                                          .primary
                                                          .withOpacity(.2),
                                                      width: MediaQuery.sizeOf(
                                                              context)
                                                          .width,
                                                      height: 40,
                                                      child: Center(
                                                          child: Text(
                                                        DateFormat('dd MMMM')
                                                            .format(_selectedDay
                                                                .value),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _endDate.value =
                                                            DateFormat(
                                                                    'dd MMMM')
                                                                .format(
                                                                    _selectedDay
                                                                        .value);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        color: lightColorScheme
                                                            .primary,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                        height: 40,
                                                        child: const Center(
                                                            child: Text(
                                                          'Select Date',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]);
                                        },
                                        valueListenable: _selectedDay,
                                      ),
                                    ),
                                  ));
                        },
                        child: Row(
                          children: [
                            Row(
                              children: [
                                ValueListenableBuilder(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Text(
                                      _endDate.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    );
                                  },
                                  valueListenable: _endDate,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  const Divider(),

                  //Passenger size
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            constraints:
                                const BoxConstraints.tightFor(height: 270),
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Container(
                                              color: Colors.black,
                                              height: 2,
                                              width: 50,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '   Select Passengers',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: lightColorScheme.primary),
                                        ),

                                        //adults
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: ValueListenableBuilder(
                                            valueListenable: numberOfAdults,
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text('Adults'),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            numberOfAdults
                                                                .value++;
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                            color:
                                                                lightColorScheme
                                                                    .primary,
                                                          )),
                                                      Text(
                                                        numberOfAdults.value
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            numberOfAdults
                                                                        .value >=
                                                                    0
                                                                ? numberOfAdults
                                                                    .value--
                                                                : numberOfAdults
                                                                    .value = 0;
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .remove_circle_outline,
                                                            color:
                                                                lightColorScheme
                                                                    .primary,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ),

                                        //children
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: ValueListenableBuilder(
                                            valueListenable: numberOfChildren,
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text('Children'),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            numberOfChildren
                                                                .value++;
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                            color:
                                                                lightColorScheme
                                                                    .primary,
                                                          )),
                                                      Text(
                                                        numberOfChildren.value
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            numberOfChildren
                                                                        .value >
                                                                    0
                                                                ? numberOfChildren
                                                                    .value--
                                                                : numberOfChildren
                                                                    .value = 0;
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .remove_circle_outline,
                                                            color:
                                                                lightColorScheme
                                                                    .primary,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ),

                                        Column(
                                          children: [
                                            Container(
                                              color: lightColorScheme.primary
                                                  .withOpacity(.2),
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: 40,
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ValueListenableBuilder(
                                                    builder:
                                                        (BuildContext context,
                                                            value,
                                                            Widget? child) {
                                                      return Text(
                                                        '${numberOfAdults.value}   Adults       -         ',
                                                        textAlign:
                                                            TextAlign.center,
                                                      );
                                                    },
                                                    valueListenable:
                                                        numberOfAdults,
                                                  ),
                                                  ValueListenableBuilder(
                                                    builder:
                                                        (BuildContext context,
                                                            value,
                                                            Widget? child) {
                                                      return Text(
                                                        '${numberOfChildren.value} Children',
                                                        textAlign:
                                                            TextAlign.center,
                                                      );
                                                    },
                                                    valueListenable:
                                                        numberOfChildren,
                                                  ),
                                                ],
                                              )),
                                            ),

                                            ///apply
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                color: lightColorScheme.primary,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                height: 40,
                                                child: const Center(
                                                    child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15, right: 18),
                            child: Icon(Icons.person_2_outlined,
                                size: 18, color: Colors.black54),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ValueListenableBuilder(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return Text(
                                    '${numberOfAdults.value} Adults    -        ',
                                    textAlign: TextAlign.center,
                                  );
                                },
                                valueListenable: numberOfAdults,
                              ),
                              ValueListenableBuilder(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return Text(
                                    '${numberOfChildren.value} Children',
                                    textAlign: TextAlign.center,
                                  );
                                },
                                valueListenable: numberOfChildren,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(0),
                                topRight: Radius.zero)),
                        backgroundColor: lightColorScheme.primary,
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TravelCheckoutPage(
                                      endDate: _endDate.value,
                                      startDate: _startDate.value,
                                    )));
                      },
                      child: const Text('Next'))
                ],
              ),
            ),
          ),

          ///popular locations
          ///
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              'Popular Locations',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 330,
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(locations[index]['image']!))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              locations[index]['name']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ]),
                  );
                }),
          )
        ],
      ),
    );
  }
}
