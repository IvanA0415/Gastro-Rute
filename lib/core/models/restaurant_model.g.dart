// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantModelImpl _$$RestaurantModelImplFromJson(
  Map<String, dynamic> json,
) => _$RestaurantModelImpl(
  name: json['name'] as String,
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  cuisine: json['cuisine'] as String,
  website: json['website'] as String?,
  imageUrl: json['imageUrl'] as String?,
  isOpen: json['isOpen'] as bool? ?? true,
  rating: json['rating'] as String?,
  reviewCount: json['reviewCount'] as String?,
  distance: json['distance'] as String?,
);

Map<String, dynamic> _$$RestaurantModelImplToJson(
  _$RestaurantModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'lat': instance.lat,
  'lon': instance.lon,
  'cuisine': instance.cuisine,
  'website': instance.website,
  'imageUrl': instance.imageUrl,
  'isOpen': instance.isOpen,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'distance': instance.distance,
};
