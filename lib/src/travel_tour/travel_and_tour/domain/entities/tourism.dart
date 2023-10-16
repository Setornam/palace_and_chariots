import 'package:freezed_annotation/freezed_annotation.dart';

part 'tourism.freezed.dart';

part 'tourism.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Tourism with _$Tourism {
  @JsonSerializable(explicitToJson: true)
  factory Tourism({
    /// Document ID
    required String id,

    ///name of Tourism
    required String name,

    ///price of Tourism
    required String price,

    ///Tourism  images
    required List<String> images,

    ///Tourism location
    required String location,

    ///Tourism duration
    required String duration,

    ///Tourism overview
    required String overview,

    ///Tourism rating
    required String rating,
    required bool isFavorite,

    ///Tourism reviews
    required String reviews,
  }) = _Tourism;

  /// Converts json to dart object
  factory Tourism.fromJson(Map<String, dynamic> json) =>
      _$TourismFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Tourism.initial() => Tourism(
        id: '',
        images: [],
        location: '',
        name: '',
        price: '',
        rating: '',
        duration: '',
        overview: '',
        reviews: '',
        isFavorite: false,
      );
}
