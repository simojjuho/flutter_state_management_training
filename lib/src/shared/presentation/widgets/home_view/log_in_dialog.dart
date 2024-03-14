import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_training/src/products/presentation/widgets/product_form/text_field_with_padding.dart';
import 'package:state_training/src/shared/presentation/widgets/messages/error_snackbar.dart';
import 'package:state_training/src/users/controllers/authentication_controller.dart';
import 'package:state_training/src/users/domain/core_entities/authentication_msg.dart';
import 'package:state_training/src/users/services/authentication_service.dart';

import '../../../../users/presentation/state/user_state.dart';

class LogInDialog extends StatefulWidget {
  const LogInDialog({super.key});

  @override
  State<LogInDialog> createState() => _LogInDialogState();
}

class _LogInDialogState extends State<LogInDialog> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final service = AuthenticationService(controller: AuthenticationController());

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserState>();
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () => _dialogBuilder(context, userState),
          child: const Text('Log in'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Sign up'),
        ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context, UserState userState) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          void logIn() async {
            try {
              final authMsg = AuthenticationMsg(
                email: emailController.text,
                password: passwordController.text,
              );
              var response = await service.authenticate(authMsg);
              var profile = await service.getProfile(response.accessToken);
              userState.logInUser(profile);
              emailController.clear();
              passwordController.clear();
              Navigator.of(context).pop();
            } on DioException catch (e) {
              ErrorSnackbar.set(e.toString(), context);
            }
          }

          return Dialog(
            child: Form(
              key: _formKey,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  TextFieldWithPadding(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                  ),
                  TextFieldWithPadding(
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword,
                  ),
                  OutlinedButton(
                    onPressed: () => logIn(),
                    child: const Text('Log in'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
