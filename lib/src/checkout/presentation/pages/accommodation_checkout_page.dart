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
                            onPressed: () {},
                            child: Text(
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
