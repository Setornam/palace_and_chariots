import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../../domain/entities/event_service.dart';
import '../../domain/usecases/list.dart';
import '../../domain/usecases/retrieve.dart';

class EventServiceBloc {
  EventServiceBloc(
      {required this.listEventServices, required this.retrieveEventService});

//List EventServices
  ListEventServices listEventServices;

//Retrieve a EventService
  RetrieveEventService retrieveEventService;

  ///[ListEventServices] implementation
  ///
  Stream<List<EventService>> eventServices() async* {
    final result = await listEventServices(NoParams());

    yield* result.fold((failure) async* {
      yield <EventService>[];
    }, (eventService) async* {
      yield* eventService;
    });
  }

  //retrieve a EventService
  Future<EventService> retrieve(String documentID) async {
    final result = await retrieveEventService(StringParams(documentID));
    return result.fold(
        (failure) => EventService.initial(), (success) => success);
  }
}
