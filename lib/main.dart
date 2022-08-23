import 'package:basic_ecommerce_sqflite/utils/routes/route_name.dart';
import 'package:basic_ecommerce_sqflite/utils/routes/routes.dart';
import 'package:basic_ecommerce_sqflite/view/home_page.dart';
import 'package:basic_ecommerce_sqflite/view/login_page.dart';
import 'package:basic_ecommerce_sqflite/view_model/auth.dart';
import 'package:basic_ecommerce_sqflite/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()..init()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // make splash screen for checking first time app open isAdmin or not
        initialRoute: Routes.login,
        onGenerateRoute: RouteGenerator.getRoute,
        home: const LoginPage(),
      ),
    );
  }
}
