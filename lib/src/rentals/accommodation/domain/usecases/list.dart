import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/accommodation.dart';
import '../repository/accommodation_repository.dart';

class ListAccommodations extends UseCase<Stream<List<Accommodation>>, NoParams> {
  ListAccommodations(this.repository);

  final AccommodationRepository repository;

  @override
  Future<Either<Failure, Stream<List<Accommodation>>>> call(NoParams params) {
    // TODO: implement call
   return  repository.list();
  }
}
