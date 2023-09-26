import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/success_page.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/travel_form.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/user_personal_details_form.dart';

import '../../services/order.dart';
import '../widgets/driver_details_form.dart';
import '../widgets/security_user_form.dart';
import '../widgets/user_info_form.dart';

class TravelUserForm extends StatefulWidget {
  final String startDate, endDate;
  const TravelUserForm(
      {super.key, required this.startDate, required this.endDate});

  @override
  State<TravelUserForm> createState() => _TravelUserFormState();
}

class _TravelUserFormState extends State<TravelUserForm> {
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
              children: [
                SecurityForm(),
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
                          '',
                          FirebaseAuth.instance.currentUser!.uid,
                          'travel',
                          '',
                          '',
                          date,
                          '',
                          '',
                          '',
                          '',
                          widget.startDate,
                          widget.endDate,
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
                        );

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessPage()));
                      },
                      child: const Text('Submit')),
                )
              ],
            ),
          ),
        ]));
  }
}
