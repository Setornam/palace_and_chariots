import 'package:get_it/get_it.dart';

import 'package:palace_and_chariots/src/sales/cars/presentation/bloc/car_bloc.dart';

import 'data/database/car_remote_database.dart';
import 'data/repositories/car_repository_impl.dart';
import 'domain/repository/car_repository.dart';
import 'domain/usecases/list.dart';
import 'domain/usecases/retrieve.dart';

void initCar() {
  final sl = GetIt.instance;

  sl

    ///Bloc
    ..registerFactory(() => CarBloc(listCars: sl(), retrieveCar: sl()))

    ///Remote Database
    ..registerLazySingleton<CarRemoteDatabase>(CarRemoteDatabaseImpl.new)

    ///Register repositories
    ..registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    ///register usecases
    ..registerLazySingleton(() => RetrieveCar(sl()))
    ..registerLazySingleton(() => ListCars(sl()));
}
