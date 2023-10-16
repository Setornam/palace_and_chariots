import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/utils/validator.dart';
import '../../services/order.dart';
import '../../services/save_to_account.dart';
import '../widgets/success_page.dart';

class SalesCheckoutPage extends StatefulWidget {
  final String? name,
      image,
      seats,
      transmission,
      speed,
      service,
      location,
      condition,
      bathrooms,
      price,
      color,
      rating,
      bedrooms;

  const SalesCheckoutPage(
      {super.key,
      this.name,
      this.image,
      this.seats,
      this.transmission,
      this.speed,
      this.service,
      this.location,
      this.condition,
      this.bathrooms,
      this.bedrooms,
      this.price,
      this.color,
      this.rating});

  @override
  State<SalesCheckoutPage> createState() => _SalesCheckoutPageState();
}

class _SalesCheckoutPageState extends State<SalesCheckoutPage> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  late String country = '';

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isSavedToAccount = false;

  List<DropdownMenuItem> countrys = [
    const DropdownMenuItem(
      value: 'Ghana',
      child: Text('Ghana'),
    ),
    const DropdownMenuItem(value: 'Nigeria', child: Text('Nigeria'))
  ];

  getAccount() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String? userID = _auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('account')
        .where('user_id', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        firstNameController.text = doc['first_name'];
        lastNameController.text = doc['last_name'];
        phoneNumberController.text = doc['phone_number'];
        emailController.text = doc['email'];
        country = doc['country'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAccount();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Personal Info',
            style: TextStyle(color: lightColorScheme.primary),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('account')
              .where('user_id',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;

              return documents.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'First Name(*)',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              TextFormField(
                                controller: firstNameController,
                                validator: Validator.name,
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
                                      borderSide:
                                          BorderSide(color: Colors.grey),
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
                                controller: lastNameController,
                                validator: Validator.name,
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
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  fillColor: Colors.white,
                                ),
                              ),
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
                                    height: 50,
                                    child: IntlPhoneField(
                                        validator: (phone) =>
                                            Validator.phoneNumber(phoneNumber),
                                        decoration: InputDecoration(
                                            alignLabelWithHint: true,
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide(
                                                            color: Colors
                                                                .lightBlue),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(5))),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide(
                                                            color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                  color:
                                                      theme.colorScheme.error,
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
                                      side:
                                          const BorderSide(color: Colors.grey),
                                      fillColor: MaterialStateProperty.all(
                                          lightColorScheme.primary),
                                      value: isSavedToAccount,
                                      onChanged: (val) {
                                        setState(() {
                                          isSavedToAccount = !isSavedToAccount;
                                        });
                                      }),
                                  const Text(
                                    'Save to your account',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            lightColorScheme.primary,
                                        minimumSize: const Size.fromHeight(50),
                                      ),
                                      onPressed: () async {
                                        DateTime currentDate = DateTime.now();
                                        String date =
                                            '${currentDate.day}- ${currentDate.month} - ${currentDate.year}';
                                        var uuid = const Uuid();
                                        String orderId = uuid.v4();
                                        // await Orders.addOrder();
                                        ///add order

                                        if (formKey.currentState!.validate()) {
                                          if (widget.service == 'car-sales') {
                                            await Orders.addOrder(
                                                'Active',
                                                'order-$orderId',
                                                widget.name!,
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                widget.service!,
                                                '',
                                                widget.image!,
                                                date,
                                                widget.color,
                                                widget.seats,
                                                widget.transmission,
                                                widget.speed,
                                                '',
                                                '',
                                                '',
                                                '',
                                                '',
                                                '',
                                                '',
                                                '',
                                                widget.rating,
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
                                                emailController.text,
                                                firstNameController.text,
                                                lastNameController.text,
                                                phoneNumberController.text,
                                                country);

                                            if (isSavedToAccount == true) {
                                              Account.saveToAccount(
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid,
                                                  emailController.text,
                                                  firstNameController.text,
                                                  lastNameController.text,
                                                  phoneNumberController.text,
                                                  country);
                                            }
                                          } else {
                                            await Orders.addOrder(
                                                'Active',
                                                'order-$orderId',
                                                widget.name!,
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                widget.service!,
                                                widget.price!,
                                                widget.image!,
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
                                                '',
                                                '',
                                                '',
                                                '',
                                                '',
                                                widget.condition,
                                                widget.location,
                                                widget.bathrooms,
                                                widget.bedrooms,
                                                '',
                                                '',
                                                emailController.text,
                                                firstNameController.text,
                                                lastNameController.text,
                                                phoneNumberController.text,
                                                country);

                                            if (isSavedToAccount == true) {
                                              Account.saveToAccount(
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid,
                                                  emailController.text,
                                                  firstNameController.text,
                                                  lastNameController.text,
                                                  phoneNumberController.text,
                                                  country);
                                            }
                                          }

                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SuccessPage()));
                                        }
                                      },
                                      child: const Text('Submit')),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : ListView(
                      children: documents
                          .map((doc) => Stack(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Form(
                                    key: formKey,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'First Name(*)',
                                              style: TextStyle(
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: firstNameController,
                                            validator: Validator.name,
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 14),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.lightBlue),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 20, bottom: 5),
                                            child: Text(
                                              'Last Name(*)',
                                              style: TextStyle(
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: lastNameController,
                                            validator: Validator.name,
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 14),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.lightBlue),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 15, bottom: 5),
                                            child: Text(
                                              'Contact number(*)',
                                              style: TextStyle(
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1, bottom: 10),
                                              child: SizedBox(
                                                height: 50,
                                                child: IntlPhoneField(
                                                    validator: (phone) =>
                                                        Validator.phoneNumber(
                                                            phoneNumber),
                                                    decoration: InputDecoration(
                                                        alignLabelWithHint:
                                                            true,
                                                        focusedBorder: const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .lightBlue),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        5))),
                                                        enabledBorder: const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        5))),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          borderSide: BorderSide(
                                                              color: theme
                                                                  .colorScheme
                                                                  .error,
                                                              width: 2),
                                                        ),
                                                        filled: true,
                                                        fillColor: theme.colorScheme.surface.withOpacity(0.9)),
                                                    controller: phoneNumberController,
                                                    showDropdownIcon: false,
                                                    disableLengthCheck: true,
                                                    // validator to check if length is 10

                                                    flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 15),
                                                    initialCountryCode: 'GH',
                                                    // countries: const ['GH', 'NG', 'KE'],
                                                    onChanged: (phone) {
                                                      phoneNumber =
                                                          phone.completeNumber;
                                                    }),
                                              )),
                                          Row(
                                            children: [
                                              Checkbox.adaptive(
                                                  side: const BorderSide(
                                                      color: Colors.grey),
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          lightColorScheme
                                                              .primary),
                                                  value: isSavedToAccount,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      isSavedToAccount =
                                                          !isSavedToAccount;
                                                    });
                                                  }),
                                              const Text(
                                                'Save to your account',
                                                style: TextStyle(
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        lightColorScheme
                                                            .primary,
                                                    minimumSize:
                                                        const Size.fromHeight(
                                                            50),
                                                  ),
                                                  onPressed: () async {
                                                    DateTime currentDate =
                                                        DateTime.now();
                                                    String date =
                                                        '${currentDate.day}- ${currentDate.month} - ${currentDate.year}';
                                                    var uuid = const Uuid();
                                                    String orderId = uuid.v4();
                                                    // await Orders.addOrder();
                                                    ///add order

                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      if (widget.service ==
                                                          'car-sales') {
                                                        await Orders.addOrder(
                                                            'Active',
                                                            'order-$orderId',
                                                            widget.name!,
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid,
                                                            widget.service!,
                                                            '',
                                                            widget.image!,
                                                            date,
                                                            widget.color,
                                                            widget.seats,
                                                            widget.transmission,
                                                            widget.speed,
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            widget.rating,
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
                                                            emailController
                                                                .text,
                                                            firstNameController
                                                                .text,
                                                            lastNameController
                                                                .text,
                                                            phoneNumberController
                                                                .text,
                                                            country);
                                                      } else {
                                                        await Orders.addOrder(
                                                            'Active',
                                                            'order-$orderId',
                                                            widget.name!,
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid,
                                                            widget.service!,
                                                            widget.price!,
                                                            widget.image!,
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
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            '',
                                                            widget.condition,
                                                            widget.location,
                                                            widget.bathrooms,
                                                            widget.bedrooms,
                                                            '',
                                                            '',
                                                            emailController
                                                                .text,
                                                            firstNameController
                                                                .text,
                                                            lastNameController
                                                                .text,
                                                            phoneNumberController
                                                                .text,
                                                            country);
                                                      }

                                                      // ignore: use_build_context_synchronously
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SuccessPage()));
                                                    }
                                                  },
                                                  child: const Text('Submit')),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]))
                          .toList(),
                    );
            } else {
              if (snapshot.hasError) {
                return Text('Error');
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
