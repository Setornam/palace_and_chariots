import 'dart:convert';

import 'package:equatable/equatable.dart';

///Generic failure handler
class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  ///convert the failure message to string using utf8
  @override
  String toString()=>_utf8convert(message);

  static String _utf8convert(String text){
    final bytes = text.codeUnits;
    return utf8.decode(bytes);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [message];

}