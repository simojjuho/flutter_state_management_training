import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/product_state.dart';
import 'package:state_training/src/products/assets/product_form/product_form_state.dart';
import 'package:state_training/src/products/assets/product_tile.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    var products = productState.products;
    return FutureBuilder(
        future: productState.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.stackTrace.toString());
          } else {
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
        });
  }
}
