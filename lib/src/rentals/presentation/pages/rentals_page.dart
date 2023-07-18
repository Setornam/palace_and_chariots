import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/vehicles_tab_bar_view.dart';

import '../widgets/accommodation_tab_bar_view.dart';

class RentalsPage extends StatefulWidget {
  const RentalsPage({super.key});

  @override
  State<RentalsPage> createState() => _RentalsPageState();
}

class _RentalsPageState extends State<RentalsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
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
                      'Rentals',
                      style: TextStyle(color: lightColorScheme.primary),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'What are you searching for?',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffe7e9f4)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    fillColor: Color(0xffe7e9f4),
                  ),
                ),
              ),
            ]),
          ),
          bottom: TabBar(
            indicatorColor: lightColorScheme.primary,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 35),
            indicatorWeight: 6,
            labelColor: lightColorScheme.primary,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.symmetric(horizontal: 5),
            tabs: const [
              Tab(
                text: 'Vehicles',
              ),
              Tab(
                text: 'Accommodation',
              ),
              Tab(
                text: 'Event Services',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            VehiclesTabBarView(),
            AccommodationTabBarView(),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
