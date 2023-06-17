import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wahtsapp_clone/screens/login.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff075E54),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: const Login(),
    );
  }
}
