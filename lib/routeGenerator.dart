import 'package:flutter/material.dart';
import 'package:wahtsapp_clone/screens/cadastro.dart';
import 'package:wahtsapp_clone/screens/home.dart';
import 'package:wahtsapp_clone/screens/login.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const Login());

      case "/login":
        return MaterialPageRoute(builder: (context) => const Login());

      case "/cadastro":
        return MaterialPageRoute(builder: (context) => const Cadastro());

      case "/home":
        return MaterialPageRoute(builder: (context) => const Home());

      default:
        _erroRota();
    }
    return null;
  }

  static Route<dynamic>? _erroRota() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Tela não encontrada!!")),
        body: const Center(
          child: Text("Tela não encontrada!!"),
        ),
      );
    });
  }
}
