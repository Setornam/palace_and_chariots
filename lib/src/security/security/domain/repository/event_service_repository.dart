import 'package:dartz/dartz.dart';

import '../../../../../shared/errors/failure.dart';
import '../entities/security.dart';

///contracts for [SecurityRepositoryImpl]

abstract class SecurityRepository {
  ///retrieves a Security from the database
  Future<Either<Failure, Security>> retrieve(String documentID);

  ///List all Securitys in the database
  Future<Either<Failure, Stream<List<Security>>>> list();
}
