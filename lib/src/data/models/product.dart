import 'dart:convert';

ProductsData productsDataFromJson(String str) =>
    ProductsData.fromJson(jsonDecode(str));

class ProductsData {
  int numberOfPages;
  int totalNumberOfResults;
  List<Product> data;

  ProductsData({
    required this.numberOfPages,
    required this.totalNumberOfResults,
    required this.data,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
      numberOfPages: json['numberOfPages'],
      totalNumberOfResults: json['totalNumberOfResults'],
      data: List<Product>.from(json['results'].map((x) => Product.fromMap(x))));
}

class Product {
  String code;
  String name;
  String description;
  String productUrl;

  Product(
      {required this.code,
      required this.name,
      this.description = '',
      this.productUrl = ''});

  Product.fromMap(Map<String, dynamic> json)
      : code = json['code'],
        name = json['name'],
        description = json['description'] ?? '',
        productUrl = json['productUrl'] ?? '';

  @override
  String toString() {
    return '{code: $code, name: $name, description: $description, productUrl: $productUrl}';
  }
}
