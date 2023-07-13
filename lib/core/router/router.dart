import 'package:flutter/material.dart';

import '../../views/home/home.dart';
import '../constants/routing_constants.dart';

class NavigationRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
  }) {
    return MaterialPageRoute(
        builder: (context) => viewToShow, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> routeArgs = settings.arguments != null
        ? settings.arguments as Map<String, dynamic>
        : {};

    switch (settings.name) {
      case NavigatorRoutes.home:
        return _getPageRoute(
          settings: settings,
          viewToShow: const MyHomePage(),
        );
      default:
        return _getPageRoute(
          settings: settings,
          viewToShow: const Scaffold(),
        );
    }
  }
}
