import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_training/src/products/presentation/state/category_state.dart";
import "package:state_training/src/products/presentation/state/product_state.dart";
import "package:state_training/src/products/presentation/widgets/product_form/text_field_with_padding.dart";
import "package:state_training/src/products/services/product_service.dart";
import "package:state_training/src/shared/presentation/widgets/messages/error_snackbar.dart";

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final service = ProductService();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    var categoryState = context.watch<CategoryState>();
    var categories = categoryState.categories;
    var category = categoryState.selectedCategory;

    void addNewProduct(ProductState productState) async {
      try {
        var categoryId =
            categories.firstWhere((cat) => cat.name == category).id;
        var product = await service.addNewProduct(
          nameController.text,
          int.parse(priceController.text),
          descriptionController.text,
          categoryId,
        );
        productState.addProduct(product);
        clear();
      } on DioException catch (e) {
        ErrorSnackbar.set(e.message!, context);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Product title:'),
          TextFieldWithPadding(
            controller: nameController,
            inputType: TextInputType.text,
          ),
          const Text('Price:'),
          TextFieldWithPadding(
            controller: priceController,
            inputType: TextInputType.number,
          ),
          const Text('Description'),
          TextFieldWithPadding(
            controller: descriptionController,
            inputType: TextInputType.text,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: categoryState.selectedCategory,
              items: categories.map<DropdownMenuItem<String>>((category) {
                return DropdownMenuItem<String>(
                  value: category.name,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                categoryState.setSelectedCategory(value!);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                addNewProduct(productState);
              },
              child: const Text("Send"),
            ),
          )
        ],
      ),
    );
  }
}
