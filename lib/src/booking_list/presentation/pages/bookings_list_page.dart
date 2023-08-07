import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';


class BookingsListPage extends StatefulWidget {
  const BookingsListPage({super.key});

  @override
  State<BookingsListPage> createState() => _BookingsListPageState();
}

class _BookingsListPageState extends State<BookingsListPage> {
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
            centerTitle: true,
          title: Text(
            'List',
            style: TextStyle(color: lightColorScheme.primary),
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
                text: 'Active',
              ),
              Tab(
                text: 'History',
              ),
              Tab(
                text: 'Liked',
              )
            ],
          ),
        ),
       
        body: const TabBarView(
          children: [
            VehiclesTabBarView(),
            AccommodationTabBarView(),
            EventTabBarView()
          ],
        ),
      ),
    );
  }
}
