import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/shared/states/main_view_state.dart';

class MainViewSmall extends StatelessWidget {
  const MainViewSmall({
    required this.page,
    super.key,
  });

  final Widget page;

  @override
  Widget build(BuildContext context) {
    var mainViewState = context.watch<MainViewState>();
    var selectedIndex = mainViewState.selectedIndex;
    return Column(
      children: [
        NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shop),
              label: 'Products',
            )
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            mainViewState.setIndex(value);
          },
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ),
        ),
      ],
    );
  }
}
