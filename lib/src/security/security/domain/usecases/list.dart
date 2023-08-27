import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/security.dart';
import '../repository/event_service_repository.dart';

class ListEventServices extends UseCase<Stream<List<EventService>>, NoParams> {
  ListEventServices(this.repository);

  final EventServiceRepository repository;

  @override
  Future<Either<Failure, Stream<List<EventService>>>> call(NoParams params) {
    // TODO: implement call
   return  repository.list();
  }
}
