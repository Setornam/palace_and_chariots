import 'package:palace_and_chariots/shared/usecase/usecase.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/usecases/list.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/usecases/retrieve.dart';

import '../../domain/entities/vehicle.dart';

class VehicleBloc {
  VehicleBloc({required this.listVehicles, required this.retrieveVehicle});

//List Vehicles
  ListVehicles listVehicles;

//Retrieve a vehicle
  RetrieveVehicle retrieveVehicle;

  ///[ListVehicles] implementation
  ///
  Stream<List<Vehicle>> vehicles() async* {
    final result = await listVehicles(NoParams());

    yield* result.fold((failure) async* {
      yield <Vehicle>[];
    }, (vehicle) async* {
      yield* vehicle;
    });
  }

  //retrieve a vehicle
  Stream<Vehicle> retrieve(String documentID) async* {
    final result = await retrieveVehicle(StringParams(documentID));
    yield result.fold((failure) => Vehicle.initial(), (success) => success);
  }
}
