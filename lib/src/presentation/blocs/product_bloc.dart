import 'package:eshop/src/domain/entities/product_entity.dart';
import 'package:eshop/src/domain/repositories/product_repository_dom.dart';
import 'package:eshop/src/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductBloc {
  final repositoryDom = ProductRepositoryDom();

  Future<ProductEntity> getProduct(String productCode) async {
    return await repositoryDom.getProduct(productCode);
  }

  Future<List<ProductEntity>> getAllProducts() async {
    return await repositoryDom.getAllProducts();
  }

  Future<void> showProduct(BuildContext context, String productCode) async {
    ProductEntity product = await getProduct(productCode.substring(0, 7) +
        productCode.substring(productCode.length -
            3)); //Product codes in the list are constructed

    return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Product information'),
          content: Center(
            child: ProductWidget(product: product),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
