import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/src/travel_tour/travel_and_tour/presentation/bloc/accommodation_bloc.dart';

import 'data/database/tourism_remote_database.dart';
import 'data/repositories/tourism_repository_impl.dart';
import 'domain/repository/tourism_repository.dart';
import 'domain/usecases/list.dart';
import 'domain/usecases/retrieve.dart';

void initTourism() {
  final sl = GetIt.instance;

  sl

    ///Bloc
    ..registerFactory(
        () => TourismBloc(listTourisms: sl(), retrieveTourism: sl()))

    ///Remote Database
    ..registerLazySingleton<TourismRemoteDatabase>(
        TourismRemoteDatabaseImpl.new)

    ///Register repositories
    ..registerLazySingleton<TourismRepository>(
        () => TourismRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    ///register usecases
    ..registerLazySingleton(() => RetrieveTourism(sl()))
    ..registerLazySingleton(() => ListTourisms(sl()));
}
