import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/theme/color_scheme.dart';
import 'package:palace_and_chariots/src/checkout/presentation/pages/checkout_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/item_gallery_page.dart';
import 'package:palace_and_chariots/src/rentals/presentation/widgets/rooms_page.dart';
import 'package:palace_and_chariots/src/travel_tour/presentation/widgets/tourism_gallery.dart';

import '../../../../injection_container.dart';
import '../../../checkout/presentation/pages/tourism_checkout_page.dart';
import '../../../wishlist/wishlist.dart';
import '../../travel_and_tour/domain/entities/tourism.dart';
import '../../travel_and_tour/presentation/bloc/tourism_bloc.dart';

class TourismDetailsPage extends StatefulWidget {
  final Tourism tourism;
  const TourismDetailsPage({super.key, required this.tourism});

  @override
  State<TourismDetailsPage> createState() => _TourismDetailsPageState();
}

class _TourismDetailsPageState extends State<TourismDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = sl<TourismBloc>();
    return StreamBuilder(
        stream: bloc.retrieve(widget.tourism.id),
        builder: (BuildContext context, AsyncSnapshot<Tourism> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: Text('Travel & Tourism',
                    style: Theme.of(context).textTheme.bodyLarge!),
                elevation: 0,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () async {
                        ///add to wishlist
                        ///
                        ///
                        DocumentReference docRef = FirebaseFirestore.instance
                            .doc('tourism/${widget.tourism.id}');

                        if (snapshot.data!.isFavorite == false) {
                          await Wishlist.addToWishlist(
                              widget.tourism.id,
                              widget.tourism.name,
                              FirebaseAuth.instance.currentUser!.uid,
                              'tourism',
                              widget.tourism.price,
                              widget.tourism.images.first,
                              '',
                              '',
                              widget.tourism.duration,
                              widget.tourism.rating,
                              widget.tourism.reviews,
                              '');

                          docRef.update({'isFavorite': true});
                          setState(() {});
                        } else {
                          await Wishlist.removeFromWishlist(widget.tourism.id);
                          docRef.update({'isFavorite': false});
                          setState(() {});
                        }
                      },
                      child: snapshot.data!.isFavorite == true
                          ? const Icon(
                              size: 25,
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              size: 25,
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/castle.png'))),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/cape.png'))),
                                    ),
                                    Container(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/capecoast.png'))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const TourismGalleryPage()));
                                          },
                                          child: Container(
                                            color: Colors.black.withOpacity(.5),
                                            child: const Center(
                                              child: Text(
                                                '+12',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.tourism.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Start here',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black87),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  '${widget.tourism.price} (USD)',
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
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        'Overview',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    Text(
                                      widget.tourism.overview,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: lightColorScheme.primary,
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              TourismCheckoutPage(
                                                tourism: widget.tourism,
                                              )));
                                },
                                child: const Text('Reserve')),
                          ),
                        )
                      ],
                    ),
                  ),

                  //btn
                ],
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Scaffold(
                  body: Center(
                child: Text('Error'),
              ));
            }

            return Scaffold(
                body: Center(
              child: CircularProgressIndicator.adaptive(),
            ));
          }
        });
  }
}
