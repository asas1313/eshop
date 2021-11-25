import 'package:eshop/src/data/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing product model: ', () {
    test('- from json', () {
      var product = Product.fromMap({
        'code': "ABC",
        'name': "ABC",
        'description': "ABC",
        'productUrl': "ABC"
      });
      expect(product.toString(),
          '{code: ABC, name: ABC, description: ABC, productUrl: ABC}');
    });
  });
}
