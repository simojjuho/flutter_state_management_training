import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/product_state.dart';
import 'package:state_training/src/products/assets/product_form/product_form_state.dart';

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
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text("Error!");
          } else {
            return Column(
              children: [
                const ProductForm(),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: products
                        .map((e) => ListTile(
                              title: Text(e.title),
                            ))
                        .toList(),
                  ),
                )
              ],
            );
          }
        });
  }
}
