import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/home/presentation/pages/home.dart';

import '../../../home/presentation/widgets/custom_bottom_nav.dart';
import '../../../sign_up/presentation/pages/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage();
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode? myFocusNode;
  bool _isLoading = false;

  ValueNotifier isPasswordHidden = ValueNotifier(true);

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

  void _Login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Login successful, do something
      print('Sign in successful: ${userCredential.user!.email}');
      setState(() {
        _isLoading = false;
      });

      // Login successful, navigate to another page
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
      _showSnackbar('Sign in failed. ${e.toString()}');
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 45, left: 120),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                const Text('Username/Email',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                TextFormField(
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
                            const EdgeInsets.symmetric(horizontal: 10),
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
                      _isLoading ? null : _Login();
                    },
                    color: lightColorScheme.tertiary,
                    textColor: Colors.white,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                  ),
                ),

                const Text('Forgot your password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),

                const Center(
                  child: Text('Or',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                ),

                const SizedBox(height: 20),

                ///continue with facebook
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async {
                    ///implement fb authentication

                    // ignore: use_build_context_synchronously
                    // await Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (BuildContext context) =>
                    //           const CustomBottomNavigation(),
                    //     ));
                  },
                  color: Colors.white,
                  textColor: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          ImageAssets.facebookLogo,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Continue with Facebook',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16)),
                      ),
                    ],
                  ),
                ),

                ///continue with google
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 0,
                    minWidth: double.maxFinite,
                    height: 50,
                    onPressed: () async {
                      ///implement google authentication

                      // Trigger the authentication flow
                      final GoogleSignInAccount? googleUser =
                          await GoogleSignIn().signIn();

                      // Obtain the auth details from the request
                      final GoogleSignInAuthentication? googleAuth =
                          await googleUser?.authentication;

                      // Create a new credential
                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken,
                      );

                      // Once signed in, return the UserCredential
                      await FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            content: Text(
                              'Siging in failed...Please try again ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .apply(
                                      color:
                                          Theme.of(context).colorScheme.error),
                            )));
                      });

                      // ignore: use_build_context_synchronously
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CustomBottomNavigation(),
                          ));
                    },
                    color: Colors.white,
                    textColor: Colors.black87,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(
                            ImageAssets.googleLogo,
                            scale: 2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('Continue with Google',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Row(
                          children: [
                            const Text('Dont have an account?  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignUpPage()));
                              },
                              child: Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: lightColorScheme.tertiary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 50, left: 100),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CustomBottomNavigation()));
                    },
                    child: Text('Sign up as guest  ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
