import 'package:crypto_app/config/router/main_shell.dart';
import 'package:crypto_app/config/router/route_paths.dart';
import 'package:crypto_app/features/all_crypto/presentation/screen/all_crypto_screen.dart';
import 'package:crypto_app/features/detail/presentation/screen/detail_screen.dart';
import 'package:crypto_app/features/home/presentation/screen/home_screen.dart';
import 'package:crypto_app/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.home,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: RoutePaths.allCryptos,
      builder: (context, state) => const AllCryptoScreen(),
    ),

    ShellRoute(
      builder: (context, state, child) {
        return RootScreen(child: child);
      },
      routes: [
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: RoutePaths.crypto,
          builder: (context, state) {
            final int start = state.extra as int;
            return DetailScreen(start: start);
          },
        ),
        GoRoute(
          path: RoutePaths.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
  // errorBuilder: (context, state) => const NotFoundScreen(),
);
