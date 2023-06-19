import 'package:flutter/material.dart';

class AbaContato extends StatefulWidget {
  const AbaContato({super.key});

  @override
  State<AbaContato> createState() => _AbaContatoState();
}

class _AbaContatoState extends State<AbaContato> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Contatos"),
    );
  }
}