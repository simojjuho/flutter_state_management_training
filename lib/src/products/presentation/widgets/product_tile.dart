import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/domain/core_entities/product.dart';
import 'package:state_training/src/products/state/product_state.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    return GridTile(
      footer: Row(
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
          FloatingActionButton(
            onPressed: () => productState.removeProduct(product.id),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      child: Text('${product.title}: ${product.id}'),
    );
  }
}
