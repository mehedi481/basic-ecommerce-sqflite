import 'package:basic_ecommerce_sqflite/model/product_model.dart';
import 'package:basic_ecommerce_sqflite/resource/colorManager.dart';
import 'package:basic_ecommerce_sqflite/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _key = GlobalKey<FormState>();
  ProductModel _productModel = ProductModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: const Text("Add Product"),
      ),
      body: Column(
        children: [
          _addProductForm(),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: _addProduct,
              color: ColorManager.primaryColor,
              child: const Text(
                "Add Product",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addProduct() {
    var form = _key.currentState!;
    if (form.validate()) {
      form.save();

      context.read<ProductViewModel>().addProduct(_productModel);
      print(_productModel.toJson());
    }
  }

  Widget _addProductForm() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Product Name"),
              validator: (value) {
                return value!.isEmpty ? "* This field is required" : null;
              },
              onSaved: (value) {
                _productModel.productName = value;
              },
            ),
            TextFormField(
              maxLines: 5,
              decoration:
                  const InputDecoration(labelText: "Product Description"),
              validator: (value) {
                return value!.isEmpty ? "* This field is required" : null;
              },
              onSaved: (value) {
                _productModel.productDesc = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Product Price"),
              validator: (value) {
                return value!.isEmpty ? "* This field is required" : null;
              },
              onSaved: (value) {
                _productModel.productPrice = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 250,
              color: Colors.grey,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: FlutterLogo(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera,
                          size: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.photo,
                          size: 35,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
