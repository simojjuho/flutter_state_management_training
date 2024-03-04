import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_training/src/product_state.dart";

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

  void addNewProduct(ProductState productState) {
    productState.addProduct(
      nameController.text,
      descriptionController.text,
      int.parse(priceController.text),
    );
    clear();
  }

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();

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
