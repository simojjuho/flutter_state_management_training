import 'package:flutter/material.dart';

class ErrorSnackbar {
  ErrorSnackbar.set(
    this.error,
    this.context,
  ) {
    setSnackbar(buildSnackbar());
  }

  final String error;
  final BuildContext context;

  void setSnackbar(SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  SnackBar buildSnackbar() {
    return SnackBar(
      content: Text(error),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
    );
  }
}
