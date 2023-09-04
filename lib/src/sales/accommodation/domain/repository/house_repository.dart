import 'package:dartz/dartz.dart';

import '../../../../../shared/errors/failure.dart';
import '../entities/house.dart';

///contracts for [HouseRepositoryImpl]

abstract class HouseRepository {
  ///retrieves a House from the database
  Future<Either<Failure, House>> retrieve(String documentID);

  ///List all Houses in the database
  Future<Either<Failure, Stream<List<House>>>> list();
}
