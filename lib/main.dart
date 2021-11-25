import 'package:eshop/src/config/routes/app_routes.dart';
import 'package:eshop/src/core/utils/constants.dart';
import 'package:eshop/src/data/models/pagination.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<Pagination>(Pagination());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
