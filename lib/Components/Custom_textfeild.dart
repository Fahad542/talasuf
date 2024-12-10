import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:talasuf_car_care/Components/Utilis.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
final TextEditingController controllers;
  final double horizontalPadding;
  final double verticalPadding;
  final Function(String?)? onSaved;
  final IconData? prefixIcon; // Added prefix icon parameter
  final IconData? suffixIcon; // Optional suffix icon parameter
  final VoidCallback? onSuffixIconTap; // Optional tap handler for the suffix icon

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controllers,
    this.horizontalPadding = 16.0 * 1.5,
    this.verticalPadding = 16.0,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllers,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.primary.withOpacity(0.05),
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.grey)
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
          onTap: onSuffixIconTap,
          child: Icon(suffixIcon, color: Colors.grey),
        )
            : null,
      ),
      onSaved: onSaved,
    );
  }
}
