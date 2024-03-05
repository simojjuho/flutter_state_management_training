import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/core_entities/product.dart';
import 'package:state_training/src/product_state.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    return GridTile(
      footer: FloatingActionButton(
        onPressed: () => productState.removeProduct(product.id),
        child: const Icon(Icons.remove),
      ),
      child: Text('${product.title}: ${product.id}'),
    );
  }
}
