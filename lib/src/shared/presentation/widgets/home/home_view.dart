import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/presentation/widgets/product_view.dart';
import 'package:state_training/src/shared/presentation/widgets/home/home_view_medium.dart';
import 'package:state_training/src/shared/presentation/widgets/home/home_view_small.dart';
import 'package:state_training/src/shared/states/main_view_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mainViewState = context.watch<MainViewState>();
    final selectedIndex = mainViewState.selectedIndex;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const Placeholder();
        break;
      case 1:
        page = const ProductView();
        break;
      default:
        throw UnimplementedError('No widget for selected index');
    }
    return LayoutBuilder(builder: (
      context,
      constraints,
    ) {
      if (constraints.maxWidth < 600) {
        return HomeViewSmall(page: page);
      } else {
        return HomeViewMedium(page: page);
      }
    });
  }
}
