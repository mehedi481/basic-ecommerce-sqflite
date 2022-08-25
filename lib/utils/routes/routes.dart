import 'package:basic_ecommerce_sqflite/model/product_model.dart';
import 'package:basic_ecommerce_sqflite/resource/app_strings.dart';
import 'package:basic_ecommerce_sqflite/utils/routes/route_name.dart';
import 'package:basic_ecommerce_sqflite/view/adminView/components/add_product.dart';
import 'package:basic_ecommerce_sqflite/view/adminView/components/all_products.dart';
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
      case Routes.addProduct:
        return MaterialPageRoute(
          builder: (_) => AddProduct(
            isUpdate: false, updateProductModel: ProductModel(),
          ),
        );
      case Routes.allProducts:
        return MaterialPageRoute(builder: (_) => AllProducts());
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
