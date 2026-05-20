import 'package:flutter/material.dart';
import 'package:gastro_rute/core/widgets/filter_buttons.dart';
import 'package:gastro_rute/core/widgets/search_bar.dart';

class MapaScreen extends StatelessWidget {
  const MapaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BUSCADOR + FILTROS
              const SizedBox(height: 20),

              // 1. Barra de Búsqueda
              const CustomSearchBar(),

              const SizedBox(height: 15),

              const CustomFilterButtons(),

              const SizedBox(height: 25),

              // MAPA FALSO
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

                      Positioned(
                        top: 40,
                        left: 40,
                        child: _PriceBubble("\$234"),
                      ),
                      Positioned(
                        top: 70,
                        right: 50,
                        child: _PriceBubble("\$299"),
                      ),
                      Positioned(
                        top: 120,
                        left: 140,
                        child: _PriceBubble("\$123", selected: true),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 90,
                        child: _PriceBubble("\$345"),
                      ),
                      Positioned(
                        bottom: 70,
                        right: 70,
                        child: _PriceBubble("\$176"),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // CARD RESTAURANTE
              //const RestaurantCard(),
            ],
          ),
        ),
      ),
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
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
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
