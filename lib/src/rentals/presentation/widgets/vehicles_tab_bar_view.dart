import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';

import '../../../../shared/theme/color_scheme.dart';

class VehiclesTabBarView extends StatefulWidget {
  const VehiclesTabBarView({super.key});

  @override
  State<VehiclesTabBarView> createState() => _VehiclesTabBarViewState();
}

class _VehiclesTabBarViewState extends State<VehiclesTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ///vehicle buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  'Saloon',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              ElevatedButton(
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
                  'Bus',
                  style:
                      TextStyle(fontSize: 13, color: lightColorScheme.primary),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: lightColorScheme.primary),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 0,
                ),
                child: Text(
                  'Private jet',
                  style:
                      TextStyle(fontSize: 13, color: lightColorScheme.primary),
                ),
              )
            ],
          ),

          ///vehicle brands
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(ImageAssets.mercedesLogo),
                    Text('Mercedes')
                  ],
                ),
                Column(
                  children: [Image.asset(ImageAssets.BMWLogo), Text('BMW')],
                ),
                Column(
                  children: [Image.asset(ImageAssets.lexusLogo), Text('Lexus')],
                ),
                Column(
                  children: [Image.asset(ImageAssets.kiaLogo), Text('KIA')],
                ),
                Column(
                  children: [Image.asset(ImageAssets.hondaLogo), Text('Honda')],
                )
              ],
            ),
          ),

          ///best cars
          ///
          SizedBox(
            height: 200,
            child: ListView.builder(itemBuilder: (BuildContext context, index) {
              return Container(
                child: Row(
                  children: [Image.asset('assets/images/benz_front.png')],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
