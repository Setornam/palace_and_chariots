import 'package:dartz/dartz.dart';

import '../../../../../shared/errors/failure.dart';
import '../entities/vehicle.dart';

///contracts for [VehicleRepositoryImpl]

abstract class VehicleRepository {
  ///retrieves a vehicle from the database
  Future<Either<Failure, Vehicle>> retrieve(String documentID);

  ///List all vehicles in the database
  Future<Either<Failure, Stream<List<Vehicle>>>> list();
}
