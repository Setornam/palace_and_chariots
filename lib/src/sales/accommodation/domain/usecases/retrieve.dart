import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/house.dart';
import '../repository/house_repository.dart';

class RetrieveHouse extends UseCase<House, StringParams> {
  RetrieveHouse(this.repository);

  final HouseRepository repository;

  @override
  Future<Either<Failure, House>> call(StringParams params) {
    // TODO: implement call
   return  repository.retrieve(params.value);
  }
}
