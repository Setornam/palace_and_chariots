import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/accommodation_gallery.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/rooms_page.dart';

import '../../accommodation/domain/entities/accommodation.dart';

class AccommodationDetailsPage extends StatefulWidget {
  final Accommodation? accommodation;
  final String? startDate,
      endDate,
      numberOfRooms,
      numberOfAdults,
      numberOfChildren;

  const AccommodationDetailsPage(
      {super.key,
      this.accommodation,
      this.startDate,
      this.endDate,
      this.numberOfRooms,
      this.numberOfAdults,
      this.numberOfChildren});

  @override
  State<AccommodationDetailsPage> createState() =>
      _AccommodationDetailsPageState();
}

class _AccommodationDetailsPageState extends State<AccommodationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('${widget.startDate} - ${widget.endDate}',
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
                                image: AssetImage('assets/images/room.jpg'))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/room.jpg'))),
                            ),
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/room.jpg'))),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const AccommodationGalleryPage()));
                                  },
                                  child: Container(
                                    color: Colors.black.withOpacity(.5),
                                    child: const Center(
                                      child: Text(
                                        '+5',
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
                                  widget.accommodation!.name,
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
                                      widget.accommodation!.rating,
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
                                            const EdgeInsets.only(right: 20),
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
                                              widget.startDate!,
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
                                            widget.endDate!,
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
                                    'Rooms and guests',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                  Text(
                                    '${widget.numberOfRooms} rooms - ${widget.numberOfAdults} adults  ${widget.numberOfChildren} children',
                                    style: TextStyle(
                                        color: lightColorScheme.primary),
                                  )
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'US\$ ${widget.accommodation!.price}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: lightColorScheme.primary),
                                  ),
                                  const Text(
                                    'include taxes and charges',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset('assets/images/map.png'),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(
                                        'Tetteh Quarshie opposite Accra\n Mall East Legon Accra'),
                                  ],
                                )
                              ],
                            ),

                            //most popular facilities
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Most popular facilities',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.pool),
                                            Text(
                                              '1 swimming pool',
                                              style: TextStyle(
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
                                            Icon(Icons.local_parking),
                                            Text(
                                              'Private Parking',
                                              style: TextStyle(
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
                                                'Free Wifi in all areas',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons
                                                .wheelchair_pickup_outlined),
                                            Text(
                                              'Facilities for disabled guests',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.family_restroom),
                                            Text(
                                              'family rooms',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.spa),
                                            Text(
                                              'Spa and wellness center',
                                              style: TextStyle(
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
                                              Icon(Icons.check),
                                              Text(
                                                'Airport Shuttle',
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
                                              'Free Parking',
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
                                  builder: (BuildContext context) => RoomsPage(
                                        rooms: widget.accommodation!.rooms,
                                        accommodation: widget.accommodation!,
                                        checkInDate: widget.startDate!,
                                        checkOutDate: widget.endDate!,
                                        numberOfAdults: widget.numberOfAdults!,
                                        numberOfChildren:
                                            widget.numberOfChildren!,
                                        numberOfRooms: widget.numberOfRooms!,
                                      )));
                        },
                        child: const Text('select rooms')),
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
