import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/event_user_form.dart';
import 'package:palace_and_chariots/src/checkout/presentation/widgets/user_personal_details_form.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/utils/validator.dart';
import '../../../rentals/event_services/domain/entities/event_service.dart';
import '../../services/order.dart';
import '../../services/save_to_account.dart';
import '../widgets/driver_details_form.dart';
import '../widgets/success_page.dart';
import '../widgets/user_info_form.dart';

class EventCheckoutPage extends StatefulWidget {
  final String name,
      rating,
      review,
      image,
      location,
      checkIn,
      checkOut,
      numberOfGuests;

  const EventCheckoutPage({
    super.key,
    required this.name,
    required this.rating,
    required this.review,
    required this.location,
    required this.image,
    required this.checkIn,
    required this.checkOut,
    required this.numberOfGuests,
  });

  @override
  State<EventCheckoutPage> createState() => _EventCheckoutPageState();
}

class _EventCheckoutPageState extends State<EventCheckoutPage> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  late String country = '';
  late String event = '';

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isSavedToAccount = false;
  bool isDecorationsSelected = false;
  bool isEventCoverageSelected = false;
  bool isSecuritySelected = false;
  bool isTransportationSelected = false;
  bool isOtherSelected = false;

  List<DropdownMenuItem> countrys = [
    const DropdownMenuItem(
      value: 'Ghana',
      child: Text('Ghana'),
    ),
    const DropdownMenuItem(value: 'Nigeria', child: Text('Nigeria'))
  ];

  List<DropdownMenuItem> eventTypes = [
    const DropdownMenuItem(
      value: 'Anniversary',
      child: Text('Anniversary'),
    ),
    const DropdownMenuItem(value: 'Birthday', child: Text('Birthday'))
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Personal Info'),
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
                  ? Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView(
                          children: [
                            ///event form
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
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
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.lightBlue),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        fillColor: Colors.white,
                                      ),
                                    ),

                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 5),
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
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.lightBlue),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        fillColor: Colors.white,
                                      ),
                                    ),

                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 5),
                                      child: Text(
                                        'Email Address(*)',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      validator: Validator.email,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 14),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.lightBlue),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        fillColor: Colors.white,
                                      ),
                                    ),

                                    //country
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text(
                                        'Country',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: DropdownButtonFormField(
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
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
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text(
                                        'Contact number(*)',
                                        style: TextStyle(color: Colors.black87),
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
                                                  alignLabelWithHint: true,
                                                  focusedBorder: const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.lightBlue),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5))),
                                                  enabledBorder: const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5))),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    borderSide: BorderSide(
                                                        color: theme
                                                            .colorScheme.error,
                                                        width: 2),
                                                  ),
                                                  filled: true,
                                                  fillColor: theme
                                                      .colorScheme.surface
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
                                                    lightColorScheme.primary),
                                            value: isSavedToAccount,
                                            onChanged: (val) {
                                              setState(() {
                                                isSavedToAccount =
                                                    !isSavedToAccount;
                                              });
                                            }),
                                        const Text(
                                          'Save to your account',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //event type
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 15, bottom: 5),
                                          child: Text(
                                            'Event type',
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: DropdownButtonFormField(
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 14),
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelStyle: TextStyle(
                                                    color: Colors.grey),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors
                                                                    .lightBlue),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                fillColor: Colors.white,
                                              ),
                                              hint: const Text(
                                                  'anniversary or birthday'),
                                              items: eventTypes,
                                              onChanged: (selectedEvent) =>
                                                  event = selectedEvent),
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'I am interested in ',
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Checkbox.adaptive(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value:
                                                          isDecorationsSelected,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          isDecorationsSelected =
                                                              !isDecorationsSelected;
                                                        });
                                                      }),
                                                  const Text(
                                                    'Decorations',
                                                    style: TextStyle(
                                                        color: Colors.black87),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Checkbox.adaptive(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value:
                                                          isEventCoverageSelected,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          isEventCoverageSelected =
                                                              !isEventCoverageSelected;
                                                        });
                                                      }),
                                                  const Text(
                                                    'Event Coverage',
                                                    style: TextStyle(
                                                        color: Colors.black87),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Checkbox.adaptive(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value: isSecuritySelected,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          isSecuritySelected =
                                                              !isSecuritySelected;
                                                        });
                                                      }),
                                                  const Text(
                                                    'Security',
                                                    style: TextStyle(
                                                        color: Colors.black87),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Checkbox.adaptive(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value:
                                                          isTransportationSelected,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          isTransportationSelected =
                                                              !isTransportationSelected;
                                                        });
                                                      }),
                                                  const Text(
                                                    'Transportation',
                                                    style: TextStyle(
                                                        color: Colors.black87),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Checkbox.adaptive(
                                                      side: const BorderSide(
                                                          color: Colors.grey),
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  lightColorScheme
                                                                      .primary),
                                                      value: isOtherSelected,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          isOtherSelected =
                                                              !isOtherSelected;
                                                        });
                                                      }),
                                                  const Text(
                                                    'Other',
                                                    style: TextStyle(
                                                        color: Colors.black87),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                    const Divider()
                                  ],
                                ),
                              ),
                            ),

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
                                    var uuid = Uuid();
                                    String orderId = uuid.v4();

                                    ///add order

                                    if (formKey.currentState!.validate()) {
                                      await Orders.addOrder(
                                          'Active',
                                          'order-$orderId',
                                          widget.name,
                                          FirebaseAuth
                                              .instance.currentUser!.uid,
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
                                          widget.checkIn,
                                          widget.checkOut,
                                          widget.rating,
                                          widget.review,
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
                                          country,
                                          widget.numberOfGuests);

                                      if (isSavedToAccount == true) {
                                        Account.saveToAccount(
                                            FirebaseAuth
                                                .instance.currentUser!.uid,
                                            emailController.text,
                                            firstNameController.text,
                                            lastNameController.text,
                                            phoneNumberController.text,
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
                                  child: Text('Submit')),
                            )
                          ],
                        ),
                      ),
                    ])
                  : SizedBox(
                      height: 1000,
                      child: Stack(
                        children: documents
                            .map((doc) => Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: SizedBox(
                                      height: 1000,
                                      child: ListView(
                                        children: [
                                          ///event form
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Form(
                                              key: formKey,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: Text(
                                                      'First Name(*)',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        firstNameController,
                                                    validator: Validator.name,
                                                    decoration:
                                                        const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 14),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelStyle: TextStyle(
                                                          color: Colors.grey),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .lightBlue),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      fillColor: Colors.white,
                                                    ),
                                                  ),

                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, bottom: 5),
                                                    child: Text(
                                                      'Last Name(*)',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        lastNameController,
                                                    validator: Validator.name,
                                                    decoration:
                                                        const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 14),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelStyle: TextStyle(
                                                          color: Colors.grey),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .lightBlue),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      fillColor: Colors.white,
                                                    ),
                                                  ),

                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20, bottom: 5),
                                                    child: Text(
                                                      'Email Address(*)',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: emailController,
                                                    validator: Validator.email,
                                                    decoration:
                                                        const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 14),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelStyle: TextStyle(
                                                          color: Colors.grey),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .lightBlue),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      fillColor: Colors.white,
                                                    ),
                                                  ),

                                                  //country
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15, bottom: 5),
                                                    child: Text(
                                                      'Country',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child:
                                                        DropdownButtonFormField(
                                                            decoration:
                                                                const InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          30,
                                                                      vertical:
                                                                          14),
                                                              floatingLabelBehavior:
                                                                  FloatingLabelBehavior
                                                                      .never,
                                                              labelStyle: TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .lightBlue),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5))),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .grey),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5))),
                                                              fillColor:
                                                                  Colors.white,
                                                            ),
                                                            hint: const Text(
                                                                'select country'),
                                                            items: countrys,
                                                            onChanged:
                                                                (selectedCountry) =>
                                                                    country =
                                                                        selectedCountry),
                                                  ),

                                                  ///phone number
                                                  ///

                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15, bottom: 5),
                                                    child: Text(
                                                      'Contact number(*)',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 1,
                                                              bottom: 10),
                                                      child: SizedBox(
                                                        height: 50,
                                                        child: IntlPhoneField(
                                                            validator: (phone) =>
                                                                Validator.phoneNumber(
                                                                    phoneNumber),
                                                            decoration:
                                                                InputDecoration(
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    focusedBorder: const OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color: Colors
                                                                                .lightBlue),
                                                                        borderRadius: BorderRadius.all(Radius.circular(
                                                                            5))),
                                                                    enabledBorder: const OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color: Colors
                                                                                .grey),
                                                                        borderRadius: BorderRadius.all(Radius.circular(
                                                                            5))),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide: BorderSide(
                                                                          color: theme
                                                                              .colorScheme
                                                                              .error,
                                                                          width:
                                                                              2),
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
                                                              phoneNumber = phone
                                                                  .completeNumber;
                                                            }),
                                                      )),

                                                  Row(
                                                    children: [
                                                      Checkbox.adaptive(
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                          fillColor:
                                                              MaterialStateProperty.all(
                                                                  lightColorScheme
                                                                      .primary),
                                                          value:
                                                              isSavedToAccount,
                                                          onChanged: (val) {
                                                            setState(() {
                                                              isSavedToAccount =
                                                                  !isSavedToAccount;
                                                            });
                                                          }),
                                                      const Text(
                                                        'Save to your account',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                    ],
                                                  ),

                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      //event type
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 15,
                                                                bottom: 5),
                                                        child: Text(
                                                          'Event type',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 10),
                                                        child:
                                                            DropdownButtonFormField(
                                                                decoration:
                                                                    const InputDecoration(
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              30,
                                                                          vertical:
                                                                              14),
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .never,
                                                                  labelStyle:
                                                                      TextStyle(
                                                                          color:
                                                                              Colors.grey),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .lightBlue),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5))),
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5))),
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                hint: const Text(
                                                                    'anniversary or birthday'),
                                                                items:
                                                                    eventTypes,
                                                                onChanged:
                                                                    (selectedEvent) =>
                                                                        event =
                                                                            selectedEvent),
                                                      ),
                                                    ],
                                                  ),

                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 20,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              'I am interested in ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Checkbox
                                                                    .adaptive(
                                                                        side: const BorderSide(
                                                                            color: Colors
                                                                                .grey),
                                                                        fillColor:
                                                                            MaterialStateProperty.all(lightColorScheme
                                                                                .primary),
                                                                        value:
                                                                            isDecorationsSelected,
                                                                        onChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            isDecorationsSelected =
                                                                                !isDecorationsSelected;
                                                                          });
                                                                        }),
                                                                const Text(
                                                                  'Decorations',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Checkbox
                                                                    .adaptive(
                                                                        side: const BorderSide(
                                                                            color: Colors
                                                                                .grey),
                                                                        fillColor:
                                                                            MaterialStateProperty.all(lightColorScheme
                                                                                .primary),
                                                                        value:
                                                                            isEventCoverageSelected,
                                                                        onChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            isEventCoverageSelected =
                                                                                !isEventCoverageSelected;
                                                                          });
                                                                        }),
                                                                const Text(
                                                                  'Event Coverage',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Checkbox
                                                                    .adaptive(
                                                                        side: const BorderSide(
                                                                            color: Colors
                                                                                .grey),
                                                                        fillColor:
                                                                            MaterialStateProperty.all(lightColorScheme
                                                                                .primary),
                                                                        value:
                                                                            isSecuritySelected,
                                                                        onChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            isSecuritySelected =
                                                                                !isSecuritySelected;
                                                                          });
                                                                        }),
                                                                const Text(
                                                                  'Security',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Checkbox
                                                                    .adaptive(
                                                                        side: const BorderSide(
                                                                            color: Colors
                                                                                .grey),
                                                                        fillColor:
                                                                            MaterialStateProperty.all(lightColorScheme
                                                                                .primary),
                                                                        value:
                                                                            isTransportationSelected,
                                                                        onChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            isTransportationSelected =
                                                                                !isTransportationSelected;
                                                                          });
                                                                        }),
                                                                const Text(
                                                                  'Transportation',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Checkbox
                                                                    .adaptive(
                                                                        side: const BorderSide(
                                                                            color: Colors
                                                                                .grey),
                                                                        fillColor:
                                                                            MaterialStateProperty.all(lightColorScheme
                                                                                .primary),
                                                                        value:
                                                                            isOtherSelected,
                                                                        onChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            isOtherSelected =
                                                                                !isOtherSelected;
                                                                          });
                                                                        }),
                                                                const Text(
                                                                  'Other',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                  const Divider()
                                                ],
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      lightColorScheme.primary,
                                                  minimumSize:
                                                      const Size.fromHeight(50),
                                                ),
                                                onPressed: () async {
                                                  DateTime currentDate =
                                                      DateTime.now();
                                                  String date =
                                                      '${currentDate.day}- ${currentDate.month} - ${currentDate.year}';
                                                  var uuid = Uuid();
                                                  String orderId = uuid.v4();

                                                  ///add order

                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    await Orders.addOrder(
                                                        'Active',
                                                        'order-$orderId',
                                                        widget.name,
                                                        FirebaseAuth.instance
                                                            .currentUser!.uid,
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
                                                        widget.checkIn,
                                                        widget.checkOut,
                                                        widget.rating,
                                                        widget.review,
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
                                                        firstNameController
                                                            .text,
                                                        lastNameController.text,
                                                        phoneNumberController
                                                            .text,
                                                        country,
                                                        widget.numberOfGuests);

                                                    if (isSavedToAccount ==
                                                        true) {
                                                      Account.saveToAccount(
                                                          FirebaseAuth.instance
                                                              .currentUser!.uid,
                                                          emailController.text,
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
                                                child: Text('Submit')),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]))
                            .toList(),
                      ),
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
