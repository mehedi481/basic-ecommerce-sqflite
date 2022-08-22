import 'package:basic_ecommerce_sqflite/utils/routes/route_name.dart';
import 'package:basic_ecommerce_sqflite/view_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    print("isAdmin ${provider.isAdmin}");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              icon: const Icon(Icons.logout))
        ],
        title: Text(
          provider.isAdmin ? "E-commerce App Admin" : "E-commerce App Users",
        ),
        centerTitle: true,
      ),
    );
  }
}
