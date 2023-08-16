import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class UseCase<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}


class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

/// Used for token/string value required usecases
class StringParams extends Equatable {
  /// Constructor
  const StringParams(this.value);

  /// Authorization token
  /// OR
  /// A single value parameter
  final String value;

  @override
  List<Object> get props => [value];
}

/// Used for list of strings value required usecase
class ListStringParams extends Equatable {
  /// Constructor
  const ListStringParams(this.values);

  /// Document ids for firestore
  /// OR
  /// List of String value parameter
  final List<String> values;

  @override
  List<Object> get props => [values];
}

