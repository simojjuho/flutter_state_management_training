import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/presentation/state/category_state.dart';
import 'package:state_training/src/products/presentation/state/product_state.dart';
import 'package:state_training/src/products/presentation/widgets/product_form/product_form.dart';
import 'package:state_training/src/products/presentation/widgets/product_tile.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  var chosenCategory = 'Show all';
  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    var products = productState.products;
    var categoryState = context.watch<CategoryState>();
    var categoryNames = categoryState.categoryNames;
    var visibleProducts = products.where((product) {
      return chosenCategory == 'Show all'
          ? true
          : product.category.name == chosenCategory;
    });

    return Column(
      children: [
        const ProductForm(),
        Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: categoryNames
                .map((e) => FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        chosenCategory = e;
                      });
                    },
                    child: Text(e)))
                .toList()),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: visibleProducts
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
