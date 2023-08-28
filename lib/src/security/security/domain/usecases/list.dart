import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/security.dart';
import '../repository/event_service_repository.dart';

class ListSecurities extends UseCase<Stream<List<Security>>, NoParams> {
  ListSecurities(this.repository);

  final SecurityRepository repository;

  @override
  Future<Either<Failure, Stream<List<Security>>>> call(NoParams params) {
    // TODO: implement call
   return  repository.list();
  }
}
