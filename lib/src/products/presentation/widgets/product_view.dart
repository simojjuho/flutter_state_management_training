import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/state/category_state.dart';
import 'package:state_training/src/products/state/product_state.dart';
import 'package:state_training/src/products/presentation/widgets/product_form/product_form.dart';
import 'package:state_training/src/products/presentation/widgets/product_tile.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    var products = productState.products;
    var categoryState = context.watch<CategoryState>();
    var categories = categoryState.categories;

    return Column(
      children: [
        const ProductForm(),
        Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categories
                .map((e) =>
                    FloatingActionButton(onPressed: () {}, child: Text(e.name)))
                .toList()),
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
