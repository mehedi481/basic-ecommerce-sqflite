class ProductModel {
  static const String tableName = 'products';
  static const String colId = 'id';
  static const String colProductName = 'productName';
  static const String colProductDesc = 'productDesc';
  static const String colProductPrice = 'productPrice';
  static const String colProductPic = 'productPic';
  int? id;
  String? productName;
  String? productDesc;
  String? productPrice;
  String? productPic;

  ProductModel({
    this.id,
    this.productName,
    this.productDesc,
    this.productPrice,
    this.productPic,
  });

  ProductModel.fromMap(Map<String, dynamic> json) {
    id = json[colId];
    productName = json[colProductName];
    productDesc = json[colProductDesc];
    productPrice = json[colProductPrice];
    productPic = json[colProductPic];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      colProductName: productName,
      colProductDesc: productDesc,
      colProductPrice: productPrice,
      colProductPic: productPic,
    };
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}
