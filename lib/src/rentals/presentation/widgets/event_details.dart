import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/event_checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/event_services/domain/entities/event_service.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/event_gallery.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/item_gallery_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/rooms_page.dart';

class EventDetailsPage extends StatefulWidget {
  final EventService eventService;
  final String startDate, endDate, destination, numberOfGuests;
  const EventDetailsPage(
      {super.key,
      required this.eventService,
      required this.startDate,
      required this.endDate,
      required this.numberOfGuests,
      required this.destination});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
            '${widget.destination}, ${widget.startDate} - ${widget.endDate}',
            style: Theme.of(context).textTheme.bodyLarge!),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black87,
              ))
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/event_space1.png'))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 80,
                              width: 200,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/event_space2.png'))),
                            ),
                            Container(
                              height: 80,
                              width: 130,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/event_space.png'))),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const EventGalleryPage()));
                                  },
                                  child: Container(
                                    color: Colors.black.withOpacity(.5),
                                    child: const Center(
                                      child: Text(
                                        '+12',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.eventService.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Color(0xfff8c123),
                                    ),
                                    Text(
                                      widget.eventService.rating,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Check in',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              widget.startDate,
                                              style: TextStyle(
                                                  color:
                                                      lightColorScheme.primary),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Check out',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            widget.endDate,
                                            style: TextStyle(
                                                color:
                                                    lightColorScheme.primary),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Number of Guests',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                  Text(
                                    widget.numberOfGuests,
                                    style: TextStyle(
                                        color: lightColorScheme.primary),
                                  )
                                ],
                              ),
                            ),

                            const Divider(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/map.png'),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                          'Tetteh Quarshie opposite Accra\n Mall East Legon Accra'),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            //most popular facilities
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Amenities and Services',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.family_restroom),
                                            Text(
                                              widget.eventService.amenities
                                                  .first['washrooms']!,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Row(
                                            children: [
                                              Icon(Icons.wifi),
                                              Text(
                                                widget.eventService.amenities
                                                    .first['free_wifi']!,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.power),
                                            Text(
                                              widget.eventService.amenities
                                                  .first['standby_generator']!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              children: [
                                                Icon(Icons
                                                    .baby_changing_station),
                                                Text(
                                                  widget.eventService.amenities
                                                      .first['changing_rooms']!,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black87),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.local_parking),
                                              Text(
                                                widget.eventService.amenities
                                                    .first['parking']!,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightColorScheme.primary,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EventCheckoutPage(
                                        location: '',
                                        name: widget.eventService.name,
                                        rating: widget.eventService.rating,
                                        review: '10 ',
                                        image: '',
                                        checkIn: widget.startDate,
                                        checkOut: widget.endDate,
                                        numberOfGuests: widget.numberOfGuests,
                                      )));
                        },
                        child: const Text('Reserve')),
                  ),
                )
              ],
            ),
          ),

          //btn
        ],
      ),
    );
  }
}
