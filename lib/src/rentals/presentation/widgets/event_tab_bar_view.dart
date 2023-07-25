import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/destination_search_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/events_search_result_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../shared/theme/color_scheme.dart';

class EventTabBarView extends StatefulWidget {
  const EventTabBarView({super.key});

  @override
  State<EventTabBarView> createState() => _EventTabBarViewState();
}

class _EventTabBarViewState extends State<EventTabBarView> {
  ValueNotifier<int> numberOfRooms = ValueNotifier(0);
  ValueNotifier<int> numberOfAdults = ValueNotifier(0);
  ValueNotifier<int> numberOfChildren = ValueNotifier(0);

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
                  borderRadius: BorderRadius.all(Radius.circular(7))),
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
                        children: [
                          const Icon(Icons.location_on_outlined,
                              size: 18, color: Colors.black54),
                          Text(
                            '   Enter destination',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),

                  //date
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            constraints:
                                const BoxConstraints.tightFor(height: 398),
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
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
                                          '   Select Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: lightColorScheme.primary),
                                        ),
                                        TableCalendar(
                                          firstDay: DateTime.utc(2010, 10, 16),
                                          lastDay: DateTime.utc(2030, 3, 14),
                                          focusedDay: DateTime.now(),
                                          rowHeight: 32,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                color: lightColorScheme.primary
                                                    .withOpacity(.2),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                height: 40,
                                                child: Center(
                                                    child: const Text(
                                                  '12 April - 12 April',
                                                  textAlign: TextAlign.center,
                                                )),
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          lightColorScheme
                                                              .primary,
                                                      minimumSize:
                                                          const Size.fromHeight(
                                                              40),
                                                    ),
                                                    onPressed: () {},
                                                    child: const Text('Apply')),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined,
                              size: 18, color: Colors.black54),
                          Text(
                            '   Fri 28 Apr - Sat, 29 Apr',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),

                  //room size
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            constraints:
                                const BoxConstraints.tightFor(height: 180),
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
                                          '   Guests',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: lightColorScheme.primary),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                  'Number of Guests',
                                                  style: TextStyle(
                                                      color: Colors.black87),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 35,
                                                width: 200,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30,
                                                            vertical: 14),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    labelStyle: TextStyle(
                                                        color: Colors.grey),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .lightBlue),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                    fillColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                              child: const Center(
                                                  child: Text(
                                                '12 April - 12 April',
                                                textAlign: TextAlign.center,
                                              )),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        lightColorScheme
                                                            .primary,
                                                    minimumSize:
                                                        const Size.fromHeight(
                                                            40),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text('Apply')),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.person_2_outlined,
                              size: 18, color: Colors.black54),
                          Text(
                            '   150',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightColorScheme.primary,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EventSearchResultPage()));
                        },
                        child: Text('Search')),
                  )
                ],
              ),
            ),
          ),

          ///best rooms
          ///
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'Best Rooms',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 330,
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    topLeft: Radius.circular(7),
                                    bottomLeft: Radius.circular(7)),
                                color: Color(0xffe7e7f4)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'The Queens Court Event',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        ' Available',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: lightColorScheme.primary),
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
                                        ' 4.5',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.bed,
                                          size: 18, color: Colors.black54),
                                      Text(
                                        '1 King size bed',
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
                  );
                }),
          )
        ],
      ),
    );
  }
}