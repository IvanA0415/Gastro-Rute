import 'package:flutter/material.dart';
import 'package:gastro_rute/core/providers/restaurant_provider.dart';
import 'package:gastro_rute/core/widgets/filter_buttons.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/restaurant_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RestaurantProvider>();

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: Text("Favoritos", style: AppTextStyles.pageTitle),

        centerTitle: false,

        backgroundColor: AppColors.white,

        elevation: 0,
      ),

      body: provider.favorites.isEmpty
          ? const Center(child: Text('No hay favoritos'))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // FILTROS
                  Row(
                    children: [
                      const CustomFilterButtons(),

                      const SizedBox(width: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // FAVORITOS
                  ListView.builder(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: provider.favorites.length,

                    itemBuilder: (context, index) {
                      final restaurant = provider.favorites[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),

                        child: RestaurantCard(restaurant: restaurant),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
