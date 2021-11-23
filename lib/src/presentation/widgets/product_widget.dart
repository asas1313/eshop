import 'package:flutter/material.dart';

import 'package:eshop/src/domain/entities/product_entity.dart';

class ProductWidget extends StatefulWidget {
  final ProductEntity product;
  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  _ProductWidgetState();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xff97FFFF),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.code,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(widget.product.name),
          const SizedBox(height: 10),
          Text(widget.product.description),
          const SizedBox(height: 10),
          Text(widget.product.productUrl),
        ],
      ),
    );
  }
}
