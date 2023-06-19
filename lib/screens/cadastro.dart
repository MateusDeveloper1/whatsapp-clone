import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:wahtsapp_clone/mixin/validator.dart';
import 'package:wahtsapp_clone/model/usuario.dart';
import 'package:wahtsapp_clone/screens/home.dart';
import 'package:wahtsapp_clone/widgets/input.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> with ValidationsMixin {
  final _formKey = GlobalKey<FormState>();
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  String _message = '';


  void _criaUsuario(){
    String nome = _controllerName.text;
    String senha = _controllerSenha.text;
    String email = _controllerEmail.text;

    Usuario usuario = Usuario();
    usuario.nome = nome;
    usuario.senha = senha;
    usuario.email = email;

    _cadastrarUsuario(usuario);
  }


  
  void _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,

    ).then((firebaseUser) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("usuarios")
      .doc(firebaseUser.user!.uid)
      .set(usuario.toMap());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }).catchError((onError) {
      _message = "Erro ao cadastrar, digite os dados novamente";
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerSenha.dispose();
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/images/usuario.png",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(height: 32),
                  InputWidget(
                    obscureText: false,
                    controller: _controllerName,
                    placeholder: "Nome",
                    filled: true,
                    inputType: TextInputType.name,
                    validator: (value) =>
                        nameValidatio(value, "nome é obrigatorio"),
                  ),
                  const SizedBox(height: 8),
                  InputWidget(
                    obscureText: false,
                    controller: _controllerEmail,
                    placeholder: "E-mail",
                    filled: true,
                    inputType: TextInputType.emailAddress,
                    validator: Validatorless.required('E-mail é obrigatorio'),
                  ),
                  const SizedBox(height: 8),
                  InputWidget(
                    obscureText: true,
                    controller: _controllerSenha,
                    placeholder: "Senha",
                    filled: true,
                    inputType: TextInputType.visiblePassword,
                    validator: (value) => passwordValidation(
                        value, "A senha deve conter no minimo 6 digitos"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        var formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          _criaUsuario();
                        }
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      _message,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
