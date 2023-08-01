import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/sales_details_page.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/view_more_page.dart';

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
      child: Column(
        children: [
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

          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Best cars'),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ViewMorePage()));
                  },
                  child: Text(
                    'See More',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: lightColorScheme.primary),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 430,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SalesDetailsPage()));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7),
                                      bottomLeft: Radius.circular(7)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/benz-front.png'))),
                              child: const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(
                                    size: 18,
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 80,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        bottomLeft: Radius.circular(7)),
                                    color: Color(0xffe7e7f4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Toyota Corolla 2020',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xfff8c123),
                                              ),
                                              Text(
                                                '4.5',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Silver |',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            ' Available',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    lightColorScheme.primary),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'GHS 530',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: lightColorScheme
                                                          .primary),
                                                ),
                                                const Text(
                                                  ' |  Per day',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black87),
                                                ),
                                              ],
                                            ),
                                          ),

                                          //order button
                                          SizedBox(
                                            height: 25,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            CheckoutPage()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                backgroundColor:
                                                    lightColorScheme.primary,
                                                elevation: 0,
                                              ),
                                              child: const Text(
                                                'Order',
                                                style: TextStyle(fontSize: 11),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
