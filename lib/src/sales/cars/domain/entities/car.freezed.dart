// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Car _$CarFromJson(Map<String, dynamic> json) {
  return _Car.fromJson(json);
}

/// @nodoc
mixin _$Car {
  /// Document ID
  String get id => throw _privateConstructorUsedError;

  ///name of Car
  String get name => throw _privateConstructorUsedError;

  ///color of Car
  String get color => throw _privateConstructorUsedError;

  ///price of Car
  String get price => throw _privateConstructorUsedError;

  ///availability of car
  bool get availability => throw _privateConstructorUsedError;

  ///Car  images
  List<String> get images => throw _privateConstructorUsedError;

  ///Car brand
  CarBrand? get brand => throw _privateConstructorUsedError;

  ///Car transmission
  String get transmission => throw _privateConstructorUsedError;

  ///number of seats
  String get seats => throw _privateConstructorUsedError;

  ///condition
  String get condition => throw _privateConstructorUsedError;

  /// maker
  String get maker => throw _privateConstructorUsedError;

  ///number of seats
  String get engineSize => throw _privateConstructorUsedError;
  String get trim => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;

  ///number of seats
  String get numberOfCylinders => throw _privateConstructorUsedError;

  ///Car rating
  String get rating => throw _privateConstructorUsedError;

  ///Car popularity
  String get popularity => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  ///Car speed
  String get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarCopyWith<Car> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarCopyWith<$Res> {
  factory $CarCopyWith(Car value, $Res Function(Car) then) =
      _$CarCopyWithImpl<$Res, Car>;
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      String price,
      bool availability,
      List<String> images,
      CarBrand? brand,
      String transmission,
      String seats,
      String condition,
      String maker,
      String engineSize,
      String trim,
      String year,
      String numberOfCylinders,
      String rating,
      String popularity,
      bool isFavorite,
      String speed});

  $CarBrandCopyWith<$Res>? get brand;
}

/// @nodoc
class _$CarCopyWithImpl<$Res, $Val extends Car> implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? price = null,
    Object? availability = null,
    Object? images = null,
    Object? brand = freezed,
    Object? transmission = null,
    Object? seats = null,
    Object? condition = null,
    Object? maker = null,
    Object? engineSize = null,
    Object? trim = null,
    Object? year = null,
    Object? numberOfCylinders = null,
    Object? rating = null,
    Object? popularity = null,
    Object? isFavorite = null,
    Object? speed = null,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as CarBrand?,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      maker: null == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String,
      engineSize: null == engineSize
          ? _value.engineSize
          : engineSize // ignore: cast_nullable_to_non_nullable
              as String,
      trim: null == trim
          ? _value.trim
          : trim // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfCylinders: null == numberOfCylinders
          ? _value.numberOfCylinders
          : numberOfCylinders // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CarBrandCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $CarBrandCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CarCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$$_CarCopyWith(_$_Car value, $Res Function(_$_Car) then) =
      __$$_CarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      String price,
      bool availability,
      List<String> images,
      CarBrand? brand,
      String transmission,
      String seats,
      String condition,
      String maker,
      String engineSize,
      String trim,
      String year,
      String numberOfCylinders,
      String rating,
      String popularity,
      bool isFavorite,
      String speed});

  @override
  $CarBrandCopyWith<$Res>? get brand;
}

