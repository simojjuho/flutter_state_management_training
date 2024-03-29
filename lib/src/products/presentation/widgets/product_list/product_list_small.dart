import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/domain/core_entities/product.dart';
import 'package:state_training/src/products/presentation/widgets/product_tile.dart';

import '../../../../users/presentation/state/user_state.dart';

class ProductListSmall extends StatelessWidget {
  const ProductListSmall({
    required this.visibleProducts,
    super.key,
  });
  final Iterable<Product> visibleProducts;

  @override
  Widget build(BuildContext context) {
    var isAdmin = context.watch<UserState>().isAdmin;
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        shrinkWrap: true,
        crossAxisCount: 1,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 2.5,
        children: visibleProducts
            .map(
              (e) => ProductTile(
                product: e,
                isAdmin: isAdmin,
              ),
            )
            .toList(),
      ),
    );
  }
}
