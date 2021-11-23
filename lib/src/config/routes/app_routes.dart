import 'package:eshop/src/presentation/views/home.dart';
import 'package:eshop/src/presentation/views/loading_screen.dart';
import 'package:eshop/src/presentation/views/products_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomeView());
      case '/products':
        return MaterialPageRoute(
            builder: (context) => const ProductsListView());
      case '/loading':
        return MaterialPageRoute(builder: (context) => const LoadingScreen());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Page not found!'),
      ),
    );
  });
}
