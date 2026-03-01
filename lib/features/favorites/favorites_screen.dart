import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_sizes.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Favoritos", style: AppTextStyles.pageTitle),
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FILA DE FILTROS
            Row(
              children: [
                // Botón Filtrar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text("Filtrar", style: AppTextStyles.filters),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),

                // Botón Ordenar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text("Ordenar", style: AppTextStyles.filters),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // TARJETA RESTAURANTE 1
            GestureDetector(
              onTap: () {
                context.push('/detail');
              },

              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSizes.favoritesCarouselRadius,
                    ),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b",
                      height: AppSizes.favoritesCarouselHeight,
                      width: AppSizes.favoritesCarouselWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Tacos Arabes Felix", style: AppTextStyles.cardTitle),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Abierto · Cierra a las 11:00 PM",
                        style: AppTextStyles.cardSubtitle,
                      ),
                      Icon(
                        AppIcons.heart,
                        color: AppColors.heartRed,
                        size: AppIcons.size,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(AppIcons.star, size: 16, color: AppColors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "4.8 (500 reseñas)",
                        style: AppTextStyles.cardSubtitle,
                      ),
                      const SizedBox(width: 16),
                      Icon(AppIcons.navMap, size: 16, color: AppColors.grey),
                      const SizedBox(width: 4),
                      Text("1.2 millas", style: AppTextStyles.cardSubtitle),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // TARJETA RESTAURANTE 2
            GestureDetector(
              onTap: () {
                context.push('/detail');
              },

              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSizes.favoritesCarouselRadius,
                    ),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b",
                      height: AppSizes.favoritesCarouselHeight,
                      width: AppSizes.favoritesCarouselWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Tacos Arabes Felix", style: AppTextStyles.cardTitle),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Abierto · Cierra a las 11:00 PM",
                        style: AppTextStyles.cardSubtitle,
                      ),
                      Icon(
                        AppIcons.heart,
                        color: AppColors.heartRed,
                        size: AppIcons.size,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(AppIcons.star, size: 16, color: AppColors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "4.8 (500 reseñas)",
                        style: AppTextStyles.cardSubtitle,
                      ),
                      const SizedBox(width: 16),
                      Icon(AppIcons.navMap, size: 16, color: AppColors.grey),
                      const SizedBox(width: 4),
                      Text("1.2 millas", style: AppTextStyles.cardSubtitle),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
