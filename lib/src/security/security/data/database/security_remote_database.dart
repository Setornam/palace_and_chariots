// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/security.dart';

///contracts for interacting with database
abstract class SecurityRemoteDatabase {
  ///retrieves a particular security instance
  Future<Security> retrieve(String documentID);

  ///List out all agent instances in the database
  Stream<List<Security>> list();
}

class SecurityRemoteDatabaseImpl implements SecurityRemoteDatabase {
  @override
  Stream<List<Security>> list() async* {
    yield* FirebaseFirestore.instance
        .collection('security-services')
        .snapshots()
        .map((securitys) => securitys.docs.map<Security>((security) {
              var data = Security.fromJson(security.data());
              print('eben');

              return data;
            }).toList());
  }

  @override
  Future<Security> retrieve(String documentID) async {
    final security = await FirebaseFirestore.instance
        .collection('security-services')
        .doc(documentID)
        .get();

    return Security.fromJson(security.data()!);
  }
}
