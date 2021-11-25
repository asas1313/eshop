import 'dart:convert';
import 'dart:io';

import 'package:eshop/src/data/datasources/local/cache_data.dart';
import 'package:eshop/src/data/datasources/remote/remote_api.dart';
import 'package:eshop/src/data/models/pagination.dart';
import 'package:eshop/src/data/models/product.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

class ProductRepository {
  final remoteDataSource = RemoteApi();
  final localDataSource = CacheData();

  ProductRepository();

  Future<Product> getProduct(String productCode) async {
    String response = await remoteDataSource.getProduct(productCode);

    final parsed = json.decode(response);
    return Product.fromMap(parsed['product']);
  }

  Future<List<Product>> getAllProducts() async {
    var cacheDir = await getTemporaryDirectory();
    var fileName = CacheData.fileName;

    String? response;

    if (await File(cacheDir.path + '/' + fileName).exists()) {
      response = await localDataSource.getAllProducts();
    }

    response ??= await remoteDataSource.getAllProducts();

    final parsed = json.decode(response)['results'] as List;
    var pagination = Pagination.fromMap(json.decode(response)['pagination']);
    GetIt.I.get<Pagination>().copy(pagination);
    CacheData.save(response);
    return parsed.map((product) => Product.fromMap(product)).toList();
  }
}
