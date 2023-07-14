import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';

import '../../../../shared/theme/color_scheme.dart';

class VehiclesTabBarView extends StatefulWidget {
  const VehiclesTabBarView({super.key});

  @override
  State<VehiclesTabBarView> createState() => _VehiclesTabBarViewState();
}

class _VehiclesTabBarViewState extends State<VehiclesTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            ///vehicle buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    backgroundColor: lightColorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Saloon',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: lightColorScheme.primary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    elevation: 0,
                  ),
                  child: Text(
                    'Bus',
                    style: TextStyle(
                        fontSize: 13, color: lightColorScheme.primary),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: lightColorScheme.primary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    elevation: 0,
                  ),
                  child: Text(
                    'Private jet',
                    style: TextStyle(
                        fontSize: 13, color: lightColorScheme.primary),
                  ),
                )
              ],
            ),

            ///vehicle brands
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(ImageAssets.mercedesLogo),
                      const Text('Mercedes')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(ImageAssets.BMWLogo),
                      const Text('BMW')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(ImageAssets.lexusLogo),
                      const Text('Lexus')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(ImageAssets.kiaLogo),
                      const Text('KIA')
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(ImageAssets.hondaLogo),
                      const Text('Honda')
                    ],
                  )
                ],
              ),
            ),

            ///best cars
            ///
            SizedBox(
              height: 450,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        child: ListTile(
                          visualDensity: const VisualDensity(vertical: 4),
                          title:   Container(
                    //           height: 80,
                    //           width: MediaQuery.of(context).size.width * 0.72,
                    //           decoration: const BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(7),
                    //                   bottomLeft: Radius.circular(7)),
                    //               color: Color(0xffe7e7f4)),
                    //           child: Column(
                    //             children: [
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   const Text(
                    //                     'Toyota Corolla 2020',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         fontSize: 15,
                    //                         color: Colors.black87),
                    //                   ),
                    //                   const Icon(
                    //                     Icons.star,
                    //                     color: Color(0xfff8c123),
                    //                   )
                    //                 ],
                    //               ),
                          leading: Container(
                            width: 70,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    bottomLeft: Radius.circular(7)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/benz-front.png'))),
                          ),
                        ),
                      ),
                    );

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10),
                    //   child: Container(

                    //     child: Row(
                    //       children: [

                    //         Container(
                    //           // height: 80,
                    //           // width: 80,
                    //           decoration: const BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(7),
                    //                   bottomLeft: Radius.circular(7)),
                    //               image: DecorationImage(
                    //                   fit: BoxFit.cover,
                    //                   image: AssetImage(
                    //                       'assets/images/benz-front.png'))),
                    //         ),

                    //         Container(
                    //           height: 80,
                    //           width: MediaQuery.of(context).size.width * 0.72,
                    //           decoration: const BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(7),
                    //                   bottomLeft: Radius.circular(7)),
                    //               color: Color(0xffe7e7f4)),
                    //           child: Column(
                    //             children: [
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   const Text(
                    //                     'Toyota Corolla 2020',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         fontSize: 15,
                    //                         color: Colors.black87),
                    //                   ),
                    //                   const Icon(
                    //                     Icons.star,
                    //                     color: Color(0xfff8c123),
                    //                   )
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
