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
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
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
            controller: myController,
          ),
          ElevatedButton(
            onPressed: () => productState.addProduct(myController.text),
            child: const Text("Send"),
          )
        ],
      ),
    );
  }
}
