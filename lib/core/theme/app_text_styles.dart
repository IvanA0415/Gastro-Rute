import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // 🔹 Título página
  static const TextStyle pageTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  // 🔹 Sección
  static const TextStyle section = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  // 🔹 Búsqueda
  static const TextStyle search = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  // 🔹 Filtros
  static TextStyle filters = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black.withOpacity(0.9),
  );

  // 🔹 Card título
  static const TextStyle cardTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  // 🔹 Card subtexto
  static TextStyle cardSubtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.5),
  );

  static const TextStyle primaryText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.darkText,
  );

  static const TextStyle secondaryText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static const TextStyle commentsHeader = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w200,
    fontStyle: FontStyle.italic,
    color: AppColors.grey,
  );

  static TextStyle commentsCount = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.9),
  );

  static const TextStyle buttonContinue = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle input = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  static const TextStyle terms = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  static const TextStyle termsHighlight = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static const TextStyle detailButton = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}
