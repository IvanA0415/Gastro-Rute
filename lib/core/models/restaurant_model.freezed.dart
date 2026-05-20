// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) {
  return _RestaurantModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantModel {
  String get name => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  String get cuisine => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get reviewCount => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;

  /// Serializes this RestaurantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantModelCopyWith<RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantModelCopyWith<$Res> {
  factory $RestaurantModelCopyWith(
    RestaurantModel value,
    $Res Function(RestaurantModel) then,
  ) = _$RestaurantModelCopyWithImpl<$Res, RestaurantModel>;
  @useResult
  $Res call({
    String name,
    double lat,
    double lon,
    String cuisine,
    String? website,
    String? imageUrl,
    bool isOpen,
    String? rating,
    String? reviewCount,
    String? distance,
  });
}

/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res, $Val extends RestaurantModel>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lat = null,
    Object? lon = null,
    Object? cuisine = null,
    Object? website = freezed,
    Object? imageUrl = freezed,
    Object? isOpen = null,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? distance = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lon: null == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                      as double,
            cuisine: null == cuisine
                ? _value.cuisine
                : cuisine // ignore: cast_nullable_to_non_nullable
                      as String,
            website: freezed == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOpen: null == isOpen
                ? _value.isOpen
                : isOpen // ignore: cast_nullable_to_non_nullable
                      as bool,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as String?,
            reviewCount: freezed == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as String?,
            distance: freezed == distance
                ? _value.distance
                : distance // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RestaurantModelImplCopyWith<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  factory _$$RestaurantModelImplCopyWith(
    _$RestaurantModelImpl value,
    $Res Function(_$RestaurantModelImpl) then,
  ) = __$$RestaurantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    double lat,
    double lon,
    String cuisine,
    String? website,
    String? imageUrl,
    bool isOpen,
    String? rating,
    String? reviewCount,
    String? distance,
  });
}

/// @nodoc
class __$$RestaurantModelImplCopyWithImpl<$Res>
    extends _$RestaurantModelCopyWithImpl<$Res, _$RestaurantModelImpl>
    implements _$$RestaurantModelImplCopyWith<$Res> {
  __$$RestaurantModelImplCopyWithImpl(
    _$RestaurantModelImpl _value,
    $Res Function(_$RestaurantModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lat = null,
    Object? lon = null,
    Object? cuisine = null,
    Object? website = freezed,
    Object? imageUrl = freezed,
    Object? isOpen = null,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? distance = freezed,
  }) {
    return _then(
      _$RestaurantModelImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lon: null == lon
            ? _value.lon
            : lon // ignore: cast_nullable_to_non_nullable
                  as double,
        cuisine: null == cuisine
            ? _value.cuisine
            : cuisine // ignore: cast_nullable_to_non_nullable
                  as String,
        website: freezed == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOpen: null == isOpen
            ? _value.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as String?,
        reviewCount: freezed == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as String?,
        distance: freezed == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantModelImpl implements _RestaurantModel {
  const _$RestaurantModelImpl({
    required this.name,
    required this.lat,
    required this.lon,
    required this.cuisine,
    this.website,
    this.imageUrl,
    this.isOpen = true,
    this.rating,
    this.reviewCount,
    this.distance,
  });

  factory _$RestaurantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantModelImplFromJson(json);

  @override
  final String name;
  @override
  final double lat;
  @override
  final double lon;
  @override
  final String cuisine;
  @override
  final String? website;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isOpen;
  @override
  final String? rating;
  @override
  final String? reviewCount;
  @override
  final String? distance;

  @override
  String toString() {
    return 'RestaurantModel(name: $name, lat: $lat, lon: $lon, cuisine: $cuisine, website: $website, imageUrl: $imageUrl, isOpen: $isOpen, rating: $rating, reviewCount: $reviewCount, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.cuisine, cuisine) || other.cuisine == cuisine) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    lat,
    lon,
    cuisine,
    website,
    imageUrl,
    isOpen,
    rating,
    reviewCount,
    distance,
  );

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantModelImplCopyWith<_$RestaurantModelImpl> get copyWith =>
      __$$RestaurantModelImplCopyWithImpl<_$RestaurantModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantModelImplToJson(this);
  }
}

abstract class _RestaurantModel implements RestaurantModel {
  const factory _RestaurantModel({
    required final String name,
    required final double lat,
    required final double lon,
    required final String cuisine,
    final String? website,
    final String? imageUrl,
    final bool isOpen,
    final String? rating,
    final String? reviewCount,
    final String? distance,
  }) = _$RestaurantModelImpl;

  factory _RestaurantModel.fromJson(Map<String, dynamic> json) =
      _$RestaurantModelImpl.fromJson;

  @override
  String get name;
  @override
  double get lat;
  @override
  double get lon;
  @override
  String get cuisine;
  @override
  String? get website;
  @override
  String? get imageUrl;
  @override
  bool get isOpen;
  @override
  String? get rating;
  @override
  String? get reviewCount;
  @override
  String? get distance;

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantModelImplCopyWith<_$RestaurantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
