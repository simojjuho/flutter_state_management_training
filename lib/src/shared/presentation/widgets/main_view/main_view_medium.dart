import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/shared/states/main_view_state.dart';

class MainViewMedium extends StatelessWidget {
  const MainViewMedium({
    required this.page,
    super.key,
  });

  final Widget page;

  @override
  Widget build(BuildContext context) {
    var mainViewState = context.watch<MainViewState>();
    var selectedIndex = mainViewState.selectedIndex;
    return Row(
      children: [
        SafeArea(
          child: NavigationRail(
            extended: false,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                  icon: Icon(Icons.favorite), label: Text('Faorites'))
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              mainViewState.setIndex(value);
            },
          ),
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
