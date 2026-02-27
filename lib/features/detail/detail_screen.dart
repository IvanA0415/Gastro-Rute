import 'package:flutter/material.dart';
import 'package:gastro_rute/core/constants/app_sizes.dart';
import '../../core/constants/app_icons.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool isFavorite = false;

  final List<String> images = [
    "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b",
    "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(AppIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Tacos Arabes", style: AppTextStyles.pageTitle),
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
                        child: Image.network(images[index], fit: BoxFit.cover),
                      );
                    },
                  ),

                  // Indicadores
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
                  // Estado + corazón
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Abierto · Cierra a las 11:00 PM",
                        style: AppTextStyles.cardSubtitle,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
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

                  // Rating + precio
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        "4.8 (500 reseñas)",
                        style: AppTextStyles.cardSubtitle,
                      ),
                      const SizedBox(width: 16),
                      Text("1,2 Mil", style: AppTextStyles.cardSubtitle),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text("Descripción", style: AppTextStyles.primaryText),

                  const SizedBox(height: 8),

                  const Text(
                    "Especialistas en tacos árabes al trompo con receta tradicional. Pan artesanal, carne marinada y salsas caseras en cada servicio rápido y porciones generosas.",
                    style: AppTextStyles.secondaryText,
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Av. Reforma 123, Centro, Mérida, Yucatán\n+529991234567\n\$ MXN \$100 - \$200 por persona",
                    style: AppTextStyles.secondaryText,
                  ),

                  const SizedBox(height: 24),

                  // Botones
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
                                'Excelente producto',
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
                          'Me gustó mucho la calidad y el diseño. Cumple con lo prometido y lo recomiendo.',
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
