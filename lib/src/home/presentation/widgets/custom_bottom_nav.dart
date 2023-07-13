// import 'package:dr_teletech/shared/theme/color_scheme.dart';
// import 'package:dr_teletech/src/appointment/presentation/pages/appointments_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:iconly/iconly.dart';

// import '../pages/home.dart';

// class CustomBottomNavigation extends StatefulWidget {
//   const CustomBottomNavigation({super.key});

//   @override
//   State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
// }

// class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
//   int currentIndex = 0;

//   // list of screens that will be rendered in the scaffold body
//   final List screens = [Home(), AppointmentsScreen(), Container(), Container()];
//   // current index

//   @override
//   void initState() {
//     super.initState();

//     // This will hide the bottom system navigation bar
//     // Only the status bar on the top will show up
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.top]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[currentIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: lightColorScheme.primary,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//           child: GNav(
//             backgroundColor: lightColorScheme.primary,
//             rippleColor: Colors.grey[300]!,
//             hoverColor: Colors.grey[100]!,
//             gap: 2,
//             activeColor: Colors.white,
//             iconSize: 24,
//             padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//             duration: const Duration(milliseconds: 400),
//             tabBackgroundColor: lightColorScheme.primary,
//             color: Colors.white,
//             style: GnavStyle.oldSchool,
//             tabs: [
//               GButton(
//                 icon: currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
//                 text: 'Home',
//               ),
//               GButton(
//                 icon: currentIndex == 1
//                     ? IconlyBold.calendar
//                     : IconlyLight.calendar,
//                 text: 'Appointment',
//               ),
//               GButton(
//                 icon:
//                     currentIndex == 2 ? IconlyBold.wallet : IconlyLight.wallet,
//                 text: 'Earnings',
//               ),
//               GButton(
//                 icon: currentIndex == 3
//                     ? IconlyBold.setting
//                     : IconlyLight.setting,
//                 text: 'Settings',
//               ),
//             ],
//             selectedIndex: currentIndex,
//             onTabChange: (index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
