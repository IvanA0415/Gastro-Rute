import 'package:flutter/material.dart';

import 'package:gastro_rute/core/models/restaurant_model.dart';
import 'package:gastro_rute/core/repository/restaurant_repository.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantRepository repository = RestaurantRepository();

  List<RestaurantModel> restaurants = [];

  List<RestaurantModel> filteredRestaurants = [];

  List<RestaurantModel> favorites = [];

  void toggleFavorite(RestaurantModel restaurant) {
    final exists = favorites.any((item) => item.name == restaurant.name);

    if (exists) {
      favorites.removeWhere((item) => item.name == restaurant.name);
    } else {
      favorites.add(restaurant);
    }

    notifyListeners();
  }

  bool isLoading = false;

  Future<void> loadRestaurants(double lat, double lon) async {
    try {
      isLoading = true;

      notifyListeners();

      restaurants = await repository.getRestaurants(lat, lon);

      filteredRestaurants = restaurants;
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  bool isFavorite(RestaurantModel restaurant) {
    return favorites.any((item) => item.name == restaurant.name);
  }

  // SEARCH
  void searchRestaurants(String query) {
    if (query.isEmpty) {
      filteredRestaurants = restaurants;
    } else {
      filteredRestaurants = restaurants.where((restaurant) {
        return restaurant.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }
}
