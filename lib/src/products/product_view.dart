import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/controllers/product_controller.dart';
import 'package:state_training/src/product_state.dart';
import 'package:state_training/src/products/assets/product_form/ProductFormState.dart';

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
            print(snapshot.error);
            return const Text("Error!");
          } else {
            return Column(
              children: [
                const ProductForm(),
                ListView(
                  shrinkWrap: true,
                  children: products
                      .map((e) => ListTile(
                            title: Text(e.title),
                          ))
                      .toList(),
                )
              ],
            );
          }
        });
  }
}
