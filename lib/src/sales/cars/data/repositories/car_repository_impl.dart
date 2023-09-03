import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/exception.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/network/network.dart';

import '../../domain/entities/car.dart';
import '../../domain/repository/car_repository.dart';
import '../database/car_remote_database.dart';

class CarRepositoryImpl implements CarRepository {
  CarRepositoryImpl({required this.networkInfo, required this.remoteDatabase});

  //Dependencies
  NetworkInfo networkInfo;
  CarRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<Car>>>> list() async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Car>> retrieve(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
