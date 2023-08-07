import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

class TourismCheckoutPage extends StatefulWidget {
  const TourismCheckoutPage({super.key});

  @override
  State<TourismCheckoutPage> createState() => _TourismCheckoutPageState();
}

class _TourismCheckoutPageState extends State<TourismCheckoutPage> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  late String country = '';
  late String Security = '';

  bool isSecuritySelected = false;
  bool isHotelPickupSelected = false;

  bool isSavedToAccount = false;

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
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
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
                      height: 50,
                      child: IntlPhoneField(
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
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
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: theme.colorScheme.error, width: 2),
                              ),
                              filled: true,
                              fillColor:
                                  theme.colorScheme.surface.withOpacity(0.9)),
                          controller: phoneNumberController,
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

                Row(
                  children: [
                    Checkbox.adaptive(
                        side: const BorderSide(color: Colors.grey),
                        fillColor:
                            MaterialStateProperty.all(lightColorScheme.primary),
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
                                  value: isHotelPickupSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      isHotelPickupSelected =
                                          !isHotelPickupSelected;
                                    });
                                  }),
                              const Text(
                                'Hotel Pick up',
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
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightColorScheme.primary,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const TourismCheckoutPage()));
                        },
                        child: const Text('Submit')),
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
