import 'package:device_preview/device_preview.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/widget_light_theme.dart';
import 'package:palace_and_chariots/src/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:palace_and_chariots/src/onboarding/presentation/pages/onboarding_page.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

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
      // home: SpecialtiesForm(),
      // home: ExperienceForm(),
      home: const OnboardingPage(),
      // home: const SignUpPage(),
      // home: CustomBottomNavigation(),
    );
  }
}
