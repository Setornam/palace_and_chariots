// import 'dart:convert';
// import 'package:date_field/date_field.dart';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import '../../../../../shared/utils/validator.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _PhonePageState();
// }

// class _PhonePageState extends State<SignUpPage> {
//   /// Form Controller
//   final formKey = GlobalKey<FormState>();

//   ///  Phone number controller
//   late TextEditingController phoneNumberController = TextEditingController();

//   late String phoneNumber;
//   late String firstName = '';
//   late String lastName = '';
//   late String password = '';
//   late String email = '';
//   late String dateOfBirth = '';
//   late String bioData = '';
//   late String gender = '';


//   late bool submitted = false;

//   /// Checks if phone number is valid
//   final phoneNumberValid = ValueNotifier<bool>(false);

//   /// form submitted
//   final showSubmitButton = ValueNotifier<bool>(true);

//   /// AutoFocus node
//   late FocusNode focusNode;

//   List<DropdownMenuItem> genders = [
//     const DropdownMenuItem(value: 'Male',child: Text('Male'),),
//     const DropdownMenuItem(value: 'Female',child: Text('Female'))

//     ];

//   @override
//   void initState() {
//     super.initState();
//     focusNode = FocusNode();
//     phoneNumberController.addListener(() {
//       if (phoneNumberController.value.text.isEmpty) {
//         phoneNumber = phoneNumberController.text;
//         phoneNumberController.selection =
//             TextSelection.collapsed(offset: phoneNumberController.text.length);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     focusNode.dispose();
//     // phoneNumberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//         appBar: AppBar(title:  Text('REGISTER',style:theme.textTheme.titleMedium,),centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
        
//         ),
//         resizeToAvoidBottomInset: true,
//         body: SafeArea(
//             minimum: const EdgeInsets.symmetric(horizontal: 20),
//             child: SingleChildScrollView(
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       //First name
//                       Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: TextFormField(
//                             keyboardType: TextInputType.name,
//                             decoration: const InputDecoration(
//                               labelText: 'First Name',
//                             ),
//                             onChanged: (name) => firstName = name,
//                             validator: Validator.name,
//                           )),

//                       //Last name
//                       Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: TextFormField(
//                             keyboardType: TextInputType.name,
//                             decoration: const InputDecoration(
//                               labelText: 'Last Name',
//                             ),
//                             onChanged: (name) => lastName = name,
//                             validator: Validator.name,
//                           )),

//                       //Email address
//                       Padding(
//                           padding: const EdgeInsets.only(top: 10,bottom: 10),
//                           child: TextFormField(
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: const InputDecoration(
//                               labelText: 'Email',
//                             ),
//                             onChanged: (emailAddress) => email = emailAddress,
//                             // validator: Validator.name,
//                           )),

//                       //Password
//                       Padding(
//                           padding: const EdgeInsets.only(top: 10,bottom: 10),
//                           child: TextFormField(
//                             obscureText: true,
//                             keyboardType: TextInputType.visiblePassword,
//                             decoration: const InputDecoration(
//                               labelText: 'Password',
//                             ),
//                             onChanged: (passwd) => password = passwd,
//                             // validator: Validator.name,
//                           )),

//                       ///phone number
//                       Padding(
//                           padding: const EdgeInsets.only(top: 10, bottom: 10),
//                           child: IntlPhoneField(
//                               focusNode: focusNode,
//                               decoration: InputDecoration(
//                                   labelText: 'Phone Number',
//                                   alignLabelWithHint: true,
//                                   errorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide(
//                                         color: theme.colorScheme.error,
//                                         width: 2),
//                                   ),
//                                   filled: true,
//                                   fillColor: theme.colorScheme.surface
//                                       .withOpacity(0.9)),
//                               controller: phoneNumberController,
//                               showDropdownIcon: false,
//                               disableLengthCheck: true,
//                               // validator to check if length is 10
//                               validator: (phoneNumber) =>
//                                   Validator.phoneNumber(phoneNumber?.number),
//                               flagsButtonPadding:
//                                   const EdgeInsets.symmetric(horizontal: 15),
//                               initialCountryCode: 'GH',
//                               countries: const ['GH', 'NG', 'KE'],
//                               onChanged: (phone) {
//                                 phoneNumber = phone.completeNumber;

//                                 /// Get phone number length
//                                 final phoneLength =
//                                     phoneNumberController.value.text;
//                                 // check if phone number length is 10

//                                 /// Checks number length
//                                 if (Validator.formValid(phoneLength) == true) {
//                                   /// Show enabled button
//                                   phoneNumberValid.value = true;
//                                 } else {
//                                   /// Show disabled button
//                                   phoneNumberValid.value = false;
//                                 }
//                               })),

//                       ///gender
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10,bottom: 10),
//                         child: DropdownButtonFormField(
//                           hint: const Text('select'),
//                             items: genders, onChanged: (selectedGender)=>gender = selectedGender),
//                       ),

