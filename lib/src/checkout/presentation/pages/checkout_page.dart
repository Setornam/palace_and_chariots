import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

import '../../../rentals/vehicle/domain/entities/vehicle.dart';
import '../widgets/driver_details_form.dart';
import '../widgets/user_info_form.dart';

class CheckoutPage extends StatefulWidget {
  final String name, color, rating, seats, image, transmission;
  const CheckoutPage(
      {super.key,
      required this.name,
      required this.color,
      required this.rating,
      required this.seats,
      required this.transmission,
      required this.image});

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
                  Text(
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

              Text(
                'Terms and conditions',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green[300],
                        content: const Text(
                          'Your booking has been placed successfully',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.85,
                            right: 20,
                            left: 20),
                      ));
                    },
                    child: Text('Book Now')),
              )
            ],
          ),
        ));
  }
}
