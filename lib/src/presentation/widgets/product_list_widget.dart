import 'package:eshop/src/data/models/pagination.dart';
import 'package:eshop/src/domain/entities/product_entity.dart';
import 'package:eshop/src/presentation/blocs/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsListWidget> {
  List<ProductEntity> allProducts = [];
  var productBloc = ProductBloc();

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getProductData({bool isRefresh = false}) async {
    List<ProductEntity> result = [];
    final pagination = GetIt.I.get<Pagination>();

    if (isRefresh) {
      pagination.currentPage = 1;
    } else if (pagination.currentPage >= pagination.numberOfPages) {
      refreshController.loadNoData();
      return false;
    }
    result = await productBloc.getAllProducts();

    if (isRefresh) {
      allProducts = result;
    } else {
      allProducts.addAll(result);
    }
    pagination.currentPage++;

    setState(() {});

    return true;
  }

  onRefresh() async {
    final result = await getProductData(isRefresh: true);
    if (result) {
      refreshController.refreshCompleted();
    } else {
      refreshController.refreshFailed();
    }
  }

  onLoading() async {
    final result = await getProductData();
    if (result) {
      refreshController.loadComplete();
    } else {
      refreshController.loadFailed();
    }
  }

  onTap(ProductEntity productEntity) {
    productBloc.showProduct(context, productEntity.code);
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final product = allProducts[index];
          return ListTile(
            title: Text(
              product.code,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(product.name),
            onTap: () => onTap(product),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: allProducts.length,
      ),
    );
  }
}
