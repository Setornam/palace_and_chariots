import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/exception.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/network/network.dart';

import '../../domain/entities/tourism.dart';
import '../../domain/repository/tourism_repository.dart';
import '../database/tourism_remote_database.dart';

class TourismRepositoryImpl implements TourismRepository {
  TourismRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  //Dependencies
  NetworkInfo networkInfo;
  TourismRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<Tourism>>>> list() async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Tourism>> retrieve(String documentID) async {
     try {
      await networkInfo.hasInternet();
      final results =await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
