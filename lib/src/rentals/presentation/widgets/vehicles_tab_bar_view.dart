import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/injection_container.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/vehicle_details_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/view_more_bus_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/view_more_cars_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/view_more_jets_page.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/entities/vehicle.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/presentation/bloc/vehicle_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../../checkout/presentation/pages/jet_checkout_page.dart';
import '../../../wishlist/wishlist.dart';

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
      '/vehicles/saloon_cars/bmw3.jpeg'; // Replace with your image path

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
                  .where((vehicle) => vehicle.category == 'private jet'));

              List<Vehicle> lexusList = List.from(vehicleList.where((vehicle) =>
                  vehicle.brand!.name == 'lexus' &&
                  vehicle.category == "saloon"));

              List<Vehicle> mercedesList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand!.name == 'Mercedes' &&
                      vehicle.category == "saloon"));

              List<Vehicle> BMWList = List.from(vehicleList.where((vehicle) =>
                  vehicle.brand!.name == 'BMW' &&
                  vehicle.category == "saloon"));

              List<Vehicle> kiaList = List.from(vehicleList.where((vehicle) =>
                  vehicle.brand!.name == 'KIA' &&
                  vehicle.category == "saloon"));

              List<Vehicle> hondaList = List.from(vehicleList.where((vehicle) =>
                  vehicle.brand!.name == 'Honda' &&
                  vehicle.category == "saloon"));

              List<Vehicle> lexusBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand!.name == 'lexus' &&
                      vehicle.category == "bus"));

              List<Vehicle> BMWBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand!.name == 'BMW' &&
                      vehicle.category == "bus"));

              List<Vehicle> kiaBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand!.name == 'KIA' &&
                      vehicle.category == "bus"));

              List<Vehicle> hondaBusList = List.from(vehicleList.where(
                  (vehicle) =>
                      vehicle.brand!.name == 'Honda' &&
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
                                                  ViewMorePage(
                                                    saloonCars: saloonList,
                                                    buses: [],
                                                    privateJets: [],
                                                  )));
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

                                //display a list of mercedes brand cars

                                SizedBox(
                                    height: 400,
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
                                                            VehicleDetailsPage(
                                                              color:
                                                                  mercedesList[
                                                                          index]
                                                                      .color,
                                                              name:
                                                                  mercedesList[
                                                                          index]
                                                                      .name,
                                                              luggage:
                                                                  mercedesList[
                                                                          index]
                                                                      .luggage,
                                                              numberOfSeats:
                                                                  mercedesList[
                                                                          index]
                                                                      .seats,
                                                              price:
                                                                  mercedesList[
                                                                          index]
                                                                      .price,
                                                              rating:
                                                                  mercedesList[
                                                                          index]
                                                                      .rating,
                                                              images:
                                                                  mercedesList[
                                                                          index]
                                                                      .images,
                                                              otherFeatures:
                                                                  mercedesList[
                                                                          index]
                                                                      .otherFeatures!,
                                                              transmission:
                                                                  mercedesList[
                                                                          index]
                                                                      .transmission,
                                                              category:
                                                                  mercedesList[
                                                                          index]
                                                                      .category,
                                                            )));
                                              },
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
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8)),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                mercedesList[
                                                                        index]
                                                                    .images
                                                                    .first
                                                                    .toString()))),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            ///add to wishlist
                                                            ///
                                                            ///
                                                            DocumentReference
                                                                docRef =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .doc(
                                                                        'vehicles/${mercedesList[index].id}');

                                                            if (mercedesList[
                                                                        index]
                                                                    .isFavorite ==
                                                                false) {
                                                              await Wishlist
                                                                  .addToWishlist(
                                                                mercedesList[
                                                                        index]
                                                                    .id,
                                                                mercedesList[
                                                                        index]
                                                                    .name,
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid,
                                                                'vehicle-rentals',
                                                                mercedesList[
                                                                        index]
                                                                    .price,
                                                                mercedesList[
                                                                        index]
                                                                    .images
                                                                    .first,
                                                                mercedesList[
                                                                        index]
                                                                    .color,
                                                                '',
                                                                '',
                                                                mercedesList[
                                                                        index]
                                                                    .rating,
                                                              );

                                                              docRef.update({
                                                                'isFavorite':
                                                                    true
                                                              });
                                                            } else {
                                                              await Wishlist
                                                                  .removeFromWishlist(
                                                                      mercedesList[
                                                                              index]
                                                                          .id);
                                                              docRef.update({
                                                                'isFavorite':
                                                                    false
                                                              });
                                                            }
                                                          },
                                                          child: mercedesList[
                                                                          index]
                                                                      .isFavorite ==
                                                                  true
                                                              ? const Icon(
                                                                  size: 25,
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : const Icon(
                                                                  size: 25,
                                                                  Icons
                                                                      .favorite_outline,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 80,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          8)),
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
                                                                      mercedesList[
                                                                              index]
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
                                                                  '${mercedesList[index].color} |',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .black87),
                                                                ),
                                                                Text(
                                                                  snapshot.requireData[index]
                                                                              .availability ==
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
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                lightColorScheme.primary),
                                                                      ),
                                                                      const Text(
                                                                        ' |  Per day',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.black87),
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
                                                                          MaterialPageRoute(
                                                                              builder: (BuildContext context) => CheckoutPage(
                                                                                    name: mercedesList[index].name,
                                                                                    color: mercedesList[index].color,
                                                                                    rating: mercedesList[index].rating,
                                                                                    seats: mercedesList[index].seats,
                                                                                    transmission: mercedesList[index].transmission!,
                                                                                    image: mercedesList[index].images.first,
                                                                                    price: mercedesList[index].price,
                                                                                  )));
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape: const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5))),
                                                                      backgroundColor:
                                                                          lightColorScheme
                                                                              .primary,
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
                                          );
                                        }),
                                  )
                                : isActiveBrand == "BMW"
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.53,
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
                                                                VehicleDetailsPage(
                                                                  color: BMWList[
                                                                          index]
                                                                      .color,
                                                                  name: BMWList[
                                                                          index]
                                                                      .name,
                                                                  luggage: BMWList[
                                                                          index]
                                                                      .luggage,
                                                                  numberOfSeats:
                                                                      BMWList[index]
                                                                          .seats,
                                                                  price: BMWList[
                                                                          index]
                                                                      .price,
                                                                  rating: BMWList[
                                                                          index]
                                                                      .rating,
                                                                  transmission:
                                                                      BMWList[index]
                                                                          .transmission,
                                                                  images: BMWList[
                                                                          index]
                                                                      .images,
                                                                  otherFeatures:
                                                                      BMWList[index]
                                                                          .otherFeatures!,
                                                                  category: BMWList[
                                                                          index]
                                                                      .category,
                                                                )));
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
                                                                          8),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8)),
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(BMWList[
                                                                          index]
                                                                      .images
                                                                      .first
                                                                      .toString()))),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  ///add to wishlist
                                                                  ///
                                                                  ///
                                                                  DocumentReference
                                                                      docRef =
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .doc(
                                                                              'vehicles/${BMWList[index].id}');

                                                                  if (BMWList[index]
                                                                          .isFavorite ==
                                                                      false) {
                                                                    await Wishlist
                                                                        .addToWishlist(
                                                                      BMWList[index]
                                                                          .id,
                                                                      BMWList[index]
                                                                          .name,
                                                                      FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid,
                                                                      'vehicle-rentals',
                                                                      BMWList[index]
                                                                          .price,
                                                                      BMWList[index]
                                                                          .images
                                                                          .first,
                                                                      BMWList[index]
                                                                          .color,
                                                                      '',
                                                                      '',
                                                                      BMWList[index]
                                                                          .rating,
                                                                    );

                                                                    docRef
                                                                        .update({
                                                                      'isFavorite':
                                                                          true
                                                                    });
                                                                  } else {
                                                                    await Wishlist.removeFromWishlist(
                                                                        BMWList[index]
                                                                            .id);
                                                                    docRef
                                                                        .update({
                                                                      'isFavorite':
                                                                          false
                                                                    });
                                                                  }
                                                                },
                                                                child: BMWList[index]
                                                                            .isFavorite ==
                                                                        true
                                                                    ? const Icon(
                                                                        size:
                                                                            25,
                                                                        Icons
                                                                            .favorite,
                                                                        color: Colors
                                                                            .red,
                                                                      )
                                                                    : const Icon(
                                                                        size:
                                                                            25,
                                                                        Icons
                                                                            .favorite_outline,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 80,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8)),
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
                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (BuildContext context) => CheckoutPage(
                                                                                          name: BMWList[index].name,
                                                                                          color: BMWList[index].color,
                                                                                          rating: BMWList[index].rating,
                                                                                          seats: BMWList[index].seats,
                                                                                          transmission: BMWList[index].transmission!,
                                                                                          image: BMWList[index].images.first,
                                                                                          price: BMWList[index].price,
                                                                                        )));
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.53,
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
                                                                    VehicleDetailsPage(
                                                                      color: lexusList[
                                                                              index]
                                                                          .color,
                                                                      name: lexusList[
                                                                              index]
                                                                          .name,
                                                                      luggage: lexusList[
                                                                              index]
                                                                          .luggage,
                                                                      numberOfSeats:
                                                                          lexusList[index]
                                                                              .seats,
                                                                      price: lexusList[
                                                                              index]
                                                                          .price,
                                                                      rating: lexusList[
                                                                              index]
                                                                          .rating,
                                                                      images: lexusList[
                                                                              index]
                                                                          .images,
                                                                      otherFeatures:
                                                                          lexusList[index]
                                                                              .otherFeatures!,
                                                                      transmission:
                                                                          lexusList[index]
                                                                              .transmission,
                                                                      category:
                                                                          lexusList[index]
                                                                              .category,
                                                                    )));
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
                                                                              8),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8)),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: NetworkImage(lexusList[
                                                                              index]
                                                                          .images
                                                                          .first
                                                                          .toString()))),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      ///add to wishlist
                                                                      ///
                                                                      ///
                                                                      DocumentReference
                                                                          docRef =
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .doc('vehicles/${lexusList[index].id}');

                                                                      if (lexusList[index]
                                                                              .isFavorite ==
                                                                          false) {
                                                                        await Wishlist
                                                                            .addToWishlist(
                                                                          lexusList[index]
                                                                              .id,
                                                                          lexusList[index]
                                                                              .name,
                                                                          FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid,
                                                                          'vehicle-rentals',
                                                                          lexusList[index]
                                                                              .price,
                                                                          lexusList[index]
                                                                              .images
                                                                              .first,
                                                                          lexusList[index]
                                                                              .color,
                                                                          '',
                                                                          '',
                                                                          lexusList[index]
                                                                              .rating,
                                                                        );

                                                                        docRef
                                                                            .update({
                                                                          'isFavorite':
                                                                              true
                                                                        });
                                                                      } else {
                                                                        await Wishlist.removeFromWishlist(
                                                                            lexusList[index].id);
                                                                        docRef
                                                                            .update({
                                                                          'isFavorite':
                                                                              false
                                                                        });
                                                                      }
                                                                    },
                                                                    child: lexusList[index].isFavorite ==
                                                                            true
                                                                        ? const Icon(
                                                                            size:
                                                                                25,
                                                                            Icons.favorite,
                                                                            color:
                                                                                Colors.red,
                                                                          )
                                                                        : const Icon(
                                                                            size:
                                                                                25,
                                                                            Icons.favorite_outline,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                height: 80,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                7),
                                                                        bottomRight:
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
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (BuildContext context) => CheckoutPage(
                                                                                              name: lexusList[index].name,
                                                                                              color: lexusList[index].color,
                                                                                              rating: lexusList[index].rating,
                                                                                              seats: lexusList[index].seats,
                                                                                              transmission: lexusList[index].transmission!,
                                                                                              image: lexusList[index].images.first,
                                                                                              price: lexusList[index].price,
                                                                                            )));
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
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.53,
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
                                                                        VehicleDetailsPage(
                                                                          color:
                                                                              kiaList[index].color,
                                                                          name:
                                                                              kiaList[index].name,
                                                                          luggage:
                                                                              kiaList[index].luggage,
                                                                          numberOfSeats:
                                                                              kiaList[index].seats,
                                                                          price:
                                                                              kiaList[index].price,
                                                                          rating:
                                                                              kiaList[index].rating,
                                                                          images:
                                                                              kiaList[index].images,
                                                                          otherFeatures:
                                                                              kiaList[index].otherFeatures!,
                                                                          transmission:
                                                                              kiaList[index].transmission,
                                                                          category:
                                                                              kiaList[index].category,
                                                                        )));
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
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () async {
                                                                          ///add to wishlist
                                                                          ///
                                                                          ///
                                                                          DocumentReference
                                                                              docRef =
                                                                              FirebaseFirestore.instance.doc('vehicles/${kiaList[index].id}');

                                                                          if (kiaList[index].isFavorite ==
                                                                              false) {
                                                                            await Wishlist.addToWishlist(
                                                                              kiaList[index].id,
                                                                              kiaList[index].name,
                                                                              FirebaseAuth.instance.currentUser!.uid,
                                                                              'vehicle-rentals',
                                                                              kiaList[index].price,
                                                                              kiaList[index].images.first,
                                                                              kiaList[index].color,
                                                                              '',
                                                                              '',
                                                                              kiaList[index].rating,
                                                                            );

                                                                            docRef.update({
                                                                              'isFavorite': true
                                                                            });
                                                                          } else {
                                                                            await Wishlist.removeFromWishlist(kiaList[index].id);
                                                                            docRef.update({
                                                                              'isFavorite': false
                                                                            });
                                                                          }
                                                                        },
                                                                        child: kiaList[index].isFavorite ==
                                                                                true
                                                                            ? const Icon(
                                                                                size: 25,
                                                                                Icons.favorite,
                                                                                color: Colors.red,
                                                                              )
                                                                            : const Icon(
                                                                                size: 25,
                                                                                Icons.favorite_outline,
                                                                                color: Colors.white,
                                                                              ),
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
                                                                                    Navigator.push(
                                                                                        context,
                                                                                        MaterialPageRoute(
                                                                                            builder: (BuildContext context) => CheckoutPage(
                                                                                                  name: kiaList[index].name,
                                                                                                  color: kiaList[index].color,
                                                                                                  rating: kiaList[index].rating,
                                                                                                  seats: kiaList[index].seats,
                                                                                                  transmission: kiaList[index].transmission!,
                                                                                                  image: kiaList[index].images.first,
                                                                                                  price: kiaList[index].price,
                                                                                                )));
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
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.53,
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
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            VehicleDetailsPage(
                                                                              color: hondaList[index].color,
                                                                              name: hondaList[index].name,
                                                                              luggage: hondaList[index].luggage,
                                                                              numberOfSeats: hondaList[index].seats,
                                                                              price: hondaList[index].price,
                                                                              rating: hondaList[index].rating,
                                                                              images: hondaList[index].images,
                                                                              otherFeatures: hondaList[index].otherFeatures!,
                                                                              transmission: hondaList[index].transmission,
                                                                              category: hondaList[index].category,
                                                                            )));
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
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              ///add to wishlist
                                                                              ///
                                                                              ///
                                                                              DocumentReference docRef = FirebaseFirestore.instance.doc('vehicles/${hondaList[index].id}');

                                                                              if (hondaList[index].isFavorite == false) {
                                                                                await Wishlist.addToWishlist(
                                                                                  hondaList[index].id,
                                                                                  hondaList[index].name,
                                                                                  FirebaseAuth.instance.currentUser!.uid,
                                                                                  'vehicle-rentals',
                                                                                  hondaList[index].price,
                                                                                  hondaList[index].images.first,
                                                                                  hondaList[index].color,
                                                                                  '',
                                                                                  '',
                                                                                  hondaList[index].rating,
                                                                                );

                                                                                docRef.update({
                                                                                  'isFavorite': true
                                                                                });
                                                                              } else {
                                                                                await Wishlist.removeFromWishlist(hondaList[index].id);
                                                                                docRef.update({
                                                                                  'isFavorite': false
                                                                                });
                                                                              }
                                                                            },
                                                                            child: hondaList[index].isFavorite == true
                                                                                ? const Icon(
                                                                                    size: 25,
                                                                                    Icons.favorite,
                                                                                    color: Colors.red,
                                                                                  )
                                                                                : const Icon(
                                                                                    size: 25,
                                                                                    Icons.favorite_outline,
                                                                                    color: Colors.white,
                                                                                  ),
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
                                                                                BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
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
                                                                                        Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (BuildContext context) => CheckoutPage(
                                                                                                      name: hondaList[index].name,
                                                                                                      color: hondaList[index].color,
                                                                                                      rating: hondaList[index].rating,
                                                                                                      seats: hondaList[index].seats,
                                                                                                      transmission: hondaList[index].transmission!,
                                                                                                      image: hondaList[index].images.first,
                                                                                                      price: hondaList[index].price,
                                                                                                    )));
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
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.53,
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
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            VehicleDetailsPage(
                                                                              color: saloonList[index].color,
                                                                              name: saloonList[index].name,
                                                                              luggage: saloonList[index].luggage,
                                                                              numberOfSeats: saloonList[index].seats,
                                                                              price: saloonList[index].price,
                                                                              rating: saloonList[index].rating,
                                                                              images: saloonList[index].images,
                                                                              otherFeatures: [],
                                                                              transmission: saloonList[index].transmission,
                                                                              category: saloonList[index].category,
                                                                            )));
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
                                                                                  8),
                                                                              bottomLeft: Radius.circular(
                                                                                  8)),
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(saloonList[index].images.first.toString()))),
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              ///add to wishlist
                                                                              ///
                                                                              ///
                                                                              DocumentReference docRef = FirebaseFirestore.instance.doc('vehicles/${saloonList[index].id}');

                                                                              if (saloonList[index].isFavorite == false) {
                                                                                await Wishlist.addToWishlist(
                                                                                  saloonList[index].id,
                                                                                  saloonList[index].name,
                                                                                  FirebaseAuth.instance.currentUser!.uid,
                                                                                  'vehicle-rentals',
                                                                                  saloonList[index].price,
                                                                                  saloonList[index].images.first,
                                                                                  saloonList[index].color,
                                                                                  '',
                                                                                  '',
                                                                                  saloonList[index].rating,
                                                                                );

                                                                                docRef.update({
                                                                                  'isFavorite': true
                                                                                });
                                                                              } else {
                                                                                await Wishlist.removeFromWishlist(saloonList[index].id);
                                                                                docRef.update({
                                                                                  'isFavorite': false
                                                                                });
                                                                              }
                                                                            },
                                                                            child: saloonList[index].isFavorite == true
                                                                                ? const Icon(
                                                                                    size: 25,
                                                                                    Icons.favorite,
                                                                                    color: Colors.red,
                                                                                  )
                                                                                : const Icon(
                                                                                    size: 25,
                                                                                    Icons.favorite_outline,
                                                                                    color: Colors.white,
                                                                                  ),
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
                                                                                BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
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
                                                                                    saloonList[index].name,
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
                                                                                    saloonList[index].availability == true ? "  Available" : "   Unavailable",
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
                                                                                        Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (BuildContext context) => CheckoutPage(
                                                                                                      name: saloonList[index].name,
                                                                                                      color: saloonList[index].color,
                                                                                                      rating: saloonList[index].rating,
                                                                                                      seats: saloonList[index].seats,
                                                                                                      transmission: saloonList[index].transmission!,
                                                                                                      image: saloonList[index].images.first,
                                                                                                      price: saloonList[index].price,
                                                                                                    )));
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
                                                  builder:
                                                      (BuildContext context) =>
                                                          ViewMoreBusesPage(
                                                            buses: busList,
                                                          )));
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
                                isActiveBrand == "lexus"
                                    ?

                                    //display a list of alllexus brand buses

                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.53,
                                        child: ListView.builder(
                                            itemCount: lexusBusList.length,
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
                                                                VehicleDetailsPage(
                                                                  color: lexusBusList[
                                                                          index]
                                                                      .color,
                                                                  name: lexusBusList[
                                                                          index]
                                                                      .name,
                                                                  luggage: lexusBusList[
                                                                          index]
                                                                      .luggage,
                                                                  numberOfSeats:
                                                                      lexusBusList[
                                                                              index]
                                                                          .seats,
                                                                  price: lexusBusList[
                                                                          index]
                                                                      .price,
                                                                  rating: lexusBusList[
                                                                          index]
                                                                      .rating,
                                                                  images: [],
                                                                  otherFeatures: [],
                                                                  transmission:
                                                                      lexusBusList[
                                                                              index]
                                                                          .transmission,
                                                                  category: lexusBusList[
                                                                          index]
                                                                      .category,
                                                                )));
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
                                                                          8),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8)),
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(
                                                                      lexusBusList[
                                                                              index]
                                                                          .images
                                                                          .first
                                                                          .toString()))),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  ///add to wishlist
                                                                  ///
                                                                  ///
                                                                  DocumentReference
                                                                      docRef =
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .doc(
                                                                              'vehicles/${lexusBusList[index].id}');

                                                                  if (lexusBusList[
                                                                              index]
                                                                          .isFavorite ==
                                                                      false) {
                                                                    await Wishlist
                                                                        .addToWishlist(
                                                                      lexusBusList[
                                                                              index]
                                                                          .id,
                                                                      lexusBusList[
                                                                              index]
                                                                          .name,
                                                                      FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid,
                                                                      'vehicle-rentals',
                                                                      lexusBusList[
                                                                              index]
                                                                          .price,
                                                                      lexusBusList[
                                                                              index]
                                                                          .images
                                                                          .first,
                                                                      lexusBusList[
                                                                              index]
                                                                          .color,
                                                                      '',
                                                                      '',
                                                                      lexusBusList[
                                                                              index]
                                                                          .rating,
                                                                    );

                                                                    docRef
                                                                        .update({
                                                                      'isFavorite':
                                                                          true
                                                                    });
                                                                  } else {
                                                                    await Wishlist.removeFromWishlist(
                                                                        lexusBusList[index]
                                                                            .id);
                                                                    docRef
                                                                        .update({
                                                                      'isFavorite':
                                                                          false
                                                                    });
                                                                  }
                                                                },
                                                                child: lexusBusList[index]
                                                                            .isFavorite ==
                                                                        true
                                                                    ? const Icon(
                                                                        size:
                                                                            25,
                                                                        Icons
                                                                            .favorite,
                                                                        color: Colors
                                                                            .red,
                                                                      )
                                                                    : const Icon(
                                                                        size:
                                                                            25,
                                                                        Icons
                                                                            .favorite_outline,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 80,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8)),
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
                                                                        lexusBusList[index]
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
                                                                            lexusBusList[index].rating,
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
                                                                        '$lexusBusList[index].color} |',
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
                                                                              'GHS $lexusBusList[index].price}',
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
                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (BuildContext context) => CheckoutPage(
                                                                                          name: lexusBusList[index].name,
                                                                                          color: lexusBusList[index].color,
                                                                                          rating: lexusBusList[index].rating,
                                                                                          seats: lexusBusList[index].seats,
                                                                                          transmission: lexusBusList[index].transmission!,
                                                                                          image: lexusBusList[index].images.first,
                                                                                          price: lexusBusList[index].price,
                                                                                        )));
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.53,
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
                                                                    VehicleDetailsPage(
                                                                      color: BMWBusList[
                                                                              index]
                                                                          .color,
                                                                      name: BMWBusList[
                                                                              index]
                                                                          .name,
                                                                      luggage: BMWBusList[
                                                                              index]
                                                                          .luggage,
                                                                      numberOfSeats:
                                                                          BMWBusList[index]
                                                                              .seats,
                                                                      price: BMWBusList[
                                                                              index]
                                                                          .price,
                                                                      rating: BMWBusList[
                                                                              index]
                                                                          .rating,
                                                                      images: [],
                                                                      otherFeatures: [],
                                                                      transmission:
                                                                          BMWBusList[index]
                                                                              .transmission,
                                                                      category:
                                                                          BMWBusList[index]
                                                                              .category,
                                                                    )));
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
                                                                              8),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8)),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: NetworkImage(BMWBusList[
                                                                              index]
                                                                          .images
                                                                          .first
                                                                          .toString()))),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      ///add to wishlist
                                                                      ///
                                                                      ///
                                                                      DocumentReference
                                                                          docRef =
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .doc('vehicles/${BMWBusList[index].id}');

                                                                      if (BMWBusList[index]
                                                                              .isFavorite ==
                                                                          false) {
                                                                        await Wishlist
                                                                            .addToWishlist(
                                                                          BMWBusList[index]
                                                                              .id,
                                                                          BMWBusList[index]
                                                                              .name,
                                                                          FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid,
                                                                          'vehicle-rentals',
                                                                          BMWBusList[index]
                                                                              .price,
                                                                          BMWBusList[index]
                                                                              .images
                                                                              .first,
                                                                          BMWBusList[index]
                                                                              .color,
                                                                          '',
                                                                          '',
                                                                          BMWBusList[index]
                                                                              .rating,
                                                                        );

                                                                        docRef
                                                                            .update({
                                                                          'isFavorite':
                                                                              true
                                                                        });
                                                                      } else {
                                                                        await Wishlist.removeFromWishlist(
                                                                            BMWBusList[index].id);
                                                                        docRef
                                                                            .update({
                                                                          'isFavorite':
                                                                              false
                                                                        });
                                                                      }
                                                                    },
                                                                    child: BMWBusList[index].isFavorite ==
                                                                            true
                                                                        ? const Icon(
                                                                            size:
                                                                                25,
                                                                            Icons.favorite,
                                                                            color:
                                                                                Colors.red,
                                                                          )
                                                                        : const Icon(
                                                                            size:
                                                                                25,
                                                                            Icons.favorite_outline,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                height: 80,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                8),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                8)),
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
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (BuildContext context) => CheckoutPage(
                                                                                              name: BMWBusList[index].name,
                                                                                              color: BMWBusList[index].color,
                                                                                              rating: BMWBusList[index].rating,
                                                                                              seats: BMWBusList[index].seats,
                                                                                              transmission: BMWBusList[index].transmission!,
                                                                                              image: BMWBusList[index].images.first,
                                                                                              price: BMWBusList[index].price,
                                                                                            )));
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

                                        //Lexus buses
                                        : isActiveBrand == "Lexus"
                                            ? SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.53,
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
                                                                        VehicleDetailsPage(
                                                                          color:
                                                                              lexusBusList[index].color,
                                                                          name:
                                                                              lexusBusList[index].name,
                                                                          luggage:
                                                                              lexusBusList[index].luggage,
                                                                          numberOfSeats:
                                                                              lexusBusList[index].seats,
                                                                          price:
                                                                              lexusBusList[index].price,
                                                                          rating:
                                                                              lexusBusList[index].rating,
                                                                          images: [],
                                                                          otherFeatures: [],
                                                                          transmission:
                                                                              lexusBusList[index].transmission,
                                                                          category:
                                                                              lexusBusList[index].category,
                                                                        )));
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
                                                                              8),
                                                                          bottomLeft: Radius.circular(
                                                                              8)),
                                                                      image: DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image: NetworkImage(lexusBusList[index]
                                                                              .images
                                                                              .first
                                                                              .toString()))),
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () async {
                                                                          ///add to wishlist
                                                                          ///
                                                                          ///
                                                                          DocumentReference
                                                                              docRef =
                                                                              FirebaseFirestore.instance.doc('vehicles/${lexusBusList[index].id}');

                                                                          if (lexusBusList[index].isFavorite ==
                                                                              false) {
                                                                            await Wishlist.addToWishlist(
                                                                              lexusBusList[index].id,
                                                                              lexusBusList[index].name,
                                                                              FirebaseAuth.instance.currentUser!.uid,
                                                                              'vehicle-rentals',
                                                                              lexusBusList[index].price,
                                                                              lexusBusList[index].images.first,
                                                                              lexusBusList[index].color,
                                                                              '',
                                                                              '',
                                                                              lexusBusList[index].rating,
                                                                            );

                                                                            docRef.update({
                                                                              'isFavorite': true
                                                                            });
                                                                          } else {
                                                                            await Wishlist.removeFromWishlist(lexusBusList[index].id);
                                                                            docRef.update({
                                                                              'isFavorite': false
                                                                            });
                                                                          }
                                                                        },
                                                                        child: lexusBusList[index].isFavorite ==
                                                                                true
                                                                            ? const Icon(
                                                                                size: 25,
                                                                                Icons.favorite,
                                                                                color: Colors.red,
                                                                              )
                                                                            : const Icon(
                                                                                size: 25,
                                                                                Icons.favorite_outline,
                                                                                color: Colors.white,
                                                                              ),
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
                                                                            topRight: Radius.circular(
                                                                                8),
                                                                            bottomRight: Radius.circular(
                                                                                8)),
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
                                                                                    Navigator.push(
                                                                                        context,
                                                                                        MaterialPageRoute(
                                                                                            builder: (BuildContext context) => CheckoutPage(
                                                                                                  name: lexusBusList[index].name,
                                                                                                  color: lexusBusList[index].color,
                                                                                                  rating: lexusBusList[index].rating,
                                                                                                  seats: lexusBusList[index].seats,
                                                                                                  transmission: lexusBusList[index].transmission!,
                                                                                                  image: lexusBusList[index].images.first,
                                                                                                  price: lexusList[index].price,
                                                                                                )));
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
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.53,
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
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            VehicleDetailsPage(
                                                                              color: kiaBusList[index].color,
                                                                              name: kiaBusList[index].name,
                                                                              luggage: kiaBusList[index].luggage,
                                                                              numberOfSeats: kiaBusList[index].seats,
                                                                              price: kiaBusList[index].price,
                                                                              rating: kiaBusList[index].rating,
                                                                              images: [],
                                                                              otherFeatures: [],
                                                                              transmission: kiaBusList[index].transmission,
                                                                              category: kiaBusList[index].category,
                                                                            )));
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
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              ///add to wishlist
                                                                              ///
                                                                              ///
                                                                              DocumentReference docRef = FirebaseFirestore.instance.doc('vehicles/${kiaBusList[index].id}');

                                                                              if (kiaBusList[index].isFavorite == false) {
                                                                                await Wishlist.addToWishlist(
                                                                                  kiaBusList[index].id,
                                                                                  kiaBusList[index].name,
                                                                                  FirebaseAuth.instance.currentUser!.uid,
                                                                                  'vehicle-rentals',
                                                                                  kiaBusList[index].price,
                                                                                  kiaBusList[index].images.first,
                                                                                  kiaBusList[index].color,
                                                                                  '',
                                                                                  '',
                                                                                  kiaBusList[index].rating,
                                                                                );

                                                                                docRef.update({
                                                                                  'isFavorite': true
                                                                                });
                                                                              } else {
                                                                                await Wishlist.removeFromWishlist(kiaBusList[index].id);
                                                                                docRef.update({
                                                                                  'isFavorite': false
                                                                                });
                                                                              }
                                                                            },
                                                                            child: kiaBusList[index].isFavorite == true
                                                                                ? const Icon(
                                                                                    size: 25,
                                                                                    Icons.favorite,
                                                                                    color: Colors.red,
                                                                                  )
                                                                                : const Icon(
                                                                                    size: 25,
                                                                                    Icons.favorite_outline,
                                                                                    color: Colors.white,
                                                                                  ),
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
                                                                                        Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (BuildContext context) => CheckoutPage(
                                                                                                      name: kiaBusList[index].name,
                                                                                                      color: kiaBusList[index].color,
                                                                                                      rating: kiaBusList[index].rating,
                                                                                                      seats: kiaBusList[index].seats,
                                                                                                      transmission: kiaBusList[index].transmission!,
                                                                                                      image: kiaBusList[index].images.first,
                                                                                                      price: kiaBusList[index].price,
                                                                                                    )));
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
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.53,
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
                                                                            builder: (BuildContext context) => VehicleDetailsPage(
                                                                                  color: hondaBusList[index].color,
                                                                                  name: hondaBusList[index].name,
                                                                                  luggage: hondaBusList[index].luggage,
                                                                                  numberOfSeats: hondaBusList[index].seats,
                                                                                  price: hondaBusList[index].price,
                                                                                  rating: hondaBusList[index].rating,
                                                                                  images: [],
                                                                                  otherFeatures: [],
                                                                                  transmission: hondaBusList[index].transmission,
                                                                                  category: hondaBusList[index].category,
                                                                                )));
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
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                                                              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(hondaBusList[index].images.first.toString()))),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                Alignment.topLeft,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(5.0),
                                                                              child: GestureDetector(
                                                                                onTap: () async {
                                                                                  ///add to wishlist
                                                                                  ///
                                                                                  ///
                                                                                  DocumentReference docRef = FirebaseFirestore.instance.doc('vehicles/${hondaBusList[index].id}');

                                                                                  if (hondaBusList[index].isFavorite == false) {
                                                                                    await Wishlist.addToWishlist(
                                                                                      hondaBusList[index].id,
                                                                                      hondaBusList[index].name,
                                                                                      FirebaseAuth.instance.currentUser!.uid,
                                                                                      'vehicle-rentals',
                                                                                      hondaBusList[index].price,
                                                                                      hondaBusList[index].images.first,
                                                                                      hondaBusList[index].color,
                                                                                      '',
                                                                                      '',
                                                                                      hondaBusList[index].rating,
                                                                                    );

                                                                                    docRef.update({
                                                                                      'isFavorite': true
                                                                                    });
                                                                                  } else {
                                                                                    await Wishlist.removeFromWishlist(hondaBusList[index].id);
                                                                                    docRef.update({
                                                                                      'isFavorite': false
                                                                                    });
                                                                                  }
                                                                                },
                                                                                child: hondaBusList[index].isFavorite == true
                                                                                    ? const Icon(
                                                                                        size: 25,
                                                                                        Icons.favorite,
                                                                                        color: Colors.red,
                                                                                      )
                                                                                    : const Icon(
                                                                                        size: 25,
                                                                                        Icons.favorite_outline,
                                                                                        color: Colors.white,
                                                                                      ),
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
                                                                                const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)), color: Color(0xffe7e7f4)),
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
                                                                                            Navigator.push(
                                                                                                context,
                                                                                                MaterialPageRoute(
                                                                                                    builder: (BuildContext context) => CheckoutPage(
                                                                                                          name: hondaBusList[index].name,
                                                                                                          color: hondaBusList[index].color,
                                                                                                          rating: hondaBusList[index].rating,
                                                                                                          seats: hondaBusList[index].seats,
                                                                                                          transmission: hondaBusList[index].transmission!,
                                                                                                          image: hondaBusList[index].images.first,
                                                                                                          price: hondaList[index].price,
                                                                                                        )));
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
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.53,
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
                                                                            builder: (BuildContext context) => VehicleDetailsPage(
                                                                                  color: busList[index].color,
                                                                                  name: busList[index].name,
                                                                                  luggage: busList[index].luggage,
                                                                                  numberOfSeats: busList[index].seats,
                                                                                  price: busList[index].price,
                                                                                  rating: busList[index].rating,
                                                                                  images: [],
                                                                                  otherFeatures: [],
                                                                                  transmission: busList[index].transmission,
                                                                                  category: busList[index].category,
                                                                                )));
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
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                                                              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(busList[index].images.first.toString()))),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                Alignment.topLeft,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(5.0),
                                                                              child: GestureDetector(
                                                                                onTap: () async {
                                                                                  ///add to wishlist
                                                                                  ///
                                                                                  ///
                                                                                  DocumentReference docRef = FirebaseFirestore.instance.doc('vehicles/${busList[index].id}');

                                                                                  if (busList[index].isFavorite == false) {
                                                                                    await Wishlist.addToWishlist(
                                                                                      busList[index].id,
                                                                                      busList[index].name,
                                                                                      FirebaseAuth.instance.currentUser!.uid,
                                                                                      'vehicle-rentals',
                                                                                      busList[index].price,
                                                                                      busList[index].images.first,
                                                                                      busList[index].color,
                                                                                      '',
                                                                                      '',
                                                                                      busList[index].rating,
                                                                                    );

                                                                                    docRef.update({
                                                                                      'isFavorite': true
                                                                                    });
                                                                                  } else {
                                                                                    await Wishlist.removeFromWishlist(busList[index].id);
                                                                                    docRef.update({
                                                                                      'isFavorite': false
                                                                                    });
                                                                                  }
                                                                                },
                                                                                child: busList[index].isFavorite == true
                                                                                    ? const Icon(
                                                                                        size: 25,
                                                                                        Icons.favorite,
                                                                                        color: Colors.red,
                                                                                      )
                                                                                    : const Icon(
                                                                                        size: 25,
                                                                                        Icons.favorite_outline,
                                                                                        color: Colors.white,
                                                                                      ),
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
                                                                                const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)), color: Color(0xffe7e7f4)),
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
                                                                                            busList[index].rating,
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
                                                                                            Navigator.push(
                                                                                                context,
                                                                                                MaterialPageRoute(
                                                                                                    builder: (BuildContext context) => CheckoutPage(
                                                                                                          name: busList[index].name,
                                                                                                          color: busList[index].color,
                                                                                                          rating: busList[index].rating,
                                                                                                          seats: busList[index].seats,
                                                                                                          transmission: busList[index].transmission!,
                                                                                                          image: busList[index].images.first,
                                                                                                          price: busList[index].price,
                                                                                                        )));
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
                          : isActiveVehicle == "Private jet"
                              ?

                              //private jet
                              Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Best jets'),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ViewMoreJetsPage(
                                                            privateJets:
                                                                jetList,
                                                          )));
                                            },
                                            child: Text(
                                              'See More',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color:
                                                      lightColorScheme.primary),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.53,
                                      child: ListView.builder(
                                          itemCount: jetList.length,
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
                                                              VehicleDetailsPage(
                                                                color: jetList[
                                                                        index]
                                                                    .color,
                                                                name: jetList[
                                                                        index]
                                                                    .name,
                                                                luggage: jetList[
                                                                        index]
                                                                    .luggage,
                                                                numberOfSeats:
                                                                    jetList[index]
                                                                        .seats,
                                                                price: jetList[
                                                                        index]
                                                                    .price,
                                                                rating: jetList[
                                                                        index]
                                                                    .rating,
                                                                images: jetList[
                                                                        index]
                                                                    .images,
                                                                otherFeatures: [],
                                                                transmission:
                                                                    '',
                                                                category: jetList[
                                                                        index]
                                                                    .category,
                                                                height: jetList[
                                                                        index]
                                                                    .height,
                                                                length: jetList[
                                                                        index]
                                                                    .length,
                                                                speed: jetList[
                                                                        index]
                                                                    .speed,
                                                                range: jetList[
                                                                        index]
                                                                    .range,
                                                              )));
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
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8)),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: NetworkImage(
                                                                    jetList[index]
                                                                        .images
                                                                        .first
                                                                        .toString()))),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                ///add to wishlist
                                                                ///
                                                                ///
                                                                DocumentReference
                                                                    docRef =
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .doc(
                                                                            'vehicles/${jetList[index].id}');

                                                                if (jetList[index]
                                                                        .isFavorite ==
                                                                    false) {
                                                                  await Wishlist
                                                                      .addToWishlist(
                                                                    jetList[index]
                                                                        .id,
                                                                    jetList[index]
                                                                        .name,
                                                                    FirebaseAuth
                                                                        .instance
                                                                        .currentUser!
                                                                        .uid,
                                                                    'vehicle-rentals',
                                                                    jetList[index]
                                                                        .price,
                                                                    jetList[index]
                                                                        .images
                                                                        .first,
                                                                    jetList[index]
                                                                        .color,
                                                                    '',
                                                                    '',
                                                                    jetList[index]
                                                                        .rating,
                                                                  );

                                                                  docRef
                                                                      .update({
                                                                    'isFavorite':
                                                                        true
                                                                  });
                                                                } else {
                                                                  await Wishlist
                                                                      .removeFromWishlist(
                                                                          jetList[index]
                                                                              .id);
                                                                  docRef
                                                                      .update({
                                                                    'isFavorite':
                                                                        false
                                                                  });
                                                                }
                                                              },
                                                              child: jetList[index]
                                                                          .isFavorite ==
                                                                      true
                                                                  ? const Icon(
                                                                      size: 25,
                                                                      Icons
                                                                          .favorite,
                                                                      color: Colors
                                                                          .red,
                                                                    )
                                                                  : const Icon(
                                                                      size: 25,
                                                                      Icons
                                                                          .favorite_outline,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: 80,
                                                          decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8)),
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
                                                                      jetList[index]
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
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Color(0xfff8c123),
                                                                        ),
                                                                        Text(
                                                                          jetList[index]
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
                                                                      '${jetList[index].color} |',
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          color:
                                                                              Colors.black87),
                                                                    ),
                                                                    Text(
                                                                      jetList[index].availability ==
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
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            'GHS ${jetList[index].price}',
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 15,
                                                                                color: lightColorScheme.primary),
                                                                          ),
                                                                          const Text(
                                                                            ' |  Per day',
                                                                            style:
                                                                                TextStyle(fontSize: 13, color: Colors.black87),
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
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (BuildContext context) => JetCheckOutPage(
                                                                                        name: jetList[index].name,
                                                                                        color: jetList[index].color,
                                                                                        rating: jetList[index].rating,
                                                                                        seats: jetList[index].seats,
                                                                                        transmission: '',
                                                                                        image: jetList[index].images.first,
                                                                                        price: jetList[index].price,
                                                                                      )));
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
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
                                  ],
                                )
                              : Container()
                ],
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }),
    );
  }
}
