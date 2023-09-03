// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Car _$$_CarFromJson(Map<String, dynamic> json) => _$_Car(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      price: json['price'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      brand: json['brand'] == null
          ? null
          : CarBrand.fromJson(json['brand'] as Map<String, dynamic>),
      transmission: json['transmission'] as String?,
      seats: json['seats'] as String,
      condition: json['condition'] as String,
      maker: json['maker'] as String,
      engineSize: json['engineSize'] as String,
      trim: json['trim'] as String,
      numberOfCylinders: json['numberOfCylinders'] as String,
      rating: json['rating'] as String,
      popularity: json['popularity'] as String,
      speed: json['speed'] as String?,
    );

Map<String, dynamic> _$$_CarToJson(_$_Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'price': instance.price,
      'images': instance.images,
      'brand': instance.brand?.toJson(),
      'transmission': instance.transmission,
      'seats': instance.seats,
      'condition': instance.condition,
      'maker': instance.maker,
      'engineSize': instance.engineSize,
      'trim': instance.trim,
      'numberOfCylinders': instance.numberOfCylinders,
      'rating': instance.rating,
      'popularity': instance.popularity,
      'speed': instance.speed,
    };
