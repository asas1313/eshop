import 'dart:io';

import 'package:eshop/src/core/utils/constants.dart';
import 'package:path_provider/path_provider.dart';

class CacheData {
  static String fileName = kLocalCacheFileName;

  Future<String?> getProduct() async {
    var chacheDir = await getTemporaryDirectory();

    if (await File(chacheDir.path + '/' + fileName).exists()) {
      final jsonData = File(chacheDir.path + '/' + fileName).readAsStringSync();
      return jsonData;
    } else {
      return null;
    }
  }

  Future<String?> getAllProducts() async {
    var chacheDir = await getTemporaryDirectory();

    if (await File(chacheDir.path + '/' + fileName).exists()) {
      final jsonData = File(chacheDir.path + '/' + fileName).readAsStringSync();
      return jsonData;
    } else {
      return null;
    }
  }

  static Future<void> save(String data) async {
    var tempDir = await getTemporaryDirectory();
    File file = File(tempDir.path + "/" + fileName);
    file.writeAsString(data, flush: true, mode: FileMode.write);
  }
}
