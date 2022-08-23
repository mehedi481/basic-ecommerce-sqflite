import 'package:basic_ecommerce_sqflite/data/database/database_helper.dart';
import 'package:basic_ecommerce_sqflite/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductViewModel with ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  late DatabaseHelper dbHelper;

  // void addProduct(ProductModel productModel) {
  //   _productList.add(productModel);
  //   notifyListeners();
  // }
  void init() async {
    dbHelper = DatabaseHelper.instance;
    _productList = await getProductFromDB();
    notifyListeners();
  }

  Future<List<ProductModel>> getProductFromDB() async {
    List<Map<String, dynamic>> products =
        await dbHelper.fetchData(ProductModel.tableName);

    return products.isEmpty
        ? []
        : products.map((e) => ProductModel.fromMap(e)).toList();
  }

  void insertData(ProductModel productModel) async{
    await dbHelper.insertData(ProductModel.tableName, productModel);
    _productList = await getProductFromDB();
    notifyListeners();
  }
}
