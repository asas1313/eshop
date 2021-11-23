import 'package:eshop/src/domain/entities/product_entity.dart';
import 'package:eshop/src/domain/repositories/product_repository_dom.dart';

class ProductBloc {
  final repositoryDom = ProductRepositoryDom();

  Future<ProductEntity> getProduct() async {
    return await repositoryDom.getProduct();
  }

  Future<List<ProductEntity>> getAllProducts() async {
    return await repositoryDom.getAllProducts();
  }
}
