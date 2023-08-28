import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/exception.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/network/network.dart';

import '../../domain/entities/security.dart';
import '../../domain/repository/event_service_repository.dart';
import '../database/security_remote_database.dart';

class SecurityRepositoryImpl implements SecurityRepository {
  SecurityRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  //Dependencies
  NetworkInfo networkInfo;
  SecurityRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<Security>>>> list() async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Security>> retrieve(String documentID) async {
     try {
      await networkInfo.hasInternet();
      final results =await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
