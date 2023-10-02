import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/shared/utils/validator.dart';

class SecurityForm extends StatefulWidget {
  const SecurityForm({super.key});

  @override
  State<SecurityForm> createState() => _SecurityFormState();
}

class _SecurityFormState extends State<SecurityForm> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  late String country = '';
  late String Security = '';

  final nameController = TextEditingController();

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
    return
    
     Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        // autovalidateMode: AutovalidateMode.always,
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
              controller: nameController,
              validator: Validator.name,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.grey),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: theme.colorScheme.error, width: 2)),
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
              validator: Validator.name,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.grey),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: theme.colorScheme.error, width: 2)),
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
              validator: Validator.email,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: theme.colorScheme.error, width: 2)),
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
                  // validator: Validator.name,
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
                  onChanged: (selectedCountry) => country = selectedCountry),
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
                          Validator.phoneNumber(phoneNumber?.number),
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          focusedBorder: const OutlineInputBorder(
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
          ],
        ),
      ),
    );

  }
}
