// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventService _$$_EventServiceFromJson(Map<String, dynamic> json) =>
    _$_EventService(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      review: json['review'] as String,
      availability: json['availability'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String,
      amenities: (json['amenities'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      category: json['category'] as String,
      rating: json['rating'] as String,
      popularity: json['popularity'] as String,
    );

Map<String, dynamic> _$$_EventServiceToJson(_$_EventService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'review': instance.review,
      'availability': instance.availability,
      'images': instance.images,
      'location': instance.location,
      'amenities': instance.amenities,
      'category': instance.category,
      'rating': instance.rating,
      'popularity': instance.popularity,
    };
