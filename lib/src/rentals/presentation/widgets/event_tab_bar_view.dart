import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palace_and_chariots/src/rentals/event_services/domain/entities/event_service.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/destination_search_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/event_details.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/events_search_result_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/search_result_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../injection_container.dart';
import '../../../../shared/theme/color_scheme.dart';
import '../../../wishlist/wishlist.dart';
import '../../event_services/presentation/bloc/event_service_bloc.dart';

class EventTabBarView extends StatefulWidget {
  const EventTabBarView({super.key});

  @override
  State<EventTabBarView> createState() => _EventTabBarViewState();
}

class _EventTabBarViewState extends State<EventTabBarView> {
  ValueNotifier<int> numberOfRooms = ValueNotifier(0);
  ValueNotifier<int> numberOfAdults = ValueNotifier(0);
  ValueNotifier<int> numberOfChildren = ValueNotifier(0);

  final ValueNotifier<DateTime> _selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  final ValueNotifier<String> _startDate = ValueNotifier('start date');
  final ValueNotifier<String> _endDate = ValueNotifier('end date');

  final ValueNotifier<String> numberGuests = ValueNotifier('Number of Guests');

  TextEditingController destinationController = TextEditingController();

  final ValueNotifier<TextEditingController> numberOfGuestsController =
      ValueNotifier(TextEditingController());

