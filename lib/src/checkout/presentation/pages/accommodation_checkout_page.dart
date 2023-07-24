import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/user_personal_details_form.dart';

import '../widgets/driver_details_form.dart';
import '../widgets/user_info_form.dart';

class AccommodationCheckoutPage extends StatefulWidget {
  const AccommodationCheckoutPage({super.key});

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
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              userPersonalDetailsForm(),
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
                    onPressed: () {},
                    child: Text('Book Now')),
              )
            ],
          ),
        ));
  }
}
