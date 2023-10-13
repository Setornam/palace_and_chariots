import 'package:flutter/material.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../../checkout/presentation/pages/accommodation_checkout_page.dart';
import '../../accommodation/domain/entities/accommodation.dart';
import '../../accommodation/domain/entities/room.dart';

class RoomsPage extends StatefulWidget {
  final List<Room> rooms;
  final Accommodation accommodation;
  final String checkInDate,
      checkOutDate,
      numberOfRooms,
      numberOfAdults,
      numberOfChildren;
  const RoomsPage(
      {super.key,
      required this.rooms,
      required this.accommodation,
      required this.checkInDate,
      required this.checkOutDate,
      required this.numberOfRooms,
      required this.numberOfAdults,
      required this.numberOfChildren});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Accra City Hotel - Choose rooms',
            style: Theme.of(context).textTheme.bodyLarge!),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                widget.rooms.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.man),
                                      Text(
                                        'Price for 2 adults',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.u_turn_right_outlined),
                                    Text(
                                      'Room size: 20m / 300ft',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.wifi),
                                      Text(
                                        'Free Wifi',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.bed),
                                    Text(
                                      widget.rooms[index].facilities.first,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.free_breakfast_outlined),
                                      Text(
                                        'Breakfast available',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.wine_bar),
                                    Text(
                                      'Complimentary minibar',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Text(
                                        'Air condition',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check),
                                    Text(
                                      'Free toiletries',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 200,
                                width: 150,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/room2.png'))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 50,
                            color: lightColorScheme.primary.withOpacity(0.1),
                            child: const Center(
                                child: Text(
                              'price for  nights (13 Apr - 15 Apr)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('\$${widget.rooms[index].price} (USD)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        color: lightColorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      )),
                              Text('Include taxes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 14,
                                      )),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: lightColorScheme.primary),
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(40),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      constraints:
                                          BoxConstraints.tightFor(height: 120),
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          color: lightColorScheme.primary
                                              .withOpacity(0.1),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        '\$${widget.rooms[index].price} (USD)',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              fontSize: 18,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                    Text(
                                                        'Include taxes and charges',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              fontSize: 14,
                                                            )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
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
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  AccommodationCheckoutPage(
                                                                    distance:
                                                                        '4km',
                                                                    image: widget
                                                                        .accommodation
                                                                        .images
                                                                        .first,
                                                                    name: widget
                                                                        .accommodation
                                                                        .name,
                                                                    price: widget
                                                                        .accommodation
                                                                        .price,
                                                                    rating: widget
                                                                        .accommodation
                                                                        .rating,
                                                                    reviews:
                                                                        '12',
                                                                    room: widget
                                                                        .accommodation
                                                                        .rooms
                                                                        .first
                                                                        .name,
                                                                    checkInDate:
                                                                        widget
                                                                            .checkInDate,
                                                                    checkOutDate:
                                                                        widget
                                                                            .checkOutDate,
                                                                    numberOfAdults:
                                                                        widget
                                                                            .numberOfAdults,
                                                                    numberOfCHildren:
                                                                        widget
                                                                            .numberOfChildren,
                                                                    numberOfRooms:
                                                                        widget
                                                                            .numberOfRooms,
                                                                  )));
                                                    },
                                                    child: const Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                      color: lightColorScheme.primary),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
