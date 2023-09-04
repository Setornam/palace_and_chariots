import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/exception.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/network/network.dart';

import '../../domain/entities/house.dart';
import '../../domain/repository/house_repository.dart';
import '../database/house_remote_database.dart';

class HouseRepositoryImpl implements HouseRepository {
  HouseRepositoryImpl({required this.networkInfo, required this.remoteDatabase});

  //Dependencies
  NetworkInfo networkInfo;
  HouseRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<House>>>> list() async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, House>> retrieve(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
