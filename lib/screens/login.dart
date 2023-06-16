import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff075E54)),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 150,
                ),
                const SizedBox(height: 32),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "E-mail",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Senha",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: const Text(
                      "Não tem uma conta? Cadastre-se!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
