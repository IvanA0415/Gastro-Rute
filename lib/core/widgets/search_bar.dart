import 'package:flutter/material.dart';

import 'package:gastro_rute/core/constants/app_icons.dart';

import 'package:gastro_rute/core/theme/app_text_styles.dart';
import 'package:gastro_rute/core/theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;

  final Function(String)? onChanged;

  final String hintText;

  const CustomSearchBar({
    super.key,

    this.controller,

    this.onChanged,

    this.hintText = "Buscar restaurantes",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),

      decoration: BoxDecoration(
        color: AppColors.searchBackground,

        borderRadius: BorderRadius.circular(30),

        border: Border.all(color: AppColors.border),
      ),

      child: TextField(
        controller: controller,

        onChanged: onChanged,

        style: AppTextStyles.search,

        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: AppTextStyles.search,

          icon: Icon(
            AppIcons.search,

            color: AppColors.black,

            size: AppIcons.size,
          ),

          suffixIcon: Icon(
            Icons.edit_outlined,

            color: AppColors.black,

            size: 20,
          ),

          border: InputBorder.none,
        ),
      ),
    );
  }
}
