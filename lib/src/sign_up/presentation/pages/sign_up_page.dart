import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

import '../../../../shared/utils/validator.dart';
import '../../../home/presentation/widgets/custom_bottom_nav.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage();
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode? myFocusNode;
  bool _isLoading = false;

  ValueNotifier isPasswordHidden = ValueNotifier(true);

  final formKey = GlobalKey<FormState>();

  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode?.dispose();
    super.dispose();
  }

  Future<void> saveUser(
    String id,
    String email,
  ) {
    return users
        .add({
          'first_name': '',
          'last_name': '',
          'phone': '',
          'email_address': email,
          'profile_image_url': "",
          'id': id,
          'country': '',
          'date_of_birth': '',
          'gender': ''
        })
        .then((value) => print('saving success'))
        .catchError((error) => print("Failed to save user: $error"));
  }

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // SignUp successful, do something
      print('Sign up successful: ${userCredential.user!.email}');

      setState(() {
        _isLoading = false;
      });

      ///save to database
      String userId = FirebaseAuth.instance.currentUser!.uid;
      String? email = FirebaseAuth.instance.currentUser!.email;

      await saveUser(userId, email!);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const CustomBottomNavigation(),
        ),
      );
    } catch (e) {
      // Show error message using a snackbar
      setState(() {
        _isLoading = false;
      });
      _showSnackbar('Sign up failed. ${e.toString()}');
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(padding: const EdgeInsets.all(10), content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: lightColorScheme.primary,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 45, left: 120),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  const Text('Username',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  TextFormField(
                    validator: Validator.name,
                    controller: _userNameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => myFocusNode?.requestFocus(),
                  ),
                  const SizedBox(height: 20),
                  const Text('Email',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  TextFormField(
                    validator: Validator.email,
                    controller: _emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => myFocusNode?.requestFocus(),
                  ),
                  const SizedBox(height: 20),
                  const Text('Password',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  ValueListenableBuilder(
                    builder: (BuildContext context, value, Widget? child) {
                      return TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        validator: Validator.isPasswordValid,
                        focusNode: myFocusNode,
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (isPasswordHidden.value == true) {
                                  isPasswordHidden.value = false;
                                } else {
                                  isPasswordHidden.value = true;
                                }
                              },
                              icon: isPasswordHidden.value == false
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined)),
                          contentPadding:
                              const EdgeInsets.only(left: 10, top: 10),
                          border: InputBorder.none,
                        ),
                        obscureText:
                            isPasswordHidden.value == true ? true : false,
                      );
                    },
                    valueListenable: isPasswordHidden,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minWidth: double.maxFinite,
                      height: 50,
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        _isLoading ? null : _signUp();
                        // }
                      },
                      color: lightColorScheme.tertiary,
                      textColor: Colors.white,
                      child: _isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : const Text('Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            const Text('By Continuing, you agree to our?  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                            Text('Terms of service and Privacy policies',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: lightColorScheme.tertiary,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
