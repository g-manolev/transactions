import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validatorText,
    this.textInputAction,
    this.obscureText,
    this.autofocus,
    this.onFieldSubmitted,
  });

  final String labelText;
  final TextEditingController? controller;
  final String validatorText;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final bool? autofocus;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      controller: controller,
      obscureText: obscureText ?? false,
      autofocus: autofocus ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
