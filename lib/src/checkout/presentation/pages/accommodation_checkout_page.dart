import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/user_personal_details_form.dart';

import '../../services/order.dart';
import '../widgets/driver_details_form.dart';
import '../widgets/success_page.dart';
import '../widgets/user_info_form.dart';

class AccommodationCheckoutPage extends StatefulWidget {
  final String name, image, distance, rating, reviews, room, price;
  const AccommodationCheckoutPage(
      {super.key,
      required this.name,
      required this.distance,
      required this.rating,
      required this.reviews,
      required this.room,
      required this.price,
      required this.image});

  @override
  State<AccommodationCheckoutPage> createState() =>
      _AccommodationCheckoutPageState();
}

class _AccommodationCheckoutPageState extends State<AccommodationCheckoutPage> {
  late String driverAvailable = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Personal Info'),
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: const [
                userPersonalDetailsForm(),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: lightColorScheme.primary.withOpacity(0.1),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('\$300 (USD)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 18,
                                      color: lightColorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    )),
                            Text('Include taxes and charges',
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
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.primary,
                              minimumSize: const Size.fromHeight(40),
                            ),
                            onPressed: () async {
                              DateTime currentDate = DateTime.now();
                              String date =
                                  '${currentDate.day}- ${currentDate.month} - ${currentDate.year}';
                              // await Orders.addOrder();
                              ///add order
                              await Orders.addOrder(
                                'order-123',
                                widget.name,
                                FirebaseAuth.instance.currentUser!.uid,
                                'accommodation-rentals',
                                widget.price,
                                widget.image,
                                date,
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                widget.distance,
                                '',
                                '',
                                '',
                                widget.rating,
                                widget.reviews,
                                '',
                                widget.room,
                              );

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SuccessPage()));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.green[300],
                                content: const Text(
                                  'Your order has been placed successfully',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.85,
                                    right: 20,
                                    left: 20),
                              ));
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ))
        ]));
  }
}
