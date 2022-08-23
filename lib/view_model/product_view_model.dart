import 'package:basic_ecommerce_sqflite/data/database/database_helper.dart';
import 'package:basic_ecommerce_sqflite/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductViewModel with ChangeNotifier {
  List<ProductModel> _productList = [];
  bool _isLoading = false;
  List<ProductModel> get productList => _productList;
  bool get isLoading => _isLoading;
  late DatabaseHelper dbHelper;

  // void addProduct(ProductModel productModel) {
  //   _productList.add(productModel);
  //   notifyListeners();
  // }
  
  void init() async {
    dbHelper = DatabaseHelper.instance;
    loading(true);
    // await Future.delayed(const Duration(seconds: 2));
    _productList = await getProductFromDB();
    notifyListeners();
    loading(false);
  }

  void loading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<List<ProductModel>> getProductFromDB() async {
    List<Map<String, dynamic>> products =
        await dbHelper.fetchData(ProductModel.tableName);

    return products.isEmpty
        ? []
        : products.map((e) => ProductModel.fromMap(e)).toList();
  }

  void insertData(ProductModel productModel) async {
    await dbHelper.insertData(ProductModel.tableName, productModel);
    loading(true);
    _productList = await getProductFromDB();
    notifyListeners();
    loading(false);
  }
}
