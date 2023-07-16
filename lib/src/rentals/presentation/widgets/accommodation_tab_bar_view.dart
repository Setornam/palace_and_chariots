import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';

import '../../../../shared/theme/color_scheme.dart';

class AccommodationTabBarView extends StatefulWidget {
  const AccommodationTabBarView({super.key});

  @override
  State<AccommodationTabBarView> createState() => _AccommodationTabBarViewState();
}

class _AccommodationTabBarViewState extends State<AccommodationTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///accommodation buttons
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  backgroundColor: lightColorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  elevation: 0,
                ),
                child: const Text(
                  'Apartments',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: lightColorScheme.primary),
                        borderRadius: const BorderRadius.all(Radius.circular(8))),
                    backgroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    elevation: 0,
                  ),
                  child: Text(
                    'Hotels',
                    style:
                        TextStyle(fontSize: 13, color: lightColorScheme.primary),
                  ),
                ),
              ),

            ],
          ),

          ///search container
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border(top:BorderSide(color: lightColorScheme.primary),left: BorderSide(color: lightColorScheme.primary),right: BorderSide(color: lightColorScheme.primary),bottom: BorderSide(color: lightColorScheme.primary,width: 0.011) ),
                borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Colors.black54
                        ),
                        Text(
                          '   Enter destination',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const Icon(
                            Icons.calendar_today_outlined,
                            size: 18,
                            color: Colors.black54
                        ),
                        Text(
                          '   Fri 28 Apr - Sat, 29 Apr',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const Icon(
                            Icons.person_2_outlined,
                            size: 18,
                            color: Colors.black54
                        ),
                        Text(
                          '   1 room - 2 adults - no children ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium,
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          backgroundColor: lightColorScheme.primary,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: () {},
                        child: Text('Search')),
                  )
                ],
              ),
            ),
          ),



          ///best rooms
          ///
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Best Rooms',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                            height: 80,
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
                                        'Superior Twin',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),

                                      Text(
                                        ' Available',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: lightColorScheme.primary),
                                      ),



                                    ],
                                  ),
                                  Row(
                                    children: [
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
                                      )
                                    ],
                                  ),


                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.bed,
                                        size: 18,
                                        color: Colors.black54
                                      ),
                                      Text(
                                        '1 King size bed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
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
      ),
    );
  }
}
