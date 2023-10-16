// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourism.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tourism _$$_TourismFromJson(Map<String, dynamic> json) => _$_Tourism(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String,
      duration: json['duration'] as String,
      overview: json['overview'] as String,
      rating: json['rating'] as String,
      isFavorite: json['isFavorite'] as bool,
      reviews: json['reviews'] as String,
    );

Map<String, dynamic> _$$_TourismToJson(_$_Tourism instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'images': instance.images,
      'location': instance.location,
      'duration': instance.duration,
      'overview': instance.overview,
      'rating': instance.rating,
      'isFavorite': instance.isFavorite,
      'reviews': instance.reviews,
    };
