import 'package:dartz/dartz.dart';

import '../../../../../shared/errors/failure.dart';
import '../entities/security.dart';

///contracts for [EventServiceRepositoryImpl]

abstract class EventServiceRepository {
  ///retrieves a EventService from the database
  Future<Either<Failure, EventService>> retrieve(String documentID);

  ///List all EventServices in the database
  Future<Either<Failure, Stream<List<EventService>>>> list();
}
