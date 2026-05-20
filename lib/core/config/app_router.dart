import 'package:gastro_rute/core/models/restaurant_model.dart';
import 'package:go_router/go_router.dart';
import '../../features/favorites/favorites_screen.dart';
import '../../features/map/map_screen.dart';
import '../../features/main/main_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/detail/detail_screen.dart';
import '../../main.dart';

final router = GoRouter(
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

              builder: (context, state) {
                final restaurant = state.extra as RestaurantModel;

                return DetailScreen(restaurant: restaurant);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
