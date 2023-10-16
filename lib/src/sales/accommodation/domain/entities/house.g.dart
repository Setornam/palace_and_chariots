// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_House _$$_HouseFromJson(Map<String, dynamic> json) => _$_House(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      furnishing: json['furnishing'] as String,
      propertySize: json['propertySize'] as String,
      popularity: json['popularity'] as String,
      rating: json['rating'] as String,
      isFavorite: json['isFavorite'] as bool,
      outHouse: json['outHouse'] as String,
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      amenities: Map<String, String>.from(json['amenities'] as Map),
      condition: json['condition'] as String,
    );

Map<String, dynamic> _$$_HouseToJson(_$_House instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'price': instance.price,
      'images': instance.images,
      'furnishing': instance.furnishing,
      'propertySize': instance.propertySize,
      'popularity': instance.popularity,
      'rating': instance.rating,
      'isFavorite': instance.isFavorite,
      'outHouse': instance.outHouse,
      'facilities': instance.facilities,
      'amenities': instance.amenities,
      'condition': instance.condition,
    };
