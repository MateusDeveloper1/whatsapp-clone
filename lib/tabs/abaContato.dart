import 'package:flutter/material.dart';
import 'package:wahtsapp_clone/model/conversa.dart';

class AbaContato extends StatefulWidget {
  const AbaContato({super.key});

  @override
  State<AbaContato> createState() => _AbaContatoState();
}

class _AbaContatoState extends State<AbaContato> {

  List<Conversa> listaConversas = [
    Conversa(
      "José Renato",
      "Olá, mundo",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-42e5f.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=4f9da873-999c-46e5-8fd6-6473958bbaa1",
    ),
    Conversa(
      "Ana Clara",
      "Olá, tudo bem?",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-42e5f.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=9de6ceef-32ff-4fa7-b019-880c9697802e",
    ),
    Conversa(
      "Pedro Silva",
      "Assistindo serie aqui",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-42e5f.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=57c13c1e-b6d2-4231-975d-3a1cfd2b965c",
    ),
    Conversa(
      "Geovana",
      "oi",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-42e5f.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=1b7ca7a5-36ba-41f5-ac4d-42135a1d01c7",
    ),
    Conversa(
      "Jamilton",
      "Vamos para aula",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-42e5f.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=0923672c-95b3-431c-a350-653cb88312fa",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaConversas.length,
      itemBuilder: (context, index) {
        Conversa conversa = listaConversas[index];

        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(conversa.caminhoFoto!),
          ),
          title: Text(
            conversa.nome!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}