  final bloc = sl<EventServiceBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<List<EventService>>(
          stream: bloc.eventServices(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //list of EventServices
              List<EventService> eventsList = List.from(snapshot.requireData);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(29),
                                  bottomRight: Radius.circular(29))),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 15),
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: false,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: lightColorScheme.primary)),
                                    contentPadding:
                                        const EdgeInsets.only(top: 10),
                                    hintText: 'Enter Location',
                                    constraints: const BoxConstraints.tightFor(
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
                                              const BoxConstraints.tightFor(
                                                  height: 398),
                                          context: context,
                                          builder:
                                              (BuildContext context) =>
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child:
                                                          ValueListenableBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            value,
                                                            Widget? child) {
                                                          return Stack(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Center(
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
                                                                    Text(
                                                                      '   Select Date',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              lightColorScheme.primary),
                                                                    ),
                                                                    ValueListenableBuilder(
                                                                      builder: (BuildContext
                                                                              context,
                                                                          value,
                                                                          Widget?
                                                                              child) {
                                                                        return TableCalendar(
                                                                            headerStyle: const HeaderStyle(
                                                                                formatButtonVisible:
                                                                                    false),
                                                                            calendarStyle:
                                                                                CalendarStyle(
                                                                              isTodayHighlighted: false,
                                                                              selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                              selectedDecoration: BoxDecoration(color: lightColorScheme.primary, shape: BoxShape.circle),
                                                                            ),
                                                                            firstDay: DateTime.utc(
                                                                                2010,
                                                                                10,
                                                                                16),
                                                                            lastDay: DateTime.utc(
                                                                                2030,
                                                                                3,
                                                                                14),
                                                                            focusedDay: _focusedDay
                                                                                .value,
                                                                            rowHeight:
                                                                                32,
                                                                            selectedDayPredicate:
                                                                                (day) {
                                                                              return isSameDay(_selectedDay.value, day);

                                                                              // Return true if the day is within the selected range.
                                                                              // return _rangeStart != null &&
                                                                              //     _rangeEnd != null &&
                                                                              //     day.isAfter(_rangeStart!) &&
                                                                              //     day.isBefore(_rangeEnd!);
                                                                            },
                                                                            onDaySelected:
                                                                                (selectedDay, focusedDay) {
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
                                                                  bottom: 0,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: 10,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          color: lightColorScheme
                                                                              .primary
                                                                              .withOpacity(.2),
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width,
                                                                          height:
                                                                              40,
                                                                          child: Center(
                                                                              child: Text(
                                                                            DateFormat('dd MMMM').format(_selectedDay.value),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _startDate.value =
                                                                                DateFormat('dd MMMM').format(_selectedDay.value);
                                                                            Navigator.pop(context);
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
                                              Icons.calendar_today_outlined,
                                              size: 18,
                                              color: Colors.black54),
                                        ),
                                        Row(
                                          children: [
                                            ValueListenableBuilder(
                                              builder: (BuildContext context,
                                                  value, Widget? child) {
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('-'),
                                  ),

                                  ///end date
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          constraints:
                                              const BoxConstraints.tightFor(
                                                  height: 398),
                                          context: context,
                                          builder:
                                              (BuildContext context) =>
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child:
                                                          ValueListenableBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            value,
                                                            Widget? child) {
                                                          return Stack(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Center(
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
                                                                    Text(
                                                                      '   Select Date',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              lightColorScheme.primary),
                                                                    ),
                                                                    ValueListenableBuilder(
                                                                      builder: (BuildContext
                                                                              context,
                                                                          value,
                                                                          Widget?
                                                                              child) {
                                                                        return TableCalendar(
                                                                            headerStyle: const HeaderStyle(
                                                                                formatButtonVisible:
                                                                                    false),
                                                                            calendarStyle:
                                                                                CalendarStyle(
                                                                              isTodayHighlighted: false,
                                                                              selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                              selectedDecoration: BoxDecoration(color: lightColorScheme.primary, shape: BoxShape.circle),
                                                                            ),
                                                                            firstDay: DateTime.utc(
                                                                                2010,
                                                                                10,
                                                                                16),
                                                                            lastDay: DateTime.utc(
                                                                                2030,
                                                                                3,
                                                                                14),
                                                                            focusedDay: _focusedDay
                                                                                .value,
                                                                            rowHeight:
                                                                                32,
                                                                            selectedDayPredicate:
                                                                                (day) {
                                                                              return isSameDay(_selectedDay.value, day);

                                                                              // Return true if the day is within the selected range.
                                                                              // return _rangeStart != null &&
                                                                              //     _rangeEnd != null &&
                                                                              //     day.isAfter(_rangeStart!) &&
                                                                              //     day.isBefore(_rangeEnd!);
                                                                            },
                                                                            onDaySelected:
                                                                                (selectedDay, focusedDay) {
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
                                                                  bottom: 0,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: 10,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          color: lightColorScheme
                                                                              .primary
                                                                              .withOpacity(.2),
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width,
                                                                          height:
                                                                              40,
                                                                          child: Center(
                                                                              child: Text(
                                                                            DateFormat('dd MMMM').format(_selectedDay.value),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _endDate.value =
                                                                                DateFormat('dd MMMM').format(_selectedDay.value);
                                                                            Navigator.pop(context);
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
                                              builder: (BuildContext context,
                                                  value, Widget? child) {
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

                              //guests size
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          constraints:
                                              const BoxConstraints.tightFor(
                                                  height: 180),
                                          context: context,
                                          builder:
                                              (BuildContext context) =>
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child:
                                                          ValueListenableBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            value,
                                                            Widget? child) {
                                                          return Column(
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
                                                                '   Guests',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: lightColorScheme
                                                                        .primary),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        5),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    const Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'Number of Guests',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black87),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          35,
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            numberOfGuestsController.value,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          contentPadding: EdgeInsets.symmetric(
                                                                              horizontal: 30,
                                                                              vertical: 14),
                                                                          floatingLabelBehavior:
                                                                              FloatingLabelBehavior.never,
                                                                          labelStyle:
                                                                              TextStyle(color: Colors.grey),
                                                                          focusedBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.lightBlue),
                                                                              borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                          enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.grey),
                                                                              borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                          fillColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                                                        child: Text(
                                                                      numberOfGuestsController
                                                                          .value
                                                                          .text,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    )),
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    child: ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                          backgroundColor:
                                                                              lightColorScheme.primary,
                                                                          minimumSize:
                                                                              const Size.fromHeight(40),
                                                                        ),
                                                                        onPressed: () {
                                                                          numberGuests.value = numberOfGuestsController
                                                                              .value
                                                                              .text;
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text('Apply')),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                        valueListenable:
                                                            numberOfGuestsController,
                                                      ),
                                                    ),
                                                  ));
                                    },
                                    child: ValueListenableBuilder(
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15),
                                              child: Icon(
                                                  Icons.person_2_outlined,
                                                  size: 18,
                                                  color: Colors.black54),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(numberGuests.value),
                                            )
                                          ],
                                        );
                                      },
                                      valueListenable: numberGuests,
                                    ),
                                  )),

                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: lightColorScheme.primary,
                                    minimumSize: const Size.fromHeight(40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                EventSearchResultPage(
                                                  endDate: _endDate.value,
                                                  numberOfGuests:
                                                      numberGuests.value,
                                                  searchQuery:
                                                      destinationController
                                                          .text,
                                                  startDate: _startDate.value,
                                                  eventServices: eventsList,
                                                )));
                                  },
                                  child: const Text('Search'))
                            ],
                          ),
                        ),
                      ),

                      ///best spaces
                      ///
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Best Event Spaces',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 330,
                        child: ListView.builder(
                            itemCount: eventsList.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                EventDetailsPage(
                                                  endDate: '',
                                                  startDate: '',
                                                  eventService:
                                                      eventsList[index],
                                                  numberOfGuests: '',
                                                  destination: '',
                                                )));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(7),
                                                bottomLeft: Radius.circular(7)),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/event_space.png'))),
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
                                                DocumentReference docRef =
                                                    FirebaseFirestore.instance.doc(
                                                        'event-services/${eventsList[index].id}');

                                                if (eventsList[index]
                                                        .isFavorite ==
                                                    false) {
                                                  await Wishlist.addToWishlist(
                                                      eventsList[index].id,
                                                      eventsList[index].name,
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid,
                                                      'event-rentals',
                                                      eventsList[index].price,
                                                      eventsList[index]
                                                          .images
                                                          .first,
                                                      '',
                                                      '',
                                                      '',
                                                      eventsList[index].rating,
                                                      '',
                                                      '');

                                                  docRef.update(
                                                      {'isFavorite': true});
                                                } else {
                                                  await Wishlist
                                                      .removeFromWishlist(
                                                          eventsList[index].id);
                                                  docRef.update(
                                                      {'isFavorite': false});
                                                }
                                              },
                                              child: eventsList[index]
                                                          .isFavorite ==
                                                      true
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
                                                  topRight: Radius.circular(7),
                                                  bottomRight:
                                                      Radius.circular(7)),
                                              color: Color(0xffe7e7f4)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                      eventsList[index].name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                    Text(
                                                      eventsList[index]
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
                                                      color: Color(0xfff8c123),
                                                    ),
                                                    Text(
                                                      '  ${eventsList[index].rating}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${eventsList[index].review} reviews',
                                                      style: Theme.of(context)
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
                                ),
                              );
                            }),
                      )
                    ],
                  )
                ],
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
            }
            return const Center(
              child: Text('Sorry no event '),
            );
          }),
    );
  }
}
