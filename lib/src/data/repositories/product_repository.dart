import 'package:eshop/src/data/datasources/remote/remote_api.dart';
import 'package:eshop/src/data/models/product.dart';

class ProductRepository {
  final datasource = RemoteApi();

  ProductRepository();

  Future<Product> getProduct() async {
    return await datasource.getProduct();
  }

  Future<List<Product>> getAllProducts() async {
    return await datasource.getAllProducts();
  }
}