//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: DateTimeFormField(
//                           decoration: const InputDecoration(
//                           hintStyle: TextStyle(color: Colors.black45),
//                           errorStyle: TextStyle(color: Colors.redAccent),
//                           suffixIcon: Icon(Icons.event_note),
//                           labelText: 'date of birth',
//                                               ),
//                                               mode: DateTimeFieldPickerMode.date,
//                                               autovalidateMode: AutovalidateMode.always,
//                                               onDateSelected: (DateTime value) {
//                           print(value);
//                                               },
//                                             ),
//                         ),

//                       ///bio
//                       Padding(
//                           padding: const EdgeInsets.only(top: 10,bottom: 25),
//                           child: TextFormField(
//                             maxLines: 4,
//                             keyboardType: TextInputType.multiline,
//                             decoration: const InputDecoration(
//                               labelText: 'Bio',
//                             ),
//                             onChanged: (bio) => bioData = bio,
//                             validator: Validator.name,
//                           )),

//                       ValueListenableBuilder<bool>(
//                           valueListenable: phoneNumberValid,
//                           builder: (context, value, _) {
//                             if (value == true) {
//                               return ValueListenableBuilder(
//                                   valueListenable: showSubmitButton,
//                                   builder: (context, submitValue, _) {
//                                     if (submitValue != false) {
//                                       return SizedBox(
//                                           width: double.infinity,
//                                           child: ElevatedButton(
//                                               onPressed: () async {
//                                                 /// Removes focus from form
//                                                 focusNode.unfocus();

