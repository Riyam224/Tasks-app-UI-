import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/routing/app_routes.dart';
import 'package:notes/features/home/views/home_view.dart';
import 'package:notes/features/home/widgets/add_new_note.dart';
import 'package:notes/features/splash/views/splash_view.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('404 Not Found'))),
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/home',
        name: AppRoutes.home,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0); // slide from right
                  const end = Offset.zero;
                  final tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: Curves.easeInOut));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          );
        },
      ),

      GoRoute(
        path: AppRoutes.addNewNote,
        name: AppRoutes.addNewNote,
        builder: (context, state) => const AddNewNote(),
      ),
    ],
  );
}
