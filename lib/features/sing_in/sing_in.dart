import 'package:flutter/material.dart';
import 'package:gastro_rute/core/constants/app_icons.dart';
import 'package:gastro_rute/core/constants/app_sizes.dart';
import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppColors.white para Background
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 60),

                // Logo de Gastro Rute
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.searchBackground, // Fondo gris claro
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "GR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // AppTextStyles.pageTitle para el nombre de la app
                Text("Gastro Rute", style: AppTextStyles.pageTitle),

                const SizedBox(height: 40),
                // AppTextStyles.section para "Crea una cuenta"
                Text("Inicia sesión", style: AppTextStyles.section),
                const SizedBox(height: 10),
                // AppTextStyles.secondaryText para el subtítulo
                Text(
                  "Ingresa tu correo electrónico\npara iniciar sesion en esta aplicación",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.secondaryText,
                ),

                const SizedBox(height: 30),

                // Input de correo con AppColors.border y AppTextStyles.input
                TextField(
                  style: AppTextStyles.input,
                  decoration: InputDecoration(
                    hintText: "correoelectrónico@dominio.com",
                    hintStyle: TextStyle(
                      color: AppColors.greyLight,
                    ), // Color específico para placeholder
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.black,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Botón Continuar usando AppSizes.continueButtonWidth/Height y AppColors.black
                SizedBox(
                  width: AppSizes.continueButtonWidth,
                  height: AppSizes.continueButtonHeight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Continuar",
                      style: AppTextStyles.buttonContinue,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Divisor "o" con AppColors.border
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.border)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("o", style: AppTextStyles.secondaryText),
                    ),
                    Expanded(child: Divider(color: AppColors.border)),
                  ],
                ),

                const SizedBox(height: 30),

                // Botones Sociales usando AppIcons.size
                _socialButton("Continuar con Google", Icons.g_mobiledata),
                const SizedBox(height: 15),
                _socialButton("Continuar con Apple", Icons.apple),

                const SizedBox(height: 40),

                // Términos y condiciones usando AppTextStyles.terms y termsHighlight
                Text.rich(
                  TextSpan(
                    text: "Al hacer clic en continuar, aceptas nuestros ",
                    style: AppTextStyles.terms,
                    children: [
                      TextSpan(
                        text: "Términos de servicio",
                        style: AppTextStyles.termsHighlight,
                      ),
                      const TextSpan(text: " y "),
                      TextSpan(
                        text: "Política de privacidad",
                        style: AppTextStyles.termsHighlight,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para botones sociales
  Widget _socialButton(String text, IconData icon) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: AppSizes.continueButtonWidth,
        height: AppSizes.continueButtonHeight,
        decoration: BoxDecoration(
          color: AppColors
              .searchBackground, // Usando fondo gris claro de tu paleta
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.black, size: AppIcons.size),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black, // O AppColors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
