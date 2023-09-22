import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

import '../../../rentals/presentation/widgets/accommodation_details_.dart';

class HistoryTabBarView extends StatefulWidget {
  const HistoryTabBarView({super.key});

  @override
  State<HistoryTabBarView> createState() =>
      _HistoryTabBarViewState();
}

class _HistoryTabBarViewState extends State<HistoryTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          //hotel reservation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hotel Reservation',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: lightColorScheme.primary),
              ),
              Text('12/04/2022', style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AccommodationDetailsPage()));
              },
              child:
              
               Row(
                children: [
                  Container(
                    height: 120,
                    width: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/hotel.png'))),
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
                      height: 120,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7)),
                          color: Color(0xffe7e7f4)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Accra City Hotel',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 18,
                                ),
                                Text(
                                  ' 4 km away | ',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Color(0xfff8c123),
                                ),
                                Text(
                                  ' 4.5',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  ' | 10 reviews',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Superior room: 1 bed',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('300 (USD)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 18,
                                          color: lightColorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                        )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Include taxes',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                        )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      size: 14,
                                      color: lightColorScheme.primary,
                                    ),
                                    Text(' Free cancellation',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              color: lightColorScheme.primary,
                                            )),
                                  ],
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

          //tourism reservation
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tourism Reservation',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: lightColorScheme.primary),
                ),
                Text('12/04/2022',
                    style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
