import 'package:flutter/material.dart';
import 'package:gastro_rute/core/constants/app_icons.dart';
import 'package:gastro_rute/core/constants/app_sizes.dart';
import 'package:gastro_rute/core/providers/restaurant_provider.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';
import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:gastro_rute/core/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class RestaurantCard extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;
    final provider = context.watch<RestaurantProvider>();
    final isFavorite = provider.isFavorite(restaurant);

    return GestureDetector(
      onTap: () {
        context.push('/detail', extra: restaurant);
      },

      behavior: HitTestBehavior.opaque,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),

                child: AspectRatio(
                  aspectRatio: 16 / 9,

                  child: Image.network(
                    restaurant.imageUrl ?? '',

                    // width: AppSizes.cardWidth,
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {
                      return AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          '../../../assets/images/error_image.png',

                          //    width: AppSizes.cardWidth,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),

              Positioned(
                top: 15,
                right: 15,

                child: GestureDetector(
                  onTap: () {
                    provider.toggleFavorite(restaurant);
                  },

                  child: Container(
                    padding: const EdgeInsets.all(6),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(100),
                    ),

                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,

                      color: isFavorite
                          ? AppColors.heartInner
                          : AppColors.heartOuter,

                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            restaurant.name,

            style: AppTextStyles.cardTitle,

            maxLines: 1,

            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          Text(
            restaurant.isOpen ? "Abierto • Disponible" : "Cerrado",

            style: AppTextStyles.cardSubtitle,
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Icon(AppIcons.star, size: 18, color: Colors.amber),

              Text(
                " ${restaurant.rating ?? '4.8'}",

                style: AppTextStyles.cardSubtitle,
              ),

              Text(
                " (${restaurant.reviewCount ?? '500 reseñas'})",

                style: AppTextStyles.cardSubtitle,
              ),

              const SizedBox(width: 10),

              const Icon(Icons.location_on_outlined, size: 18),

              Expanded(
                child: Text(
                  restaurant.distance ?? "1.2 km",

                  style: AppTextStyles.cardSubtitle,

                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            restaurant.cuisine,

            style: AppTextStyles.cardSubtitle,

            maxLines: 1,

            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
