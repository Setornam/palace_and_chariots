import 'package:flutter/material.dart';

import '../../../../shared/theme/color_scheme.dart';

class SalesGalleryPage extends StatefulWidget {
  const SalesGalleryPage({super.key});

  @override
  State<SalesGalleryPage> createState() => _SalesGalleryPageState();
}

class _SalesGalleryPageState extends State<SalesGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'Photos',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: lightColorScheme.primary),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: 
          GridView.builder(
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 100,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/benz-front.png'))),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                  ),
                );
              }),
       
        ));
  }
}
