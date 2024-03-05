import 'package:flutter/material.dart';
import 'package:state_training/src/core_entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Text(product.description),
      child: Text(product.title),
    );
  }
}
