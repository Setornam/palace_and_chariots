import 'package:freezed_annotation/freezed_annotation.dart';

part 'house.freezed.dart';

part 'house.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class House with _$House {
  @JsonSerializable(explicitToJson: true)
  factory House({
    /// Document ID
    required String id,

    ///name of House
    required String name,

    ///location of House
    required String location,

    ///price of House
    required String price,

    ///House  images
    required List<String> images,

    ///Furnishing
    required String furnishing,

    ///property size
    required String propertySize,

    ///property size
    required String popularity,

    ///property size
    required String rating,



    ///Out House
    required String outHouse,

    //facilities
    required List<String> facilities,

    ///amenities
    required Map<String, String> amenities,

    ///condition
    required String condition,
  }) = _House;

  /// Converts json to dart object
  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory House.initial() => House(
        id: '',
        images: [],
        name: '',
        condition: '',
        furnishing: '',
        location: '',
        outHouse: '',
        price: '',
        propertySize: '',
        amenities: {},
        facilities: [], popularity: '', rating: '',
      );
}
