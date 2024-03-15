import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/domain/core_entities/product.dart';
import 'package:state_training/src/products/presentation/state/product_state.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final bool isAdmin;

  const ProductTile({required this.product, required this.isAdmin, super.key});

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    Widget getTileButtons() {
      var flex = Flex(
        direction: Axis.horizontal,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.shopping_cart),
          )
        ],
      );
      if (isAdmin) {
        flex.children.addAll([
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
          FloatingActionButton(
            onPressed: () => productState.removeProduct(product.id),
            child: const Icon(Icons.remove),
          )
        ]);
      }
      return flex;
    }

    return GridTile(
      footer: Row(
        children: [getTileButtons()],
      ),
      child: Text('${product.title}: ${product.id}'),
    );
  }
}
