import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/exception.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/network/network.dart';

import '../../domain/entities/accommodation.dart';
import '../../domain/repository/accommodation_repository.dart';
import '../database/event_services_remote_database.dart';

class AccommodationRepositoryImpl implements AccommodationRepository {
  AccommodationRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  //Dependencies
  NetworkInfo networkInfo;
  AccommodationRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<Accommodation>>>> list() async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Accommodation>> retrieve(String documentID) async {
     try {
      await networkInfo.hasInternet();
      final results =await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
