import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/src/rentals/event_services/presentation/bloc/event_service_bloc.dart';
import 'package:palace_and_chariots/src/security/security/presentation/bloc/security_bloc.dart';

import 'data/database/security_remote_database.dart';
import 'data/repositories/security_repository_impl.dart';
import 'domain/repository/event_service_repository.dart';
import 'domain/usecases/list.dart';
import 'domain/usecases/retrieve.dart';

void initSecurity() {
  final sl = GetIt.instance;

  sl

    ///Bloc
    ..registerFactory(() =>
        SecurityBloc(listSecurities: sl(), retrieveSecurity: sl()))

    ///Remote Database
    ..registerLazySingleton<SecurityRemoteDatabase>(
        SecurityRemoteDatabaseImpl.new)

    ///Register repositories
    ..registerLazySingleton<SecurityRepository>(() =>
        SecurityRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    ///register usecases
    ..registerLazySingleton(() => RetrieveSecurity(sl()))
    ..registerLazySingleton(() => ListSecurities(sl()));
}
