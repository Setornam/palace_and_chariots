import 'package:get_it/get_it.dart';
import 'package:palace_and_chariots/shared/network/network.dart';
import 'package:palace_and_chariots/src/rentals/accommodation/accommodation_injection.dart';
import 'package:palace_and_chariots/src/rentals/event_services/event_service_injection.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/vehicle_injection.dart';

final sl = GetIt.instance;

void init() {
  ///Vehicle
  initVehicle();

  ///Accommodation
  initAccommodation();

  initEventService();

  ///Shared - repositories
  sl

    ///Checks internet connectivity
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
