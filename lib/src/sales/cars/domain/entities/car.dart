import 'package:freezed_annotation/freezed_annotation.dart';

import 'car_brand.dart';

part 'car.freezed.dart';

part 'car.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Car with _$Car {
  @JsonSerializable(explicitToJson: true)
  factory Car({
    /// Document ID
    required String id,

    ///name of Car
    required String name,

    ///color of Car
    required String color,

    ///price of Car
    required String price,

    ///availability of car
    required bool availability,

    ///Car  images
    required List<String> images,

    ///Car brand
    CarBrand? brand,

    ///Car transmission
    required String transmission,

    ///number of seats
    required String seats,

    ///condition
    required String condition,

    /// maker
    required String maker,

    ///number of seats
    required String engineSize,
    required String trim,
    required String year,

    ///number of seats
    required String numberOfCylinders,

    ///Car rating
    required String rating,

    ///Car popularity
    required String popularity,
    required bool isFavorite,

    ///Car speed
    required String speed,
  }) = _Car;

  /// Converts json to dart object
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Car.initial() => Car(
      id: '',
      images: [],
      name: '',
      popularity: '',
      price: '',
      rating: '',
      seats: '',
      transmission: '',
      color: '',
      brand: CarBrand.initial(),
      engineSize: '',
      condition: '',
      maker: '',
      numberOfCylinders: '',
      trim: '',
      availability: false,
      year: '',
      speed: '',
      isFavorite: false);
}
