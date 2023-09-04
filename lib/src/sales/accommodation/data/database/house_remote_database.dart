// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/house.dart';

///contracts for interacting with database
abstract class HouseRemoteDatabase {
  ///retrieves a particular House instance
  Future<House> retrieve(String documentID);

  ///List out all agent instances in the database
  Stream<List<House>> list();
}

class HouseRemoteDatabaseImpl implements HouseRemoteDatabase {
  @override
  Stream<List<House>> list() async* {
    yield* FirebaseFirestore.instance
        .collection('houses')
        .snapshots()
        .map((event) => event.docs.map<House>((house) {
              var data = House.fromJson(house.data());
              print('eben');

              return data;
            }).toList());
  }

  @override
  Future<House> retrieve(String documentID) async {
    final house = await FirebaseFirestore.instance
        .collection('houses')
        .doc(documentID)
        .get();

    return House.fromJson(house.data()!);
  }
}
