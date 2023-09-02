import 'package:dartz/dartz.dart';

import '../../../../../shared/errors/failure.dart';
import '../entities/tourism.dart';

///contracts for [TourismRepositoryImpl]

abstract class TourismRepository {
  ///retrieves a Tourism from the database
  Future<Either<Failure, Tourism>> retrieve(String documentID);

  ///List all Tourisms in the database
  Future<Either<Failure, Stream<List<Tourism>>>> list();
}
