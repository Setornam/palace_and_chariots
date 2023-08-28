// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Security _$$_SecurityFromJson(Map<String, dynamic> json) => _$_Security(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      availability: json['availability'] as bool,
      serviceAvailableFor: json['serviceAvailableFor'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_SecurityToJson(_$_Security instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'availability': instance.availability,
      'serviceAvailableFor': instance.serviceAvailableFor,
      'image': instance.image,
    };
