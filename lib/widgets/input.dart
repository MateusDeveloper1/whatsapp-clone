import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String? placeholder;
  final bool? filled;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  const InputWidget({
    Key? key,
    this.placeholder,
    this.filled,
    this.inputType,
    this.controller,
    this.validator,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        hintText: placeholder,
        filled: filled,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        errorStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
