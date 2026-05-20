import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';

part 'restaurant_model.g.dart';

@freezed
abstract class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required String name,

    required double lat,

    required double lon,

    required String cuisine,

    String? website,

    String? imageUrl,

    @Default(true) bool isOpen,

    String? rating,

    String? reviewCount,

    String? distance,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    final tags = json['tags'] ?? {};

    return RestaurantModel(
      name: tags['name'] ?? 'Sin nombre',

      cuisine: tags['cuisine'] ?? 'Restaurante',

      lat: (json['lat'] ?? 0).toDouble(),

      lon: (json['lon'] ?? 0).toDouble(),

      website: tags['website'],

      rating: '4.8',

      reviewCount: '500 reseñas',

      distance: '1.2 km',

      isOpen: true,
    );
  }
}
