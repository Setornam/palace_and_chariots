import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/travel_tour/presentation/widgets/tourism_details.dart';

import '../../../../shared/theme/color_scheme.dart';

class TourismTabBarView extends StatefulWidget {
  const TourismTabBarView({super.key});

  @override
  State<TourismTabBarView> createState() => _TourismTabBarViewState();
}

class _TourismTabBarViewState extends State<TourismTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 680,
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TourismDetailsPage()));
                  },
                  child: Row(
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
                                image:
                                    AssetImage('assets/images/capecoast.png'))),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Cape Coast Tour',
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
                                      Icons.timelapse,
                                      size: 18,
                                    ),
                                    Text(
                                      ' 40 hours | ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Color(0xfff8c123),
                                    ),
                                    Text(
                                      ' 4.5',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      ' | 10 reviews',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    // Text(
                                    //   'Superior room: 1 bed',
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .bodyMedium,
                                    // )
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                  color:
                                                      lightColorScheme.primary,
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
              );
            }),
      ),
    );
  }
}