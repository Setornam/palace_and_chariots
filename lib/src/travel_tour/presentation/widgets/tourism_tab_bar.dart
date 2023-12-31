import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/src/travel_tour/presentation/widgets/tourism_details.dart';

import '../../../../injection_container.dart';
import '../../../../shared/theme/color_scheme.dart';
import '../../../wishlist/wishlist.dart';
import '../../travel_and_tour/domain/entities/tourism.dart';
import '../../travel_and_tour/presentation/bloc/tourism_bloc.dart';

class TourismTabBarView extends StatefulWidget {
  const TourismTabBarView({super.key});

  @override
  State<TourismTabBarView> createState() => _TourismTabBarViewState();
}

class _TourismTabBarViewState extends State<TourismTabBarView> {
  final bloc = sl<TourismBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Tourism>>(
        stream: bloc.tourisms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Tourism> tourisms = snapshot.requireData;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 680,
                child: ListView.builder(
                    itemCount: tourisms.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TourismDetailsPage(
                                          tourism: tourisms[index],
                                        )));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/capecoast.png'))),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: 
                                  
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        ///add to wishlist
                                        ///
                                        ///
                                        DocumentReference docRef =
                                            FirebaseFirestore.instance.doc(
                                                'tourism/${tourisms[index].id}');

                                        if (tourisms[index].isFavorite ==
                                            false) {
                                          await Wishlist.addToWishlist(
                                              tourisms[index].id,
                                              tourisms[index].name,
                                              FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              'tourism',
                                              tourisms[index].price,
                                              tourisms[index].images.first,
                                              '',
                                              '',
                                              tourisms[index].duration,
                                              tourisms[index].rating,
                                              tourisms[index].reviews,
                                              '');

                                          docRef.update({'isFavorite': true});
                                        } else {
                                          await Wishlist.removeFromWishlist(
                                              tourisms[index].id);
                                          docRef.update({'isFavorite': false});
                                        }
                                      },
                                      child: tourisms[index].isFavorite == true
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
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                      color: Color(0xffe7e7f4)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              tourisms[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.timelapse,
                                              size: 18,
                                            ),
                                            Text(
                                              ' ${tourisms[index].duration} | ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Color(0xfff8c123),
                                            ),
                                            Text(
                                              tourisms[index].rating,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              ' | ${tourisms[index].reviews} reviews',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // Text(
                                            //   'Superior room: 1 bed',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .bodyMedium,
                                            // )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                '${tourisms[index].price} (USD)',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 18,
                                                      color: lightColorScheme
                                                          .primary,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Include taxes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    )),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  size: 14,
                                                  color:
                                                      lightColorScheme.primary,
                                                ),
                                                Text(' Free cancellation',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14,
                                                          color:
                                                              lightColorScheme
                                                                  .primary,
                                                        )),
                                              ],
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
              ),
            );
          } else {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
