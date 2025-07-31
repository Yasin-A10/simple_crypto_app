import 'package:crypto_app/config/router/main_shell.dart';
import 'package:crypto_app/config/router/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final location = state.uri.path;
        int initialIndex;
        switch (location) {
          case RoutePaths.profile:
            initialIndex = 1;
            break;
          case RoutePaths.crypto:
            initialIndex = 2;
            break;
          case RoutePaths.home:
          default:
            initialIndex = 0;
        }
        return MainShell(initialIndex: initialIndex);
      },
      routes: [
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) => const SizedBox(),
        ),
        GoRoute(
          path: RoutePaths.profile,
          builder: (context, state) => const SizedBox(),
        ),
        GoRoute(
          path: RoutePaths.crypto,
          builder: (context, state) => const SizedBox(),
        ),
      ],
    ),
  ],
  // errorBuilder: (context, state) => const NotFoundScreen(),
);
