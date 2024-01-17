import 'package:assesment_app/core/router/route_paths.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/screens/pets_main_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homeScreen:
        return MaterialPageRoute(builder: (_) => const PetsMainView(),);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
