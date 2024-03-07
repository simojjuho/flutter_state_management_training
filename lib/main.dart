import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/product_state.dart';
import 'package:state_training/src/main_view.dart';
import 'package:state_training/src/user_state.dart';

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
        ChangeNotifierProvider<UserState>(create: (_) => UserState())
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
        home: const HomeView(),
      ),
    );
  }
}
