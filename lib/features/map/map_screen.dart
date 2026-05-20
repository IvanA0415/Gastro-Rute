import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../core/constants/app_icons.dart';
import '../../core/theme/app_colors.dart';

class Restaurant {
  final String name;
  final double rating;
  final double distance;
  final bool isOpen;
  final String image;

  Restaurant({
    required this.name,
    required this.rating,
    required this.distance,
    required this.isOpen,
    required this.image,
  });
}

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  final TextEditingController searchController =
      TextEditingController();

  final List<Restaurant> allRestaurants = [
    Restaurant(
      name: "Tacos Arabes",
      rating: 4.8,
      distance: 1.2,
      isOpen: true,
      image: "https://images.unsplash.com/photo-1613514785940-daed07799d9b",
    ),

    Restaurant(
      name: "Pizza Hut",
      rating: 4.3,
      distance: 2.5,
      isOpen: false,
      image: "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    ),

    Restaurant(
      name: "Burger King",
      rating: 4.5,
      distance: 0.9,
      isOpen: true,
      image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    ),

    Restaurant(
      name: "McDonalds",
      rating: 4.1,
      distance: 3.1,
      isOpen: true,
      image: "https://images.unsplash.com/photo-1571091718767-18b5b1457add",
    ),
  ];

  List<Restaurant> filteredRestaurants = [];

  bool onlyOpen = false;

  @override
  void initState() {
    super.initState();

    filteredRestaurants = allRestaurants;
  }

  void searchRestaurants(String query) {
    setState(() {

      filteredRestaurants =
          allRestaurants.where((restaurant) {

        return restaurant.name
            .toLowerCase()
            .contains(query.toLowerCase());

      }).toList();
    });
  }

  void filterOpenRestaurants() {

    setState(() {

      onlyOpen = !onlyOpen;

      if (onlyOpen) {

        filteredRestaurants =
            allRestaurants.where((restaurant) {

          return restaurant.isOpen;

        }).toList();

      } else {

        filteredRestaurants = allRestaurants;
      }
    });
  }

  void sortByRating() {

    setState(() {

      filteredRestaurants.sort((a, b) {

        return b.rating.compareTo(a.rating);

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // SEARCH
              Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [

                    _SearchBar(
                      controller: searchController,

                      onChanged: (value) {
                        searchRestaurants(value);
                      },
                    ),

                    const SizedBox(height: 12),

                    _FilterRow(
                      onlyOpen: onlyOpen,

                      totalResults:
                          filteredRestaurants.length,

                      onFilterPressed: () {
                        filterOpenRestaurants();
                      },

                      onSortPressed: () {
                        sortByRating();
                      },
                    ),
                  ],
                ),
              ),

              // MAPA REAL
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: SizedBox(
                  height: 260,

                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20),

                    child: FlutterMap(

                      options: MapOptions(

                        initialCenter: LatLng(
                          20.9674,
                          -89.5926,
                        ),

                        initialZoom: 13,
                      ),

                      children: [

                        TileLayer(

                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                          userAgentPackageName:
                              'com.example.app',
                        ),

                        MarkerLayer(

                          markers: [

                            Marker(
                              point: LatLng(
                                20.9674,
                                -89.5926,
                              ),

                              width: 80,
                              height: 80,

                              child: const Icon(
                                Icons.location_on,
                                size: 40,
                                color: Colors.red,
                              ),
                            ),

                            Marker(
                              point: LatLng(
                                20.9750,
                                -89.5800,
                              ),

                              width: 80,
                              height: 80,

                              child: const Icon(
                                Icons.location_on,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),

                            Marker(
                              point: LatLng(
                                20.9600,
                                -89.6000,
                              ),

                              width: 80,
                              height: 80,

                              child: const Icon(
                                Icons.location_on,
                                size: 40,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // RESTAURANTS
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: ListView.builder(
                  shrinkWrap: true,

                  physics:
                      const NeverScrollableScrollPhysics(),

                  itemCount:
                      filteredRestaurants.length,

                  itemBuilder: (context, index) {

                    final restaurant =
                        filteredRestaurants[index];

                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),

                      child: _RestaurantCard(
                        restaurant: restaurant,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      
    );
  }
}

// SEARCH BAR
class _SearchBar extends StatelessWidget {

  final TextEditingController controller;

  final Function(String) onChanged;

  const _SearchBar({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),

      height: 50,

      decoration: BoxDecoration(
        color: Colors.grey[200],

        borderRadius:
            BorderRadius.circular(30),
      ),

      child: Row(
        children: [

          const Icon(Icons.search),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,

              onChanged: (value) {
                onChanged(value);
              },

              decoration: const InputDecoration(
                hintText: "Buscar restaurante",

                border: InputBorder.none,
              ),
            ),
          ),

          const Icon(Icons.edit),
        ],
      ),
    );
  }
}

// FILTER ROW
class _FilterRow extends StatelessWidget {

  final VoidCallback onFilterPressed;

  final VoidCallback onSortPressed;

  final int totalResults;

  final bool onlyOpen;

  const _FilterRow({
    required this.onFilterPressed,
    required this.onSortPressed,
    required this.totalResults,
    required this.onlyOpen,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [

        Row(
          children: [

            GestureDetector(
              onTap: onFilterPressed,

              child: _FilterChip(
                onlyOpen
                    ? "Abiertos"
                    : "Filtrar",
              ),
            ),

            const SizedBox(width: 8),

            GestureDetector(
              onTap: onSortPressed,

              child: const _FilterChip(
                "Ordenar",
              ),
            ),
          ],
        ),

        Text("$totalResults resultados"),
      ],
    );
  }
}

// FILTER CHIP
class _FilterChip extends StatelessWidget {

  final String text;

  const _FilterChip(this.text);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Text(text),
    );
  }
}

// RESTAURANT CARD
class _RestaurantCard extends StatelessWidget {

  final Restaurant restaurant;

  const _RestaurantCard({
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20),
      ),

      elevation: 3,

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(
              top: Radius.circular(20),
            ),

            child: Image.network(
              restaurant.image,

              height: 150,

              width: double.infinity,

              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  restaurant.name,

                  style: const TextStyle(
                    fontSize: 18,

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [

                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.orange,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      restaurant.rating.toString(),
                    ),

                    const SizedBox(width: 10),

                    const Icon(
                      Icons.location_on,
                      size: 16,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      "${restaurant.distance} millas",
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  restaurant.isOpen
                      ? "Abierto"
                      : "Cerrado",

                  style: TextStyle(
                    color:
                        restaurant.isOpen
                            ? Colors.green
                            : Colors.red,
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {

                      showDialog(
                        context: context,

                        builder: (_) {

                          return AlertDialog(

                            title:
                                Text(restaurant.name),

                            content: Column(
                              mainAxisSize:
                                  MainAxisSize.min,

                              children: [

                                Text(
                                  "Calificación: ${restaurant.rating}",
                                ),

                                Text(
                                  "Distancia: ${restaurant.distance} millas",
                                ),

                                Text(
                                  restaurant.isOpen
                                      ? "Abierto"
                                      : "Cerrado",
                                ),
                              ],
                            ),

                            actions: [

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },

                                child: const Text(
                                  "Cerrar",
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },

                    child: const Text(
                      "Más info",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
