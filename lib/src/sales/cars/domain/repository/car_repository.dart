import 'package:dartz/dartz.dart';

import '../../../../../shared/errors/failure.dart';
import '../entities/car.dart';

///contracts for [CarRepositoryImpl]

abstract class CarRepository {
  ///retrieves a Car from the database
  Future<Either<Failure, Car>> retrieve(String documentID);

  ///List all Cars in the database
  Future<Either<Failure, Stream<List<Car>>>> list();
}
