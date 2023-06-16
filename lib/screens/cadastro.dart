import 'package:flutter/material.dart';
import 'package:wahtsapp_clone/widgets/input.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastro",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff075E54),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff075E54)),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/usuario.png",
                  width: 200,
                  height: 150,
                ),
                const SizedBox(height: 32),
                const InputWidget(
                  placeholder: "Nome",
                  filled: true,
                  inputType: TextInputType.name,
                ),
                const SizedBox(height: 8),
                const InputWidget(
                  placeholder: "E-mail",
                  filled: true,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                const InputWidget(
                  placeholder: "Senha",
                  filled: true,
                  inputType: TextInputType.visiblePassword,
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
                      "Cadastrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
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
