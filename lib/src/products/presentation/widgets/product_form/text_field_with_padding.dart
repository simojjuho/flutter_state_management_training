import 'package:flutter/material.dart';

class TextFieldWithPadding extends StatelessWidget {
  const TextFieldWithPadding({
    required this.controller,
    required this.inputType,
    super.key,
  });
  final TextEditingController controller;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
      ),
    );
  }
}
