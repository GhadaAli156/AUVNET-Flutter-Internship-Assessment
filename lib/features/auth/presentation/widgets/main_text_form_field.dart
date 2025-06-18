import 'package:flutter/material.dart';
import 'package:flutter_internship/core/colors/colors.dart';

class MainTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validate;
  final bool isPassword;
  final Widget? suffix;
  final Widget? prefix;
  final double borderRadius;
  final TextInputType inputType;
  final int? max;

  const MainTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validate,
    this.isPassword = false,
    this.suffix,
    this.prefix,
    this.borderRadius = 8.0,
    required this.inputType,
    this.max,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: isPassword,
      keyboardType: inputType,
      maxLines: max ?? 1,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorManager.buttonColor),
        ),
      ),
    );
  }
}
