import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../../domain/entities/accommodation.dart';
import '../../domain/usecases/list.dart';
import '../../domain/usecases/retrieve.dart';

class AccommodationBloc {
  AccommodationBloc(
      {required this.listAccommodations, required this.retrieveAccommodation});

//List Accommodations
  ListAccommodations listAccommodations;

//Retrieve a Accommodation
  RetrieveAccommodation retrieveAccommodation;

  ///[ListAccommodations] implementation
  ///
  Stream<List<Accommodation>> accommodations() async* {
    final result = await listAccommodations(NoParams());

    yield* result.fold((failure) async* {
      yield <Accommodation>[];
    }, (accommodation) async* {
      yield* accommodation;
    });
  }

  //retrieve a Accommodation
  Future<Accommodation> retrieve(String documentID) async {
    final result = await retrieveAccommodation(StringParams(documentID));
    return result.fold(
        (failure) => Accommodation.initial(), (success) => success);
  }
}
