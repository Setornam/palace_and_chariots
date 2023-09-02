// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tourism.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tourism _$TourismFromJson(Map<String, dynamic> json) {
  return _Tourism.fromJson(json);
}

/// @nodoc
mixin _$Tourism {
  /// Document ID
  String get id => throw _privateConstructorUsedError;

  ///name of Tourism
  String get name => throw _privateConstructorUsedError;

  ///price of Tourism
  String get price => throw _privateConstructorUsedError;

  ///Tourism  images
  List<String> get images => throw _privateConstructorUsedError;

  ///Tourism location
  String get location => throw _privateConstructorUsedError;

  ///Tourism Facilities
  List<String> get facilities => throw _privateConstructorUsedError;

  ///Tourism duration
  String get duration => throw _privateConstructorUsedError;

  ///Tourism overview
  String get overview => throw _privateConstructorUsedError;

  ///Tourism rating
  String get rating => throw _privateConstructorUsedError;

  ///Tourism reviews
  String get reviews => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourismCopyWith<Tourism> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourismCopyWith<$Res> {
  factory $TourismCopyWith(Tourism value, $Res Function(Tourism) then) =
      _$TourismCopyWithImpl<$Res, Tourism>;
  @useResult
  $Res call(
      {String id,
      String name,
      String price,
      List<String> images,
      String location,
      List<String> facilities,
      String duration,
      String overview,
      String rating,
      String reviews});
}

/// @nodoc
class _$TourismCopyWithImpl<$Res, $Val extends Tourism>
    implements $TourismCopyWith<$Res> {
  _$TourismCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? images = null,
    Object? location = null,
    Object? facilities = null,
    Object? duration = null,
    Object? overview = null,
    Object? rating = null,
    Object? reviews = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      facilities: null == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TourismCopyWith<$Res> implements $TourismCopyWith<$Res> {
  factory _$$_TourismCopyWith(
          _$_Tourism value, $Res Function(_$_Tourism) then) =
      __$$_TourismCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String price,
      List<String> images,
      String location,
      List<String> facilities,
      String duration,
      String overview,
      String rating,
      String reviews});
}

/// @nodoc
class __$$_TourismCopyWithImpl<$Res>
    extends _$TourismCopyWithImpl<$Res, _$_Tourism>
    implements _$$_TourismCopyWith<$Res> {
  __$$_TourismCopyWithImpl(_$_Tourism _value, $Res Function(_$_Tourism) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? images = null,
    Object? location = null,
    Object? facilities = null,
    Object? duration = null,
    Object? overview = null,
    Object? rating = null,
    Object? reviews = null,
  }) {
    return _then(_$_Tourism(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      facilities: null == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Tourism implements _Tourism {
  _$_Tourism(
      {required this.id,
      required this.name,
      required this.price,
      required final List<String> images,
      required this.location,
      required final List<String> facilities,
      required this.duration,
      required this.overview,
      required this.rating,
      required this.reviews})
      : _images = images,
        _facilities = facilities;

  factory _$_Tourism.fromJson(Map<String, dynamic> json) =>
      _$$_TourismFromJson(json);

  /// Document ID
  @override
  final String id;

  ///name of Tourism
  @override
  final String name;

  ///price of Tourism
  @override
  final String price;

  ///Tourism  images
  final List<String> _images;

  ///Tourism  images
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  ///Tourism location
  @override
  final String location;

  ///Tourism Facilities
  final List<String> _facilities;

  ///Tourism Facilities
  @override
  List<String> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  ///Tourism duration
  @override
  final String duration;

  ///Tourism overview
  @override
  final String overview;

  ///Tourism rating
  @override
  final String rating;

  ///Tourism reviews
  @override
  final String reviews;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tourism &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviews, reviews) || other.reviews == reviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      price,
      const DeepCollectionEquality().hash(_images),
      location,
      const DeepCollectionEquality().hash(_facilities),
      duration,
      overview,
      rating,
      reviews);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourismCopyWith<_$_Tourism> get copyWith =>
      __$$_TourismCopyWithImpl<_$_Tourism>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourismToJson(
      this,
    );
  }
}

abstract class _Tourism implements Tourism {
  factory _Tourism(
      {required final String id,
      required final String name,
      required final String price,
      required final List<String> images,
      required final String location,
      required final List<String> facilities,
      required final String duration,
      required final String overview,
      required final String rating,
      required final String reviews}) = _$_Tourism;

  factory _Tourism.fromJson(Map<String, dynamic> json) = _$_Tourism.fromJson;

  @override

  /// Document ID
  String get id;
  @override

  ///name of Tourism
  String get name;
  @override

  ///price of Tourism
  String get price;
  @override

  ///Tourism  images
  List<String> get images;
  @override

  ///Tourism location
  String get location;
  @override

  ///Tourism Facilities
  List<String> get facilities;
  @override

  ///Tourism duration
  String get duration;
  @override

  ///Tourism overview
  String get overview;
  @override

  ///Tourism rating
  String get rating;
  @override

  ///Tourism reviews
  String get reviews;
  @override
  @JsonKey(ignore: true)
  _$$_TourismCopyWith<_$_Tourism> get copyWith =>
      throw _privateConstructorUsedError;
}
