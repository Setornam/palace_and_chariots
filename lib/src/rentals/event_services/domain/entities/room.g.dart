// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$$_RoomFromJson(Map<String, dynamic> json) => _$_Room(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      availability: json['availability'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'availability': instance.availability,
      'images': instance.images,
      'facilities': instance.facilities,
    };
