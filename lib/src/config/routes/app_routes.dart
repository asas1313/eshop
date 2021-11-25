import 'package:eshop/src/presentation/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomeView());
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
