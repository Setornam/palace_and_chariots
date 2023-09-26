import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

import '../../../rentals/vehicle/domain/entities/vehicle.dart';
import '../../services/order.dart';
import '../widgets/driver_details_form.dart';
import '../widgets/success_page.dart';
import '../widgets/user_info_form.dart';

class CheckoutPage extends StatefulWidget {
  final String name, color, rating, seats, image, transmission, price;
  const CheckoutPage(
      {super.key,
      required this.name,
      required this.color,
      required this.rating,
      required this.seats,
      required this.transmission,
      required this.image,
      required this.price});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late String driverAvailable = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.image))),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87),
                      ),
                      Row(
                        children: [
                          Text(
                            '${widget.color}   ',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Color(0xfff8c123),
                          ),
                          Text(
                            widget.rating,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15, right: 30),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.black87,
                                  size: 20,
                                ),
                                Text(
                                  widget.seats,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, right: 70),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Text(
                                  widget.transmission,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Do you need a driver?',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Row(
                    children: [
                      Radio.adaptive(
                          activeColor: Colors.grey,
                          fillColor: MaterialStateProperty.all(
                              lightColorScheme.primary),
                          value: "Yes",
                          groupValue: driverAvailable,
                          onChanged: (value) {
                            setState(() {
                              driverAvailable = value!;
                            });
                          }),
                      const Text(
                        'Yes',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio.adaptive(
                          fillColor: MaterialStateProperty.all(
                              lightColorScheme.primary),
                          value: "No",
                          groupValue: driverAvailable,
                          onChanged: (value) {
                            setState(() {
                              driverAvailable = value!;
                            });
                          }),
                      const Text(
                        'No',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  )
                ],
              ),

              //rental charges
              Text(
                'Rental Charges',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Car hiring cost per day',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'GHS 230',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const Divider(),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cost for 3 days',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'GHS 830',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const Divider(),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Driver for 3 days',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'GHS 830',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sum Total',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'GHS 830',
                    style: TextStyle(
                      color: lightColorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              DriverDetailsForm(),

              UserInfoForm(),

              const Text(
                'Terms and conditions',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      'By clicking Book Now , you are confirming that you\nhave read, understood and accepted our',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      DateTime currentDate = DateTime.now();
                      String date =
                          '${currentDate.day}- ${currentDate.month} - ${currentDate.year}';

                      ///add order
                      await Orders.addOrder(
                          'order-123',
                          widget.name,
                          FirebaseAuth.instance.currentUser!.uid,
                          'vehicle-rentals',
                          widget.price,
                          widget.image,
                          date,
                          widget.color,
                          widget.seats);

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SuccessPage()));

                      // ignore: use_build_context_synchronously
                    },
                    child: Text('Book Now')),
              )
            ],
          ),
        ));
  }
}
