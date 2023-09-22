import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/injection_container.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/view_more_bus_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/view_more_cars_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/view_more_jets_page.dart';
import 'package:palace_and_chariots/src/sales/presentation/widgets/view_more_cars_page.dart';

import '../../../../shared/theme/color_scheme.dart';
import '../../cars/domain/entities/car.dart';
import '../../cars/presentation/bloc/car_bloc.dart';
import 'cars_details_page.dart';

class CarsTabBarView extends StatefulWidget {
  const CarsTabBarView({super.key});

  @override
  State<CarsTabBarView> createState() => _CarsTabBarViewState();
}

class _CarsTabBarViewState extends State<CarsTabBarView> {
  final bloc = sl<CarBloc>();

  String isActiveCar = "Saloon";

  // bool isSaloonCarActive =false;
  // bool isBusActive =false;
  // bool isJetActive =false;

  String isActiveBrand = "";

  final String imagePath =
      '/security-services/personal-security.png'; // Replace with your image path

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
      child: StreamBuilder<List<Car>>(
          stream: bloc.cars(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //list of Cars
              List<Car> carList = List.from(snapshot.requireData);

              List<Car> lexusList =
                  List.from(carList.where((car) => car.brand!.name == 'lexus'));

              List<Car> mercedesList = List.from(
                  carList.where((car) => car.brand!.name == 'Mercedes'));

              List<Car> BMWList =
                  List.from(carList.where((car) => car.brand!.name == 'BMW'));

              List<Car> kiaList =
                  List.from(carList.where((car) => car.brand!.name == 'KIA'));

              List<Car> hondaList =
                  List.from(carList.where((car) => car.brand!.name == 'Honda'));

              return Column(
                children: [
                  ///Car brands
                  ///
                  Padding(
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
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Best cars'),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ViewMoreCarsPage(
                                              cars: carList,
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
                                  itemBuilder: (BuildContext context, index) {
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
                                                      CarDetailsPage(
                                                        car:
                                                            mercedesList[index],
                                                      )));
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
                                                                Radius.circular(
                                                                    7),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    7)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            mercedesList[index]
                                                                .images
                                                                .first
                                                                .toString()))),
                                                child: const Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
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
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(7),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          7)),
                                                      color: Color(0xffe7e7f4)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.star,
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
                                                                  fontSize: 13,
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
                                                                  fontSize: 13,
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
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'GHS ${mercedesList[index].price}',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15,
                                                                        color: lightColorScheme
                                                                            .primary),
                                                                  ),
                                                                  const Text(
                                                                    ' |  Per day',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .black87),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            //order button
                                                            SizedBox(
                                                              height: 25,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
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
                                                                          BorderRadius.all(
                                                                              Radius.circular(5))),
                                                                  backgroundColor:
                                                                      lightColorScheme
                                                                          .primary,
                                                                  elevation: 0,
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
                          : isActiveBrand == "lexus"
                              ?

                              //display a list of alllexus brand cars

                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.59,
                                  child: ListView.builder(
                                      itemCount: lexusList.length,
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
                                                          CarDetailsPage(
                                                            car: lexusList[
                                                                index],
                                                          )));
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
                                                                lexusList[index]
                                                                    .images
                                                                    .first
                                                                    .toString()))),
                                                    child: const Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
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
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomRight:
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
                                                                  lexusList[
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
                                                                      lexusList[
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
                                                                  '${lexusList[index].color} |',
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
                                                                        'GHS ${lexusList[index].price}',
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
                                                                                    name: lexusList[index].name,
                                                                                    color: lexusList[index].color,
                                                                                    rating: lexusList[index].rating,
                                                                                    seats: lexusList[index].seats,
                                                                                    transmission: lexusList[index].transmission!,
                                                                                    image: lexusList[index].images.first,
                                                                                    price: lexusList[index].price,
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
                                          ),
                                        );
                                      }),
                                )
                              : isActiveBrand == "BMW"
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.59,
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
                                                              CarDetailsPage(
                                                                  car: BMWList[
                                                                      index])));
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
                                                                    BMWList[index]
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
                                                              color:
                                                                  Colors.white,
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
                                                                          7),
                                                                  bottomRight: Radius
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
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Color(0xfff8c123),
                                                                        ),
                                                                        Text(
                                                                          BMWList[index]
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
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            'GHS ${BMWList[index].price}',
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

                                  //Lexus cars
                                  : isActiveBrand == "Lexus"
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.59,
                                          child: ListView.builder(
                                              itemCount: lexusList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  CarDetailsPage(
                                                                      car: lexusList[
                                                                          index])));
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
                                                            child: const Align(
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
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          lexusList[index]
                                                                              .name,
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
                                                                          style: const TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.black87),
                                                                        ),
                                                                        Text(
                                                                          snapshot.requireData[index].availability == true
                                                                              ? "  Available"
                                                                              : "   Unavailable",
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              color: lightColorScheme.primary),
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
                                                                            onPressed:
                                                                                () {
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
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                              backgroundColor: lightColorScheme.primary,
                                                                              elevation: 0,
                                                                            ),
                                                                            child:
                                                                                const Text(
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
                                                  0.59,
                                              child: ListView.builder(
                                                  itemCount: kiaList.length,
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
                                                                      CarDetailsPage(
                                                                        car: kiaList[
                                                                            index],
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
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                7),
                                                                        bottomLeft:
                                                                            Radius.circular(
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
                                                                child:
                                                                    Container(
                                                                  height: 80,
                                                                  decoration: const BoxDecoration(
                                                                      borderRadius: BorderRadius.only(
                                                                          topRight: Radius.circular(
                                                                              7),
                                                                          bottomRight: Radius.circular(
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
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.59,
                                                  child: ListView.builder(
                                                      itemCount:
                                                          hondaList.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 10),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          CarDetailsPage(
                                                                            car:
                                                                                hondaList[index],
                                                                          )));
                                                            },
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: 80,
                                                                    width: 80,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: const BorderRadius.only(
                                                                            topLeft: Radius.circular(
                                                                                7),
                                                                            bottomLeft: Radius.circular(
                                                                                7)),
                                                                        image: DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image: NetworkImage(hondaList[index].images.first.toString()))),
                                                                    child:
                                                                        const Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(5.0),
                                                                        child:
                                                                            Icon(
                                                                          size:
                                                                              18,
                                                                          Icons
                                                                              .favorite_outline,
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
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(7),
                                                                              bottomRight: Radius.circular(7)),
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
                                                                                      hondaList[index].rating,
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
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.59,
                                                  child: ListView.builder(
                                                      itemCount: carList.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 10),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          CarDetailsPage(
                                                                            car:
                                                                                carList[index],
                                                                          )));
                                                            },
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: 80,
                                                                    width: 80,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: const BorderRadius.only(
                                                                            topLeft: Radius.circular(
                                                                                7),
                                                                            bottomLeft: Radius.circular(
                                                                                7)),
                                                                        image: DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image: NetworkImage(carList[index].images.first.toString()))),
                                                                    child:
                                                                        const Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(5.0),
                                                                        child:
                                                                            Icon(
                                                                          size:
                                                                              18,
                                                                          Icons
                                                                              .favorite_outline,
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
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(7),
                                                                              bottomRight: Radius.circular(7)),
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
                                                                                  carList[index].name,
                                                                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    const Icon(
                                                                                      Icons.star,
                                                                                      color: Color(0xfff8c123),
                                                                                    ),
                                                                                    Text(
                                                                                      carList[index].rating,
                                                                                      style: Theme.of(context).textTheme.bodyMedium,
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  '${carList[index].color} |',
                                                                                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                                                                                ),
                                                                                Text(
                                                                                  carList[index].availability == true ? "  Available" : "   Unavailable",
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
                                                                                        'GHS ${carList[index].price}',
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
                                                                                                    name: carList[index].name,
                                                                                                    color: carList[index].color,
                                                                                                    rating: carList[index].rating,
                                                                                                    seats: carList[index].seats,
                                                                                                    transmission: carList[index].transmission!,
                                                                                                    image: carList[index].images.first,
                                                                                                    price: carList[index].price,
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
                ],
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
            }
            return const Center(
              child: Text('Sorry no Cars '),
            );
          }),
    );
  }
}
