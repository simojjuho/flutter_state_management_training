import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/presentation/state/category_state.dart';

class ChooseCategoryMedium extends StatelessWidget {
  const ChooseCategoryMedium({
    required this.setCategory,
    super.key,
  });
  final void Function(String) setCategory;

  @override
  Widget build(BuildContext context) {
    var categoryNames = context.watch<CategoryState>().categoryNames;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categoryNames
              .map((e) => FloatingActionButton(
                  onPressed: () {
                    setCategory(e);
                  },
                  child: Text(e)))
              .toList()),
    );
  }
}
