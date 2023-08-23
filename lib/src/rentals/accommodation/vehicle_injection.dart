import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/src/rentals/accommodation/presentation/bloc/accommodation_bloc.dart';

import 'data/database/accommodation_remote_database.dart';
import 'data/repositories/vehicle_repository_impl.dart';
import 'domain/repository/accommodation_repository.dart';
import 'domain/usecases/list.dart';
import 'domain/usecases/retrieve.dart';

void initAccommodation() {
  final sl = GetIt.instance;

  sl

    ///Bloc
    ..registerFactory(() => AccommodationBloc(
        listAccommodations: sl(), retrieveAccommodation: sl()))

    ///Remote Database
    ..registerLazySingleton<AccommodationRemoteDatabase>(
        AccommodationRemoteDatabaseImpl.new)

    ///Register repositories
    ..registerLazySingleton<AccommodationRepository>(() =>
        AccommodationRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    ///register usecases
    ..registerLazySingleton(() => RetrieveAccommodation(sl()))
    ..registerLazySingleton(() => ListAccommodations(sl()));
}
