import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/entities/vehicle.dart';

import '../repository/vehicle_repository.dart';

class RetrieveVehicle extends UseCase<Vehicle, StringParams> {
  RetrieveVehicle(this.repository);

  final VehicleRepository repository;

  @override
  Future<Either<Failure, Vehicle>> call(StringParams params) {
    // TODO: implement call
   return  repository.retrieve(params.value);
  }
}
