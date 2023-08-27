import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_service.freezed.dart';

part 'event_service.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class EventService with _$EventService {
  @JsonSerializable(explicitToJson: true)
  factory EventService({
    /// Document ID
    required String id,

    ///name of EventService
    required String name,

    ///price of EventService
    required String price,

    ///review of EventService
    required String review,

    ///availability of EventService
    required bool availability,

    ///EventService  images
    required List<String> images,

    ///EventService location
    required String location,

    ///EventService amenities
    required List<Map<String, String>> amenities,

    ///EventService Category
    required String category,

    ///EventService rating
    required String rating,

    ///EventService popularity
    required String popularity,
  }) = _EventService;

  /// Converts json to dart object
  factory EventService.fromJson(Map<String, dynamic> json) =>
      _$EventServiceFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory EventService.initial() => EventService(
        availability: false,
        category: '',
        amenities: [],
        id: '',
        images: [],
        location: '',
        name: '',
        popularity: '',
        price: '',
        rating: '',
        review: '',
      );
}
