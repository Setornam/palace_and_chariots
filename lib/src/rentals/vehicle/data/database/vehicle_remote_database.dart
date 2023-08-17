// ignore_for_file: avoid_print

import 'package:palace_and_chariots/src/rentals/vehicle/domain/entities/vehicle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///contracts for interacting with database
abstract class VehicleRemoteDatabase {
  ///retrieves a particular vehicle instance
  Future<Vehicle> retrieve(String documentID);

  ///List out all agent instances in the database
  Stream<List<Vehicle>> list();
}

class VehicleRemoteDatabaseImpl implements VehicleRemoteDatabase {
  @override
  Stream<List<Vehicle>> list() async* {
    yield* FirebaseFirestore.instance
        .collection('vehicles')
        .snapshots()
        .map((event) => event.docs.map<Vehicle>((vehicle) {
              var data = Vehicle.fromJson(vehicle.data());
              print('eben');

              return data;
            }).toList());
  }

  @override
  Future<Vehicle> retrieve(String documentID) async {
    final vehicle = await FirebaseFirestore.instance
        .collection('vehicles')
        .doc(documentID)
        .get();

    return Vehicle.fromJson(vehicle.data()!);
  }
}
