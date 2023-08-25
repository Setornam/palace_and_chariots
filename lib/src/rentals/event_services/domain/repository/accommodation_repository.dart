import 'package:dartz/dartz.dart';

import '../../../../../shared/errors/failure.dart';
import '../entities/accommodation.dart';

///contracts for [AccommodationRepositoryImpl]

abstract class AccommodationRepository {
  ///retrieves a Accommodation from the database
  Future<Either<Failure, Accommodation>> retrieve(String documentID);

  ///List all Accommodations in the database
  Future<Either<Failure, Stream<List<Accommodation>>>> list();
}
