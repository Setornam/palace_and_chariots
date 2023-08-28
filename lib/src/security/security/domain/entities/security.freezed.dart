// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Security _$SecurityFromJson(Map<String, dynamic> json) {
  return _Security.fromJson(json);
}

/// @nodoc
mixin _$Security {
  /// Document ID
  String get id => throw _privateConstructorUsedError;

  ///name of Security
  String get name => throw _privateConstructorUsedError;

  ///price of Security
  String get description => throw _privateConstructorUsedError;

  ///availability of Security
  bool get availability => throw _privateConstructorUsedError;

  ///availability of Security
  String get serviceAvailableFor => throw _privateConstructorUsedError;

  ///Security  image
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityCopyWith<Security> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityCopyWith<$Res> {
  factory $SecurityCopyWith(Security value, $Res Function(Security) then) =
      _$SecurityCopyWithImpl<$Res, Security>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      bool availability,
      String serviceAvailableFor,
      String image});
}

/// @nodoc
class _$SecurityCopyWithImpl<$Res, $Val extends Security>
    implements $SecurityCopyWith<$Res> {
  _$SecurityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? availability = null,
    Object? serviceAvailableFor = null,
    Object? image = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceAvailableFor: null == serviceAvailableFor
          ? _value.serviceAvailableFor
          : serviceAvailableFor // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecurityCopyWith<$Res> implements $SecurityCopyWith<$Res> {
  factory _$$_SecurityCopyWith(
          _$_Security value, $Res Function(_$_Security) then) =
      __$$_SecurityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      bool availability,
      String serviceAvailableFor,
      String image});
}

/// @nodoc
class __$$_SecurityCopyWithImpl<$Res>
    extends _$SecurityCopyWithImpl<$Res, _$_Security>
    implements _$$_SecurityCopyWith<$Res> {
  __$$_SecurityCopyWithImpl(
      _$_Security _value, $Res Function(_$_Security) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? availability = null,
    Object? serviceAvailableFor = null,
    Object? image = null,
  }) {
    return _then(_$_Security(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceAvailableFor: null == serviceAvailableFor
          ? _value.serviceAvailableFor
          : serviceAvailableFor // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Security implements _Security {
  _$_Security(
      {required this.id,
      required this.name,
      required this.description,
      required this.availability,
      required this.serviceAvailableFor,
      required this.image});

  factory _$_Security.fromJson(Map<String, dynamic> json) =>
      _$$_SecurityFromJson(json);

  /// Document ID
  @override
  final String id;

  ///name of Security
  @override
  final String name;

  ///price of Security
  @override
  final String description;

  ///availability of Security
  @override
  final bool availability;

  ///availability of Security
  @override
  final String serviceAvailableFor;

  ///Security  image
  @override
  final String image;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Security &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.serviceAvailableFor, serviceAvailableFor) ||
                other.serviceAvailableFor == serviceAvailableFor) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      availability, serviceAvailableFor, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecurityCopyWith<_$_Security> get copyWith =>
      __$$_SecurityCopyWithImpl<_$_Security>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SecurityToJson(
      this,
    );
  }
}

abstract class _Security implements Security {
  factory _Security(
      {required final String id,
      required final String name,
      required final String description,
      required final bool availability,
      required final String serviceAvailableFor,
      required final String image}) = _$_Security;

  factory _Security.fromJson(Map<String, dynamic> json) = _$_Security.fromJson;

  @override

  /// Document ID
  String get id;
  @override

  ///name of Security
  String get name;
  @override

  ///price of Security
  String get description;
  @override

  ///availability of Security
  bool get availability;
  @override

  ///availability of Security
  String get serviceAvailableFor;
  @override

  ///Security  image
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_SecurityCopyWith<_$_Security> get copyWith =>
      throw _privateConstructorUsedError;
}
