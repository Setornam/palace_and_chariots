import 'package:flutter/material.dart';

import '../../../../shared/theme/color_scheme.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Accra City Hotel - Choose rooms',
            style: Theme.of(context).textTheme.bodyLarge!),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                2,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.man),
                                      Text(
                                        'Price for 2 adults',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.u_turn_right_outlined),
                                    Text(
                                      'Room size: 20m / 300ft',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.wifi),
                                      Text(
                                        'Free Wifi',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.bed),
                                    Text(
                                      '1 extra large double fold bed',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.free_breakfast_outlined),
                                      Text(
                                        'Breakfast available',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.wine_bar),
                                    Text(
                                      'Complimentary minibar',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Text(
                                        'Air condition',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check),
                                    Text(
                                      'Free toiletries',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 200,
                                width: 150,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/room2.png'))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 50,
                            color: lightColorScheme.primary.withOpacity(0.1),
                            child: const Center(
                                child: Text(
                              'price for 14 nights (13 Apr - 15 Apr)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('\$300 (USD)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        color: lightColorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      )),
                              Text('Include taxes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 14,
                                      )),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: lightColorScheme.primary),
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(40),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      constraints:
                                          BoxConstraints.tightFor(height: 120),
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          color: lightColorScheme.primary
                                              .withOpacity(0.1),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$300 (USD)',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              fontSize: 18,
                                                              color:
                                                                  lightColorScheme
                                                                      .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                    Text(
                                                        'Include taxes and charges',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              fontSize: 14,
                                                            )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          lightColorScheme
                                                              .primary,
                                                      minimumSize:
                                                          const Size.fromHeight(
                                                              40),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                      color: lightColorScheme.primary),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
