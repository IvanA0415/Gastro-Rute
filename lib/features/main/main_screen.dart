import 'package:flutter/material.dart';
import 'package:gastro_rute/core/constants/app_icons.dart'; 
import 'package:gastro_rute/core/constants/app_sizes.dart'; 
import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                // 1. Barra de Búsqueda
                _buildSearchBar(),
                
                const SizedBox(height: 15),

                // 2. Filtros y Favoritos
                _buildFilterButtons(),

                const SizedBox(height: 25),

                // 3. Sección de Anuncios (Banner)
                Text("Anuncios", style: AppTextStyles.section),
                const SizedBox(height: 10),
                _buildBannerCard(),

                const SizedBox(height: 25),

                // 4. Sección de Restaurantes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Restaurantes", style: AppTextStyles.section),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
                const SizedBox(height: 15),

                // Tarjeta de Restaurante
                _buildRestaurantCard(),
                const SizedBox(height: 20),
                _buildRestaurantCard(), // Duplicado para el ejemplo
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Widget: Barra de Búsqueda
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Tacos Arabes",
          hintStyle: AppTextStyles.secondaryText,
          icon: const Icon(Icons.search, color: Colors.black),
          suffixIcon: const Icon(Icons.edit_outlined, color: Colors.black, size: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Widget: Botones de Filtro
  Widget _buildFilterButtons() {
    return Row(
      children: [
        _outlinedButton("Filtrar", Icons.keyboard_arrow_down),
        const SizedBox(width: 10),
        _outlinedButton("Ordenar", Icons.keyboard_arrow_down),
        const SizedBox(width: 10),
        _outlinedButton("Favoritos", Icons.favorite_border),
      ],
    );
  }

  Widget _outlinedButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          Icon(icon, size: 16),
        ],
      ),
    );
  }

  // Widget: Banner de Anuncios
  Widget _buildBannerCard() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Gris claro
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Anuncios",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.network(
                'https://img.freepik.com/foto-gratis/peras-frescas-aisladas-blanco_144627-14815.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Tarjeta de Restaurante
  Widget _buildRestaurantCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8X3z-Y9Y2J2J9Y2J9Y2J9Y2J9Y2J9Y2J9Y2J9Y2J9Y2J', // Imagen placeholder de Tacos Felix
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(height: 200, color: Colors.grey[300], child: const Icon(Icons.restaurant)),
              ),
            ),
            const Positioned(
              top: 15,
              right: 15,
              child: Icon(Icons.favorite_border, color: Colors.white, size: 28),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text("Tacos Arabes Felix", style: AppTextStyles.section),
        Text(
          "Abierto • Cierra a las 11:00 PM",
          style: AppTextStyles.secondaryText.copyWith(color: Colors.grey),
        ),
        Row(
          children: [
            const Icon(Icons.star_border, size: 18),
            Text(" 4.8 (500 reseñas)  ", style: AppTextStyles.secondaryText),
            const Icon(Icons.location_on_outlined, size: 18),
            Text(" 1.2 millas", style: AppTextStyles.secondaryText),
          ],
        ),
      ],
    );
  }

  // Widget: Bottom Navigation Bar
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0, // Home activo
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.white,
      elevation: 5,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.black.withOpacity(0.4),
      items: [
        BottomNavigationBarItem(icon: Icon(AppIcons.navHome, size: AppIcons.size), label: ""),
        BottomNavigationBarItem(icon: Icon(AppIcons.navMap, size: AppIcons.size), label: ""),
        BottomNavigationBarItem(icon: Icon(AppIcons.navFavorites, size: AppIcons.size), label: ""),
        BottomNavigationBarItem(icon: Icon(AppIcons.navProfile, size: AppIcons.size), label: ""),
      ],
    );
  }
}
