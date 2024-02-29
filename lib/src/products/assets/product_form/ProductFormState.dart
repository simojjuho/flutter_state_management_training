import "dart:ffi";

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_training/src/core_entities/product.dart";
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

  @override
  Widget build(BuildContext context) {
    var productState = context.watch<ProductState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
          ),
          TextFormField(
            controller: priceController,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: descriptionController,
          ),
          ElevatedButton(
            onPressed: () {
              productState.addProduct(
                nameController.text,
                descriptionController.text,
                int.parse(priceController.text),
              );
            },
            child: const Text("Send"),
          )
        ],
      ),
    );
  }
}
