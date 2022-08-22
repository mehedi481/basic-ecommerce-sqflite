import 'package:basic_ecommerce_sqflite/utils/app_strings.dart';
import 'package:basic_ecommerce_sqflite/utils/routes/route_name.dart';
import 'package:basic_ecommerce_sqflite/view/login_page.dart';
import 'package:flutter/material.dart';
import '../../view/home_page.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return undefainedRoute();
    }
  }

  static Route<dynamic> undefainedRoute() => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(AppStrings.invalidRoute),
          ),
        ),
      );
}
