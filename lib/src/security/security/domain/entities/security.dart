import 'package:freezed_annotation/freezed_annotation.dart';

part 'security.freezed.dart';

part 'security.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Security with _$Security {
  @JsonSerializable(explicitToJson: true)
  factory Security({
    /// Document ID
    required String id,

    ///name of Security
    required String name,

    ///price of Security
    required String description,

    ///availability of Security
    required bool availability,

    ///availability of Security
    required String serviceAvailableFor,

    ///Security  image
    required String image,
  }) = _Security;

  /// Converts json to dart object
  factory Security.fromJson(Map<String, dynamic> json) =>
      _$SecurityFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Security.initial() => Security(
        availability: false,
        id: '',
        image: '',
        description: '',
        name: '',
        serviceAvailableFor: '',
      );
}
