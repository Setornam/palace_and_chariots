import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palace_and_chariots/src/rentals/accommodation/domain/entities/room.dart';

part 'accommodation.freezed.dart';

part 'accommodation.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Accommodation with _$Accommodation {
  @JsonSerializable(explicitToJson: true)
  factory Accommodation({
    /// Document ID
    required String id,

    ///name of Accommodation
    required String name,

    ///price of Accommodation
    required String price,

    ///availability of Accommodation
    required bool availability,

    ///Accommodation  images
    required List<String> images,

    ///Accommodation location
    required String location,

    ///Accommodation Facilities
    required List<String> facilities,

    ///Accommodation Category
    required String category,

    ///Accommodation Rooms
    required List<Room> rooms,

    ///Accommodation rating
    required String rating,
    required bool isFavorite,

    ///Accommodation popularity
    required String popularity,
  }) = _Accommodation;

  /// Converts json to dart object
  factory Accommodation.fromJson(Map<String, dynamic> json) =>
      _$AccommodationFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Accommodation.initial() => Accommodation(
      availability: false,
      category: '',
      facilities: [],
      id: '',
      images: [],
      location: '',
      name: '',
      popularity: '',
      price: '',
      rating: '',
      rooms: [],
      isFavorite: false);
}
