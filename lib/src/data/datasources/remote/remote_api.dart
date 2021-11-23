import 'dart:convert';

import 'package:eshop/src/data/models/pagination.dart';
import 'package:eshop/src/data/models/product.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class RemoteApi {
  Future<Product> getProduct() async {
    var response = await http.get(
        Uri.parse(
            'https://apidojo-hm-hennes-mauritz-v1.p.rapidapi.com/products/detail?lang=en&productcode=0839915011&country=asia2'),
        headers: {
          "x-rapidapi-host": "apidojo-hm-hennes-mauritz-v1.p.rapidapi.com",
          "x-rapidapi-key": "0cd414bf5dmsh5a606a20ead3701p11df65jsne269ed22efbc"
        });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return Product.fromMap(parsed['product']);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<Product>> getAllProducts() async {
    var response = await http.get(
        Uri.parse(
            'https://apidojo-hm-hennes-mauritz-v1.p.rapidapi.com/products/list?country=Europe&lang=en&currentpage=${GetIt.I.get<Pagination>().currentPage}&pagesize=${GetIt.I.get<Pagination>().pageSize}&categories=men_all&concepts=H%26M%20MAN'),
        headers: {
          "x-rapidapi-host": "apidojo-hm-hennes-mauritz-v1.p.rapidapi.com",
          "x-rapidapi-key": "0cd414bf5dmsh5a606a20ead3701p11df65jsne269ed22efbc"
        });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)['results'] as List;
      var pagination =
          Pagination.fromMap(json.decode(response.body)['pagination']);
      GetIt.I.get<Pagination>().copy(pagination);
      return parsed.map((product) => Product.fromMap(product)).toList();
    } else {
      throw Exception('Failed to load product');
    }
  }
}
