// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Accommodation _$$_AccommodationFromJson(Map<String, dynamic> json) =>
    _$_Accommodation(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      availability: json['availability'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String,
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      category: json['category'] as String,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: json['rating'] as String,
      isFavorite: json['isFavorite'] as bool,
      popularity: json['popularity'] as String,
    );

Map<String, dynamic> _$$_AccommodationToJson(_$_Accommodation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'availability': instance.availability,
      'images': instance.images,
      'location': instance.location,
      'facilities': instance.facilities,
      'category': instance.category,
      'rooms': instance.rooms.map((e) => e.toJson()).toList(),
      'rating': instance.rating,
      'isFavorite': instance.isFavorite,
      'popularity': instance.popularity,
    };
