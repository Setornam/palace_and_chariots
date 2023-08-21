import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/injection_container.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/item_details_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/view_more_page.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/entities/vehicle.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/presentation/bloc/vehicle_bloc.dart';

import '../../../../shared/theme/color_scheme.dart';

class VehiclesTabBarView extends StatefulWidget {
  const VehiclesTabBarView({super.key});

  @override
  State<VehiclesTabBarView> createState() => _VehiclesTabBarViewState();
}

class _VehiclesTabBarViewState extends State<VehiclesTabBarView> {
  final bloc = sl<VehicleBloc>();

  String isActiveVehicle = "Saloon";

  // bool isSaloonCarActive =false;
  // bool isBusActive =false;
  // bool isJetActive =false;

  String isActiveBrand = "";

  final String imagePath =
      '/vehicles/saloon_cars/bmw.jpeg'; // Replace with your image path

  Future<String> getImageUrl() async {
    final Reference storageReference =
        FirebaseStorage.instance.ref().child(imagePath);
    final String downloadUrl = await storageReference.getDownloadURL();
    print(downloadUrl);
    return downloadUrl;
  }

  @override
  void initState() {
    super.initState();
    getImageUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<List<Vehicle>>(
          stream: bloc.vehicles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //list of vehicles
              List<Vehicle> vehicleList = List.from(snapshot.requireData);

              List<Vehicle> saloonList = List.from(
                  vehicleList.where((vehicle) => vehicle.category == 'saloon'));

              List<Vehicle> busList = List.from(
                  vehicleList.where((vehicle) => vehicle.category == 'bus'));

              List<Vehicle> jetList = List.from(vehicleList
                  .where((vehicle) => vehicle.category == 'private Jet'));

              List<Vehicle> mercedesList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand.name == 'Mercedes' &&
                      vehicle.category == "saloon"));

              List<Vehicle> BMWList = List.from(vehicleList.where((vehicle) =>
                  vehicle.brand.name == 'BMW' && vehicle.category == "saloon"));

              List<Vehicle> lexusList = List.from(vehicleList.where((vehicle) =>
                  vehicle.brand.name == 'Lexus' &&
                  vehicle.category == "saloon"));

              List<Vehicle> kiaList = List.from(
                  vehicleList.where((vehicle) => vehicle.brand.name == 'KIA'));

              List<Vehicle> hondaList = List.from(vehicleList.where((vehicle) =>
                  vehicle.brand.name == 'Honda' &&
                  vehicle.category == "saloon"));

