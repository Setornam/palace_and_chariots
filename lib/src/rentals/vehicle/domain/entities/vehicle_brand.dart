import 'package:freezed_annotation/freezed_annotation.dart';


part 'vehicle_brand.freezed.dart';

part 'vehicle_brand.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class VehicleBrand with _$VehicleBrand {
  @JsonSerializable(explicitToJson: true)
  factory VehicleBrand(
      {
      /// Document ID
      required String id,

      ///name of Brand
      required String name,

      ///brand logo
      required String logo}) = _VehicleBrand;

  /// Converts json to dart object
  factory VehicleBrand.fromJson(Map<String, dynamic> json) =>
      _$VehicleBrandFromJson(json);

  /// String representation
  @override
  String toString() => id;

  factory VehicleBrand.initial() => VehicleBrand(id: '', name: '', logo: '');
}
