import 'package:eshop/src/data/models/product.dart';
import 'package:eshop/src/data/repositories/product_repository.dart';
import 'package:eshop/src/domain/entities/product_entity.dart';

class ProductRepositoryDom {
  final repository = ProductRepository();

  Future<ProductEntity> getProduct(String productCode) async {
    Product _product = await repository.getProduct(productCode);
    var _productEntity = ProductEntity(
      code: _product.code,
      name: _product.name,
      description: _product.description,
      productUrl: _product.productUrl,
    );
    return _productEntity;
  }

  Future<List<ProductEntity>> getAllProducts() async {
    List<Product> _allProducts = await repository.getAllProducts();
    var _allProductsEntity = _allProducts
        .map((e) => ProductEntity(
              code: e.code,
              name: e.name,
              description: e.description,
              productUrl: e.productUrl,
            ))
        .toList();
    return _allProductsEntity;
  }
}
