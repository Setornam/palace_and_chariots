import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/exception.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/network/network.dart';

import '../../domain/entities/event_service.dart';
import '../../domain/repository/event_service_repository.dart';
import '../database/event_services_remote_database.dart';

class EventServiceRepositoryImpl implements EventServiceRepository {
  EventServiceRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  //Dependencies
  NetworkInfo networkInfo;
  EventServiceRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<EventService>>>> list() async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, EventService>> retrieve(String documentID) async {
     try {
      await networkInfo.hasInternet();
      final results =await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
