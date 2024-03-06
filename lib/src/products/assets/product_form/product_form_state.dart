import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_training/src/controllers/product_controller.dart";
import "package:state_training/src/core_entities/product_create_dto.dart";
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
  final controller = ProductController();

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
    void setSnackbar(SnackBar snackBar) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void addNewProduct(ProductState productState) async {
      try {
        var newProduct = ProductCreateDto(
            title: nameController.text,
            price: int.parse(priceController.text),
            description: descriptionController.text,
            categoryId: 1,
            images: ["http://images.com/first-pic"]);
        var product = await controller.addNewProduct(newProduct);
        productState.addProduct(product);
        clear();
      } on DioException catch (e) {
        final snackBar = SnackBar(
          content: Text(e.toString()),
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
