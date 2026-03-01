import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gastro_rute/core/constants/app_icons.dart';
import 'package:gastro_rute/core/constants/app_sizes.dart';
import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // [cite: 1, 2]
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
                Text("Anuncios", style: AppTextStyles.section), //
                const SizedBox(height: 10),
                _buildBannerCard(),

                const SizedBox(height: 25),

                // 4. Sección de Restaurantes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Restaurantes", style: AppTextStyles.section), //
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
                const SizedBox(height: 15),

                // Tarjeta de Restaurante
                _buildRestaurantCard(context),
                SizedBox(height: 16),
                _buildRestaurantCard(context),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Widget: Barra de Búsqueda
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.searchBackground, //
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border), //
      ),
      child: TextField(
        style: AppTextStyles.search, //
        decoration: InputDecoration(
          hintText: "Tacos Arabes",
          hintStyle: AppTextStyles.search, //
          icon: Icon(
            AppIcons.search,
            color: AppColors.black,
            size: AppIcons.size,
          ), //
          suffixIcon: Icon(
            Icons.edit_outlined,
            color: AppColors.black,
            size: 20,
          ),
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
        _outlinedButton("Favoritos", AppIcons.heartBorder), //
      ],
    );
  }

  Widget _outlinedButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border), //
      ),
      child: Row(
        children: [
          Text(text, style: AppTextStyles.filters), //
          const SizedBox(width: 4),
          Icon(icon, size: 16),
        ],
      ),
    );
  }

  // Widget: Banner de Anuncios
  Widget _buildBannerCard() {
    return Container(
      width: AppSizes.carouselAdWidth, //
      height: AppSizes.carouselAdHeight, //
      decoration: BoxDecoration(
        color: AppColors.greyLight, //
        borderRadius: BorderRadius.circular(AppSizes.carouselAdRadius), //
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Anuncios",
                style: AppTextStyles.section, //
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSizes.carouselAdRadius),
                bottomRight: Radius.circular(AppSizes.carouselAdRadius),
              ),
              child: Image.network(
                'https://www.recetasnestle.com.mx/sites/default/files/srh_recipes/0042b50ddf34a966d44f54be5ae248bb.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Tarjeta de Restaurante
  Widget _buildRestaurantCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/detail');
      },

      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                child: Image.network(
                  'https://www.recetasnestle.com.mx/sites/default/files/srh_recipes/0042b50ddf34a966d44f54be5ae248bb.jpg',
                  height: AppSizes.cardHeight,
                  width: AppSizes.cardWidth,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Icon(
                  AppIcons.heart,
                  color: AppColors.heartRed,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text("Tacos Arabes Felix", style: AppTextStyles.cardTitle),
          Text(
            "Abierto • Cierra a las 11:00 PM",
            style: AppTextStyles.cardSubtitle,
          ),
          Row(
            children: [
              Icon(AppIcons.star, size: 18, color: Colors.amber),
              Text(" 4.8 (500 reseñas)  ", style: AppTextStyles.cardSubtitle),
              const Icon(Icons.location_on_outlined, size: 18),
              Text(" 1.2 millas", style: AppTextStyles.cardSubtitle),
            ],
          ),
        ],
      ),
    );
  }
}
