import 'dart:io';

import 'package:basic_ecommerce_sqflite/resource/colorManager.dart';
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
                child: ListView.builder(
                  itemCount: value.productList.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: value.productList[index].productPic != null
                            ? Image.file(
                                File(value.productList[index].productPic!),
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
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
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