//                                                 /// Don't validate if form is not valid
//                                                 if (!formKey.currentState!
//                                                     .validate()) {
//                                                   return;
//                                                 }
//                                                 await showDialog(
//                                                     barrierDismissible: false,
//                                                     context: context,
//                                                     builder: (context) {
//                                                       Future.delayed(
//                                                           const Duration(
//                                                               milliseconds:
//                                                                   500), () {
//                                                         Navigator.of(context)
//                                                             .pop(true);
//                                                       });
//                                                       return AlertDialog(
//                                                           icon: const Icon(
//                                                             Icons.security,
//                                                             size: 60,
//                                                           ),
//                                                           iconColor: theme
//                                                               .colorScheme
//                                                               .primary,
//                                                           title: const Text(
//                                                               'sending confirmation code ...'),
//                                                           content: Row(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .min,
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               children: const <Widget>[
//                                                                 CircularProgressIndicator
//                                                                     .adaptive()
//                                                               ]));
//                                                     });

//                                                 /// Show loading button
//                                                 showSubmitButton.value = false;

                                                
//                                                 //     .verifyPhoneNumber(
//                                                 //         phoneNumber: phoneNumber,
//                                                 //
//                                                 //         /// Auto Detects otp code
//                                                 //         verificationCompleted:
//                                                 //             (PhoneAuthCredential
//                                                 //                 credentials) async {},
//                                                 //         verificationFailed:
//                                                 //             (FirebaseException
//                                                 //                 error) {
//                                                 //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                                 //               backgroundColor:
//                                                 //                   Theme.of(
//                                                 //                           context)
//                                                 //                       .colorScheme
//                                                 //                       .error,
//                                                 //               content: Text(
//                                                 //                   error.code,
//                                                 //                   style: TextStyle(
//                                                 //                       color: Theme.of(
//                                                 //                               context)
//                                                 //                           .colorScheme
//                                                 //                           .onError))));
//                                                 //           showSubmitButton.value =
//                                                 //               true;
//                                                 //         },
//                                                 //
//                                                 //         /// Handles phone verification
//                                                 //         codeSent: (verificationId,
//                                                 //             resendToken) async {
//                                                 //           /// Open OTP Form
//                                                 //           final code = await showCupertinoModalPopup(
//                                                 //               context: context,
//                                                 //               builder: (context) =>
//                                                 //                   OtpPage(
//                                                 //                       phoneNumber:
//                                                 //                           phoneNumber));
//                                                 //
//                                                 //           /// Handles invalid OTP
//                                                 //           if (code == null) {
//                                                 //             showSubmitButton
//                                                 //                 .value = true;
//                                                 //             if (!mounted) {}
//                                                 //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                                 //                 backgroundColor:
//                                                 //                     Theme.of(
//                                                 //                             context)
//                                                 //                         .colorScheme
//                                                 //                         .error,
//                                                 //                 content: Text(
//                                                 //                     'Something went wrong, please try again 😢',
//                                                 //                     style: Theme.of(
//                                                 //                             context)
//                                                 //                         .textTheme
//                                                 //                         .bodyText2!
//                                                 //                         .apply(
//                                                 //                             color: Theme.of(context)
//                                                 //                                 .colorScheme
//                                                 //                                 .onError))));
//                                                 //           }
//                                                 //
//                                                 //           /// Create authentication credentials
//                                                 //           PhoneAuthCredential
//                                                 //               credentials =
//                                                 //               PhoneAuthProvider.credential(
//                                                 //                   verificationId:
//                                                 //                       verificationId,
//                                                 //                   smsCode: code);
//                                                 //
//                                                 //           /// Authenticate User
//                                                 //           await FirebaseAuth
//                                                 //               .instance
//                                                 //               .signInWithCredential(
//                                                 //                   credentials)
//                                                 //               .catchError(
//                                                 //                   (error) {
//                                                 //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                                 //                 backgroundColor:
//                                                 //                     Theme.of(
//                                                 //                             context)
//                                                 //                         .colorScheme
//                                                 //                         .error,
//                                                 //                 content: Text(
//                                                 //                     error.code,
//                                                 //                     style: Theme.of(
//                                                 //                             context)
//                                                 //                         .textTheme
//                                                 //                         .bodyText2!
//                                                 //                         .apply(
//                                                 //                             color: Theme.of(context)
//                                                 //                                 .colorScheme
//                                                 //                                 .onError))));
//                                                 //             showSubmitButton
//                                                 //                 .value = true;
//                                                 //           });
//                                                 //
//                                                 //           /// Get authenticated user
//                                                 //           final currentUser =
//                                                 //               FirebaseAuth
//                                                 //                   .instance
//                                                 //                   .currentUser;
//                                                 //
//                                                 //           if (currentUser ==
//                                                 //               null) {
//                                                 //             showSubmitButton
//                                                 //                 .value = true;
//                                                 //             if (!mounted) {}
//                                                 //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                                 //                 backgroundColor:
//                                                 //                     Theme.of(
//                                                 //                             context)
//                                                 //                         .colorScheme
//                                                 //                         .error,
//                                                 //                 content: Text(
//                                                 //                     'Something went wrong, please try again 😢',
//                                                 //                     style: Theme.of(
//                                                 //                             context)
//                                                 //                         .textTheme
//                                                 //                         .bodyText2!
//                                                 //                         .apply(
//                                                 //                             color: Theme.of(context)
//                                                 //                                 .colorScheme
//                                                 //                                 .onError))));
//                                                 //           }
//                                                 //
//                                                 //           /// Show username form
//                                                 //           late String nameText;
//                                                 //           if (currentUser!
//                                                 //                   .displayName ==
//                                                 //               null) {
//                                                 //             if (!mounted) {}
//                                                 //             final username =
//                                                 //                 await showCupertinoModalPopup(
//                                                 //                     context:
//                                                 //                         context,
//                                                 //                     builder:
//                                                 //                         (context) =>
//                                                 //                             const UsernameFormPage());
//                                                 //
//                                                 //             if (username ==
//                                                 //                 null) {
//                                                 //               showSubmitButton
//                                                 //                   .value = true;
//                                                 //               if (!mounted) {}
//                                                 //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                                 //                   backgroundColor:
//                                                 //                       Theme.of(
//                                                 //                               context)
//                                                 //                           .colorScheme
//                                                 //                           .error,
//                                                 //                   content: Text(
//                                                 //                       'Something went wrong, please try again ',
//                                                 //                       style: Theme.of(
//                                                 //                               context)
//                                                 //                           .textTheme
//                                                 //                           .bodyText2!
//                                                 //                           .apply(
//                                                 //                               color:
//                                                 //                                   Theme.of(context).colorScheme.onError))));
//                                                 //             }
//                                                 //
//                                                 //             /// Get user username input
//                                                 //             nameText =
//                                                 //                 username.trim();
//                                                 //
//                                                 //             /// Set's [User] username
//                                                 //             await currentUser
//                                                 //                 .updateDisplayName(
//                                                 //                     nameText);
//                                                 //           } else {
//                                                 //             nameText = currentUser
//                                                 //                 .displayName!;
//                                                 //             // final user =
//                                                 //             // User.initial().copyWith(
//                                                 //             //     id: currentUser.uid,
//                                                 //             //     name: nameText,
//                                                 //             //     phoneNumber:
//                                                 //             //     currentUser
//                                                 //             //         .phoneNumber!,
//                                                 //             //     email: currentUser.email ??
//                                                 //             //         '',
//                                                 //             //     username: nameText
//                                                 //             //         .split(' ')
//                                                 //             //         .first
//                                                 //             //         .toLowerCase());
//                                                 //
//                                                 //             /// Store authenticated user locally
//                                                 //             // await sl<
//                                                 //             //     UserLocalDatabase>()
//                                                 //             //     .save(user);
//                                                 //
//                                                 //             if (!mounted) {}
//                                                 //             // ScaffoldMessenger.of(
//                                                 //             //     context)
//                                                 //             //     .showSnackBar(
//                                                 //             //     SnackBar(
//                                                 //             //         backgroundColor:
//                                                 //             //         Theme
//                                                 //             //             .of(context)
//                                                 //             //             .colorScheme
//                                                 //             //             .primary,
//                                                 //             //         content: Text(
//                                                 //             //             'Logged in as $nameText 🎉',
//                                                 //             //             style:
//                                                 //             //             Theme
//                                                 //             //                 .of(context)
//                                                 //             //                 .textTheme
//                                                 //             //                 .bodyText2!
//                                                 //             //                 .apply(
//                                                 //             //                 color: Theme
//                                                 //             //                     .of(
//                                                 //             //                     context)
//                                                 //             //                     .colorScheme
//                                                 //             //                     .onPrimary
//                                                 //             //             )
//                                                 //             //         )
//                                                 //             //     )
//                                                 //             // );
//                                                 //             await Navigator.pushReplacement(
//                                                 //                 context,
//                                                 //                 MaterialPageRoute(
//                                                 //                     builder:
//                                                 //                         (context) =>
//                                                 //                             const CustomBottomNavigation()));
//                                                 //           }
//                                                 //
//                                                 //           /// Create a new profile instance
//                                                 //           // final profile = User.initial()
//                                                 //           //     .copyWith(
//                                                 //           //     id: currentUser.uid,
//                                                 //           //     name: nameText,
//                                                 //           //     phoneNumber:
//                                                 //           //     currentUser
//                                                 //           //         .phoneNumber!,
//                                                 //           //     email: currentUser.email ??
//                                                 //           //         '',
//                                                 //           //     username: nameText
//                                                 //           //         .split(' ')
//                                                 //           //         .first
//                                                 //           //         .toLowerCase());
//                                                 //
//                                                 //           /// Create a new [Profile] instance
//                                                 //           // await showDialog<void>(
//                                                 //           //     context: context,
//                                                 //           //     builder: (context) =>
//                                                 //           //         LoadingPage(
//                                                 //           //             errorText: bloc
//                                                 //           //                 .phoneSignIn(
//                                                 //           //                 profile),
//                                                 //           //             onLoadingDone: () async =>
//                                                 //           //             await Navigator
//                                                 //           //                 .pushReplacement(
//                                                 //           //                 context,
//                                                 //           //                 MaterialPageRoute(
//                                                 //           //                     builder: (
//                                                 //           //                         context) =>
//                                                 //           //                     const HomePage()
//                                                 //           //                 )
//                                                 //           //             ),
//                                                 //           //             loadingText:
//                                                 //           //             'Creating Account..🎉'
//                                                 //           //         )
//                                                 //           // );
//                                                 //         },
//                                                 //
//                                                 //         /// Handles timeout
//                                                 //         codeAutoRetrievalTimeout:
//                                                 //             (timeOut) {});
//                                               },
//                                               child: const Text(
//                                                   'Create Account')));
//                                     }
//                                     return const Center(
//                                         child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 20, vertical: 30),
//                                             child: LinearProgressIndicator()));
//                                   });
//                             } else {
//                               return Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(30)),
//                                         gradient: LinearGradient(colors: [
//                                           Color(0xff5ba2f4),
//                                           Color(0xff034c81),
//                                         ])),
//                                     child: ElevatedButton(
//                                         onPressed: () {},
//                                         style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.transparent,
//                                             elevation: 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 15),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: const [
//                                               Text(
//                                                 'CONTINUE',
//                                               ),
//                                             ],
//                                           ),
//                                         )),
//                                   ));
//                             }
//                           })
//                     ]),
//               ),
//             )));
//   }
// }
