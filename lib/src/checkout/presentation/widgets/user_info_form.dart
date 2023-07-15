import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({super.key});

  @override
  State<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
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
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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

            ///phone number
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: IntlPhoneField(
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        alignLabelWithHint: true,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: theme.colorScheme.error, width: 2),
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.surface.withOpacity(0.9)),
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
                    })),
          ],
        ),
      ),
    );
  }
}
