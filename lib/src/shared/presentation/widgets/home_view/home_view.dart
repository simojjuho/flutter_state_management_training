import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/shared/presentation/widgets/home_view/not_logged_in.dart';
import 'package:state_training/src/users/presentation/state/user_state.dart';

import 'logged_in.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserState>();
    Widget page;
    switch (userState.isLoggedIn()) {
      case true:
        page = const LoggedIn();
      case false:
        page = const NotLoggedIn();
      default:
        page = const CircularProgressIndicator();
    }

    return page;
  }
}
