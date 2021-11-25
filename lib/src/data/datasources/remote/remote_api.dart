import 'package:eshop/src/core/utils/constants.dart';
import 'package:eshop/src/data/models/pagination.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class RemoteApi {
  var headers = {
    "x-rapidapi-host": kRapidApiHost,
    "x-rapidapi-key": kRpidApiKey
  };

  Future<String> getProduct(String productCode) async {
    var response = await http.get(
        Uri.parse(
            '$kApiUrl/detail?lang=en&productcode=$productCode&country=Europe'),
        headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<String> getAllProducts() async {
    var response = await http.get(
        Uri.parse(
            '$kApiUrl/list?country=Europe&lang=en&currentpage=${GetIt.I.get<Pagination>().currentPage}&pagesize=${GetIt.I.get<Pagination>().pageSize}'),
        headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load product');
    }
  }
}
