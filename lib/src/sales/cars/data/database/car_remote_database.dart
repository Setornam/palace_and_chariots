// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/car.dart';

///contracts for interacting with database
abstract class CarRemoteDatabase {
  ///retrieves a particular Car instance
  Future<Car> retrieve(String documentID);

  ///List out all agent instances in the database
  Stream<List<Car>> list();
}

class CarRemoteDatabaseImpl implements CarRemoteDatabase {
  @override
  Stream<List<Car>> list() async* {
    yield* FirebaseFirestore.instance
        .collection('cars')
        .snapshots()
        .map((event) => event.docs.map<Car>((car) {
              var data = Car.fromJson(car.data());
              print('eben');

              return data;
            }).toList());
  }

  @override
  Future<Car> retrieve(String documentID) async {
    final car = await FirebaseFirestore.instance
        .collection('Cars')
        .doc(documentID)
        .get();

    return Car.fromJson(car.data()!);
  }
}
