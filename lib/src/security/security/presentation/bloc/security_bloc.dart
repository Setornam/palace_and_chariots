import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../../domain/entities/security.dart';
import '../../domain/usecases/list.dart';
import '../../domain/usecases/retrieve.dart';

class SecurityBloc {
  SecurityBloc(
      {required this.listSecurities, required this.retrieveSecurity});

//List Securities
  ListSecurities listSecurities;

//Retrieve a Security
  RetrieveSecurity retrieveSecurity;

  ///[ListSecuritys] implementation
  ///
  Stream<List<Security>> securities() async* {
    final result = await listSecurities(NoParams());

    yield* result.fold((failure) async* {
      yield <Security>[];
    }, (security) async* {
      yield* security;
    });
  }

  //retrieve a Security
  Future<Security> retrieve(String documentID) async {
    final result = await retrieveSecurity(StringParams(documentID));
    return result.fold(
        (failure) => Security.initial(), (success) => success);
  }
}
