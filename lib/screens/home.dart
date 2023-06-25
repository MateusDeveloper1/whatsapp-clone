import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wahtsapp_clone/screens/login.dart';
import 'package:wahtsapp_clone/tabs/abaContato.dart';
import 'package:wahtsapp_clone/tabs/abaConversa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> itensMenu = [
    "Configurações",
    "Deslogar",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  void _escolhaMenuItem(String item) {
    switch (item) {
      case 'Configurações':
        print('Configurações');
        break;

      case 'Deslogar':
        _deslogarUsuario(context);
        break;
    }
  }

  void _deslogarUsuario(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 4,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          tabs: const [
            Tab(text: "Conversas"),
            Tab(text: "Contatos"),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (BuildContext context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AbaConversa(),
          AbaContato(),
        ],
      ),
    );
  }
}
