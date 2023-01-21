import 'package:app_images/presentation/presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

class AppRouter {
  const AppRouter._();
  static GoRouter router(
    BuildContext context,
  ) =>
      GoRouter(
        errorBuilder: (BuildContext context, GoRouterState state) => Scaffold(
          body: Center(
            child: Text('No route defined for ${state.name}'),
          ),
        ),
        debugLogDiagnostics: kDebugMode,
        initialLocation: AppRoutes.nameLogin,
        routes: [
          GoRoute(
            name: AppRoutes.nameLogin,
            path: AppRoutes.routeLogin,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            name: AppRoutes.nameHome,
            path: AppRoutes.routeHome,
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      );
}
