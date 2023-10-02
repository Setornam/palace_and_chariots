import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

import '../../../../shared/utils/validator.dart';
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
  TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final userFormKey = GlobalKey<FormState>();

  String phoneNumber = "";
  late String country = '';
  late String title = '';

  TextEditingController userPhoneNumberController = TextEditingController();
  String userPhoneNumber = "";
  late String userCountry = '';

  bool isSavedToAccount = false;
  List<DropdownMenuItem> countrys = [
    const DropdownMenuItem(
      value: 'Ghana',
      child: Text('Ghana'),
    ),
    const DropdownMenuItem(value: 'Nigeria', child: Text('Nigeria'))
  ];

  List<DropdownMenuItem> titles = [
    const DropdownMenuItem(
      value: 'Mr.',
      child: Text('Mr.'),
    ),
    const DropdownMenuItem(value: 'Mrs.', child: Text('Mrs.')),
    const DropdownMenuItem(value: 'Dr.', child: Text('Dr.')),
    const DropdownMenuItem(value: 'Miss.', child: Text('Miss.'))
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
                                const Icon(
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
              driverAvailable == "Yes"
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Form(
                        key: formKey,
                        // autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Main drivers detail',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'As they appear on drivers license',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),

                            //title
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 5),
                              child: Text(
                                'Title',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 14),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.lightBlue),
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
                                    fillColor: Colors.white,
                                  ),
                                  hint: const Text('please select'),
                                  items: titles,
                                  onChanged: (selectedCountry) =>
                                      title = selectedCountry),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'Full Name(*)',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            TextFormField(
                              validator: Validator.name,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: const TextStyle(color: Colors.grey),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.error, width: 2),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                fillColor: Colors.white,
                              ),
                            ),

                            //email address
                            const Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5, top: 10),
                              child: Text(
                                'Email Address(*)',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            TextFormField(
                              validator: Validator.email,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: const TextStyle(color: Colors.grey),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.error, width: 2),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                fillColor: Colors.white,
                              ),
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
                                padding:
                                    const EdgeInsets.only(top: 1, bottom: 10),
                                child: SizedBox(
                                  height: 70,
                                  child: IntlPhoneField(
                                      validator: (phoneNumber) =>
                                          Validator.phoneNumber(
                                              phoneNumber?.number),
                                      decoration: InputDecoration(
                                          alignLabelWithHint: true,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.lightBlue),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5))),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
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

                            //country
                            const Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 5),
                              child: Text(
                                'Country of residence',
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    fillColor: Colors.white,
                                  ),
                                  hint: const Text('select country'),
                                  items: countrys,
                                  onChanged: (selectedCountry) =>
                                      country = selectedCountry),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'License number(*)',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            TextFormField(
                              validator: Validator.license,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: const TextStyle(color: Colors.grey),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.error, width: 2),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Divider(),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),

              ///user info form

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  key: userFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Your Information',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Full Name(*)',
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
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: theme.colorScheme.error, width: 2),
                          ),
                          fillColor: Colors.white,
                        ),
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
                                validator: (phone) =>
                                    Validator.phoneNumber(phoneNumber),
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.lightBlue),
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
                                controller: userPhoneNumberController,
                                showDropdownIcon: false,
                                disableLengthCheck: true,
                                // validator to check if length is 10

                                flagsButtonPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                initialCountryCode: 'GH',
                                // countries: const ['GH', 'NG', 'KE'],
                                onChanged: (phone) {
                                  phoneNumber = phone.completeNumber;
                                }),
                          )),

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

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Address(*)',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      TextFormField(
                        validator: Validator.address,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: theme.colorScheme.error, width: 2),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 5),
                        child: Text(
                          'City(*)',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      TextFormField(
                        validator: Validator.city,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: theme.colorScheme.error, width: 2),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),

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
                            Icon(Icons.error_outline,
                                color: lightColorScheme.primary),
                            Text(
                              '  Free Cancellation up to 24 hours before pick up ',
                              style: TextStyle(color: lightColorScheme.primary),
                            )
                          ],
                        ),
                      ),

                      Divider()
                    ],
                  ),
                ),
              ),

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

                      if (formKey.currentState!.validate() &&
                          userFormKey.currentState!.validate()) {
                        await Orders.addOrder(
                          'pending'
                              'order-123',
                          widget.name,
                          FirebaseAuth.instance.currentUser!.uid,
                          'vehicle-rentals',
                          widget.price,
                          widget.image,
                          date,
                          widget.color,
                          widget.seats,
                        );

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessPage()));
                      }

                      // ignore: use_build_context_synchronously
                    },
                    child: Text('Book Now')),
              )
            ],
          ),
        ));
  }
}
