import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/accommodation.dart';
import '../repository/accommodation_repository.dart';

class RetrieveAccommodation extends UseCase<Accommodation, StringParams> {
  RetrieveAccommodation(this.repository);

  final AccommodationRepository repository;

  @override
  Future<Either<Failure, Accommodation>> call(StringParams params) {
    // TODO: implement call
   return  repository.retrieve(params.value);
  }
}
