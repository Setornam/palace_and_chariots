import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/car.dart';
import '../repository/car_repository.dart';

class ListCars extends UseCase<Stream<List<Car>>, NoParams> {
  ListCars(this.repository);

  final CarRepository repository;

  @override
  Future<Either<Failure, Stream<List<Car>>>> call(NoParams params) {
    // TODO: implement call
   return  repository.list();
  }
}
