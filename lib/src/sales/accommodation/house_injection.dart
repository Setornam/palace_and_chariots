import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/src/sales/accommodation/presentation/bloc/house_bloc.dart';

import 'data/database/house_remote_database.dart';
import 'data/repositories/house_repository_impl.dart';
import 'domain/repository/house_repository.dart';
import 'domain/usecases/list.dart';
import 'domain/usecases/retrieve.dart';

void initHouse() {
  final sl = GetIt.instance;

  sl

    ///Bloc
    ..registerFactory(() => HouseBloc(listHouses: sl(), retrieveHouse: sl()))

    ///Remote Database
    ..registerLazySingleton<HouseRemoteDatabase>(HouseRemoteDatabaseImpl.new)

    ///Register repositories
    ..registerLazySingleton<HouseRepository>(
        () => HouseRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    ///register usecases
    ..registerLazySingleton(() => RetrieveHouse(sl()))
    ..registerLazySingleton(() => ListHouses(sl()));
}
