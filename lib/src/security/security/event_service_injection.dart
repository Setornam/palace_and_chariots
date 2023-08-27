import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/src/rentals/event_services/presentation/bloc/event_service_bloc.dart';

import 'data/database/event_services_remote_database.dart';
import 'data/repositories/event_service_repository_impl.dart';
import 'domain/repository/event_service_repository.dart';
import 'domain/usecases/list.dart';
import 'domain/usecases/retrieve.dart';

void initEventService() {
  final sl = GetIt.instance;

  sl

    ///Bloc
    ..registerFactory(() =>
        EventServiceBloc(listEventServices: sl(), retrieveEventService: sl()))

    ///Remote Database
    ..registerLazySingleton<EventServiceRemoteDatabase>(
        EventServiceRemoteDatabaseImpl.new)

    ///Register repositories
    ..registerLazySingleton<EventServiceRepository>(() =>
        EventServiceRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    ///register usecases
    ..registerLazySingleton(() => RetrieveEventService(sl()))
    ..registerLazySingleton(() => ListEventServices(sl()));
}
