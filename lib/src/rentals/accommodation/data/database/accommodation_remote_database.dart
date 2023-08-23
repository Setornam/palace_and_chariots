// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/accommodation.dart';

///contracts for interacting with database
abstract class AccommodationRemoteDatabase {
  ///retrieves a particular Accommodation instance
  Future<Accommodation> retrieve(String documentID);

  ///List out all agent instances in the database
  Stream<List<Accommodation>> list();
}

class AccommodationRemoteDatabaseImpl implements AccommodationRemoteDatabase {
  @override
  Stream<List<Accommodation>> list() async* {
    yield* FirebaseFirestore.instance
        .collection('accommodation')
        .snapshots()
        .map((event) => event.docs.map<Accommodation>((accommodation) {
              var data = Accommodation.fromJson(accommodation.data());
              print('eben');

              return data;
            }).toList());
  }

  @override
  Future<Accommodation> retrieve(String documentID) async {
    final accommodation = await FirebaseFirestore.instance
        .collection('accommodation')
        .doc(documentID)
        .get();

    return Accommodation.fromJson(accommodation.data()!);
  }
}
