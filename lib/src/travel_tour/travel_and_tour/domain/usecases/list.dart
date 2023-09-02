import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/tourism.dart';
import '../repository/tourism_repository.dart';

class ListTourisms extends UseCase<Stream<List<Tourism>>, NoParams> {
  ListTourisms(this.repository);

  final TourismRepository repository;

  @override
  Future<Either<Failure, Stream<List<Tourism>>>> call(NoParams params) {
    // TODO: implement call
    return repository.list();
  }
}
