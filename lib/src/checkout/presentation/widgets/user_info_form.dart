import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/shared/utils/validator.dart';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({super.key});

  @override
  State<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  late String country = '';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Your Information',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: theme.colorScheme.error, width: 2),
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
                      validator: (phone) => Validator.phoneNumber(phoneNumber),
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
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
                  onChanged: (selectedCountry) => country = selectedCountry),
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: theme.colorScheme.error, width: 2),
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: theme.colorScheme.error, width: 2),
                ),
                fillColor: Colors.white,
              ),
            ),

            Row(
              children: [
                Checkbox.adaptive(
                    side: BorderSide(color: Colors.grey),
                    fillColor:
                        MaterialStateProperty.all(lightColorScheme.primary),
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
                  Icon(Icons.error_outline, color: lightColorScheme.primary),
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
    );
  }
}
