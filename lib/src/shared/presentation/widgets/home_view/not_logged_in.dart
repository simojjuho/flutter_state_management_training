import 'package:flutter/material.dart';
import 'package:state_training/src/shared/presentation/widgets/home_view/log_in_dialog.dart';

class NotLoggedIn extends StatelessWidget {
  const NotLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Text(
          'You do not seem to be logged in.',
          textAlign: TextAlign.center,
        ),
        const LogInDialog()
      ],
    );
  }
}
