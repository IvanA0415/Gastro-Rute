import 'package:flutter/material.dart';
// Carpeta constans
import 'package:gastro_rute/core/constants/app_sizes.dart';

// Carpeta theme
import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              // Encabezado
              Center(
                child: Text("Hola, usuario", style: AppTextStyles.pageTitle),
              ),
              const SizedBox(height: 30),
              // Foto de Perfil
              Center(
                child: Container(
                  width: AppSizes.profileImageWidth,
                  height: AppSizes.profileImageHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border, width: 2),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYLwaG2f_AV5tBwU2t_NbHKbWp8Zq-OKJktw&s',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Caja de Descripción
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Descripción", style: AppTextStyles.section),
                      const SizedBox(height: 15),
                      Text(
                        "Apasionada por la gastronomía mexicana, siempre dispuesta a descubrir y probar nuevos menús. Tengo 21 años y soy de Mérida, Yucatán.",
                        style: AppTextStyles.secondaryText,
                      ),
                      const SizedBox(height: 180),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
