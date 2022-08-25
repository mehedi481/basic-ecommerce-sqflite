import 'dart:io';

import 'package:basic_ecommerce_sqflite/resource/colorManager.dart';
import 'package:basic_ecommerce_sqflite/utils/routes/route_name.dart';
import 'package:basic_ecommerce_sqflite/utils/utils.dart';
import 'package:basic_ecommerce_sqflite/view/adminView/components/add_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/product_view_model.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product List"),
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
      ),
      body: Consumer<ProductViewModel>(builder: (context, value, _) {
        return value.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: value.productList.isEmpty
                    ? const Center(
                        child: Text("No Product available"),
                      )
                    : ListView.builder(
                        itemCount: value.productList.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: SizedBox(
                              height: 50,
                              width: 50,
                              child: value.productList[index].productPic != null
                                  ? Image.file(
                                      File(
                                          value.productList[index].productPic!),
                                      fit: BoxFit.contain,
                                    )
                                  : const SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: FlutterLogo(),
                                    ),
                            ),
                            title: Text(
                              value.productList[index].productName!.toString(),
                            ),
                            subtitle: Text(
                              "\$ ${value.productList[index].productPrice!.toString()}",
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // This is for update product
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddProduct(
                                          isUpdate: true,
                                          updateProductModel:
                                              value.productList[index],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    value.deleteData(value.productList[index]);
                                    Utils.showMessage(
                                        message: "Delete Successful",
                                        bgColor: Colors.green);
                                    print(
                                        value.productList[index].productPrice);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
              );
      }),
    );
  }
}
