import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';

part 'room.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Room with _$Room {
  @JsonSerializable(explicitToJson: true)
  factory Room({
    /// Document ID
    required String id,

    ///name of Room
    required String name,

    ///price of Room
    required String price,

    ///availability of Room
    required bool availability,

    ///Room  images
    required List<String> images,

    ///Room Facilities
    required List<String> facilities,
  }) = _Room;

  /// Converts json to dart object
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Room.initial() => Room(
      availability: false,
      facilities: [],
      id: '',
      images: [],
      name: '',
      price: '');
}
