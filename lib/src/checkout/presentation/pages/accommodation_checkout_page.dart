import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/user_personal_details_form.dart';

import '../../../../shared/utils/validator.dart';
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
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  late String country = '';
  bool isSavedToAccount = false;
  bool isWorkSelected = false;
  bool isLeisureSelected = false;

  final formKey = GlobalKey<FormState>();

  List<DropdownMenuItem> countrys = [
    const DropdownMenuItem(
      value: 'Ghana',
      child: Text('Ghana'),
    ),
    const DropdownMenuItem(value: 'Nigeria', child: Text('Nigeria'))
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'First Name(*)',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        TextFormField(
                          validator: Validator.name,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: theme.colorScheme.error, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            fillColor: Colors.white,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            'Last Name(*)',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        TextFormField(
                          validator: Validator.name,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: theme.colorScheme.error, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            fillColor: Colors.white,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            'Email Address(*)',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        TextFormField(
                          validator: Validator.email,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: theme.colorScheme.error, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            fillColor: Colors.white,
                          ),
                        ),

                        //country
                        const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 5),
                          child: Text(
                            'Country',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                fillColor: Colors.white,
                              ),
                              hint: const Text('select country'),
                              items: countrys,
                              onChanged: (selectedCountry) =>
                                  country = selectedCountry),
                        ),

                        ///phone number
                        ///

                        const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 5),
                          child: Text(
                            'Contact number(*)',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 1, bottom: 10),
                            child: SizedBox(
                              height: 70,
                              child: IntlPhoneField(
                                  validator: (phoneNumber) =>
                                      Validator.phoneNumber(
                                          phoneNumber?.number),
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.lightBlue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: theme.colorScheme.error,
                                            width: 2),
                                      ),
                                      filled: true,
                                      fillColor: theme.colorScheme.surface
                                          .withOpacity(0.9)),
                                  controller: phoneNumberController,
                                  showDropdownIcon: false,
                                  disableLengthCheck: true,
                                  // validator to check if length is 10

                                  flagsButtonPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 15),
                                  initialCountryCode: 'GH',
                                  // countries: const ['GH', 'NG', 'KE'],
                                  onChanged: (phone) {
                                    phoneNumber = phone.completeNumber;
                                  }),
                            )),

                        Row(
                          children: [
                            Checkbox.adaptive(
                                side: BorderSide(color: Colors.grey),
                                fillColor: MaterialStateProperty.all(
                                    lightColorScheme.primary),
                                value: isSavedToAccount,
                                onChanged: (val) {
                                  setState(() {
                                    isSavedToAccount = !isSavedToAccount;
                                  });
                                }),
                            Text(
                              'Save to your account',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What is the purpose for your trip ',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox.adaptive(
                                          side: BorderSide(color: Colors.grey),
                                          fillColor: MaterialStateProperty.all(
                                              lightColorScheme.primary),
                                          value: isWorkSelected,
                                          onChanged: (val) {
                                            setState(() {
                                              isSavedToAccount =
                                                  !isSavedToAccount;
                                            });
                                          }),
                                      Text(
                                        'Work',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox.adaptive(
                                          side: BorderSide(color: Colors.grey),
                                          fillColor: MaterialStateProperty.all(
                                              lightColorScheme.primary),
                                          value: isLeisureSelected,
                                          onChanged: (val) {
                                            setState(() {
                                              isSavedToAccount =
                                                  !isSavedToAccount;
                                            });
                                          }),
                                      Text(
                                        'Leisure',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        Divider(),

                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: lightColorScheme.primary.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        backgroundColor:
                                            lightColorScheme.primary,
                                        minimumSize: const Size.fromHeight(40),
                                      ),
                                      onPressed: () async {
                                        DateTime currentDate = DateTime.now();
                                        String date =
                                            '${currentDate.day}- ${currentDate.month} - ${currentDate.year}';
                                        // await Orders.addOrder();
                                        ///add order
                                        ///
                                        if (formKey.currentState!.validate()) {
                                          await Orders.addOrder(
                                            'pending',
                                            'order-123',
                                            widget.name,
                                            FirebaseAuth
                                                .instance.currentUser!.uid,
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
                                        }
                                      },
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
