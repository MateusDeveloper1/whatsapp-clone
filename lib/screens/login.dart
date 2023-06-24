import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:wahtsapp_clone/screens/cadastro.dart';
import 'package:wahtsapp_clone/screens/home.dart';
import 'package:wahtsapp_clone/widgets/input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  String _message = '';


  void _redirecionarParaTela(BuildContext context){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
  }

  void _logarUsuario(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
      email: _controllerEmail.text,
      password: _controllerSenha.text,
    ).then((firebaseUser) {
      _redirecionarParaTela(context);
    }).catchError((onError) {
      setState(() {
        _message =
            "Erro ao fazer login, por favor verifique email e senha novamente";
      });
    });
  }

  Future _verificarUsuarioLogado(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    User? usuarioLogado = auth.currentUser;
    if (usuarioLogado != null) {
      _redirecionarParaTela(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _verificarUsuarioLogado(context);
  }

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      InputWidget(
                        controller: _controllerEmail,
                        obscureText: false,
                        placeholder: "E-mail",
                        filled: true,
                        inputType: TextInputType.emailAddress,
                        validator: Validatorless.required("Campo obrigatorio"),
                      ),
                      const SizedBox(height: 8),
                      InputWidget(
                        controller: _controllerSenha,
                        obscureText: true,
                        placeholder: "Senha",
                        filled: true,
                        inputType: TextInputType.visiblePassword,
                        validator: Validatorless.required("Campo obrigatorio"),
                      ),
                    ],
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
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      var formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        _logarUsuario(context);
                      }
                    },
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: const Text(
                      "Não tem uma conta ainda? Cadastre-se!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Cadastro(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _message,
                      style: const TextStyle(
                        color: Colors.white,
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
