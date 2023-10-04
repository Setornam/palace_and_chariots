import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/security_checkout_page.dart';

import '../widgets/travel_user_form.dart';

class TravelCheckoutPage extends StatefulWidget {
  final String startDate, endDate, takeOff, destination;
  const TravelCheckoutPage({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.takeOff,
    required this.destination,
  });

  @override
  State<TravelCheckoutPage> createState() => _TravelCheckoutPageState();
}

class _TravelCheckoutPageState extends State<TravelCheckoutPage> {
  TextEditingController phoneNumberController = TextEditingController();

  bool isDropoffSelected = false;
  bool isPickupSelected = false;
  bool isSecuritySelected = false;
  bool isTourismSelected = false;
  bool isAccommodationSelected = false;
  bool isCarRentalSelected = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Booking details',
            style: TextStyle(color: lightColorScheme.primary),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //depart
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Text('Depart ${widget.startDate}'),
                    ),
                    Row(
                      children: [
                        // const Text('(ACC)'),
                        Container(
                          width: 180,
                          child: const Divider(
                            height: 2,
                          ),
                        ),
                        const Icon(Icons.connecting_airports_outlined),
                        const SizedBox(
                          width: 108,
                          child: Divider(
                            height: 2,
                          ),
                        ),
                        // const Text('(XYZ)')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${widget.takeOff} Airport'),
                        Text('${widget.destination} Airport')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.takeOff),
                        Text(widget.destination)
                      ],
                    )
                  ],
                ),

                //return
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Return ${widget.endDate}'),
                      ),
                      Row(
                        children: [
                          // const Text('(ACC)'),
                          Container(
                            width: 180,
                            child: const Divider(
                              height: 2,
                            ),
                          ),
                          const Icon(Icons.connecting_airports_outlined),
                          const SizedBox(
                            width: 108,
                            child: Divider(
                              height: 2,
                            ),
                          ),
                          // const Text('(XYZ)')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.takeOff} Airport'),
                          Text('${widget.destination} Airport')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.takeOff),
                          Text(widget.destination)
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'I am interested in ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                  side: const BorderSide(color: Colors.grey),
                                  fillColor: MaterialStateProperty.all(
                                      lightColorScheme.primary),
                                  value: isDropoffSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      isDropoffSelected = !isDropoffSelected;
                                    });
                                  }),
                              const Text(
                                'Drop off',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                  side: const BorderSide(color: Colors.grey),
                                  fillColor: MaterialStateProperty.all(
                                      lightColorScheme.primary),
                                  value: isPickupSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      isPickupSelected = !isPickupSelected;
                                    });
                                  }),
                              const Text(
                                'Pick Up',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                  side: const BorderSide(color: Colors.grey),
                                  fillColor: MaterialStateProperty.all(
                                      lightColorScheme.primary),
                                  value: isSecuritySelected,
                                  onChanged: (val) {
                                    setState(() {
                                      isSecuritySelected = !isSecuritySelected;
                                    });
                                  }),
                              const Text(
                                'Security',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                  side: const BorderSide(color: Colors.grey),
                                  fillColor: MaterialStateProperty.all(
                                      lightColorScheme.primary),
                                  value: isTourismSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      isTourismSelected = !isTourismSelected;
                                    });
                                  }),
                              const Text(
                                'Tourism',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                  side: const BorderSide(color: Colors.grey),
                                  fillColor: MaterialStateProperty.all(
                                      lightColorScheme.primary),
                                  value: isAccommodationSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      isAccommodationSelected =
                                          !isAccommodationSelected;
                                    });
                                  }),
                              const Text(
                                'Accommodation',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                  side: const BorderSide(color: Colors.grey),
                                  fillColor: MaterialStateProperty.all(
                                      lightColorScheme.primary),
                                  value: isCarRentalSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      isCarRentalSelected =
                                          !isCarRentalSelected;
                                    });
                                  }),
                              const Text(
                                'Car Rentals',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightColorScheme.primary,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TravelUserForm(
                                        endDate: widget.endDate,
                                        startDate: widget.startDate,
                                        destination: widget.destination,
                                        takeOff: widget.takeOff,
                                      )));
                        },
                        child: const Text('Next')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
