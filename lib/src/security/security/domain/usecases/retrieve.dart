import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/security.dart';
import '../repository/event_service_repository.dart';

class RetrieveSecurity extends UseCase<Security, StringParams> {
  RetrieveSecurity(this.repository);

  final SecurityRepository repository;

  @override
  Future<Either<Failure, Security>> call(StringParams params) {
    // TODO: implement call
   return  repository.retrieve(params.value);
  }
}
