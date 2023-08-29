import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/item_gallery_page.dart';

class VehicleDetailsPage extends StatefulWidget {
  final String numberOfSeats, name, category, price, color, rating, luggage;
  final String? transmission, height, length, speed, range;
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
      required this.transmission,
      required this.category,
      this.height,
      this.length,
      this.range,
      this.speed});

  @override
  State<VehicleDetailsPage> createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
  DateTime pickUpDate = DateTime.now();
  DateTime dropOffDate = DateTime.now();
  DateFormat dateFormat = DateFormat("EEEE, d MMMM");
  TimeOfDay pickUpTime = TimeOfDay.now();
  TimeOfDay dropOffTime = TimeOfDay.now();

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
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * .82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.images[0]))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 80,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget.images[1]))),
                          ),
                          Container(
                            height: 80,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget.images[2]))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ItemGalleryPage(
                                                images: widget.images,
                                              )));
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
                                      Icons.airline_seat_recline_extra,
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
                              widget.category == "private jet"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 100),
                                          child: Text(widget.height!),
                                        ),
                                        Text(widget.length!),
                                      ],
                                    )
                                  : Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, right: 100),
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
                                                fontSize: 15,
                                                color: Colors.black87),
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
                              widget.category == "private jet"
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 75),
                                      child: Row(
                                        children: [
                                          Icon(Icons.air_sharp),
                                          Text('range: ${widget.range}'),
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          widget.category == "private jet"
                              ? Padding(
                                  padding: EdgeInsets.only(right: 75),
                                  child: Row(
                                    children: [
                                      Icon(Icons.speed),
                                      Text('speed: ${widget.speed}'),
                                    ],
                                  ),
                                )
                              : Container(),
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: pickUpDate,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null &&
                                          picked != pickUpDate) {
                                        setState(() {
                                          pickUpDate = picked;
                                        });
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Icon(Icons
                                                  .calendar_today_outlined),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 25),
                                              child: Text(
                                                'Pick up date',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 35),
                                          child: Text(
                                            dateFormat.format(pickUpDate),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              //pick up time
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final TimeOfDay? picked =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: pickUpTime,
                                      );
                                      if (picked != null &&
                                          picked != pickUpTime) {
                                        setState(() {
                                          pickUpTime = picked;
                                        });
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Icon(Icons.access_time),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 25),
                                              child: Text(
                                                'Pick up time',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            '${pickUpTime.hourOfPeriod}:${pickUpTime.minute.toString().padLeft(2, '0')} ${pickUpTime.period == DayPeriod.am ? 'AM' : 'PM'}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
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
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: pickUpDate,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null &&
                                          picked != pickUpDate) {
                                        setState(() {
                                          dropOffDate = picked;
                                        });
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Icon(Icons
                                                  .calendar_today_outlined),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 25),
                                              child: Text(
                                                'Drop off date',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 35),
                                          child: Text(
                                            dateFormat.format(dropOffDate),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              //drop off time
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 7),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final TimeOfDay? picked =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: dropOffTime,
                                      );
                                      if (picked != null &&
                                          picked != dropOffTime) {
                                        setState(() {
                                          dropOffTime = picked;
                                        });
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Icon(Icons.access_time),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Text(
                                                'Drop off time',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            '${dropOffTime.hourOfPeriod}:${dropOffTime.minute.toString().padLeft(2, '0')} ${dropOffTime.period == DayPeriod.am ? 'AM' : 'PM'}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
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
                              builder: (BuildContext context) => CheckoutPage(
                                    name: widget.name,
                                    color: widget.color,
                                    transmission: widget.transmission!,
                                    rating: widget.rating,
                                    seats: widget.numberOfSeats, image: widget.images.first,
                                  )));
                    },
                    child: Text('Submit')),
              ))
        ],
      ),
    );
  }
}
