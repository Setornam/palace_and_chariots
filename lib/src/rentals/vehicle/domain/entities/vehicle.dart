import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palace_and_chariots/src/rentals/vehicle/domain/entities/vehicle_brand.dart';

part 'vehicle.freezed.dart';

part 'vehicle.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Vehicle with _$Vehicle {
  @JsonSerializable(explicitToJson: true)
  factory Vehicle(
      {
      /// Document ID
      required String id,

      ///name of Vehicle
      required String name,

      ///color of vehicle
      required String color,

      ///price of vehicle
      required String price,

      ///availability of vehicle
      required bool availability,

      ///vehicle  images
      required List<String> images,

      ///vehicle brand
      required VehicleBrand brand,

      ///Vehicle Category
      required String category,

      ///vehicle transmission
      required String transmission,

      ///number of seats
      required String seats,

      ///luggage
      required String luggage,

      ///Other Vehicle Features
      required List<String> otherFeatures,

      ///Vehicle rating
      required String rating,

      ///Vehicle popularity
      required String popularity,

      ///Vehicle speed
      String? speed,

      ///Vehicle range (for jets)
      String? range,

      ///height of vehicle
      String? height,

      ///length of vehicle
      String? length}) = _Vehicle;

  /// Converts json to dart object
  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Vehicle.initial() => Vehicle(
      availability: true,
      category: '',
      id: '',
      images: [],
      luggage: '',
      name: '',
      otherFeatures: [],
      popularity: '',
      price: '',
      rating: '',
      seats: '',
      transmission: '',
      color: '',
      brand: VehicleBrand.initial());
}
