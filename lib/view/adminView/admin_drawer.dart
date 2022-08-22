import 'package:basic_ecommerce_sqflite/resource/colorManager.dart';
import 'package:basic_ecommerce_sqflite/utils/routes/route_name.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          color: ColorManager.primaryColor,
          height: 200,
          child: const Center(
              child: Text(
            "Welcome to Admin View",
            style: TextStyle(fontSize: 20),
          )),
        ),
        ListTile(
          title: const Text("All Products"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Add Product"),
          onTap: () {
            Navigator.pushNamed(context, Routes.addProduct);
          },
        ),
      ]),
    );
  }
}
