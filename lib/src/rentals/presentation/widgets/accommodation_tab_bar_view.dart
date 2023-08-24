import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/destination_search_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/search_result_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../injection_container.dart';
import '../../../../shared/theme/color_scheme.dart';
import '../../accommodation/domain/entities/accommodation.dart';
import '../../accommodation/presentation/bloc/accommodation_bloc.dart';

class AccommodationTabBarView extends StatefulWidget {
  const AccommodationTabBarView({super.key});

  @override
  State<AccommodationTabBarView> createState() =>
      _AccommodationTabBarViewState();
}

class _AccommodationTabBarViewState extends State<AccommodationTabBarView> {
  ValueNotifier<int> numberOfRooms = ValueNotifier(0);
  ValueNotifier<int> numberOfAdults = ValueNotifier(0);
  ValueNotifier<int> numberOfChildren = ValueNotifier(0);

  ValueNotifier<int> numberOfRoomsApartment = ValueNotifier(0);
  ValueNotifier<int> numberOfAdultsApartment = ValueNotifier(0);
  ValueNotifier<int> numberOfChildrenApartment = ValueNotifier(0);

  final ValueNotifier<DateTime> _selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  final ValueNotifier<String> _startDate = ValueNotifier('start date');
  final ValueNotifier<String> _endDate = ValueNotifier('end date');

  final ValueNotifier<String> _apartmentBookStartDate =
      ValueNotifier('start date');
  final ValueNotifier<String> _apartmentBookEndDate = ValueNotifier('end date');

  TextEditingController destinationController = TextEditingController();

  TextEditingController destinationControllerApartment =
      TextEditingController();

  String isActiveAccommodation = "Apartments";

