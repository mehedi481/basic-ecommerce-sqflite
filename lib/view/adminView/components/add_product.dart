import 'dart:io';

import 'package:basic_ecommerce_sqflite/model/product_model.dart';
import 'package:basic_ecommerce_sqflite/resource/colorManager.dart';
import 'package:basic_ecommerce_sqflite/utils/utils.dart';
import 'package:basic_ecommerce_sqflite/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  AddProduct(
      {Key? key, required this.isUpdate, required this.updateProductModel})
      : super(key: key);
  bool isUpdate = false;
  final ProductModel updateProductModel;
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _key = GlobalKey<FormState>();
  late ProductModel _productModel;
  final productNameController = TextEditingController();
  final productDesController = TextEditingController();
  final productPriceController = TextEditingController();
  XFile? image;

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      _productModel = widget.updateProductModel;
      productNameController.text = _productModel.productName!;
      productDesController.text = _productModel.productDesc!;
      productPriceController.text = _productModel.productPrice!;
      _productModel.productPic = _productModel.productPic;
    } else {
      _productModel = ProductModel();
    }
    print("isUpdate ${widget.isUpdate}");
    print("init ${_productModel.id}");
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final String imageTemp = image.path;
      setState(() {
        _productModel.productPic = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Faild to pick an Image/Photo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: widget.isUpdate
            ? const Text("Update Product")
            : const Text("Add Product"),
      ),
      body: ListView(
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
              child: Text(
                widget.isUpdate ? "Update Product" : "Add Product",
                style: const TextStyle(color: Colors.white),
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

      if (_productModel.id == null) {
        context.read<ProductViewModel>().insertData(_productModel);
        print(_productModel.toJson());
        form.reset();
        Navigator.pop(context);
        Navigator.of(context).pop();
        Utils.showMessage(
          message: "Successfully Product Added",
          bgColor: Colors.green,
        );
      } else {
        context.read<ProductViewModel>().updateData(_productModel);
        productNameController.clear();
        productDesController.clear();
        productPriceController.clear();
        _productModel.id == null;
        Navigator.pop(context);
        Utils.showMessage(
          message: "Successfully Product Updated",
          bgColor: Colors.green,
        );
        print(_productModel.toJson());
      }
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
              controller: productNameController,
              decoration: const InputDecoration(labelText: "Product Name"),
              validator: (value) {
                return value!.isEmpty ? "* This field is required" : null;
              },
              onSaved: (value) {
                _productModel.productName = value;
              },
            ),
            TextFormField(
              controller: productDesController,
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
              controller: productPriceController,
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
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: _productModel.productPic != null
                        ? Image.file(File(_productModel.productPic!))
                        : const FlutterLogo(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await pickImage(ImageSource.camera);
                        },
                        icon: const Icon(
                          Icons.camera,
                          size: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        onPressed: () async {
                          await pickImage(ImageSource.gallery);
                        },
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
