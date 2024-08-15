import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomInputWidget({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon, color: Theme.of(context).iconTheme.color),
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor ?? Theme.of(context).primaryColorLight.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none, // Remove the border for a cleaner look
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      ),
    );
  }
}
