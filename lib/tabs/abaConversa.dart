import 'package:flutter/material.dart';

class AbaConversa extends StatefulWidget {
  const AbaConversa({super.key});

  @override
  State<AbaConversa> createState() => _AbaConversaState();
}

class _AbaConversaState extends State<AbaConversa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Conversas"),
    );
  }
}