import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [lightColorScheme.primary, Colors.white])),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Get ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35)),
                        Text('15% ',
                            style: TextStyle(
                                color: lightColorScheme.tertiary,
                                fontWeight: FontWeight.bold,
                                fontSize: 35)),
                        const Text('discount  ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35)),
                      ],
                    ),
                    const Text(
                      'When you book a trip to any tourist\ndestination in Ghana',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
