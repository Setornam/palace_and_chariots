import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/event_tab_bar_view.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/vehicles_tab_bar_view.dart';

import '../widgets/accommodation_tab_bar_view.dart';
import '../widgets/search_page.dart';

class RentalsPage extends StatefulWidget {
  const RentalsPage({super.key});

  @override
  State<RentalsPage> createState() => _RentalsPageState();
}

class _RentalsPageState extends State<RentalsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Vehicles'),
    Tab(text: 'Accommodation'),
    Tab(text: 'Event Services')
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: tabs.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Visibility(
              visible: _selectedTabIndex == 0 ? true : false,
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SearchPage())),
                child: const SearchBar(),
              ),
            ),
          ]),
        ),
        bottom: TabBar(
          controller: _tabController,
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
          onTap: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          VehiclesTabBarView(),
          AccommodationTabBarView(),
          EventTabBarView()
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
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
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffe7e9f4)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffe7e9f4)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          fillColor: Color(0xffe7e9f4),
        ),
      ),
    );
  }
}