  final bloc = sl<AccommodationBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<List<Accommodation>>(
          stream: bloc.accommodations(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //list of accommodations
              List<Accommodation> acommodationList =
                  List.from(snapshot.requireData);

              List<Accommodation> hotels = List.from(acommodationList
                  .where((acommodation) => acommodation.category == 'hotel'));

              List<Accommodation> apartments = List.from(acommodationList.where(
                  (acommodation) => acommodation.category == 'apartment'));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///accommodation buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActiveAccommodation = "Apartments";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          side: BorderSide(color: lightColorScheme.primary),
                          backgroundColor: isActiveAccommodation == "Apartments"
                              ? lightColorScheme.primary
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          elevation: 0,
                        ),
                        child: Text(
                          'Apartments',
                          style: TextStyle(
                              fontSize: 13,
                              color: isActiveAccommodation == "Apartments"
                                  ? Colors.white
                                  : lightColorScheme.primary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isActiveAccommodation = "Hotels";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: lightColorScheme.primary),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            backgroundColor: isActiveAccommodation == "Hotels"
                                ? lightColorScheme.primary
                                : Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            elevation: 0,
                          ),
                          child: Text(
                            'Hotels',
                            style: TextStyle(
                                fontSize: 13,
                                color: isActiveAccommodation == "Hotels"
                                    ? Colors.white
                                    : lightColorScheme.primary),
                          ),
                        ),
                      ),
                    ],
                  ),

                  isActiveAccommodation == "Hotels"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: lightColorScheme.primary),
                                        left: BorderSide(
                                            color: lightColorScheme.primary),
                                        right: BorderSide(
                                            color: lightColorScheme.primary),
                                        bottom: BorderSide(
                                            color: lightColorScheme.primary,
                                            width: 0.011)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 15),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: false,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: lightColorScheme
                                                      .primary)),
                                          contentPadding:
                                              const EdgeInsets.only(top: 10),
                                          hintText: 'Enter Destination',
                                          constraints:
                                              const BoxConstraints.tightFor(
                                                  height: 40),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          prefixIcon: const Icon(
                                              Icons.location_on_outlined,
                                              size: 18,
                                              color: Colors.black54),
                                        ),
                                        controller: destinationController,
                                      ),
                                    ),
                                    const Divider(),

                                    //date
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 5, bottom: 5),
                                      child: Row(children: [
                                        ///start date
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                                constraints:
                                                    const BoxConstraints
                                                        .tightFor(height: 398),
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        SizedBox(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            child:
                                                                ValueListenableBuilder(
                                                              builder: (BuildContext
                                                                      context,
                                                                  value,
                                                                  Widget?
                                                                      child) {
                                                                return Stack(
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                Container(
                                                                              color: Colors.black,
                                                                              height: 2,
                                                                              width: 50,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            '   Select Date',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, color: lightColorScheme.primary),
                                                                          ),
                                                                          ValueListenableBuilder(
                                                                            builder: (BuildContext context,
                                                                                value,
                                                                                Widget? child) {
                                                                              return TableCalendar(
                                                                                  headerStyle: const HeaderStyle(formatButtonVisible: false),
                                                                                  calendarStyle: CalendarStyle(
                                                                                    isTodayHighlighted: false,
                                                                                    selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    selectedDecoration: BoxDecoration(color: lightColorScheme.primary, shape: BoxShape.circle),
                                                                                  ),
                                                                                  firstDay: DateTime.utc(2010, 10, 16),
                                                                                  lastDay: DateTime.utc(2030, 3, 14),
                                                                                  focusedDay: _focusedDay.value,
                                                                                  rowHeight: 32,
                                                                                  selectedDayPredicate: (day) {
                                                                                    return isSameDay(_selectedDay.value, day);

                                                                                    // Return true if the day is within the selected range.
                                                                                    // return _rangeStart != null &&
                                                                                    //     _rangeEnd != null &&
                                                                                    //     day.isAfter(_rangeStart!) &&
                                                                                    //     day.isBefore(_rangeEnd!);
                                                                                  },
                                                                                  onDaySelected: (selectedDay, focusedDay) {
                                                                                    setState(() {
                                                                                      _focusedDay.value = focusedDay;
                                                                                      _selectedDay.value = selectedDay;
                                                                                    });
                                                                                  });
                                                                            },
                                                                            valueListenable:
                                                                                _focusedDay,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Positioned(
                                                                        bottom:
                                                                            0,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            top:
                                                                                10,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                color: lightColorScheme.primary.withOpacity(.2),
                                                                                width: MediaQuery.sizeOf(context).width,
                                                                                height: 40,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  DateFormat('dd MMMM').format(_selectedDay.value),
                                                                                  textAlign: TextAlign.center,
                                                                                )),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  _startDate.value = DateFormat('dd MMMM').format(_selectedDay.value);
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  color: lightColorScheme.primary,
                                                                                  width: MediaQuery.sizeOf(context).width,
                                                                                  height: 40,
                                                                                  child: const Center(
                                                                                      child: Text(
                                                                                    'Select Date',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                    textAlign: TextAlign.center,
                                                                                  )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]);
                                                              },
                                                              valueListenable:
                                                                  _selectedDay,
                                                            ),
                                                          ),
                                                        ));
                                          },
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 18),
                                                child: Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    size: 18,
                                                    color: Colors.black54),
                                              ),
                                              Row(
                                                children: [
                                                  ValueListenableBuilder(
                                                    builder:
                                                        (BuildContext context,
                                                            value,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text('-'),
                                        ),

                                        ///end date
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                                constraints:
                                                    const BoxConstraints
                                                        .tightFor(height: 398),
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        SizedBox(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            child:
                                                                ValueListenableBuilder(
                                                              builder: (BuildContext
                                                                      context,
                                                                  value,
                                                                  Widget?
                                                                      child) {
                                                                return Stack(
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                Container(
                                                                              color: Colors.black,
                                                                              height: 2,
                                                                              width: 50,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            '   Select Date',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, color: lightColorScheme.primary),
                                                                          ),
                                                                          ValueListenableBuilder(
                                                                            builder: (BuildContext context,
                                                                                value,
                                                                                Widget? child) {
                                                                              return TableCalendar(
                                                                                  headerStyle: const HeaderStyle(formatButtonVisible: false),
                                                                                  calendarStyle: CalendarStyle(
                                                                                    isTodayHighlighted: false,
                                                                                    selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    selectedDecoration: BoxDecoration(color: lightColorScheme.primary, shape: BoxShape.circle),
                                                                                  ),
                                                                                  firstDay: DateTime.utc(2010, 10, 16),
                                                                                  lastDay: DateTime.utc(2030, 3, 14),
                                                                                  focusedDay: _focusedDay.value,
                                                                                  rowHeight: 32,
                                                                                  selectedDayPredicate: (day) {
                                                                                    return isSameDay(_selectedDay.value, day);

                                                                                    // Return true if the day is within the selected range.
                                                                                    // return _rangeStart != null &&
                                                                                    //     _rangeEnd != null &&
                                                                                    //     day.isAfter(_rangeStart!) &&
                                                                                    //     day.isBefore(_rangeEnd!);
                                                                                  },
                                                                                  onDaySelected: (selectedDay, focusedDay) {
                                                                                    setState(() {
                                                                                      _focusedDay.value = focusedDay;
                                                                                      _selectedDay.value = selectedDay;
                                                                                    });
                                                                                  });
                                                                            },
                                                                            valueListenable:
                                                                                _focusedDay,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Positioned(
                                                                        bottom:
                                                                            0,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            top:
                                                                                10,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                color: lightColorScheme.primary.withOpacity(.2),
                                                                                width: MediaQuery.sizeOf(context).width,
                                                                                height: 40,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  DateFormat('dd MMMM').format(_selectedDay.value),
                                                                                  textAlign: TextAlign.center,
                                                                                )),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  _endDate.value = DateFormat('dd MMMM').format(_selectedDay.value);
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  color: lightColorScheme.primary,
                                                                                  width: MediaQuery.sizeOf(context).width,
                                                                                  height: 40,
                                                                                  child: const Center(
                                                                                      child: Text(
                                                                                    'Select Date',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                    textAlign: TextAlign.center,
                                                                                  )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]);
                                                              },
                                                              valueListenable:
                                                                  _selectedDay,
                                                            ),
                                                          ),
                                                        ));
                                          },
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  ValueListenableBuilder(
                                                    builder:
                                                        (BuildContext context,
                                                            value,
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

                                    //room size
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              constraints:
                                                  const BoxConstraints.tightFor(
                                                      height: 270),
                                              context: context,
                                              builder:
                                                  (BuildContext context) =>
                                                      SizedBox(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          5),
                                                                  child:
                                                                      Container(
                                                                    color: Colors
                                                                        .black,
                                                                    height: 2,
                                                                    width: 50,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                '   Select Rooms and guests',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: lightColorScheme
                                                                        .primary),
                                                              ),

                                                              //rooms
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child:
                                                                    ValueListenableBuilder(
                                                                  valueListenable:
                                                                      numberOfRooms,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      value,
                                                                      Widget?
                                                                          child) {
                                                                    return Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        const Text(
                                                                            'Rooms'),
                                                                        Row(
                                                                          children: [
                                                                            IconButton(
                                                                                onPressed: () {
                                                                                  numberOfRooms.value++;
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.add_circle_outline,
                                                                                  color: lightColorScheme.primary,
                                                                                )),
                                                                            Text(
                                                                              numberOfRooms.value.toString(),
                                                                              style: const TextStyle(color: Colors.black87),
                                                                            ),
                                                                            IconButton(
                                                                                onPressed: () {
                                                                                  numberOfRooms.value >= 0 ? numberOfRooms.value-- : numberOfRooms.value = 0;
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.remove_circle_outline,
                                                                                  color: lightColorScheme.primary,
                                                                                )),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),

                                                              //adults
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child:
                                                                    ValueListenableBuilder(
                                                                  valueListenable:
                                                                      numberOfAdults,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      value,
                                                                      Widget?
                                                                          child) {
                                                                    return Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        const Text(
                                                                            'Adults'),
                                                                        Row(
                                                                          children: [
                                                                            IconButton(
                                                                                onPressed: () {
                                                                                  numberOfAdults.value++;
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.add_circle_outline,
                                                                                  color: lightColorScheme.primary,
                                                                                )),
                                                                            Text(
                                                                              numberOfAdults.value.toString(),
                                                                              style: const TextStyle(color: Colors.black87),
                                                                            ),
                                                                            IconButton(
                                                                                onPressed: () {
                                                                                  numberOfAdults.value >= 0 ? numberOfAdults.value-- : numberOfAdults.value = 0;
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.remove_circle_outline,
                                                                                  color: lightColorScheme.primary,
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
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child:
                                                                    ValueListenableBuilder(
                                                                  valueListenable:
                                                                      numberOfChildren,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      value,
                                                                      Widget?
                                                                          child) {
                                                                    return Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        const Text(
                                                                            'Children'),
                                                                        Row(
                                                                          children: [
                                                                            IconButton(
                                                                                onPressed: () {
                                                                                  numberOfChildren.value++;
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.add_circle_outline,
                                                                                  color: lightColorScheme.primary,
                                                                                )),
                                                                            Text(
                                                                              numberOfChildren.value.toString(),
                                                                              style: const TextStyle(color: Colors.black87),
                                                                            ),
                                                                            IconButton(
                                                                                onPressed: () {
                                                                                  numberOfChildren.value > 0 ? numberOfChildren.value-- : numberOfChildren.value = 0;
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.remove_circle_outline,
                                                                                  color: lightColorScheme.primary,
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
                                                                    color: lightColorScheme
                                                                        .primary
                                                                        .withOpacity(
                                                                            .2),
                                                                    width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    height: 40,
                                                                    child: Center(
                                                                        child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        ValueListenableBuilder(
                                                                          builder: (BuildContext context,
                                                                              value,
                                                                              Widget? child) {
                                                                            return Text(
                                                                              '${numberOfRooms.value} rooms - ',
                                                                              textAlign: TextAlign.center,
                                                                            );
                                                                          },
                                                                          valueListenable:
                                                                              numberOfRooms,
                                                                        ),
                                                                        ValueListenableBuilder(
                                                                          builder: (BuildContext context,
                                                                              value,
                                                                              Widget? child) {
                                                                            return Text(
                                                                              '${numberOfAdults.value} Adults -',
                                                                              textAlign: TextAlign.center,
                                                                            );
                                                                          },
                                                                          valueListenable:
                                                                              numberOfAdults,
                                                                        ),
                                                                        ValueListenableBuilder(
                                                                          builder: (BuildContext context,
                                                                              value,
                                                                              Widget? child) {
                                                                            return Text(
                                                                              '${numberOfChildren.value} Children',
                                                                              textAlign: TextAlign.center,
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
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      color: lightColorScheme
                                                                          .primary,
                                                                      width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      height:
                                                                          40,
                                                                      child: const Center(
                                                                          child: Text(
                                                                        'Apply',
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
                                                            ],
                                                          ),
                                                        ),
                                                      ));
                                        },
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15),
                                              child: Icon(
                                                  Icons.person_2_outlined,
                                                  size: 18,
                                                  color: Colors.black54),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ValueListenableBuilder(
                                                  builder:
                                                      (BuildContext context,
                                                          value,
                                                          Widget? child) {
                                                    return Text(
                                                      '${numberOfRooms.value} rooms - ',
                                                      textAlign:
                                                          TextAlign.center,
                                                    );
                                                  },
                                                  valueListenable:
                                                      numberOfRooms,
                                                ),
                                                ValueListenableBuilder(
                                                  builder:
                                                      (BuildContext context,
                                                          value,
                                                          Widget? child) {
                                                    return Text(
                                                      '${numberOfAdults.value} Adults -',
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
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                lightColorScheme.primary,
                                            minimumSize:
                                                const Size.fromHeight(40),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        SearchResultPage(
                                                          hotels: hotels,
                                                          searchQuery:
                                                              destinationController
                                                                  .text,
                                                          endDate:
                                                              _endDate.value,
                                                          numberOfAdults:
                                                              numberOfAdults
                                                                  .value
                                                                  .toString(),
                                                          numberOfChildren:
                                                              numberOfChildren
                                                                  .value
                                                                  .toString(),
                                                          numberOfRooms:
                                                              numberOfRooms
                                                                  .value
                                                                  .toString(),
                                                          startDate:
                                                              _startDate.value,
                                                        )));
                                          },
                                          child: const Text('Search')),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            ///best rooms
                            ///
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Best Rooms',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 330,
                              child: ListView.builder(
                                  itemCount: hotels.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(7),
                                                    bottomLeft:
                                                        Radius.circular(7)),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/room.jpg'))),
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(7),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  7)),
                                                  color: Color(0xffe7e7f4)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                          hotels[index].name,
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black87),
                                                        ),
                                                        Text(
                                                          hotels[index]
                                                                  .availability
                                                              ? "Available"
                                                              : "Unavailable",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.star,
                                                          size: 18,
                                                          color:
                                                              Color(0xfff8c123),
                                                        ),
                                                        Text(
                                                          '  ${hotels[index].rating}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.bed,
                                                            size: 18,
                                                            color:
                                                                Colors.black54),
                                                        Text(
                                                          hotels[index]
                                                              .facilities
                                                              .first,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                        )
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
                          ],
                        )
                      : isActiveAccommodation == "Apartments"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color:
                                                    lightColorScheme.primary),
                                            left: BorderSide(
                                                color:
                                                    lightColorScheme.primary),
                                            right: BorderSide(
                                                color:
                                                    lightColorScheme.primary),
                                            bottom: BorderSide(
                                                color: lightColorScheme.primary,
                                                width: 0.011)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 15),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              filled: false,
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              lightColorScheme
                                                                  .primary)),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                              hintText: 'Enter Destination',
                                              constraints:
                                                  const BoxConstraints.tightFor(
                                                      height: 40),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              prefixIcon: const Icon(
                                                  Icons.location_on_outlined,
                                                  size: 18,
                                                  color: Colors.black54),
                                            ),
                                            controller:
                                                destinationControllerApartment,
                                          ),
                                        ),
                                        const Divider(),

                                        //date
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 5, bottom: 5),
                                          child: Row(children: [
                                            ///start date
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    constraints:
                                                        const BoxConstraints
                                                                .tightFor(
                                                            height: 398),
                                                    context: context,
                                                    builder:
                                                        (BuildContext
                                                                context) =>
                                                            SizedBox(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10),
                                                                child:
                                                                    ValueListenableBuilder(
                                                                  builder: (BuildContext
                                                                          context,
                                                                      value,
                                                                      Widget?
                                                                          child) {
                                                                    return Stack(
                                                                        children: [
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
                                                                                style: TextStyle(fontWeight: FontWeight.bold, color: lightColorScheme.primary),
                                                                              ),
                                                                              ValueListenableBuilder(
                                                                                builder: (BuildContext context, value, Widget? child) {
                                                                                  return TableCalendar(
                                                                                      headerStyle: const HeaderStyle(formatButtonVisible: false),
                                                                                      calendarStyle: CalendarStyle(
                                                                                        isTodayHighlighted: false,
                                                                                        selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                        selectedDecoration: BoxDecoration(color: lightColorScheme.primary, shape: BoxShape.circle),
                                                                                      ),
                                                                                      firstDay: DateTime.utc(2010, 10, 16),
                                                                                      lastDay: DateTime.utc(2030, 3, 14),
                                                                                      focusedDay: _focusedDay.value,
                                                                                      rowHeight: 32,
                                                                                      selectedDayPredicate: (day) {
                                                                                        return isSameDay(_selectedDay.value, day);

                                                                                        // Return true if the day is within the selected range.
                                                                                        // return _rangeStart != null &&
                                                                                        //     _rangeEnd != null &&
                                                                                        //     day.isAfter(_rangeStart!) &&
                                                                                        //     day.isBefore(_rangeEnd!);
                                                                                      },
                                                                                      onDaySelected: (selectedDay, focusedDay) {
                                                                                        setState(() {
                                                                                          _focusedDay.value = focusedDay;
                                                                                          _selectedDay.value = selectedDay;
                                                                                        });
                                                                                      });
                                                                                },
                                                                                valueListenable: _focusedDay,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Positioned(
                                                                            bottom:
                                                                                0,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                top: 10,
                                                                              ),
                                                                              child: Column(
                                                                                children: [
                                                                                  Container(
                                                                                    color: lightColorScheme.primary.withOpacity(.2),
                                                                                    width: MediaQuery.sizeOf(context).width,
                                                                                    height: 40,
                                                                                    child: Center(
                                                                                        child: Text(
                                                                                      DateFormat('dd MMMM').format(_selectedDay.value),
                                                                                      textAlign: TextAlign.center,
                                                                                    )),
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      _apartmentBookStartDate.value = DateFormat('dd MMMM').format(_selectedDay.value);
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Container(
                                                                                      color: lightColorScheme.primary,
                                                                                      width: MediaQuery.sizeOf(context).width,
                                                                                      height: 40,
                                                                                      child: const Center(
                                                                                          child: Text(
                                                                                        'Select Date',
                                                                                        style: TextStyle(color: Colors.white),
                                                                                        textAlign: TextAlign.center,
                                                                                      )),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  valueListenable:
                                                                      _selectedDay,
                                                                ),
                                                              ),
                                                            ));
                                              },
                                              child: Row(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 18),
                                                    child: Icon(
                                                        Icons
                                                            .calendar_today_outlined,
                                                        size: 18,
                                                        color: Colors.black54),
                                                  ),
                                                  Row(
                                                    children: [
                                                      ValueListenableBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            value,
                                                            Widget? child) {
                                                          return Text(
                                                            _apartmentBookStartDate
                                                                .value,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          );
                                                        },
                                                        valueListenable:
                                                            _apartmentBookStartDate,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text('-'),
                                            ),

                                            ///end date
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    constraints:
                                                        const BoxConstraints
                                                                .tightFor(
                                                            height: 398),
                                                    context: context,
                                                    builder:
                                                        (BuildContext
                                                                context) =>
                                                            SizedBox(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10),
                                                                child:
                                                                    ValueListenableBuilder(
                                                                  builder: (BuildContext
                                                                          context,
                                                                      value,
                                                                      Widget?
                                                                          child) {
                                                                    return Stack(
                                                                        children: [
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
                                                                                style: TextStyle(fontWeight: FontWeight.bold, color: lightColorScheme.primary),
                                                                              ),
                                                                              ValueListenableBuilder(
                                                                                builder: (BuildContext context, value, Widget? child) {
                                                                                  return TableCalendar(
                                                                                      headerStyle: const HeaderStyle(formatButtonVisible: false),
                                                                                      calendarStyle: CalendarStyle(
                                                                                        isTodayHighlighted: false,
                                                                                        selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                        selectedDecoration: BoxDecoration(color: lightColorScheme.primary, shape: BoxShape.circle),
                                                                                      ),
                                                                                      firstDay: DateTime.utc(2010, 10, 16),
                                                                                      lastDay: DateTime.utc(2030, 3, 14),
                                                                                      focusedDay: _focusedDay.value,
                                                                                      rowHeight: 32,
                                                                                      selectedDayPredicate: (day) {
                                                                                        return isSameDay(_selectedDay.value, day);

                                                                                        // Return true if the day is within the selected range.
                                                                                        // return _rangeStart != null &&
                                                                                        //     _rangeEnd != null &&
                                                                                        //     day.isAfter(_rangeStart!) &&
                                                                                        //     day.isBefore(_rangeEnd!);
                                                                                      },
                                                                                      onDaySelected: (selectedDay, focusedDay) {
                                                                                        setState(() {
                                                                                          _focusedDay.value = focusedDay;
                                                                                          _selectedDay.value = selectedDay;
                                                                                        });
                                                                                      });
                                                                                },
                                                                                valueListenable: _focusedDay,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Positioned(
                                                                            bottom:
                                                                                0,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                top: 10,
                                                                              ),
                                                                              child: Column(
                                                                                children: [
                                                                                  Container(
                                                                                    color: lightColorScheme.primary.withOpacity(.2),
                                                                                    width: MediaQuery.sizeOf(context).width,
                                                                                    height: 40,
                                                                                    child: Center(
                                                                                        child: Text(
                                                                                      DateFormat('dd MMMM').format(_selectedDay.value),
                                                                                      textAlign: TextAlign.center,
                                                                                    )),
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      _apartmentBookEndDate.value = DateFormat('dd MMMM').format(_selectedDay.value);
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Container(
                                                                                      color: lightColorScheme.primary,
                                                                                      width: MediaQuery.sizeOf(context).width,
                                                                                      height: 40,
                                                                                      child: const Center(
                                                                                          child: Text(
                                                                                        'Select Date',
                                                                                        style: TextStyle(color: Colors.white),
                                                                                        textAlign: TextAlign.center,
                                                                                      )),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  valueListenable:
                                                                      _selectedDay,
                                                                ),
                                                              ),
                                                            ));
                                              },
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      ValueListenableBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            value,
                                                            Widget? child) {
                                                          return Text(
                                                            _apartmentBookEndDate
                                                                .value,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          );
                                                        },
                                                        valueListenable:
                                                            _apartmentBookEndDate,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                        const Divider(),

                                        //room size
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  constraints:
                                                      const BoxConstraints
                                                              .tightFor(
                                                          height: 270),
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          SizedBox(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              5),
                                                                      child:
                                                                          Container(
                                                                        color: Colors
                                                                            .black,
                                                                        height:
                                                                            2,
                                                                        width:
                                                                            50,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '   Select Rooms and guests',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: lightColorScheme
                                                                            .primary),
                                                                  ),

                                                                  //rooms
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child:
                                                                        ValueListenableBuilder(
                                                                      valueListenable:
                                                                          numberOfRoomsApartment,
                                                                      builder: (BuildContext
                                                                              context,
                                                                          value,
                                                                          Widget?
                                                                              child) {
                                                                        return Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            const Text('Rooms'),
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      numberOfRoomsApartment.value++;
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.add_circle_outline,
                                                                                      color: lightColorScheme.primary,
                                                                                    )),
                                                                                Text(
                                                                                  numberOfRoomsApartment.value.toString(),
                                                                                  style: const TextStyle(color: Colors.black87),
                                                                                ),
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      numberOfRoomsApartment.value > 0 ? numberOfRoomsApartment.value-- : numberOfRoomsApartment.value = 0;
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.remove_circle_outline,
                                                                                      color: lightColorScheme.primary,
                                                                                    )),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),

                                                                  //adults
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child:
                                                                        ValueListenableBuilder(
                                                                      valueListenable:
                                                                          numberOfAdultsApartment,
                                                                      builder: (BuildContext
                                                                              context,
                                                                          value,
                                                                          Widget?
                                                                              child) {
                                                                        return Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            const Text('Adults'),
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      numberOfAdultsApartment.value++;
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.add_circle_outline,
                                                                                      color: lightColorScheme.primary,
                                                                                    )),
                                                                                Text(
                                                                                  numberOfAdultsApartment.value.toString(),
                                                                                  style: const TextStyle(color: Colors.black87),
                                                                                ),
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      numberOfAdultsApartment.value >= 0 ? numberOfAdultsApartment.value-- : numberOfAdultsApartment.value = 0;
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.remove_circle_outline,
                                                                                      color: lightColorScheme.primary,
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
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child:
                                                                        ValueListenableBuilder(
                                                                      valueListenable:
                                                                          numberOfChildren,
                                                                      builder: (BuildContext
                                                                              context,
                                                                          value,
                                                                          Widget?
                                                                              child) {
                                                                        return Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            const Text('Children'),
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      numberOfChildrenApartment.value++;
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.add_circle_outline,
                                                                                      color: lightColorScheme.primary,
                                                                                    )),
                                                                                Text(
                                                                                  numberOfChildrenApartment.value.toString(),
                                                                                  style: const TextStyle(color: Colors.black87),
                                                                                ),
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      numberOfChildrenApartment.value > 0 ? numberOfChildrenApartment.value-- : numberOfChildrenApartment.value = 0;
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.remove_circle_outline,
                                                                                      color: lightColorScheme.primary,
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
                                                                        color: lightColorScheme
                                                                            .primary
                                                                            .withOpacity(.2),
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        height:
                                                                            40,
                                                                        child: Center(
                                                                            child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            ValueListenableBuilder(
                                                                              builder: (BuildContext context, value, Widget? child) {
                                                                                return Text(
                                                                                  '${numberOfRoomsApartment.value} rooms - ',
                                                                                  textAlign: TextAlign.center,
                                                                                );
                                                                              },
                                                                              valueListenable: numberOfRoomsApartment,
                                                                            ),
                                                                            ValueListenableBuilder(
                                                                              builder: (BuildContext context, value, Widget? child) {
                                                                                return Text(
                                                                                  '${numberOfAdultsApartment.value} Adults -',
                                                                                  textAlign: TextAlign.center,
                                                                                );
                                                                              },
                                                                              valueListenable: numberOfAdultsApartment,
                                                                            ),
                                                                            ValueListenableBuilder(
                                                                              builder: (BuildContext context, value, Widget? child) {
                                                                                return Text(
                                                                                  '${numberOfChildrenApartment.value} Children',
                                                                                  textAlign: TextAlign.center,
                                                                                );
                                                                              },
                                                                              valueListenable: numberOfChildrenApartment,
                                                                            ),
                                                                          ],
                                                                        )),
                                                                      ),

                                                                      ///apply
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          color:
                                                                              lightColorScheme.primary,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width,
                                                                          height:
                                                                              40,
                                                                          child: const Center(
                                                                              child: Text(
                                                                            'Apply',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                            textAlign:
                                                                                TextAlign.center,
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
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Icon(
                                                      Icons.person_2_outlined,
                                                      size: 18,
                                                      color: Colors.black54),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ValueListenableBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              value,
                                                              Widget? child) {
                                                        return Text(
                                                          '${numberOfRoomsApartment.value} rooms - ',
                                                          textAlign:
                                                              TextAlign.center,
                                                        );
                                                      },
                                                      valueListenable:
                                                          numberOfRoomsApartment,
                                                    ),
                                                    ValueListenableBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              value,
                                                              Widget? child) {
                                                        return Text(
                                                          '${numberOfAdultsApartment.value} Adults -',
                                                          textAlign:
                                                              TextAlign.center,
                                                        );
                                                      },
                                                      valueListenable:
                                                          numberOfAdultsApartment,
                                                    ),
                                                    ValueListenableBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              value,
                                                              Widget? child) {
                                                        return Text(
                                                          '${numberOfChildrenApartment.value} Children',
                                                          textAlign:
                                                              TextAlign.center,
                                                        );
                                                      },
                                                      valueListenable:
                                                          numberOfChildrenApartment,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    lightColorScheme.primary,
                                                minimumSize:
                                                    const Size.fromHeight(40),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            SearchResultPage(
                                                              apartments:
                                                                  apartments,
                                                              searchQuery:
                                                                  destinationControllerApartment
                                                                      .text,
                                                              endDate:
                                                                  _apartmentBookEndDate
                                                                      .value,
                                                              numberOfAdults:
                                                                  numberOfAdultsApartment
                                                                      .value
                                                                      .toString(),
                                                              numberOfChildren:
                                                                  numberOfChildrenApartment
                                                                      .value
                                                                      .toString(),
                                                              numberOfRooms:
                                                                  numberOfRoomsApartment
                                                                      .value
                                                                      .toString(),
                                                              startDate:
                                                                  _apartmentBookStartDate
                                                                      .value,
                                                            )));
                                              },
                                              child: const Text('Search')),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                ///best rooms
                                ///
                                const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Best Rooms',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 330,
                                  child: ListView.builder(
                                      itemCount: apartments.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(7),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    7)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'assets/images/room.jpg'))),
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
                                                              topLeft: Radius
                                                                  .circular(7),
                                                              bottomLeft: Radius
                                                                  .circular(7)),
                                                      color: Color(0xffe7e7f4)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                              apartments[index]
                                                                  .name,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                            Text(
                                                              apartments[index]
                                                                      .availability
                                                                  ? "Available"
                                                                  : "Unavailable",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: lightColorScheme
                                                                      .primary),
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
                                                              '  ${apartments[index].rating}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                Icons.bed,
                                                                size: 18,
                                                                color: Colors
                                                                    .black54),
                                                            Text(
                                                              apartments[index]
                                                                  .facilities
                                                                  .first,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                            )
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
                              ],
                            )
                          : Container(),
                ],
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
            }
            return const Center(
              child: Text('Sorry no accommodation '),
            );
          }),
    );
  }
}
