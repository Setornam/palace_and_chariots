import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/item_gallery_page.dart';

class VehicleDetailsPage extends StatefulWidget {
  final String numberOfSeats, name, category, price, color, rating, luggage;
  final String? transmission;
  final List<String> otherFeatures, images;
  const VehicleDetailsPage(
      {super.key,
      required this.numberOfSeats,
      required this.name,
      required this.price,
      required this.color,
      required this.rating,
      required this.luggage,
      required this.otherFeatures,
      required this.images,
      required this.transmission, required this.category});

  @override
  State<VehicleDetailsPage> createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          widget.name,
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
                    Image.asset('assets/images/benz-front1.png'),
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
                                    image: AssetImage(
                                        'assets/images/benz-front.png'))),
                          ),
                          Container(
                            height: 80,
                            width: 150,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/benz-front.png'))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ItemGalleryPage()));
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black87),
                              ),
                              Text(
                                'GHS ${widget.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: lightColorScheme.primary),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${widget.color}    ',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black87),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color(0xfff8c123),
                                  ),
                                  Text(
                                    widget.rating,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.numberOfSeats,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, right: 100),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      color: Colors.black54,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.transmission!,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          
                          
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.luggage_rounded,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.luggage,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(top: 5, right: 55),
                              //   child: Row(
                              //     children: [
                              //       Icon(
                              //         Icons.ac_unit,
                              //         color: Colors.black54,
                              //         size: 20,
                              //       ),
                              //       Text(
                              //         widget.otherFeatures.first,
                              //         style: TextStyle(
                              //             fontSize: 15, color: Colors.black87),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline,
                                    color: lightColorScheme.primary),
                                Text(
                                  '  Free Cancellation up to 24 hours before pick up ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: lightColorScheme.primary),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE7E7F4),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 50),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Enter pick up location',
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightBlue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffe7e9f4)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              fillColor: Colors.white,
                            ),
                          ),
                        ),

                        //pick up
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //pick up date
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(
                                                Icons.calendar_today_outlined),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 25),
                                            child: Text(
                                              'Pick up date',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 35),
                                        child: Text(
                                          'Sun 2 Apr 2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              //pick up time
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.access_time),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 25),
                                            child: Text(
                                              'Pick up time',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '9:00 AM',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        //drop off
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //pick up date
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(
                                                Icons.calendar_today_outlined),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 25),
                                            child: Text(
                                              'Drop off date',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 35),
                                        child: Text(
                                          'Sun 2 Apr 2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              //drop off time
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.access_time),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Text(
                                              'Drop off time',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '9:00 AM',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CheckoutPage()));
                    },
                    child: Text('Submit')),
              ))
        ],
      ),
    );
  }
}