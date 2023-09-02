import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../../domain/entities/tourism.dart';
import '../../domain/usecases/list.dart';
import '../../domain/usecases/retrieve.dart';

class TourismBloc {
  TourismBloc({required this.listTourisms, required this.retrieveTourism});

//List Tourisms
  ListTourisms listTourisms;

//Retrieve a Tourism
  RetrieveTourism retrieveTourism;

  ///[ListTourisms] implementation
  ///
  Stream<List<Tourism>> tourisms() async* {
    final result = await listTourisms(NoParams());

    yield* result.fold((failure) async* {
      yield <Tourism>[];
    }, (tourism) async* {
      yield* tourism;
    });
  }

  //retrieve a Tourism
  Future<Tourism> retrieve(String documentID) async {
    final result = await retrieveTourism(StringParams(documentID));
    return result.fold((failure) => Tourism.initial(), (success) => success);
  }
}
