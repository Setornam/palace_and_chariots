import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/data/database/vehicle_remote_database.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/usecases/list.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/usecases/retrieve.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/presentation/bloc/vehicle_bloc.dart';

import 'data/repositories/vehicle_repository_impl.dart';
import 'domain/repository/vehicle_repository.dart';

void initVehicle() {
  final sl = GetIt.instance;

  sl

    ///Bloc
    ..registerFactory(
        () => VehicleBloc(listVehicles: sl(), retrieveVehicle: sl()))

    ///Remote Database
    ..registerLazySingleton<VehicleRemoteDatabase>(
        VehicleRemoteDatabaseImpl.new)

    ///Register repositories
    ..registerLazySingleton<VehicleRepository>(
        () => VehicleRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    ///register usecases
    ..registerLazySingleton(() => RetrieveVehicle(sl()))
    ..registerLazySingleton(() => ListVehicles(sl()));
}
