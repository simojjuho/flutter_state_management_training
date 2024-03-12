import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/presentation/state/category_state.dart';
import 'package:state_training/src/shared/presentation/widgets/main_loading_screen.dart';
import 'package:state_training/src/shared/states/main_view_state.dart';
import 'package:state_training/src/products/presentation/state/product_state.dart';
import 'package:state_training/src/users/state/user_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductState>(create: (_) => ProductState()),
        ChangeNotifierProvider<UserState>(create: (_) => UserState()),
        ChangeNotifierProvider<CategoryState>(create: (_) => CategoryState()),
        ChangeNotifierProvider<MainViewState>(create: (_) => MainViewState())
      ],
      child: MaterialApp(
        title: 'State training',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.dark,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: TextStyle(
              fontSize: 15,
            ),
            displayMedium: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        home: const MainLoadingScreen(),
      ),
    );
  }
}
