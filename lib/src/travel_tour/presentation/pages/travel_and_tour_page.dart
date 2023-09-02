import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/travel_tour/presentation/widgets/tourism_tab_bar.dart';
import 'package:palace_and_chariots/src/travel_tour/presentation/widgets/travel_tab_bar_view.dart';

class TravelAndTourPage extends StatefulWidget {
  const TravelAndTourPage({super.key});

  @override
  State<TravelAndTourPage> createState() => _TravelAndTourPageState();
}

class _TravelAndTourPageState extends State<TravelAndTourPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Row(
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
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Travel And Tourism',
                    style: TextStyle(color: lightColorScheme.primary),
                  ),
                )
              ],
            ),
          ),
          bottom: TabBar(
            indicatorColor: lightColorScheme.primary,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 65),
            indicatorWeight: 6,
            labelColor: lightColorScheme.primary,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.symmetric(horizontal: 5),
            tabs: const [
              Tab(
                text: 'Travel',
              ),
              Tab(
                text: 'Tourism',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [TravelTabBarView(), TourismTabBarView()],
        ),
      ),
    );
  }
}
