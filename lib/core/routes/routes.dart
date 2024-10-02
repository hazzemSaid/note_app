import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/features/home/presentation/view/screens/home_screen.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String notFound = '/not-found';
  static const String unknown = '/unknown';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
