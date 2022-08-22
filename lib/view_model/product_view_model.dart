import 'package:basic_ecommerce_sqflite/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductViewModel with ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  void addProduct(ProductModel productModel) {
    _productList.add(productModel);
    notifyListeners();
  }
}
