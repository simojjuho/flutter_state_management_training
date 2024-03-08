import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/shared/presentation/widgets/home_view.dart';
import 'package:state_training/src/products/state/product_state.dart';

class MainLoadingScreen extends StatelessWidget {
  const MainLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productState = context.watch<ProductState>();
    Future<bool> initializeProducts() async {
      return productState.products.isNotEmpty;
    }

    return Scaffold(
      body: FutureBuilder(
          future: initializeProducts(),
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(snapshot.stackTrace.toString());
            } else {
              return const HomeView();
            }
          }),
    );
  }
}
