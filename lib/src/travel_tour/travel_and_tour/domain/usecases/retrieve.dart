import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/tourism.dart';
import '../repository/tourism_repository.dart';

class RetrieveTourism extends UseCase<Tourism, StringParams> {
  RetrieveTourism(this.repository);

  final TourismRepository repository;

  @override
  Future<Either<Failure, Tourism>> call(StringParams params) {
    // TODO: implement call
    return repository.retrieve(params.value);
  }
}
