import 'package:flutter/material.dart';
import 'package:gastro_rute/core/constants/app_icons.dart';
import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';

class CustomFilterButtons extends StatelessWidget {
  const CustomFilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
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
