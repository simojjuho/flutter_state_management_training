import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_training/src/products/state/product_state.dart";
import "package:state_training/src/products/services/product_service.dart";

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final service = ProductService();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    categoryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();
    void setSnackbar(SnackBar snackBar) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void addNewProduct(ProductState productState) async {
      try {
        var product = await service.addNewProduct(
          nameController.text,
          int.parse(priceController.text),
          descriptionController.text,
        );
        productState.addProduct(product);
        clear();
      } on DioException catch (e) {
        final snackBar = SnackBar(
          content: Text(e.response.toString()),
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
        );
        setSnackbar(snackBar);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Product title:'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
            ),
          ),
          const Text('Price:'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
            ),
          ),
          const Text('Description'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descriptionController,
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
