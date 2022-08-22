import 'package:basic_ecommerce_sqflite/resource/colorManager.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorManager.primaryColor,
          title: Text("Add Product")),
      body: Column(
        children: [Text("data")],
      ),
    );
  }
}
