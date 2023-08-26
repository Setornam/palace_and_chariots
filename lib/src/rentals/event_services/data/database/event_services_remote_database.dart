// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/event_service.dart';

///contracts for interacting with database
abstract class EventServiceRemoteDatabase {
  ///retrieves a particular EventService instance
  Future<EventService> retrieve(String documentID);

  ///List out all agent instances in the database
  Stream<List<EventService>> list();
}

class EventServiceRemoteDatabaseImpl implements EventServiceRemoteDatabase {
  @override
  Stream<List<EventService>> list() async* {
    yield* FirebaseFirestore.instance
        .collection('event-services')
        .snapshots()
        .map((eventServices) =>
            eventServices.docs.map<EventService>((eventService) {
              var data = EventService.fromJson(eventService.data());
              print('eben');

              return data;
            }).toList());
  }

  @override
  Future<EventService> retrieve(String documentID) async {
    final eventService = await FirebaseFirestore.instance
        .collection('event-services')
        .doc(documentID)
        .get();

    return EventService.fromJson(eventService.data()!);
  }
}
