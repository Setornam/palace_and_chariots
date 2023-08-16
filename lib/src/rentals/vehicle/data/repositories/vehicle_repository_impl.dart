import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/exception.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/network/network.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/entities/vehicle.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/repository/vehicle_repository.dart';

import '../database/vehicle_remote_database.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  VehicleRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  //Dependencies
  NetworkInfo networkInfo;
  VehicleRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<Vehicle>>>> list() async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Vehicle>> retrieve(String documentID) async {
     try {
      await networkInfo.hasInternet();
      final results =await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
