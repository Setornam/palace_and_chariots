import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/widget_light_theme.dart';
import 'package:palace_and_chariots/src/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:palace_and_chariots/src/onboarding/presentation/pages/onboarding_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/pages/rentals_page.dart';
import 'package:palace_and_chariots/src/sign_in/presentation/pages/sign_in_page.dart';
import 'package:palace_and_chariots/src/sign_up/presentation/pages/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: 'Flutter Demo',
      theme: lightMode,
      // home: const SignInPage()
      // home: CustomBottomNavigation(),
      home: RentalsPage(),
    );
  }
}
