import 'package:flutter/material.dart';
import 'package:gastro_rute/core/constants/app_sizes.dart';
import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';
import '../../core/widgets/filter_buttons.dart';
import '../../core/widgets/restaurant_card.dart';
import '../../core/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:gastro_rute/core/providers/restaurant_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantProvider>().loadRestaurants(20.967370, -89.592586);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RestaurantProvider>();

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
                CustomSearchBar(
                  controller: searchController,

                  onChanged: (value) {
                    provider.searchRestaurants(value);
                  },
                ),
                const SizedBox(height: 15),

                // 2. Filtros
                const CustomFilterButtons(),

                const SizedBox(height: 25),

                // 3. Banner
                Text("Anuncios", style: AppTextStyles.section),

                const SizedBox(height: 10),

                _buildBannerCard(),

                const SizedBox(height: 25),

                // 4. Restaurantes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("Restaurantes", style: AppTextStyles.section),

                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),

                const SizedBox(height: 15),

                // LOADING
                if (provider.isLoading)
                  const Center(child: CircularProgressIndicator()),

                // LISTA
                if (!provider.isLoading)
                  ListView.builder(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: provider.filteredRestaurants.length,

                    itemBuilder: (context, index) {
                      final restaurant = provider.filteredRestaurants[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),

                        child: RestaurantCard(restaurant: restaurant),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Banner
Widget _buildBannerCard() {
  return Container(
    width: AppSizes.carouselAdWidth,

    height: AppSizes.carouselAdHeight,

    decoration: BoxDecoration(
      color: AppColors.greyLight,

      borderRadius: BorderRadius.circular(AppSizes.carouselAdRadius),
    ),

    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),

            child: Text("Anuncios", style: AppTextStyles.section),
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
