// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CarBrand _$CarBrandFromJson(Map<String, dynamic> json) {
  return _CarBrand.fromJson(json);
}

/// @nodoc
mixin _$CarBrand {
  /// Document ID
  String get id => throw _privateConstructorUsedError;

  ///name of Brand
  String get name => throw _privateConstructorUsedError;

  ///brand logo
  String get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarBrandCopyWith<CarBrand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarBrandCopyWith<$Res> {
  factory $CarBrandCopyWith(CarBrand value, $Res Function(CarBrand) then) =
      _$CarBrandCopyWithImpl<$Res, CarBrand>;
  @useResult
  $Res call({String id, String name, String logo});
}

/// @nodoc
class _$CarBrandCopyWithImpl<$Res, $Val extends CarBrand>
    implements $CarBrandCopyWith<$Res> {
  _$CarBrandCopyWithImpl(this._value, this._then);

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
abstract class _$$_CarBrandCopyWith<$Res> implements $CarBrandCopyWith<$Res> {
  factory _$$_CarBrandCopyWith(
          _$_CarBrand value, $Res Function(_$_CarBrand) then) =
      __$$_CarBrandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String logo});
}

/// @nodoc
class __$$_CarBrandCopyWithImpl<$Res>
    extends _$CarBrandCopyWithImpl<$Res, _$_CarBrand>
    implements _$$_CarBrandCopyWith<$Res> {
  __$$_CarBrandCopyWithImpl(
      _$_CarBrand _value, $Res Function(_$_CarBrand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
  }) {
    return _then(_$_CarBrand(
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
class _$_CarBrand implements _CarBrand {
  _$_CarBrand({required this.id, required this.name, required this.logo});

  factory _$_CarBrand.fromJson(Map<String, dynamic> json) =>
      _$$_CarBrandFromJson(json);

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
            other is _$_CarBrand &&
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
  _$$_CarBrandCopyWith<_$_CarBrand> get copyWith =>
      __$$_CarBrandCopyWithImpl<_$_CarBrand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarBrandToJson(
      this,
    );
  }
}

abstract class _CarBrand implements CarBrand {
  factory _CarBrand(
      {required final String id,
      required final String name,
      required final String logo}) = _$_CarBrand;

  factory _CarBrand.fromJson(Map<String, dynamic> json) = _$_CarBrand.fromJson;

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
  _$$_CarBrandCopyWith<_$_CarBrand> get copyWith =>
      throw _privateConstructorUsedError;
}
