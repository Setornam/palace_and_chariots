// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vehicle _$$_VehicleFromJson(Map<String, dynamic> json) => _$_Vehicle(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      price: json['price'] as String,
      availability: json['availability'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      brand: VehicleBrand.fromJson(json['brand'] as Map<String, dynamic>),
      category: json['category'] as String,
      transmission: json['transmission'] as String,
      seats: json['seats'] as String,
      luggage: json['luggage'] as String,
      otherFeatures: (json['otherFeatures'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rating: json['rating'] as String,
      popularity: json['popularity'] as String,
      speed: json['speed'] as String?,
      range: json['range'] as String?,
      height: json['height'] as String?,
      length: json['length'] as String?,
    );

Map<String, dynamic> _$$_VehicleToJson(_$_Vehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'price': instance.price,
      'availability': instance.availability,
      'images': instance.images,
      'brand': instance.brand.toJson(),
      'category': instance.category,
      'transmission': instance.transmission,
      'seats': instance.seats,
      'luggage': instance.luggage,
      'otherFeatures': instance.otherFeatures,
      'rating': instance.rating,
      'popularity': instance.popularity,
      'speed': instance.speed,
      'range': instance.range,
      'height': instance.height,
      'length': instance.length,
    };
