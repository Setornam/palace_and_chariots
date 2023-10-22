import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../../domain/entities/car.dart';
import '../../domain/usecases/list.dart';
import '../../domain/usecases/retrieve.dart';

class CarBloc {
  CarBloc({required this.listCars, required this.retrieveCar});

//List Cars
  ListCars listCars;

//Retrieve a Car
  RetrieveCar retrieveCar;

  ///[ListCars] implementation
  ///
  Stream<List<Car>> cars() async* {
    final result = await listCars(NoParams());

    yield* result.fold((failure) async* {
      yield <Car>[];
    }, (car) async* {
      yield* car;
    });
  }

  //retrieve a Car
  Stream<Car> retrieve(String documentID) async* {
    final result = await retrieveCar(StringParams(documentID));
    yield result.fold((failure) => Car.initial(), (success) => success);
  }
}
