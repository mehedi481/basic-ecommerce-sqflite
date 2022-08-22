import 'package:basic_ecommerce_sqflite/resource/colorManager.dart';
import 'package:basic_ecommerce_sqflite/utils/routes/route_name.dart';
import 'package:basic_ecommerce_sqflite/view/adminView/admin_drawer.dart';
import 'package:basic_ecommerce_sqflite/view/clientView/user_drawer.dart';
import 'package:basic_ecommerce_sqflite/view_model/auth.dart';
import 'package:basic_ecommerce_sqflite/view_model/product_view_model.dart';
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
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    print("isAdmin ${authProvider.isAdmin}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, Routes.login);
              },
              icon: const Icon(Icons.logout))
        ],
        title: Text(
          authProvider.isAdmin
              ? "E-commerce App Admin"
              : "E-commerce App Users",
        ),
        centerTitle: true,
      ),
      drawer: authProvider.isAdmin ? const AdminDrawer() : const UserDrawer(),
      body: Consumer<ProductViewModel>(builder: (context, value, _) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView.builder(
            itemCount: value.productList.length,
            itemBuilder: ((context, index) {
              return Text(value.productList[index].productName!);
            }),
          ),
        );
      }),
    );
  }
}
