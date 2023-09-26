import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/event_user_form.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/user_personal_details_form.dart';

import '../../../rentals/event_services/domain/entities/event_service.dart';
import '../../services/order.dart';
import '../widgets/driver_details_form.dart';
import '../widgets/success_page.dart';
import '../widgets/user_info_form.dart';

class EventCheckoutPage extends StatefulWidget {
  final String name, rating, review, image, location;

  const EventCheckoutPage({
    super.key,
    required this.name,
    required this.rating,
    required this.review,
    required this.location,
    required this.image,
  });

  @override
  State<EventCheckoutPage> createState() => _EventCheckoutPageState();
}

class _EventCheckoutPageState extends State<EventCheckoutPage> {
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
              children: [
                EventUserForm(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightColorScheme.primary,
                        minimumSize: const Size.fromHeight(50),
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
                          'event-rentals',
                          '',
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
                          '',
                          '',
                          '',
                          '',
                          widget.rating,
                          widget.review,
                          '',
                          '',
                        );

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessPage()));

                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   backgroundColor: Colors.green[300],
                        //   content: const Text(
                        //     'Your order has been placed successfully',
                        //     style: TextStyle(fontWeight: FontWeight.bold),
                        //   ),
                        //   behavior: SnackBarBehavior.floating,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   margin: EdgeInsets.only(
                        //       bottom: MediaQuery.of(context).size.height * 0.85,
                        //       right: 20,
                        //       left: 20),
                        // ));
                      },
                      child: Text('Submit')),
                )
              ],
            ),
          ),
        ]));
  }
}
