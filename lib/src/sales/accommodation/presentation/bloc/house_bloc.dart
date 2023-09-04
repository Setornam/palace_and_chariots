import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../../domain/entities/house.dart';
import '../../domain/usecases/list.dart';
import '../../domain/usecases/retrieve.dart';

class HouseBloc {
  HouseBloc({required this.listHouses, required this.retrieveHouse});

//List Houses
  ListHouses listHouses;

//Retrieve a House
  RetrieveHouse retrieveHouse;

  ///[ListHouses] implementation
  ///
  Stream<List<House>> houses() async* {
    final result = await listHouses(NoParams());

    yield* result.fold((failure) async* {
      yield <House>[];
    }, (House) async* {
      yield* House;
    });
  }

  //retrieve a House
  Future<House> retrieve(String documentID) async {
    final result = await retrieveHouse(StringParams(documentID));
    return result.fold((failure) => House.initial(), (success) => success);
  }
}
