import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:palace_and_chariots/src/booking_list/presentation/pages/bookings_list_page.dart';
import 'package:palace_and_chariots/src/chat/presentation/pages/chatbox_page.dart';
import 'package:palace_and_chariots/src/notifications/presentation/pages/notifications_page.dart';
import 'package:palace_and_chariots/src/profile/presentation/pages/profile_page.dart';
import 'package:palace_and_chariots/src/sign_in/presentation/pages/sign_in_page.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../pages/home.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentIndex = 0;
  bool isLoggedIn = false;

  // list of screens that will be rendered in the scaffold body
  final List screens = [
    Home(),
    BookingsListPage(),
    ChatBoxPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  void checkLoginState() {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Check if there is a current user
    User? user = auth.currentUser;

    if (user != null) {
      // User is signed in
      print('User is logged in: ${user.email}');
      setState(() {
        isLoggedIn = true;
      });
    } else {
      // No user is signed in
      print('User is not logged in');
      setState(() {
        isLoggedIn = false;
      });
    }
  }
  // current index

  @override
  void initState() {
    super.initState();

    // This will hide the bottom system navigation bar
    // Only the status bar on the top will show up
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: lightColorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            backgroundColor: lightColorScheme.primary,
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 2,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: lightColorScheme.primary,
            color: Colors.white,
            style: GnavStyle.oldSchool,
            tabs: [
              GButton(
                icon: currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
              ),
              GButton(
                icon: currentIndex == 1 ? IconlyBold.star : IconlyLight.star,
              ),
              GButton(
                  icon: currentIndex == 2
                      ? Icons.message
                      : Icons.messenger_outline),
              GButton(
                  icon: currentIndex == 3
                      ? Icons.notifications_active
                      : Icons.notifications_on_outlined),
              GButton(
                icon: currentIndex == 4
                    ? IconlyBold.setting
                    : IconlyLight.setting,
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: (index) {
              checkLoginState();
              if (isLoggedIn == false) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignInPage()));
              } else {}

              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
