import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

part 'place.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Place with _$Place {
  @JsonSerializable(explicitToJson: true)
  factory Place({
    /// Document ID
    required String id,

    ///name of Place
    required String name,

    ///Place  image
    required String image,

    
  }) = _Place;

  /// Converts json to dart object
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Place.initial() => Place(
    
      id: '',
      image: '',
      name: '',
       );
}
