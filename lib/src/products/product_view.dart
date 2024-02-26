import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/product_state.dart';
import 'package:state_training/src/products/assets/product_form/ProductFormState.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var products = context.watch<ProductState>().products;
    return Column(
      children: [
        const ProductForm(),
        ListView(
          shrinkWrap: true,
          children: products
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        )
      ],
    );
  }
}
