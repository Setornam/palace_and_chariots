import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/accommodation_tab_bar_view.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/vehicles_tab_bar_view.dart';



class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                      'Sales',
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
             
            ],
          ),
        ),
       
        body: const TabBarView(
          children: [
            VehiclesTabBarView(),
            AccommodationTabBarView()
           
          ],
        ),
      ),
    );
  }
}
