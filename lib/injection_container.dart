import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/shared/network/network.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/vehicle_injection.dart';

final sl = GetIt.instance;

void init() {
  ///Vehicle
  initVehicle();

  ///Shared - repositories
  sl

    ///Checks internet connectivity
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}