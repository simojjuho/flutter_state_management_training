import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/presentation/state/category_state.dart';
import 'package:state_training/src/products/presentation/state/product_state.dart';
import 'package:state_training/src/products/presentation/widgets/product_form/add_product_form.dart';
import 'package:state_training/src/products/presentation/widgets/product_list/product_list_medium.dart';
import 'package:state_training/src/products/presentation/widgets/product_list/product_list_small.dart';

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

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Column(
          children: [
            const AddProductForm(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
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
            ),
            ProductListSmall(visibleProducts: visibleProducts)
          ],
        );
      } else {
        return Column(
          children: [
            const AddProductForm(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
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
            ),
            ProductListMedium(visibleProducts: visibleProducts)
          ],
        );
      }
    });
  }
}
