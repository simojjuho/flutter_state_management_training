import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/presentation/state/category_state.dart';

class ChooseCategorySmall extends StatelessWidget {
  const ChooseCategorySmall({
    required this.setCategory,
    required this.chosenCategory,
    super.key,
  });
  final void Function(String) setCategory;
  final String chosenCategory;

  @override
  Widget build(BuildContext context) {
    var categoryNames = context.watch<CategoryState>().categoryNames;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: chosenCategory,
          onChanged: (String? value) {
            setCategory(value!);
          },
          items: categoryNames.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
        ));
  }
}
