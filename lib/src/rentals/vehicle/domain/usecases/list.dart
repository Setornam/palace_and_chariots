import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/entities/vehicle.dart';

import '../repository/vehicle_repository.dart';

class ListVehicles extends UseCase<Stream<List<Vehicle>>, NoParams> {
  ListVehicles(this.repository);

  final VehicleRepository repository;

  @override
  Future<Either<Failure, Stream<List<Vehicle>>>> call(NoParams params) {
    // TODO: implement call
   return  repository.list();
  }
}
