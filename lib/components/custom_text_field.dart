import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:malika/themes.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String title;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction imeOptions;
  final int maxLines;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.inputType = TextInputType.text,
    this.imeOptions = TextInputAction.next,
    this.maxLines = 1,
    required this.title,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: outlineColor),
        ),
        hintStyle: hintTextStyle,
        hintText: "Enter your email",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        label: Text(title),
        labelStyle: hintTextStyle.copyWith(color: Colors.black),
        alignLabelWithHint: true,
      ),
      style: subtitleTextStyle,
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      textInputAction: TextInputAction.next,
      obscureText: obscureText,
    );
  }
}
