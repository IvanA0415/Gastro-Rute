import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/favorites/favorites_screen.dart';
import 'features/map/map_screen.dart';
import 'features/main/main_screen.dart';
import 'features/profile/profile_screen.dart';
import 'core/constants/app_icons.dart';
import 'core/constants/app_sizes.dart';
import 'core/theme/app_colors.dart';
import 'features/detail/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

//  CONFIGURACIÓN DE GO_ROUTER
final _router = GoRouter(
  initialLocation: '/main',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldConBarra(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/main',
              builder: (context, state) => const MainScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/map',
              builder: (context, state) => const MapaScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/detail',
              builder: (context, state) => const DetailScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Mi App', routerConfig: _router);
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