              List<Vehicle> mercedesBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand.name == 'Mercedes' &&
                      vehicle.category == "bus"));

              List<Vehicle> BMWBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand.name == 'BMW' &&
                      vehicle.category == "bus"));

              List<Vehicle> lexusBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand.name == 'Lexus' &&
                      vehicle.category == "bus"));

              List<Vehicle> kiaBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand.name == 'KIA' &&
                      vehicle.category == "bus"));

              List<Vehicle> hondaBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand.name == 'Honda' &&
                      vehicle.category == "bus"));

              return Column(
                children: [
                  ///vehicle buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActiveVehicle = "Saloon";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: lightColorScheme.primary),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          backgroundColor: isActiveVehicle == "Saloon"
                              ? lightColorScheme.primary
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          elevation: 0,
                        ),
                        child: Text(
                          'Saloon',
                          style: TextStyle(
                              fontSize: 13,
                              color: isActiveVehicle == "Saloon"
                                  ? Colors.white
                                  : lightColorScheme.primary),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActiveVehicle = "Bus";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: lightColorScheme.primary),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          backgroundColor: isActiveVehicle == "Bus"
                              ? lightColorScheme.primary
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          elevation: 0,
                        ),
                        child: Text(
                          'Bus',
                          style: TextStyle(
                              fontSize: 13,
                              color: isActiveVehicle == "Bus"
                                  ? Colors.white
                                  : lightColorScheme.primary),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActiveVehicle = "Private jet";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: lightColorScheme.primary),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          backgroundColor: isActiveVehicle == "Private jet"
                              ? lightColorScheme.primary
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          elevation: 0,
                        ),
                        child: Text(
                          'Private jet',
                          style: TextStyle(
                              fontSize: 13,
                              color: isActiveVehicle == "Private jet"
                                  ? Colors.white
                                  : lightColorScheme.primary),
                        ),
                      )
                    ],
                  ),

                  ///vehicle brands
                  ///
                  isActiveVehicle == "Saloon" || isActiveVehicle == "Bus"
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActiveBrand = "Mercedes";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.mercedesLogo),
                                    const Text('Mercedes')
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActiveBrand = "BMW";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.BMWLogo),
                                    const Text('BMW')
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActiveBrand = "Lexus";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.lexusLogo),
                                    const Text('Lexus')
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActiveBrand = "KIA";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.kiaLogo),
                                    const Text('KIA')
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActiveBrand = "Honda";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.hondaLogo),
                                    const Text('Honda')
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),

                  isActiveVehicle == "Saloon"
                      ?

                      ///best saloon cars
                      ///
                      ///

                      Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Best cars'),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const ViewMorePage()));
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
                            isActiveBrand == "Mercedes"
                                ?

                                //display a list of all mercedes brand cars

                                SizedBox(
                                    height: 430,
                                    child: ListView.builder(
                                        itemCount: mercedesList.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const ItemDetailsPage()));
                                              },
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 80,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          7)),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  mercedesList[
                                                                          index]
                                                                      .images
                                                                      .first
                                                                      .toString()))),
                                                      child: const Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Icon(
                                                            size: 18,
                                                            Icons
                                                                .favorite_outline,
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
                                                                topLeft: Radius
                                                                    .circular(
                                                                        7),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        7)),
                                                            color: Color(
                                                                0xffe7e7f4)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    mercedesList[
                                                                            index]
                                                                        .name,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black87),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Color(
                                                                            0xfff8c123),
                                                                      ),
                                                                      Text(
                                                                        mercedesList[index]
                                                                            .rating,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    '${mercedesList[index].color} |',
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .black87),
                                                                  ),
                                                                  Text(
                                                                    snapshot.requireData[index].availability ==
                                                                            true
                                                                        ? "  Available"
                                                                        : "   Unavailable",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: lightColorScheme
                                                                            .primary),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          'GHS ${mercedesList[index].price}',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 15,
                                                                              color: lightColorScheme.primary),
                                                                        ),
                                                                        const Text(
                                                                          ' |  Per day',
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.black87),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  //order button
                                                                  SizedBox(
                                                                    height: 25,
                                                                    child:
                                                                        ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(5))),
                                                                        backgroundColor:
                                                                            lightColorScheme.primary,
                                                                        elevation:
                                                                            0,
                                                                      ),
                                                                      child:
                                                                          const Text(
                                                                        'Order',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                11),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : isActiveBrand == "BMW"
                                    ? SizedBox(
                                        height: 430,
                                        child: ListView.builder(
                                            itemCount: BMWList.length,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                const ItemDetailsPage()));
                                                  },
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 80,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          7)),
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(BMWList[
                                                                          index]
                                                                      .images
                                                                      .first
                                                                      .toString()))),
                                                          child: const Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Icon(
                                                                size: 18,
                                                                Icons
                                                                    .favorite_outline,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 80,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            7),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            7)),
                                                                color: Color(
                                                                    0xffe7e7f4)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        BMWList[index]
                                                                            .name,
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.black87),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                Color(0xfff8c123),
                                                                          ),
                                                                          Text(
                                                                            BMWList[index].rating,
                                                                            style:
                                                                                Theme.of(context).textTheme.bodyMedium,
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        '${BMWList[index].color} |',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.black87),
                                                                      ),
                                                                      Text(
                                                                        snapshot.requireData[index].availability ==
                                                                                true
                                                                            ? "  Available"
                                                                            : "   Unavailable",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                lightColorScheme.primary),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 5),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              'GHS ${BMWList[index].price}',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                            ),
                                                                            const Text(
                                                                              ' |  Per day',
                                                                              style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),

                                                                      //order button
                                                                      SizedBox(
                                                                        height:
                                                                            25,
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                          },
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            shape:
                                                                                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                            backgroundColor:
                                                                                lightColorScheme.primary,
                                                                            elevation:
                                                                                0,
                                                                          ),
                                                                          child:
                                                                              const Text(
                                                                            'Order',
                                                                            style:
                                                                                TextStyle(fontSize: 11),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      )

                                    //Lexus cars
                                    : isActiveBrand == "Lexus"
                                        ? SizedBox(
                                            height: 430,
                                            child: ListView.builder(
                                                itemCount: lexusList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    const ItemDetailsPage()));
                                                      },
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 80,
                                                              width: 80,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: const BorderRadius
                                                                          .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              7),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              7)),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: NetworkImage(lexusList[
                                                                              index]
                                                                          .images
                                                                          .first
                                                                          .toString()))),
                                                              child:
                                                                  const Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: Icon(
                                                                    size: 18,
                                                                    Icons
                                                                        .favorite_outline,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                height: 80,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                7),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                7)),
                                                                    color: Color(
                                                                        0xffe7e7f4)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            lexusList[index].name,
                                                                            style: const TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 15,
                                                                                color: Colors.black87),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(
                                                                                Icons.star,
                                                                                color: Color(0xfff8c123),
                                                                              ),
                                                                              Text(
                                                                                lexusList[index].rating,
                                                                                style: Theme.of(context).textTheme.bodyMedium,
                                                                              )
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            '${lexusList[index].color} |',
                                                                            style:
                                                                                const TextStyle(fontSize: 13, color: Colors.black87),
                                                                          ),
                                                                          Text(
                                                                            snapshot.requireData[index].availability == true
                                                                                ? "  Available"
                                                                                : "   Unavailable",
                                                                            style:
                                                                                TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 5),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text(
                                                                                  'GHS ${lexusList[index].price}',
                                                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                ),
                                                                                const Text(
                                                                                  ' |  Per day',
                                                                                  style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),

                                                                          //order button
                                                                          SizedBox(
                                                                            height:
                                                                                25,
                                                                            child:
                                                                                ElevatedButton(
                                                                              onPressed: () {
                                                                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                backgroundColor: lightColorScheme.primary,
                                                                                elevation: 0,
                                                                              ),
                                                                              child: const Text(
                                                                                'Order',
                                                                                style: TextStyle(fontSize: 11),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          )

                                        //kia
                                        : isActiveBrand == "KIA"
                                            ? SizedBox(
                                                height: 430,
                                                child: ListView.builder(
                                                    itemCount: kiaList.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        const ItemDetailsPage()));
                                                          },
                                                          child: Container(
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                              .only(
                                                                          topLeft: Radius.circular(
                                                                              7),
                                                                          bottomLeft: Radius.circular(
                                                                              7)),
                                                                      image: DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image: NetworkImage(kiaList[index]
                                                                              .images
                                                                              .first
                                                                              .toString()))),
                                                                  child:
                                                                      const Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Icon(
                                                                        size:
                                                                            18,
                                                                        Icons
                                                                            .favorite_outline,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height: 80,
                                                                    decoration: const BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft: Radius.circular(
                                                                                7),
                                                                            bottomLeft: Radius.circular(
                                                                                7)),
                                                                        color: Color(
                                                                            0xffe7e7f4)),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                kiaList[index].name,
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  const Icon(
                                                                                    Icons.star,
                                                                                    color: Color(0xfff8c123),
                                                                                  ),
                                                                                  Text(
                                                                                    kiaList[index].rating,
                                                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                '${kiaList[index].color} |',
                                                                                style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                              ),
                                                                              Text(
                                                                                snapshot.requireData[index].availability == true ? "  Available" : "   Unavailable",
                                                                                style: TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(top: 5),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      'GHS ${kiaList[index].price}',
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                    ),
                                                                                    const Text(
                                                                                      ' |  Per day',
                                                                                      style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),

                                                                              //order button
                                                                              SizedBox(
                                                                                height: 25,
                                                                                child: ElevatedButton(
                                                                                  onPressed: () {
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                                  },
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                    backgroundColor: lightColorScheme.primary,
                                                                                    elevation: 0,
                                                                                  ),
                                                                                  child: const Text(
                                                                                    'Order',
                                                                                    style: TextStyle(fontSize: 11),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              )
                                            : isActiveBrand == "Honda"
                                                ? SizedBox(
                                                    height: 430,
                                                    child: ListView.builder(
                                                        itemCount:
                                                            hondaList.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (BuildContext context) =>
                                                                                const ItemDetailsPage()));
                                                              },
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          80,
                                                                      width: 80,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: const BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                  7),
                                                                              bottomLeft: Radius.circular(
                                                                                  7)),
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(hondaList[index].images.first.toString()))),
                                                                      child:
                                                                          const Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Icon(
                                                                            size:
                                                                                18,
                                                                            Icons.favorite_outline,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            80,
                                                                        decoration: const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                                                            color: Color(0xffe7e7f4)),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    hondaList[index].name,
                                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      const Icon(
                                                                                        Icons.star,
                                                                                        color: Color(0xfff8c123),
                                                                                      ),
                                                                                      Text(
                                                                                        BMWList[index].rating,
                                                                                        style: Theme.of(context).textTheme.bodyMedium,
                                                                                      )
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    '${hondaList[index].color} |',
                                                                                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                                  ),
                                                                                  Text(
                                                                                    hondaList[index].availability == true ? "  Available" : "   Unavailable",
                                                                                    style: TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(top: 5),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'GHS ${hondaList[index].price}',
                                                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                        ),
                                                                                        const Text(
                                                                                          ' |  Per day',
                                                                                          style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),

                                                                                  //order button
                                                                                  SizedBox(
                                                                                    height: 25,
                                                                                    child: ElevatedButton(
                                                                                      onPressed: () {
                                                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                                      },
                                                                                      style: ElevatedButton.styleFrom(
                                                                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                        backgroundColor: lightColorScheme.primary,
                                                                                        elevation: 0,
                                                                                      ),
                                                                                      child: const Text(
                                                                                        'Order',
                                                                                        style: TextStyle(fontSize: 11),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  )
                                                : SizedBox(
                                                    height: 430,
                                                    child: ListView.builder(
                                                        itemCount:
                                                            saloonList.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (BuildContext context) =>
                                                                                const ItemDetailsPage()));
                                                              },
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          80,
                                                                      width: 80,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: const BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                  7),
                                                                              bottomLeft: Radius.circular(
                                                                                  7)),
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(vehicleList[index].images.first.toString()))),
                                                                      child:
                                                                          const Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Icon(
                                                                            size:
                                                                                18,
                                                                            Icons.favorite_outline,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            80,
                                                                        decoration: const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                                                            color: Color(0xffe7e7f4)),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    vehicleList[index].name,
                                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      const Icon(
                                                                                        Icons.star,
                                                                                        color: Color(0xfff8c123),
                                                                                      ),
                                                                                      Text(
                                                                                        saloonList[index].rating,
                                                                                        style: Theme.of(context).textTheme.bodyMedium,
                                                                                      )
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    '${saloonList[index].color} |',
                                                                                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                                  ),
                                                                                  Text(
                                                                                    snapshot.requireData[index].availability == true ? "  Available" : "   Unavailable",
                                                                                    style: TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(top: 5),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'GHS ${saloonList[index].price}',
                                                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                        ),
                                                                                        const Text(
                                                                                          ' |  Per day',
                                                                                          style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),

                                                                                  //order button
                                                                                  SizedBox(
                                                                                    height: 25,
                                                                                    child: ElevatedButton(
                                                                                      onPressed: () {
                                                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                                      },
                                                                                      style: ElevatedButton.styleFrom(
                                                                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                        backgroundColor: lightColorScheme.primary,
                                                                                        elevation: 0,
                                                                                      ),
                                                                                      child: const Text(
                                                                                        'Order',
                                                                                        style: TextStyle(fontSize: 11),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  )
                          ],
                        )
                      : isActiveVehicle == "Bus"
                          ?
                          //best buses
                          Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Best buses'),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const ViewMorePage()));
                                        },
                                        child: Text(
                                          'See More',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: lightColorScheme.primary),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                isActiveBrand == "Mercedes"
                                    ?

                                    //display a list of all mercedes brand buses

                                    SizedBox(
                                        height: 430,
                                        child: ListView.builder(
                                            itemCount: mercedesBusList.length,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                const ItemDetailsPage()));
                                                  },
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 80,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          7)),
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(
                                                                      mercedesBusList[
                                                                              index]
                                                                          .images
                                                                          .first
                                                                          .toString()))),
                                                          child: const Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Icon(
                                                                size: 18,
                                                                Icons
                                                                    .favorite_outline,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 80,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            7),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            7)),
                                                                color: Color(
                                                                    0xffe7e7f4)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        mercedesBusList[index]
                                                                            .name,
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.black87),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                Color(0xfff8c123),
                                                                          ),
                                                                          Text(
                                                                            mercedesBusList[index].rating,
                                                                            style:
                                                                                Theme.of(context).textTheme.bodyMedium,
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        '${mercedesBusList[index].color} |',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.black87),
                                                                      ),
                                                                      Text(
                                                                        snapshot.requireData[index].availability ==
                                                                                true
                                                                            ? "  Available"
                                                                            : "   Unavailable",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                lightColorScheme.primary),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 5),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              'GHS ${mercedesBusList[index].price}',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                            ),
                                                                            const Text(
                                                                              ' |  Per day',
                                                                              style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),

                                                                      //order button
                                                                      SizedBox(
                                                                        height:
                                                                            25,
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                          },
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            shape:
                                                                                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                            backgroundColor:
                                                                                lightColorScheme.primary,
                                                                            elevation:
                                                                                0,
                                                                          ),
                                                                          child:
                                                                              const Text(
                                                                            'Order',
                                                                            style:
                                                                                TextStyle(fontSize: 11),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                    : isActiveBrand == "BMW"
                                        ? SizedBox(
                                            height: 430,
                                            child: ListView.builder(
                                                itemCount: BMWBusList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    const ItemDetailsPage()));
                                                      },
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 80,
                                                              width: 80,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: const BorderRadius
                                                                          .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              7),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              7)),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: NetworkImage(BMWBusList[
                                                                              index]
                                                                          .images
                                                                          .first
                                                                          .toString()))),
                                                              child:
                                                                  const Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: Icon(
                                                                    size: 18,
                                                                    Icons
                                                                        .favorite_outline,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                height: 80,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                7),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                7)),
                                                                    color: Color(
                                                                        0xffe7e7f4)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            BMWBusList[index].name,
                                                                            style: const TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 15,
                                                                                color: Colors.black87),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(
                                                                                Icons.star,
                                                                                color: Color(0xfff8c123),
                                                                              ),
                                                                              Text(
                                                                                BMWBusList[index].rating,
                                                                                style: Theme.of(context).textTheme.bodyMedium,
                                                                              )
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            '${BMWBusList[index].color} |',
                                                                            style:
                                                                                const TextStyle(fontSize: 13, color: Colors.black87),
                                                                          ),
                                                                          Text(
                                                                            snapshot.requireData[index].availability == true
                                                                                ? "  Available"
                                                                                : "   Unavailable",
                                                                            style:
                                                                                TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 5),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text(
                                                                                  'GHS ${BMWBusList[index].price}',
                                                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                ),
                                                                                const Text(
                                                                                  ' |  Per day',
                                                                                  style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),

                                                                          //order button
                                                                          SizedBox(
                                                                            height:
                                                                                25,
                                                                            child:
                                                                                ElevatedButton(
                                                                              onPressed: () {
                                                                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                backgroundColor: lightColorScheme.primary,
                                                                                elevation: 0,
                                                                              ),
                                                                              child: const Text(
                                                                                'Order',
                                                                                style: TextStyle(fontSize: 11),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          )

                                        //Lexus cars
                                        : isActiveBrand == "Lexus"
                                            ? SizedBox(
                                                height: 430,
                                                child: ListView.builder(
                                                    itemCount:
                                                        lexusBusList.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        const ItemDetailsPage()));
                                                          },
                                                          child: Container(
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                              .only(
                                                                          topLeft: Radius.circular(
                                                                              7),
                                                                          bottomLeft: Radius.circular(
                                                                              7)),
                                                                      image: DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image: NetworkImage(lexusBusList[index]
                                                                              .images
                                                                              .first
                                                                              .toString()))),
                                                                  child:
                                                                      const Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Icon(
                                                                        size:
                                                                            18,
                                                                        Icons
                                                                            .favorite_outline,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height: 80,
                                                                    decoration: const BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft: Radius.circular(
                                                                                7),
                                                                            bottomLeft: Radius.circular(
                                                                                7)),
                                                                        color: Color(
                                                                            0xffe7e7f4)),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                lexusBusList[index].name,
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  const Icon(
                                                                                    Icons.star,
                                                                                    color: Color(0xfff8c123),
                                                                                  ),
                                                                                  Text(
                                                                                    lexusBusList[index].rating,
                                                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                '${lexusList[index].color} |',
                                                                                style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                              ),
                                                                              Text(
                                                                                snapshot.requireData[index].availability == true ? "  Available" : "   Unavailable",
                                                                                style: TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(top: 5),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      'GHS ${lexusBusList[index].price}',
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                    ),
                                                                                    const Text(
                                                                                      ' |  Per day',
                                                                                      style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),

                                                                              //order button
                                                                              SizedBox(
                                                                                height: 25,
                                                                                child: ElevatedButton(
                                                                                  onPressed: () {
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                                  },
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                    backgroundColor: lightColorScheme.primary,
                                                                                    elevation: 0,
                                                                                  ),
                                                                                  child: const Text(
                                                                                    'Order',
                                                                                    style: TextStyle(fontSize: 11),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              )

                                            //kia
                                            : isActiveBrand == "KIA"
                                                ? SizedBox(
                                                    height: 430,
                                                    child: ListView.builder(
                                                        itemCount:
                                                            kiaBusList.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (BuildContext context) =>
                                                                                const ItemDetailsPage()));
                                                              },
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          80,
                                                                      width: 80,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: const BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                  7),
                                                                              bottomLeft: Radius.circular(
                                                                                  7)),
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(kiaBusList[index].images.first.toString()))),
                                                                      child:
                                                                          const Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Icon(
                                                                            size:
                                                                                18,
                                                                            Icons.favorite_outline,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            80,
                                                                        decoration: const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                                                            color: Color(0xffe7e7f4)),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    kiaBusList[index].name,
                                                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      const Icon(
                                                                                        Icons.star,
                                                                                        color: Color(0xfff8c123),
                                                                                      ),
                                                                                      Text(
                                                                                        kiaList[index].rating,
                                                                                        style: Theme.of(context).textTheme.bodyMedium,
                                                                                      )
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    '${kiaBusList[index].color} |',
                                                                                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                                  ),
                                                                                  Text(
                                                                                    snapshot.requireData[index].availability == true ? "  Available" : "   Unavailable",
                                                                                    style: TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(top: 5),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'GHS ${kiaBusList[index].price}',
                                                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                        ),
                                                                                        const Text(
                                                                                          ' |  Per day',
                                                                                          style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),

                                                                                  //order button
                                                                                  SizedBox(
                                                                                    height: 25,
                                                                                    child: ElevatedButton(
                                                                                      onPressed: () {
                                                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                                      },
                                                                                      style: ElevatedButton.styleFrom(
                                                                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                        backgroundColor: lightColorScheme.primary,
                                                                                        elevation: 0,
                                                                                      ),
                                                                                      child: const Text(
                                                                                        'Order',
                                                                                        style: TextStyle(fontSize: 11),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  )
                                                : isActiveBrand == "Honda"
                                                    ? SizedBox(
                                                        height: 430,
                                                        child: ListView.builder(
                                                            itemCount:
                                                                hondaBusList
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    index) {
                                                              return Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (BuildContext context) =>
                                                                                const ItemDetailsPage()));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              80,
                                                                          width:
                                                                              80,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                                                              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(hondaBusList[index].images.first.toString()))),
                                                                          child:
                                                                              const Align(
                                                                            alignment:
                                                                                Alignment.topLeft,
                                                                            child:
                                                                                Padding(
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
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                80,
                                                                            decoration:
                                                                                const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)), color: Color(0xffe7e7f4)),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        hondaBusList[index].name,
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          const Icon(
                                                                                            Icons.star,
                                                                                            color: Color(0xfff8c123),
                                                                                          ),
                                                                                          Text(
                                                                                            hondaBusList[index].rating,
                                                                                            style: Theme.of(context).textTheme.bodyMedium,
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      Text(
                                                                                        '${hondaBusList[index].color} |',
                                                                                        style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                                      ),
                                                                                      Text(
                                                                                        hondaList[index].availability == true ? "  Available" : "   Unavailable",
                                                                                        style: TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Text(
                                                                                              'GHS ${hondaBusList[index].price}',
                                                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                            ),
                                                                                            const Text(
                                                                                              ' |  Per day',
                                                                                              style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),

                                                                                      //order button
                                                                                      SizedBox(
                                                                                        height: 25,
                                                                                        child: ElevatedButton(
                                                                                          onPressed: () {
                                                                                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                            backgroundColor: lightColorScheme.primary,
                                                                                            elevation: 0,
                                                                                          ),
                                                                                          child: const Text(
                                                                                            'Order',
                                                                                            style: TextStyle(fontSize: 11),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                    : SizedBox(
                                                        height: 430,
                                                        child: ListView.builder(
                                                            itemCount:
                                                                busList.length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    index) {
                                                              return Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (BuildContext context) =>
                                                                                const ItemDetailsPage()));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              80,
                                                                          width:
                                                                              80,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                                                              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(busList[index].images.first.toString()))),
                                                                          child:
                                                                              const Align(
                                                                            alignment:
                                                                                Alignment.topLeft,
                                                                            child:
                                                                                Padding(
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
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                80,
                                                                            decoration:
                                                                                const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)), color: Color(0xffe7e7f4)),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        busList[index].name,
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          const Icon(
                                                                                            Icons.star,
                                                                                            color: Color(0xfff8c123),
                                                                                          ),
                                                                                          Text(
                                                                                            vehicleList[index].rating,
                                                                                            style: Theme.of(context).textTheme.bodyMedium,
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      Text(
                                                                                        '${busList[index].color} |',
                                                                                        style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                                      ),
                                                                                      Text(
                                                                                        snapshot.requireData[index].availability == true ? "  Available" : "   Unavailable",
                                                                                        style: TextStyle(fontSize: 13, color: lightColorScheme.primary),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Text(
                                                                                              'GHS ${busList[index].price}',
                                                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: lightColorScheme.primary),
                                                                                            ),
                                                                                            const Text(
                                                                                              ' |  Per day',
                                                                                              style: TextStyle(fontSize: 13, color: Colors.black87),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),

                                                                                      //order button
                                                                                      SizedBox(
                                                                                        height: 25,
                                                                                        child: ElevatedButton(
                                                                                          onPressed: () {
                                                                                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage()));
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                            backgroundColor: lightColorScheme.primary,
                                                                                            elevation: 0,
                                                                                          ),
                                                                                          child: const Text(
                                                                                            'Order',
                                                                                            style: TextStyle(fontSize: 11),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      )
                              ],
                            )
                          : Container(),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Best jets'),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ViewMorePage()));
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
                        height: 430,
                        child: ListView.builder(
                            itemCount: jetList.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const ItemDetailsPage()));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(7),
                                                      bottomLeft:
                                                          Radius.circular(7)),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      jetList[index]
                                                          .images
                                                          .first
                                                          .toString()))),
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
                                                    bottomLeft:
                                                        Radius.circular(7)),
                                                color: Color(0xffe7e7f4)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        jetList[index].name,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Color(
                                                                0xfff8c123),
                                                          ),
                                                          Text(
                                                            jetList[index]
                                                                .rating,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${jetList[index].color} |',
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                      Text(
                                                        jetList[index]
                                                                    .availability ==
                                                                true
                                                            ? "  Available"
                                                            : "   Unavailable",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                lightColorScheme
                                                                    .primary),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'GHS ${jetList[index].price}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                  color: lightColorScheme
                                                                      .primary),
                                                            ),
                                                            const Text(
                                                              ' |  Per day',
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      //order button
                                                      SizedBox(
                                                        height: 25,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        const CheckoutPage()));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            backgroundColor:
                                                                lightColorScheme
                                                                    .primary,
                                                            elevation: 0,
                                                          ),
                                                          child: const Text(
                                                            'Order',
                                                            style: TextStyle(
                                                                fontSize: 11),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  )
                ],
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
            }
            return const Center(
              child: Text('Sorry no vehicles '),
            );
          }),
    );
  }
}
