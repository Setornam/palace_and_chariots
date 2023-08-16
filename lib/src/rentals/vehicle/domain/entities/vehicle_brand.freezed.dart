// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleBrand _$VehicleBrandFromJson(Map<String, dynamic> json) {
  return _VehicleBrand.fromJson(json);
}

/// @nodoc
mixin _$VehicleBrand {
  /// Document ID
  String get id => throw _privateConstructorUsedError;

  ///name of Brand
  String get name => throw _privateConstructorUsedError;

  ///brand logo
  String get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleBrandCopyWith<VehicleBrand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleBrandCopyWith<$Res> {
  factory $VehicleBrandCopyWith(
          VehicleBrand value, $Res Function(VehicleBrand) then) =
      _$VehicleBrandCopyWithImpl<$Res, VehicleBrand>;
  @useResult
  $Res call({String id, String name, String logo});
}

/// @nodoc
class _$VehicleBrandCopyWithImpl<$Res, $Val extends VehicleBrand>
    implements $VehicleBrandCopyWith<$Res> {
  _$VehicleBrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VehicleBrandCopyWith<$Res>
    implements $VehicleBrandCopyWith<$Res> {
  factory _$$_VehicleBrandCopyWith(
          _$_VehicleBrand value, $Res Function(_$_VehicleBrand) then) =
      __$$_VehicleBrandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String logo});
}

/// @nodoc
class __$$_VehicleBrandCopyWithImpl<$Res>
    extends _$VehicleBrandCopyWithImpl<$Res, _$_VehicleBrand>
    implements _$$_VehicleBrandCopyWith<$Res> {
  __$$_VehicleBrandCopyWithImpl(
      _$_VehicleBrand _value, $Res Function(_$_VehicleBrand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
  }) {
    return _then(_$_VehicleBrand(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_VehicleBrand implements _VehicleBrand {
  _$_VehicleBrand({required this.id, required this.name, required this.logo});

  factory _$_VehicleBrand.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleBrandFromJson(json);

  /// Document ID
  @override
  final String id;

  ///name of Brand
  @override
  final String name;

  ///brand logo
  @override
  final String logo;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleBrand &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleBrandCopyWith<_$_VehicleBrand> get copyWith =>
      __$$_VehicleBrandCopyWithImpl<_$_VehicleBrand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleBrandToJson(
      this,
    );
  }
}

abstract class _VehicleBrand implements VehicleBrand {
  factory _VehicleBrand(
      {required final String id,
      required final String name,
      required final String logo}) = _$_VehicleBrand;

  factory _VehicleBrand.fromJson(Map<String, dynamic> json) =
      _$_VehicleBrand.fromJson;

  @override

  /// Document ID
  String get id;
  @override

  ///name of Brand
  String get name;
  @override

  ///brand logo
  String get logo;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleBrandCopyWith<_$_VehicleBrand> get copyWith =>
      throw _privateConstructorUsedError;
}
