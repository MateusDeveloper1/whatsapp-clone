import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String? placeholder;
  final bool? filled; 
  final TextInputType? inputType;
  
  const InputWidget({
    Key? key,
    this.placeholder,
    this.filled,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      ),
    );
  }
}
