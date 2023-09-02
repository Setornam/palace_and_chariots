// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/tourism.dart';

///contracts for interacting with database
abstract class TourismRemoteDatabase {
  ///retrieves a particular Tourism instance
  Future<Tourism> retrieve(String documentID);

  ///List out all agent instances in the database
  Stream<List<Tourism>> list();
}

class TourismRemoteDatabaseImpl implements TourismRemoteDatabase {
  @override
  Stream<List<Tourism>> list() async* {
    yield* FirebaseFirestore.instance
        .collection('tourism')
        .snapshots()
        .map((event) => event.docs.map<Tourism>((tourism) {
              var data = Tourism.fromJson(tourism.data());
              print('eben');

              return data;
            }).toList());
  }

  @override
  Future<Tourism> retrieve(String documentID) async {
    final tourism = await FirebaseFirestore.instance
        .collection('tourism')
        .doc(documentID)
        .get();

    return Tourism.fromJson(tourism.data()!);
  }
}
