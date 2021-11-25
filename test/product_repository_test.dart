import 'dart:convert';

import 'package:eshop/src/core/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'product_repository_test.mocks.dart';

Future<Map<String, dynamic>> getAllProducts(http.Client client) async {
  final response = await client.get(
      Uri.parse(
          '$kApiUrl/list?country=Europe&lang=en&currentpage=0&pagesize=1'),
      headers: {
        "x-rapidapi-host": kRapidApiHost,
        "x-rapidapi-key": kRpidApiKey
      });

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

@GenerateMocks([http.Client])
void main() {
  group('- productRepository.getAllProducts()', () {
    test('return responce json if http call completes successfully', () async {
      final client = MockClient();

      when(client.get(
          Uri.parse(
              '$kApiUrl/list?country=Europe&lang=en&currentpage=0&pagesize=1'),
          headers: {
            "x-rapidapi-host": kRapidApiHost,
            "x-rapidapi-key": kRpidApiKey
          })).thenAnswer((_) async => http.Response('{"answer": "Ok"}', 200));

      expect(await getAllProducts(client), isA<Map<String, dynamic>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get(
          Uri.parse(
              '$kApiUrl/list?country=Europe&lang=en&currentpage=0&pagesize=1'),
          headers: {
            "x-rapidapi-host": kRapidApiHost,
            "x-rapidapi-key": kRpidApiKey
          })).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(getAllProducts(client), throwsException);
    });
  });
}
