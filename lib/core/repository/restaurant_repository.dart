import 'package:gastro_rute/core/data/restaurants_data.dart';

import '../models/restaurant_model.dart';

class RestaurantRepository {
  final RestaurantsRemoteDatasource datasource = RestaurantsRemoteDatasource();

  Future<List<RestaurantModel>> getRestaurants(double lat, double lon) async {
    try {
      final response = await datasource.fetchRestaurants(lat, lon);

      final data = response.data;

      final List elements = data['elements'];

      return elements.map((e) {
        return RestaurantModel.fromJson(e);
      }).toList();
    } catch (e) {
      throw Exception('Error obteniendo restaurantes');
    }
  }
}
