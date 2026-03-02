import 'package:flutter/material.dart';
import '../../core/constants/app_icons.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MapaScreen extends StatelessWidget {
  const MapaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // =========================
              // BUSCADOR
              // =========================
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SearchBar(),
                    const SizedBox(height: 12),
                    _FilterRow(),
                  ],
                ),
              ),

              // =========================
              // MAPA
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 260,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(top: 40, left: 40, child: _PriceBubble("\$234")),
                      Positioned(top: 70, right: 50, child: _PriceBubble("\$299")),
                      Positioned(top: 120, left: 140, child: _PriceBubble("\$123", selected: true)),
                      Positioned(bottom: 40, left: 90, child: _PriceBubble("\$345")),
                      Positioned(bottom: 70, right: 70, child: _PriceBubble("\$176")),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =========================
              // CARD RESTAURANTE
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _RestaurantCard(),
              ),
            ],
          ),
        ),
      ),

      // =========================
      // BOTTOM NAVIGATION BAR
      // =========================
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.black.withOpacity(0.4),
        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navHome, size: 24), // valor fijo
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navMap, size: 24),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navFavorites, size: 24),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navProfile, size: 24),
            label: "",
          ),
        ],
      ),
    );
  }
}

// =========================
// WIDGETS INTERNOS
// =========================
class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Tacos Arabes",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Icon(Icons.edit),
        ],
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Row(
          children: [
            _FilterChip("Filtrar"),
            SizedBox(width: 8),
            _FilterChip("Ordenar"),
          ],
        ),
        Text("99 resultados"),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String text;
  const _FilterChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}

class _PriceBubble extends StatelessWidget {
  final String price;
  final bool selected;
  const _PriceBubble(this.price, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          )
        ],
      ),
      child: Text(
        price,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              "https://picsum.photos/400/200",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tacos Arabes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text("4.8 (500 h)"),
                    SizedBox(width: 10),
                    Icon(Icons.location_on, size: 16),
                    SizedBox(width: 4),
                    Text("1.2 millas"),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Más info presionado");
                    },
                    child: const Text("Más info"),
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