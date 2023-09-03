import 'package:freezed_annotation/freezed_annotation.dart';


part 'car_brand.freezed.dart';

part 'car_brand.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class CarBrand with _$CarBrand {
  @JsonSerializable(explicitToJson: true)
  factory CarBrand(
      {
      /// Document ID
      required String id,

      ///name of Brand
      required String name,

      ///brand logo
      required String logo}) = _CarBrand;

  /// Converts json to dart object
  factory CarBrand.fromJson(Map<String, dynamic> json) =>
      _$CarBrandFromJson(json);

  /// String representation1
  @override
  String toString() => id;

  factory CarBrand.initial() => CarBrand(id: '', name: '', logo: '');
}
