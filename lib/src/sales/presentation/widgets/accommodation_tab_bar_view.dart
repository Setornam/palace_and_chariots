import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/destination_search_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/search_result_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../injection_container.dart';
import '../../../../shared/theme/color_scheme.dart';
import '../../accommodation/domain/entities/house.dart';
import '../../accommodation/presentation/bloc/house_bloc.dart';
import '../../cars/presentation/bloc/car_bloc.dart';
import 'view_more_houses_page .dart';

class AccommodationTabBarView extends StatefulWidget {
  const AccommodationTabBarView({super.key});

  @override
  State<AccommodationTabBarView> createState() =>
      _AccommodationTabBarViewState();
}

class _AccommodationTabBarViewState extends State<AccommodationTabBarView> {
  final bloc = sl<HouseBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<List<House>>(
          stream: bloc.houses(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //list of houses
              List<House> houses = List.from(snapshot.requireData);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///best rooms
                  ///
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'House For Sale',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ViewMoreHouses(
                                          houses: houses,
                                        )));
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
                    height: 530,
                    child: ListView.builder(
                        itemCount: houses.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 115,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/room.jpg'))),
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
                                    height: 115,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                            bottomLeft: Radius.circular(7)),
                                        color: Color(0xffe7e7f4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                houses[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                size: 18,
                                              ),
                                              Text(
                                                houses[index].location,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              ' GHS ${houses[index].price}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: lightColorScheme
                                                          .primary,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${houses[index].condition} | ${houses[index].amenities['bathrooms']} | ${houses[index].amenities['bedrooms']} | ${houses[index].facilities.first}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
