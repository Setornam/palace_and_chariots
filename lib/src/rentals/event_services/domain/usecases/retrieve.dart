import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/event_service.dart';
import '../repository/event_service_repository.dart';

class RetrieveEventService extends UseCase<EventService, StringParams> {
  RetrieveEventService(this.repository);

  final EventServiceRepository repository;

  @override
  Future<Either<Failure, EventService>> call(StringParams params) {
    // TODO: implement call
   return  repository.retrieve(params.value);
  }
}
