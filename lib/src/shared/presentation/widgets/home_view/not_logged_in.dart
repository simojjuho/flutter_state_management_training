import 'package:flutter/material.dart';

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
        const Text('You do not seem to be logged in.'),
        Flex(
          direction: Axis.horizontal,
          children: [
            FloatingActionButton.large(
              onPressed: () {},
              child: const Text('Log in'),
            ),
            FloatingActionButton.large(
              onPressed: () {},
              child: const Text('Something else'),
            ),
          ],
        )
      ],
    );
  }
}
