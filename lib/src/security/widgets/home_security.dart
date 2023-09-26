// import 'package:flutter/material.dart';

// import '../../../shared/theme/color_scheme.dart';
// import '../../checkout/presentation/pages/security_checkout_page.dart';

// class HomeSecurityPage extends StatelessWidget {
//   const HomeSecurityPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 50,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 1),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Row(
//               children: [
//                 Row(
//                   children: [
//                     BackButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       color: Colors.black,
//                     ),
//                     const Text(
//                       'Back',
//                       style: TextStyle(color: Colors.black, fontSize: 18),
//                     )
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 50),
//                   child: Text(
//                     ' Security',
//                     style: TextStyle(color: lightColorScheme.primary),
//                   ),
//                 )
//               ],
//             ),
//           ]),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: ListView(
//           children: [
//             Container(
//               height: 140,
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(7),
//                       bottomLeft: Radius.circular(7),
//                       topLeft: Radius.circular(7),
//                       topRight: Radius.circular(7)),
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image:
//                           AssetImage('assets/images/homeSecurity.png'))),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                 'Home Security',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ),
//             const Text(
//                 'Personal protection has never been more needed these days. Assaults and trafficking have increased over the years. The worst part, if it becomes easier than ever. With technology in the palm of your hand, criminals can know where you are and your routine. Many high-profile individuals don’t even know they need personal protection until they have experienced something jeopardizing their safety. If you classify in one of these categories, make sure to contact personal security services.'),
//             const Padding(
//               padding: EdgeInsets.only(top: 40, bottom: 10),
//               child: Text(
//                 'This service is availble for',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Text('Individuals'),
//             const Text('Families'),
//             Padding(
//               padding: const EdgeInsets.only(top: 200),
//               child: SizedBox(
//                 width: MediaQuery.sizeOf(context).width,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: lightColorScheme.primary,
//                       minimumSize: const Size.fromHeight(40),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   const SecurityCheckoutPage()));
//                     },
//                     child: const Text(
//                       'Request',
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
