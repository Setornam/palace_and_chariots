import 'package:dartz/dartz.dart';
import 'package:palace_and_chariots/shared/errors/failure.dart';
import 'package:palace_and_chariots/shared/usecase/usecase.dart';

import '../entities/house.dart';
import '../repository/house_repository.dart';

class ListHouses extends UseCase<Stream<List<House>>, NoParams> {
  ListHouses(this.repository);

  final HouseRepository repository;

  @override
  Future<Either<Failure, Stream<List<House>>>> call(NoParams params) {
    // TODO: implement call
    return repository.list();
  }
}
