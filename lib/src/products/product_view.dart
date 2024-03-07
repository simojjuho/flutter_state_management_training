import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/states/product_state.dart';
import 'package:state_training/src/products/assets/product_form/product_form.dart';
import 'package:state_training/src/products/assets/product_tile.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    var products = productState.products;

    return Column(
      children: [
        const ProductForm(),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 5,
            children: products
                .map(
                  (e) => ProductTile(product: e),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