/// @nodoc
class __$$_CarCopyWithImpl<$Res> extends _$CarCopyWithImpl<$Res, _$_Car>
    implements _$$_CarCopyWith<$Res> {
  __$$_CarCopyWithImpl(_$_Car _value, $Res Function(_$_Car) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? price = null,
    Object? availability = null,
    Object? images = null,
    Object? brand = freezed,
    Object? transmission = null,
    Object? seats = null,
    Object? condition = null,
    Object? maker = null,
    Object? engineSize = null,
    Object? trim = null,
    Object? year = null,
    Object? numberOfCylinders = null,
    Object? rating = null,
    Object? popularity = null,
    Object? isFavorite = null,
    Object? speed = null,
  }) {
    return _then(_$_Car(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as CarBrand?,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      maker: null == maker
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String,
      engineSize: null == engineSize
          ? _value.engineSize
          : engineSize // ignore: cast_nullable_to_non_nullable
              as String,
      trim: null == trim
          ? _value.trim
          : trim // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfCylinders: null == numberOfCylinders
          ? _value.numberOfCylinders
          : numberOfCylinders // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Car implements _Car {
  _$_Car(
      {required this.id,
      required this.name,
      required this.color,
      required this.price,
      required this.availability,
      required final List<String> images,
      this.brand,
      required this.transmission,
      required this.seats,
      required this.condition,
      required this.maker,
      required this.engineSize,
      required this.trim,
      required this.year,
      required this.numberOfCylinders,
      required this.rating,
      required this.popularity,
      required this.isFavorite,
      required this.speed})
      : _images = images;

  factory _$_Car.fromJson(Map<String, dynamic> json) => _$$_CarFromJson(json);

  /// Document ID
  @override
  final String id;

  ///name of Car
  @override
  final String name;

  ///color of Car
  @override
  final String color;

  ///price of Car
  @override
  final String price;

  ///availability of car
  @override
  final bool availability;

  ///Car  images
  final List<String> _images;

  ///Car  images
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  ///Car brand
  @override
  final CarBrand? brand;

  ///Car transmission
  @override
  final String transmission;

  ///number of seats
  @override
  final String seats;

  ///condition
  @override
  final String condition;

  /// maker
  @override
  final String maker;

  ///number of seats
  @override
  final String engineSize;
  @override
  final String trim;
  @override
  final String year;

  ///number of seats
  @override
  final String numberOfCylinders;

  ///Car rating
  @override
  final String rating;

  ///Car popularity
  @override
  final String popularity;
  @override
  final bool isFavorite;

  ///Car speed
  @override
  final String speed;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Car &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.transmission, transmission) ||
                other.transmission == transmission) &&
            (identical(other.seats, seats) || other.seats == seats) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.maker, maker) || other.maker == maker) &&
            (identical(other.engineSize, engineSize) ||
                other.engineSize == engineSize) &&
            (identical(other.trim, trim) || other.trim == trim) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.numberOfCylinders, numberOfCylinders) ||
                other.numberOfCylinders == numberOfCylinders) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        color,
        price,
        availability,
        const DeepCollectionEquality().hash(_images),
        brand,
        transmission,
        seats,
        condition,
        maker,
        engineSize,
        trim,
        year,
        numberOfCylinders,
        rating,
        popularity,
        isFavorite,
        speed
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarCopyWith<_$_Car> get copyWith =>
      __$$_CarCopyWithImpl<_$_Car>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarToJson(
      this,
    );
  }
}

abstract class _Car implements Car {
  factory _Car(
      {required final String id,
      required final String name,
      required final String color,
      required final String price,
      required final bool availability,
      required final List<String> images,
      final CarBrand? brand,
      required final String transmission,
      required final String seats,
      required final String condition,
      required final String maker,
      required final String engineSize,
      required final String trim,
      required final String year,
      required final String numberOfCylinders,
      required final String rating,
      required final String popularity,
      required final bool isFavorite,
      required final String speed}) = _$_Car;

  factory _Car.fromJson(Map<String, dynamic> json) = _$_Car.fromJson;

  @override

  /// Document ID
  String get id;
  @override

  ///name of Car
  String get name;
  @override

  ///color of Car
  String get color;
  @override

  ///price of Car
  String get price;
  @override

  ///availability of car
  bool get availability;
  @override

  ///Car  images
  List<String> get images;
  @override

  ///Car brand
  CarBrand? get brand;
  @override

  ///Car transmission
  String get transmission;
  @override

  ///number of seats
  String get seats;
  @override

  ///condition
  String get condition;
  @override

  /// maker
  String get maker;
  @override

  ///number of seats
  String get engineSize;
  @override
  String get trim;
  @override
  String get year;
  @override

  ///number of seats
  String get numberOfCylinders;
  @override

  ///Car rating
  String get rating;
  @override

  ///Car popularity
  String get popularity;
  @override
  bool get isFavorite;
  @override

  ///Car speed
  String get speed;
  @override
  @JsonKey(ignore: true)
  _$$_CarCopyWith<_$_Car> get copyWith => throw _privateConstructorUsedError;
}
