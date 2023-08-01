import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/sales_gallery_page.dart';

import '../../../checkout/presentation/pages/sales_checkout_page.dart';
import 'accomoodation_sales_gallery_page.dart';

class SalesDetailsPageAccommodation extends StatefulWidget {
  const SalesDetailsPageAccommodation({super.key});

  @override
  State<SalesDetailsPageAccommodation> createState() =>
      _SalesDetailsPageAccommodationState();
}

class _SalesDetailsPageAccommodationState
    extends State<SalesDetailsPageAccommodation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Accmmodation Details',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: lightColorScheme.primary),
        ),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.85,
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
                            width: 150,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/room.jpg'))),
                          ),
                          Container(
                            height: 80,
                            width: 150,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/room.jpg'))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const AccmmodationSalesGalleryPage()));
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
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Furnised 3 bedroom house',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black87),
                              ),
                              // Text(
                              //   'GHS 530',
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 15,
                              //       color: lightColorScheme.primary),
                              // ),
                            ],
                          ),

                          //Vehicle details
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.bed_outlined,
                                          color: Colors.black87,
                                          size: 20,
                                        ),
                                        Text(
                                          '4 beds',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.bathtub_outlined,
                                            color: Colors.black54,
                                            size: 20,
                                          ),
                                          Text(
                                            '5 baths',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.local_parking_rounded,
                                          color: Colors.black54,
                                          size: 20,
                                        ),
                                        Text(
                                          'Parking',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    color: Colors.black12,
                                    width: 2,
                                    height: 300,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                'Condition',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              'Newly Built',
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 65),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  'Property size',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                '23 sqm',
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        width: 180, child: const Divider()),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                'Furnishing',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              'Semi-Furnished',
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 65),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  'Out house',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                'Available',
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        width: 180, child: const Divider()),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  'Facilities',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                'Air Conditioning, Turbo, \nHot Water, Electricity',
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: 180, child: const Divider()),
                                  ],
                                )
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Request call back')),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.40,
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          constraints: BoxConstraints.tightFor(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 200),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Stack(children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                    child: Text(
                                                      'Chat box',
                                                      style: TextStyle(
                                                          color:
                                                              lightColorScheme
                                                                  .primary,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: TextFormField(
                                                      maxLines: 4,
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText:
                                                            'Type Message here',
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        4),
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
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        enabledBorder: OutlineInputBorder(
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
                                              Positioned(
                                                bottom: 0,
                                                child: SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.green,
                                                        minimumSize: const Size
                                                            .fromHeight(50),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    const SalesCheckoutPage()));
                                                      },
                                                      child:
                                                          const Text('Send')),
                                                ),
                                              )
                                            ]);
                                          });
                                    },
                                    icon: Icon(Icons.message),
                                    label: const Text('Start Chat')),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
