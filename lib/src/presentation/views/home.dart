import 'package:eshop/src/presentation/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product list application')),
      body: const ProductsListWidget(),
    );
  }
}
