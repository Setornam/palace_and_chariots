// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  /// Document ID
  String get id => throw _privateConstructorUsedError;

  ///name of Vehicle
  String get name => throw _privateConstructorUsedError;

  ///color of vehicle
  String get color => throw _privateConstructorUsedError;

  ///price of vehicle
  String get price => throw _privateConstructorUsedError;

  ///availability of vehicle
  bool get availability => throw _privateConstructorUsedError;

  ///vehicle  images
  List<String> get images => throw _privateConstructorUsedError;

  ///vehicle brand
  VehicleBrand get brand => throw _privateConstructorUsedError;

  ///Vehicle Category
  String get category => throw _privateConstructorUsedError;

  ///vehicle transmission
  String get transmission => throw _privateConstructorUsedError;

  ///number of seats
  String get seats => throw _privateConstructorUsedError;

  ///luggage
  String get luggage => throw _privateConstructorUsedError;

  ///Other Vehicle Features
  List<String> get otherFeatures => throw _privateConstructorUsedError;

  ///Vehicle rating
  String get rating => throw _privateConstructorUsedError;

  ///Vehicle popularity
  String get popularity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      String price,
      bool availability,
      List<String> images,
      VehicleBrand brand,
      String category,
      String transmission,
      String seats,
      String luggage,
      List<String> otherFeatures,
      String rating,
      String popularity});

  $VehicleBrandCopyWith<$Res> get brand;
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

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
    Object? brand = null,
    Object? category = null,
    Object? transmission = null,
    Object? seats = null,
    Object? luggage = null,
    Object? otherFeatures = null,
    Object? rating = null,
    Object? popularity = null,
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
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as VehicleBrand,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as String,
      luggage: null == luggage
          ? _value.luggage
          : luggage // ignore: cast_nullable_to_non_nullable
              as String,
      otherFeatures: null == otherFeatures
          ? _value.otherFeatures
          : otherFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleBrandCopyWith<$Res> get brand {
    return $VehicleBrandCopyWith<$Res>(_value.brand, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$_VehicleCopyWith(
          _$_Vehicle value, $Res Function(_$_Vehicle) then) =
      __$$_VehicleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      String price,
      bool availability,
      List<String> images,
      VehicleBrand brand,
      String category,
      String transmission,
      String seats,
      String luggage,
      List<String> otherFeatures,
      String rating,
      String popularity});

  @override
  $VehicleBrandCopyWith<$Res> get brand;
}

/// @nodoc
class __$$_VehicleCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$_Vehicle>
    implements _$$_VehicleCopyWith<$Res> {
  __$$_VehicleCopyWithImpl(_$_Vehicle _value, $Res Function(_$_Vehicle) _then)
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
    Object? brand = null,
    Object? category = null,
    Object? transmission = null,
    Object? seats = null,
    Object? luggage = null,
    Object? otherFeatures = null,
    Object? rating = null,
    Object? popularity = null,
  }) {
    return _then(_$_Vehicle(
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
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as VehicleBrand,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as String,
      luggage: null == luggage
          ? _value.luggage
          : luggage // ignore: cast_nullable_to_non_nullable
              as String,
      otherFeatures: null == otherFeatures
          ? _value._otherFeatures
          : otherFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Vehicle implements _Vehicle {
  _$_Vehicle(
      {required this.id,
      required this.name,
      required this.color,
      required this.price,
      required this.availability,
      required final List<String> images,
      required this.brand,
      required this.category,
      required this.transmission,
      required this.seats,
      required this.luggage,
      required final List<String> otherFeatures,
      required this.rating,
      required this.popularity})
      : _images = images,
        _otherFeatures = otherFeatures;

  factory _$_Vehicle.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleFromJson(json);

  /// Document ID
  @override
  final String id;

  ///name of Vehicle
  @override
  final String name;

  ///color of vehicle
  @override
  final String color;

  ///price of vehicle
  @override
  final String price;

  ///availability of vehicle
  @override
  final bool availability;

  ///vehicle  images
  final List<String> _images;

  ///vehicle  images
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  ///vehicle brand
  @override
  final VehicleBrand brand;

  ///Vehicle Category
  @override
  final String category;

  ///vehicle transmission
  @override
  final String transmission;

  ///number of seats
  @override
  final String seats;

  ///luggage
  @override
  final String luggage;

  ///Other Vehicle Features
  final List<String> _otherFeatures;

  ///Other Vehicle Features
  @override
  List<String> get otherFeatures {
    if (_otherFeatures is EqualUnmodifiableListView) return _otherFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherFeatures);
  }

  ///Vehicle rating
  @override
  final String rating;

  ///Vehicle popularity
  @override
  final String popularity;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vehicle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.transmission, transmission) ||
                other.transmission == transmission) &&
            (identical(other.seats, seats) || other.seats == seats) &&
            (identical(other.luggage, luggage) || other.luggage == luggage) &&
            const DeepCollectionEquality()
                .equals(other._otherFeatures, _otherFeatures) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      color,
      price,
      availability,
      const DeepCollectionEquality().hash(_images),
      brand,
      category,
      transmission,
      seats,
      luggage,
      const DeepCollectionEquality().hash(_otherFeatures),
      rating,
      popularity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleCopyWith<_$_Vehicle> get copyWith =>
      __$$_VehicleCopyWithImpl<_$_Vehicle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleToJson(
      this,
    );
  }
}

abstract class _Vehicle implements Vehicle {
  factory _Vehicle(
      {required final String id,
      required final String name,
      required final String color,
      required final String price,
      required final bool availability,
      required final List<String> images,
      required final VehicleBrand brand,
      required final String category,
      required final String transmission,
      required final String seats,
      required final String luggage,
      required final List<String> otherFeatures,
      required final String rating,
      required final String popularity}) = _$_Vehicle;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$_Vehicle.fromJson;

  @override

  /// Document ID
  String get id;
  @override

  ///name of Vehicle
  String get name;
  @override

  ///color of vehicle
  String get color;
  @override

  ///price of vehicle
  String get price;
  @override

  ///availability of vehicle
  bool get availability;
  @override

  ///vehicle  images
  List<String> get images;
  @override

  ///vehicle brand
  VehicleBrand get brand;
  @override

  ///Vehicle Category
  String get category;
  @override

  ///vehicle transmission
  String get transmission;
  @override

  ///number of seats
  String get seats;
  @override

  ///luggage
  String get luggage;
  @override

  ///Other Vehicle Features
  List<String> get otherFeatures;
  @override

  ///Vehicle rating
  String get rating;
  @override

  ///Vehicle popularity
  String get popularity;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleCopyWith<_$_Vehicle> get copyWith =>
      throw _privateConstructorUsedError;
}
