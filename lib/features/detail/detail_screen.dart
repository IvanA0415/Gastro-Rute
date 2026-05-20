import 'package:flutter/material.dart';
import 'package:gastro_rute/core/providers/restaurant_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gastro_rute/core/constants/app_sizes.dart';
import 'package:gastro_rute/core/constants/app_icons.dart';
import 'package:gastro_rute/core/models/restaurant_model.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final RestaurantModel restaurant;

  const DetailScreen({super.key, required this.restaurant});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController _controller = PageController();

  int _currentPage = 0;

  late final List<String> images;

  @override
  void initState() {
    super.initState();

    images = [
      widget.restaurant.imageUrl ?? '../../../assets/images/error_image.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;
    final provider = context.watch<RestaurantProvider>();
    final isFavorite = provider.isFavorite(restaurant);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(AppIcons.back),

          onPressed: () {
            context.pop();
          },
        ),

        title: Text(restaurant.name, style: AppTextStyles.pageTitle),

        centerTitle: true,

        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // CARRUSEL
            SizedBox(
              height: AppSizes.detailCarouselHeight,

              width: AppSizes.carouselAdWidth,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,

                    itemCount: images.length,

                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },

                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSizes.detailCarouselRadius,
                        ),

                        child: Image.network(
                          images[index],

                          fit: BoxFit.cover,

                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade300,

                              child: const Icon(Icons.restaurant, size: 60),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  // INDICADORES
                  Positioned(
                    bottom: 12,

                    left: 0,

                    right: 0,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: List.generate(
                        images.length,

                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),

                          width: _currentPage == index ? 12 : 8,

                          height: 8,

                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white54,

                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CONTENIDO
            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // STATUS + FAVORITO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        restaurant.isOpen ? "Abierto • Disponible" : "Cerrado",

                        style: AppTextStyles.cardSubtitle,
                      ),

                      IconButton(
                        onPressed: () {
                          provider.toggleFavorite(restaurant);
                        },

                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,

                          color: isFavorite
                              ? AppColors.heartInner
                              : AppColors.heartOuter,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // RATING
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.orange),

                      const SizedBox(width: 4),

                      Text(
                        "${restaurant.rating ?? '4.8'} (${restaurant.reviewCount ?? '500 reseñas'})",

                        style: AppTextStyles.cardSubtitle,
                      ),

                      const SizedBox(width: 16),

                      Text(
                        restaurant.distance ?? "1.2 km",

                        style: AppTextStyles.cardSubtitle,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Text("Descripción", style: AppTextStyles.primaryText),

                  const SizedBox(height: 8),

                  Text(
                    "${restaurant.cuisine} preparado con ingredientes frescos y recetas tradicionales.",

                    style: AppTextStyles.secondaryText,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    restaurant.website ?? "Dirección no disponible",

                    style: AppTextStyles.secondaryText,
                  ),

                  const SizedBox(height: 24),

                  // COMENTARIOS
                  Row(
                    children: [
                      Text("Comentarios", style: AppTextStyles.commentsHeader),
                    ],
                  ),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},

                        child: Text("Filtrar", style: AppTextStyles.filters),
                      ),

                      const SizedBox(width: 12),

                      ElevatedButton(
                        onPressed: () {},

                        child: Text("Ordenar", style: AppTextStyles.filters),
                      ),

                      const Spacer(),

                      Text("99 resultados", style: AppTextStyles.commentsCount),
                    ],
                  ),
                ],
              ),
            ),

            // INPUT COMENTARIO
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(12),

                border: Border.all(color: Colors.grey.shade300),
              ),

              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 22,

                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=10',
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      'Escribe un comentario...',

                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  Icon(Icons.send, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // REVIEW CARD
            Container(
              margin: const EdgeInsets.all(16),

              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(12),

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const CircleAvatar(
                    radius: 28,

                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Excelente restaurante',

                                style: TextStyle(
                                  fontSize: 16,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Icon(Icons.star, color: Colors.amber, size: 18),

                            Icon(Icons.star, color: Colors.amber, size: 18),

                            Icon(Icons.star, color: Colors.amber, size: 18),

                            Icon(Icons.star, color: Colors.amber, size: 18),

                            Icon(
                              Icons.star_border,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ],
                        ),

                        SizedBox(height: 6),

                        Text(
                          'La comida estuvo excelente y el servicio fue rápido.',

                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
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
