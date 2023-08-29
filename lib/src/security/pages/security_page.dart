import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/security/security/domain/entities/security.dart';

import '../../../injection_container.dart';
import '../../../shared/theme/color_scheme.dart';
import '../security/presentation/bloc/security_bloc.dart';
import '../widgets/event_security.dart';
import '../widgets/facility_security.dart';
import '../widgets/high_profile_security.dart';
import '../widgets/home_security.dart';
import '../widgets/personal_security.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final bloc = sl<SecurityBloc>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Row(
                  children: [
                    BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                    ),
                    const Text(
                      'Back',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    'Security',
                    style: TextStyle(color: lightColorScheme.primary),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
      body: StreamBuilder<List<Security>>(
          stream: bloc.securities(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Security> securityServices = snapshot.requireData;

              return Padding(
                padding: const EdgeInsets.all(14.0),
                child: GridView.builder(
                  itemCount: securityServices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 30,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SecurityDetailPage(
                                      security: securityServices[index],
                                    )));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    bottomLeft: Radius.circular(7),
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/PersonalSecurity.png'))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              securityServices[index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  // children: [
                  //   GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (BuildContext context) =>
                  //                   HomeSecurityPage()));
                  //     },
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           height: 140,
                  //           decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                   bottomRight: Radius.circular(7),
                  //                   bottomLeft: Radius.circular(7),
                  //                   topLeft: Radius.circular(7),
                  //                   topRight: Radius.circular(7)),
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage(
                  //                       'assets/images/homeSecurity.png'))),
                  //         ),
                  //         const Padding(
                  //           padding: EdgeInsets.only(top: 8),
                  //           child: Text(
                  //             'Home Security',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (BuildContext context) =>
                  //                   FacilitySecurityPage()));
                  //     },
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           height: 140,
                  //           decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                   bottomRight: Radius.circular(7),
                  //                   bottomLeft: Radius.circular(7),
                  //                   topLeft: Radius.circular(7),
                  //                   topRight: Radius.circular(7)),
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage(
                  //                       'assets/images/officeSecurity.png'))),
                  //         ),
                  //         const Padding(
                  //           padding: EdgeInsets.only(top: 8),
                  //           child: Text(
                  //             'Facility Security',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (BuildContext context) =>
                  //                   EventSecurityPage()));
                  //     },
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           height: 140,
                  //           decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                   bottomRight: Radius.circular(7),
                  //                   bottomLeft: Radius.circular(7),
                  //                   topLeft: Radius.circular(7),
                  //                   topRight: Radius.circular(7)),
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage(
                  //                       'assets/images/eventSecurity.png'))),
                  //         ),
                  //         const Padding(
                  //           padding: EdgeInsets.only(top: 8),
                  //           child: Text(
                  //             'Event Security',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (BuildContext context) =>
                  //                   HighProfileSecurityPage()));
                  //     },
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           height: 140,
                  //           decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                   bottomRight: Radius.circular(7),
                  //                   bottomLeft: Radius.circular(7),
                  //                   topLeft: Radius.circular(7),
                  //                   topRight: Radius.circular(7)),
                  //               image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   image: AssetImage(
                  //                       'assets/images/highProfileSecurity.png'))),
                  //         ),
                  //         const Padding(
                  //           padding: EdgeInsets.only(top: 8),
                  //           child: Text(
                  //             'High Profile Security',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   )
                  // ],
                ),
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
