import 'package:flutter/material.dart';
import 'package:gastro_rute/core/providers/restaurant_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_icons.dart';
import 'core/theme/app_colors.dart';
import 'core/config/app_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RestaurantProvider())],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Mi App', routerConfig: router);
  }
}

class ScaffoldConBarra extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldConBarra({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        currentIndex: navigationShell.currentIndex,
        onTap: (int index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },

        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        selectedItemColor: AppColors.black.withOpacity(AppIcons.activeOpacity),
        unselectedItemColor: AppColors.black.withOpacity(
          AppIcons.inactiveOpacity,
        ),

        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navHome, size: AppIcons.size),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navMap, size: AppIcons.size),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navFavorites, size: AppIcons.size),
            label: "Favs",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.navProfile, size: AppIcons.size),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
