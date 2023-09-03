import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/car.dart';
import '../repository/car_repository.dart';

class RetrieveCar extends UseCase<Car, StringParams> {
  RetrieveCar(this.repository);

  final CarRepository repository;

  @override
  Future<Either<Failure, Car>> call(StringParams params) {
    // TODO: implement call
   return  repository.retrieve(params.value);
  }
}
