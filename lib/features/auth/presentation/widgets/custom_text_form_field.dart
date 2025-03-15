import 'package:flutter/material.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  // تعبير عادي للتحقق من تنسيق البريد الإلكتروني
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email (e.g., example@domain.com)';
  }
  return null;
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final int? maxLines;

  static const _borderRadius = 15.0;
  static const _borderWidth = 1.0;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autocorrect: false,
      style: const TextStyle(color: Colors.black),
      decoration: _buildDecoration(),
      maxLines: maxLines,
      validator:
          keyboardType == TextInputType.emailAddress
              ? validateEmail
              : (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      label: Text(label),
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.black, size: 25),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: _buildBorder(Colors.grey[400]!),
      focusedBorder: _buildBorder(Colors.grey),
      errorBorder: _buildBorder(Colors.red),
      focusedErrorBorder: _buildBorder(Colors.red),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: BorderSide(color: color, width: _borderWidth),
    );
  }
}
