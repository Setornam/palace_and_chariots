// import 'package:dr_teletech/shared/data/image_assets.dart';
// import 'package:dr_teletech/shared/theme/color_scheme.dart';
// import 'package:flutter/material.dart';
// import 'package:iconly/iconly.dart';

// import '../../../appointment/presentation/pages/appointment_detail_page.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 140,
//         backgroundColor: lightColorScheme.background,
//         elevation: 0,
//         title: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(right: 10),
//                       child: CircleAvatar(),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Welcome',
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                         ),
//                         Text(
//                           'Dr. Amoah',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),

//                 ///Notifications
//                 Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: lightColorScheme.primary,
//                       child: Icon(
//                         IconlyBold.notification,
//                         color: lightColorScheme.surface,
//                       ),
//                     ),
//                     Positioned(
//                         left: 25,
//                         bottom: 25,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(width: 2, color: Colors.white),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: const CircleAvatar(
//                               child: Text(
//                                 '2',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               radius: 10,
//                               backgroundColor: Color(0xffdb00ff)),
//                         )),
//                   ],
//                 ),
//               ],
//             ),

//             ///search bar
//             Padding(
//               padding: const EdgeInsets.only(top: 25),
//               child: Stack(children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade500,
//                         blurRadius: 1.0, // soften the shadow
//                         spreadRadius: 0.0, //extend the shadow
//                         offset: const Offset(
//                           1.0, // Move to right 5  horizontally
//                           1.0, // Move to bottom 5 Vertically
//                         ),
//                       )
//                     ],
//                   ),
//                   height: 50,
//                   child: const TextField(
//                     decoration: InputDecoration(
//                         suffixIcon: Icon(
//                           IconlyLight.search,
//                           size: 18,
//                         ),
//                         labelText: 'Search Patient',
//                         labelStyle: TextStyle(color: Colors.black54),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.lightBlue),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(30))),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.white),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(30))),
//                         fillColor: Color(0xfffafafa)),
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: ListView(
//           children: [
//             ///dashboard
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ///appointement container
//                   Container(
//                     width: 250,
//                     height: 80,
//                     decoration: BoxDecoration(
//                         color: lightColorScheme.primary,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20),
//                         )),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CircleAvatar(
//                           child: Icon(
//                             IconlyLight.calendar,
//                             color: Colors.white,
//                           ),
//                           backgroundColor: Color(0xff7cb5f6),
//                         ),
//                         Text('Todays\nAppointment',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white)),
//                         Text('20',
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white)),
//                       ],
//                     ),
//                   ),

//                   //patients container
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Container(
//                       width: 250,
//                       height: 80,
//                       decoration: BoxDecoration(
//                           color: lightColorScheme.primary,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(20),
//                           )),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           CircleAvatar(
//                             child: Image.asset(
//                               ImageAssets.patientIcon,
//                               scale: 20,
//                             ),
//                             backgroundColor: Color(0xff7cb5f6),
//                           ),
//                           Text('Total\nNo of Patients',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           Text('20',
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                         ],
//                       ),
//                     ),
//                   ),

//                   //earnings container
//                   Container(
//                     width: 250,
//                     height: 80,
//                     decoration: BoxDecoration(
//                         color: lightColorScheme.primary,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20),
//                         )),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CircleAvatar(
//                           child: Image.asset(
//                             ImageAssets.cediIcon,
//                           ),
//                           backgroundColor: Color(0xff7cb5f6),
//                         ),
//                         Text('Total\nEarnings',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white)),
//                         Text('20',
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white)),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),

//             ///upcoming appointments
//             ///

//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Upcoming\nAppointments',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: lightColorScheme.primary),
//                   ),
//                   Text(
//                     'View all',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: lightColorScheme.primary),
//                   ),
//                 ],
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: lightColorScheme.primary.withOpacity(0.2),
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       //appointment container
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                               color: Colors.white),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ///image
//                                 ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image.asset(
//                                       'assets/images/sample-1.png',
//                                       scale: 0.85,
//                                     )),

//                                 ///appointment details
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '  Covid-19 Vaccination',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyLarge
//                                           ?.copyWith(
//                                               fontWeight: FontWeight.bold,
//                                               color: lightColorScheme.primary),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 5),
//                                       child: Text(
//                                         '  Linda Osei',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyLarge
//                                             ?.copyWith(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                       ),
//                                     ),
//                                     Text(
//                                       '  8th Sept,2023 | 10AM',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall
//                                           ?.copyWith(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (BuildContext
//                                                         context) =>
//                                                     const AppointmentDetailScreen()));
//                                       },
//                                       child: Text(
//                                         'View Details',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 color:
//                                                     lightColorScheme.primary),
//                                       ),
//                                     )
//                                   ],
//                                 ),

//                                 ///appointment status
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 50),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: lightColorScheme.primary
//                                             .withOpacity(0.2),
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(10))),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 2, horizontal: 15),
//                                       child: Text(
//                                         'New',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 color:
//                                                     lightColorScheme.primary),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),

//                       //appointment container
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                               color: Colors.white),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ///image
//                                 ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image.asset(
//                                       'assets/images/sample-2.png',
//                                       scale: 0.85,
//                                     )),

//                                 ///appointment details
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '  Covid-19 Vaccination',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyLarge
//                                           ?.copyWith(
//                                               fontWeight: FontWeight.bold,
//                                               color: lightColorScheme.primary),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 5),
//                                       child: Text(
//                                         '  Bismark Osei',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyLarge
//                                             ?.copyWith(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                       ),
//                                     ),
//                                     Text(
//                                       '  8th Sept,2023 | 10AM',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall
//                                           ?.copyWith(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (BuildContext
//                                                         context) =>
//                                                     const AppointmentDetailScreen()));
//                                       },
//                                       child: Text(
//                                         'View Details',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 color:
//                                                     lightColorScheme.primary),
//                                       ),
//                                     )
//                                   ],
//                                 ),

//                                 ///appointment status
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 50),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color:
//                                             Color(0xffdb00ff).withOpacity(0.2),
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(10))),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 2, horizontal: 10),
//                                       child: Text(
//                                         'Follow up',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color(0xffdb00ff)),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             ///Recent Earnings
//             ///
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Recent\nEarnings',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: lightColorScheme.primary),
//                   ),
//                   Text(
//                     'View all',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: lightColorScheme.primary),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: lightColorScheme.primary.withOpacity(0.2),
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       //earning container
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                               color: Colors.white),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ///image
//                                 ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image.asset(
//                                       'assets/images/sample-1.png',
//                                       scale: 0.85,
//                                     )),

//                                 ///earning details
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 5),
//                                       child: Text(
//                                         '  Linda Osei',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyLarge
//                                             ?.copyWith(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                       ),
//                                     ),
//                                     Text(
//                                       '  8th Sept,2023 | 10AM',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall
//                                           ?.copyWith(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {},
//                                       child: Text(
//                                         'View Details',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 color:
//                                                     lightColorScheme.primary),
//                                       ),
//                                     )
//                                   ],
//                                 ),

//                                 ///appointment charge
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 2, horizontal: 10),
//                                   child: Text(
//                                     'GHS 450',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.copyWith(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18,
//                                             color: lightColorScheme.primary),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
